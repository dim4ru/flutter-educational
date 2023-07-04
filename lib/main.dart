import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  bool _loading = false;
  double _progressValue = 0.0;

  @override
  void initState() {
    _loading;
    _progressValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          title: Text("My first app"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(25),
            child: _loading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: _progressValue,
                        color: Colors.blue,
                        backgroundColor: Colors.lightBlue,
                      ),
                      Text(
                        "${(_progressValue * 100).round()}%",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  )
                : Text(
                    "Press button to download",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              _loading = !_loading;
              _updateProgress();
            });
          },
          child: Icon(Icons.download),
        ),
      ),
    );
  }
  void _updateProgress() {
    const oneSecond = const Duration(seconds: 1);
    Timer.periodic(oneSecond, (timer) {
      setState(() {
        _progressValue += 0.2;

        if (_progressValue.toStringAsFixed(1) == '1.0'){
          _loading = false;
          timer.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
