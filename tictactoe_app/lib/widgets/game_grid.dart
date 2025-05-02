import 'package:flutter/material.dart';

class GameGrid extends StatefulWidget {
  @override
  State<GameGrid> createState() {
    return GameGridState();
  }
}

class GameGridState extends State<GameGrid> {
  String choice = '';
  String playerName = '';
  String turnSymbol = 'X';
  String gameStateText = "Turn: X", resetButtonText = "RESET GAME";
  List<String> gameState = ["", "", "", "", "", "", "", "", "", ""];
  String gameStatus = "GAME ON";
  bool win = false;
  List<bool> winStatus = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  String checkWin() {
    List<List<int>> winStates = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7],
    ];

    for (int i = 0; i < 8; i++) {
      int m = winStates[i][0];
      int n = winStates[i][1];
      int o = winStates[i][2];

      if (gameState[m] == turnSymbol &&
          gameState[n] == turnSymbol &&
          gameState[o] == turnSymbol &&
          turnSymbol != "") {
        setState(() {
          winStatus[m] = true;
          winStatus[n] = true;
          winStatus[o] = true;
          win = true;
        });
        return "WIN";
      }
    }

    for (int i = 1; i < gameState.length; i++) {
      if (gameState[i] == "") {
        return "GAME ON";
      }
    }

    return "DRAW";
  }

  onGameGridButtonPress(int index) {
    setState(() {
      if (win != true) {
        print("game on");
        if (gameState[index] == "") {
          gameState[index] = turnSymbol;
          gameStatus = checkWin();
          if (gameStatus == "WIN") {
            gameStateText = 'WINNER: $turnSymbol';
            turnSymbol = "";
            resetButtonText = "NEW GAME";
          } else if (gameStatus == "DRAW") {
            turnSymbol = "";
            gameStateText = gameStatus;
            resetButtonText = "NEW GAME";
          } else {
            turnSymbol == "X" ? turnSymbol = "O" : turnSymbol = "X";
            gameStateText = 'Turn: $turnSymbol';
            resetButtonText = "RESET GAME";
          }
        }
      }
    });
  }

  onResetButtonPress() {
    setState(() {
      turnSymbol = 'X';
      gameStateText = "Turn: X";
      resetButtonText = "RESET GAME";
      gameState = ["", "", "", "", "", "", "", "", "", ""];
      gameStatus = "GAME ON";
      win = false;
      winStatus = [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
      ];
    });
  }

  buildGridButton({int index = 0}) {
    return Expanded(
      child: SizedBox(
        height: 120,
        width: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor:
                  winStatus[index] == true ? Colors.blue : Colors.blue.shade100,
              elevation: 6,
            ),
            onPressed: () => {onGameGridButtonPress(index)},
            child: Text(
              gameState[index],
              style: TextStyle(
                color: winStatus[index] ? Colors.blue.shade100 : Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () => {onResetButtonPress()},
      child: Text(
        resetButtonText,
        style: TextStyle(color: Colors.blue.shade50, fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          gameStateText,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade400,
          ),
        ),
        Row(
          children: [
            buildGridButton(index: 1),
            buildGridButton(index: 2),
            buildGridButton(index: 3),
          ],
        ),
        Row(
          children: [
            buildGridButton(index: 4),
            buildGridButton(index: 5),
            buildGridButton(index: 6),
          ],
        ),
        Row(
          children: [
            buildGridButton(index: 7),
            buildGridButton(index: 8),
            buildGridButton(index: 9),
          ],
        ),
        SizedBox(height: 30),
        buildButton(),
      ],
    );
  }
}
