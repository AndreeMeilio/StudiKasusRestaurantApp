import 'dart:math' as math;

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SplashScreenContent(),
      ),
    );
  }
}

class SplashScreenContent extends StatefulWidget {
  const SplashScreenContent({Key? key}) : super(key: key);

  @override
  State<SplashScreenContent> createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _rotateAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _animationController.forward();
      Future.delayed(const Duration(seconds: 3), () {
        return Navigator.pushNamedAndRemoveUntil(
            context, "/restaurants", (route) => false);
      });
    });

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _rotateAnimation = IntTween(begin: 0, end: 360).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.0, 0.350)));

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 75), weight: 5),
      TweenSequenceItem<double>(tween: Tween(begin: 75, end: 50), weight: 5)
    ]).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.350, 0.750)));

    // _animationController.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedBuilder(
          animation: _rotateAnimation,
          builder: (context, _) => Transform.rotate(
            angle: _rotateAnimation.value * (math.pi / 180),
            child: const Icon(
              Icons.fastfood,
              color: Colors.greenAccent,
              size: 125,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        AnimatedBuilder(
          animation: _sizeAnimation,
          builder: (context, _) => Text(
            "Rest Toran",
            style:
                TextStyle(fontSize: _sizeAnimation.value, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
