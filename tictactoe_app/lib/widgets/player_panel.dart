import 'package:flutter/material.dart';
import 'package:tictactoe_app/widgets/player_name_card.dart';

class PlayerPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: ,
      child: Container(
        child: Card(
          elevation: 6,
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlayerNameCard('Meenakshi', 'X'),
              Text(
                'TIC TAC TOE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              PlayerNameCard('Bharadwaj', 'O'),
            ],
          ),
        ),
      ),
    );
  }
}
