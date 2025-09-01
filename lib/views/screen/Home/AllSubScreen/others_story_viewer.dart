import 'package:flutter/material.dart';

class OthersStoryViewer extends StatefulWidget {
  const OthersStoryViewer({super.key});

  @override
  State<OthersStoryViewer> createState() => _OthersStoryViewerState();
}

class _OthersStoryViewerState extends State<OthersStoryViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("others Story"),
      ),
    );
  }
}
