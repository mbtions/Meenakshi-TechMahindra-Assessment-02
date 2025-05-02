import 'package:flutter/material.dart';
import 'package:tictactoe_app/widgets/player_panel.dart';
import 'package:tictactoe_app/widgets/game_grid.dart';

void main() {
  runApp(MyTicTacToeApp());
}

class MyTicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Tic x Tac x Toe'), centerTitle: true),
        body: Container(
          // padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              PlayerPanel(),
              SizedBox(height: 20),
              GameGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
