import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:camera/camera.dart';
import 'home.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  FlutterTts _flutterTts = FlutterTts();
  Future _speak() async {
    await _flutterTts.speak('''The Third Eye app helps the
    blind and low vision people to understand their environment better,
    Tap the screen to continue''');
  }
  @override
  Widget build(BuildContext context) {
    //_speak;
    _flutterTts.setSpeechRate(0.9);
    _flutterTts.setPitch(0.9);
    _flutterTts.speak('''The Third Eye application assists the blind and low vision people to understand their environment better,
    Tap the screen to continue''');
    return MaterialApp(
      title: 'Bringing Sight To Blind and Low Vision People',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Colors.lightGreenAccent,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.green))
      ),
      home: HomePage(cameras),
    );
  }
}