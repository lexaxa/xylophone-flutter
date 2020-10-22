import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final AudioCache player = AudioCache();

  final notes = {
    1: 'Do',
    2: 'Re',
    3: 'Mi',
    4: 'Fa',
    5: 'Sol',
    6: 'La',
    7: 'Si'
  };
  final noteColors = {
    'Do': Colors.red,
    'Re': Colors.orange,
    'Mi': Colors.yellow,
    'Fa': Colors.green,
    'Sol': Colors.lightBlue,
    'La': Colors.blue[900],
    'Si': Colors.purple,
  };
  @override
  Widget build(BuildContext context) {
    List<Widget> callbacks = [];
    for (var i = 1; i <= 7; i++) {
      callbacks.add(getNoteButton(note: i, noteDesc: notes[i]));
    }
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: callbacks,
            ),
          ),
        ),
      ),
    );
  }

  Widget getNoteButton({int note, String noteDesc}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          player.play('note$note.wav');
        },
        color: noteColors[noteDesc],
        child: Text(noteDesc),
      ),
    );
  }
}
