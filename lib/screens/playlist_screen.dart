import 'package:flutter/material.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Playlist Screen', style: TextStyle(fontWeight: FontWeight.normal),),),
    );
  }
}
