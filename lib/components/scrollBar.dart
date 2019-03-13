// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

const double _kScrollbarCustomThickness = 3.0;
const Duration _kScrollbarCustomFadeDuration = Duration(milliseconds: 300);
const Duration _kScrollbarCustomTimeToFade = Duration(milliseconds: 600);

/// A material design ScrollbarCustom.
///
/// A ScrollbarCustom indicates which portion of a [Scrollable] widget is actually
/// visible.
///
/// Dynamically changes to an iOS style ScrollbarCustom that looks like
/// [CupertinoScrollbarCustom] on the iOS platform.
///
/// To add a ScrollbarCustom to a [ScrollView], simply wrap the scroll view widget in
/// a [ScrollbarCustom] widget.
///
/// See also:
///
///  * [ListView], which display a linear, scrollable list of children.
///  * [GridView], which display a 2 dimensional, scrollable array of children.
class ScrollbarCustom extends StatefulWidget {
  /// Creates a material design ScrollbarCustom that wraps the given [child].
  ///
  /// The [child] should be a source of [ScrollNotification] notifications,
  /// typically a [Scrollable] widget.
  const ScrollbarCustom({
    Key key,
    @required this.child,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// The ScrollbarCustom will be stacked on top of this child. This child (and its
  /// subtree) should include a source of [ScrollNotification] notifications.
  ///
  /// Typically a [ListView] or [CustomScrollView].
  final Widget child;

  @override
  _ScrollbarCustomState createState() => _ScrollbarCustomState();
}


class _ScrollbarCustomState extends State<ScrollbarCustom> with TickerProviderStateMixin {
  ScrollbarPainter _materialPainter;
  TargetPlatform _currentPlatform;
  TextDirection _textDirection;
  Color _themeColor;

  AnimationController _fadeoutAnimationController;
  Animation<double> _fadeoutOpacityAnimation;
  Timer _fadeoutTimer;

  @override
  void initState() {
    super.initState();
    _fadeoutAnimationController = AnimationController(
      vsync: this,
      duration: _kScrollbarCustomFadeDuration,
    );
    _fadeoutOpacityAnimation = CurvedAnimation(
        parent: _fadeoutAnimationController,
        curve: Curves.fastOutSlowIn
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final ThemeData theme = Theme.of(context);
    _currentPlatform = theme.platform;

    switch (_currentPlatform) {
      case TargetPlatform.iOS:
      // On iOS, stop all local animations. CupertinoScrollbarCustom has its own
      // animations.
        _fadeoutTimer?.cancel();
        _fadeoutTimer = null;
        _fadeoutAnimationController.reset();
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        _themeColor = theme.primaryColor.withOpacity(1.0);
        _textDirection = Directionality.of(context);
        _materialPainter = _buildMaterialScrollbarCustomPainter();
        break;
    }
  }

  ScrollbarPainter _buildMaterialScrollbarCustomPainter() {
    return ScrollbarPainter(
      color: _themeColor,
      textDirection: _textDirection,
      thickness: _kScrollbarCustomThickness,
      fadeoutOpacityAnimation: _fadeoutOpacityAnimation,
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    // iOS sub-delegates to the CupertinoScrollbarCustom instead and doesn't handle
    // scroll notifications here.
    if (_currentPlatform != TargetPlatform.iOS
        && (notification is ScrollUpdateNotification
            || notification is OverscrollNotification)) {
      if (_fadeoutAnimationController.status != AnimationStatus.forward) {
        _fadeoutAnimationController.forward();
      }

      _materialPainter.update(notification.metrics, notification.metrics.axisDirection);
      _fadeoutTimer?.cancel();
      _fadeoutTimer = Timer(_kScrollbarCustomTimeToFade, () {
        _fadeoutAnimationController.reverse();
        _fadeoutTimer = null;
      });
    }
    return false;
  }

  @override
  void dispose() {
    _fadeoutAnimationController.dispose();
    _fadeoutTimer?.cancel();
    _materialPainter?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentPlatform) {
      case TargetPlatform.iOS:
        return CupertinoScrollbar(
          child: widget.child,
        );
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: RepaintBoundary(
            child: CustomPaint(
              foregroundPainter: _materialPainter,
              child: RepaintBoundary(
                child: widget.child,
              ),
            ),
          ),
        );
    }
    throw FlutterError('Unknown platform for ScrollbarCustom insertion');
  }
}
