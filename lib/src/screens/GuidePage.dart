import 'package:flutter/material.dart';
import 'package:lg_controller/src/ui/ScreenBackground.dart';

class GuidePage extends StatefulWidget {
  GuidePage();
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ScreenBackground.getBackgroundDecoration(),
        child: Center(child:Text("Guide"),),
      ),
    );
  }
}