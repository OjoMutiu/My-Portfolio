import 'package:flutter/material.dart';

class ScrollAnimatedWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;
  final Offset offset;
  final Curve curve;
  final double triggerFraction;

  const ScrollAnimatedWidget({
    super.key,
    required this.child,
    required this.controller,
    this.duration = const Duration(milliseconds: 600),
    this.offset = const Offset(0, 0.1),
    this.curve = Curves.easeOut,
    this.triggerFraction = 0.8,
  });

  @override
  State<ScrollAnimatedWidget> createState() => _ScrollAnimatedWidgetState();
}

class _ScrollAnimatedWidgetState extends State<ScrollAnimatedWidget> with SingleTickerProviderStateMixin {
  final GlobalKey _key = GlobalKey();
  bool _isInView = false;
  bool inView = false;
  double height = 1;

  late RenderBox? box;

  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  void _checkVisibility() {
    box = _key.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      final offset = box?.localToGlobal(Offset(0,200)).dy ?? 0;
      final screenHeight = MediaQuery.of(context).size.height;

      inView = offset < screenHeight * widget.triggerFraction && offset > 0;
      height = (offset > 0 && offset < 150 ) ? offset : 15;
      //setState(() => height = offset);
      if (inView != _isInView) {
        setState(() => _isInView = inView);
        if (inView) {
          _animationController.reverse();
        } else {
          if(mounted) {
            _animationController.forward();
          }
        }
      }
    }
    print("height is $height");
    print("height 2 is ${(height/200)}");
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _offsetAnimation = Tween<Offset>(
      begin: widget.offset,
      end: Offset(0,(0.6* (height/150))),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.curve,
    ));

    _opacityAnimation = Tween<double>(
      begin:  (1-(height/150)), //inView ? 0.0 :
      end: (height/150),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.curve,
    ));

    widget.controller.addListener(_checkVisibility);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_checkVisibility);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: SlideTransition(
          position: _offsetAnimation,
          child: widget.child,
        ),
      ),
    );
  }
}
