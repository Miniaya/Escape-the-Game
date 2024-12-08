import 'package:flutter/material.dart';

class GameScaffold extends StatelessWidget {
  final List<Widget> content;
  
  const GameScaffold({required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 800,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: content,
            ),
          )
        )
      ),
    );
  }
}