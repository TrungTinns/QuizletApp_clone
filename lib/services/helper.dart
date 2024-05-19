import 'package:flutter_tts/flutter_tts.dart';

bool isReading = false;
FlutterTts flutterTts = FlutterTts();

Future<void> toggleTextToSpeech(String text) async {
  if (isReading) {
    await flutterTts.stop();
    isReading = false;
  } else {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
    isReading = true;
  }
}