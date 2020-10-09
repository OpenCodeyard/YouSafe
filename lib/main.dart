import 'dart:async';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:yousafe/screens/login_screen.dart';
import 'package:yousafe/screens/screen.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:yousafe/api_repository.dart';


void main() {
  runApp(ByPass());
  
}

class ByPass extends StatefulWidget {
  @override
  _ByPassState createState() => _ByPassState();
}

class _ByPassState extends State<ByPass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SpeechToText speech;

  final timeout = const Duration(seconds: 2);

  bool _hasSpeech = false;


  String lastWords = "";
  String lastError = "";
  String lastStatus = "";

  Timer timer;

  @override
  void initState() {
    super.initState();
    speech = SpeechToText();
    initSpeechState();
  }

  void handleTimeout() {
    stopListening();
    startListening();
  }

  void startListening() {
    lastWords = "";
    lastError = "";
    timer = new Timer(timeout, handleTimeout);
    speech.listen(
        onResult: resultListener,
        listenFor: timeout,
        cancelOnError: true,
        partialResults: true,
        onDevice: true,
        listenMode: ListenMode.confirmation);
  }

  void stopListening() {
    speech.stop();
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = "${result.recognizedWords} - ${result.finalResult}";
    });

    print(lastWords);
    if (result.recognizedWords.toLowerCase() == 'help') {
      print('match');
      emergency();
    }
  }

  void emergency() async {
    final status = await emergencyButtonPressed();
    if (status) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Email Sent'),
        ),
      );
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Error occurred'),
        ),
      );
    }
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);

    startListening();

    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    setState(() {
      lastStatus = "$status";

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouSafe',
      home: LoginScreen(),
    );
  }
}

