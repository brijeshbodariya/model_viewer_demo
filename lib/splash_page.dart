import 'dart:async';

import 'package:flutter/material.dart';
import 'package:model_viewer_demo/demo_view.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const DemoView()));
  }

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurvedAnimation(parent: animationController!, curve: Curves.easeOut);
    animation!.addListener(() => setState(() {}));
    animationController!.forward();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Image.asset(
                  'assets/powered_by.png',
                  height: 25.0,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/devs.jpg',
                width: animation!.value * 250,
                height: animation!.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
