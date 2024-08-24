part of 'animation.dart';

class CoreAnimationRepeatedFade extends StatefulWidget {
  final Widget child;
  final Duration duration;
  const CoreAnimationRepeatedFade({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<CoreAnimationRepeatedFade> createState() =>
      _CoreAnimationRepeatedFadeState();
}

class _CoreAnimationRepeatedFadeState extends State<CoreAnimationRepeatedFade>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    fadeAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController)
          ..addListener(() {
            setState(() {
              if (animationController.isCompleted) {
                animationController.repeat(reverse: true);
              }
            });
          });
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: widget.child,
    );
  }
}