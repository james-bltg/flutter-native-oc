import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTestTwo(),
    );
  }
}

class CupertinoTestTwo extends StatefulWidget {
  @override
  _CupertinoTestTwoState createState() => _CupertinoTestTwoState();
}

class _CupertinoTestTwoState extends State<CupertinoTestTwo> {
  static const platform =
      const MethodChannel('samples.flutter.dev/goToNativePage');

  Future<void> _goToNativePage() async {
    try {
      final int result = await platform
          .invokeMethod('goToNativePage', {'test': 'from flutter'});
      print(result);
    } on PlatformException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text('去原生界面'),
              onPressed: _goToNativePage,
              color: Colors.blueAccent,
              textColor: Colors.white,
            ),
            Text(
              "Flutter 页面",
              style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
                fontFamily: "Georgia",
              ),
            )
          ],
        ),
      ),
    );
  }
}
