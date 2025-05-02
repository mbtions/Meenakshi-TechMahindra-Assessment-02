import 'package:flutter/material.dart';

class PlayerNameCard extends StatefulWidget {
  String initialPlayerName = "";
  String playerChoice = "";
  PlayerNameCard(String playerName, String choice, {super.key}) {
    initialPlayerName = playerName;
    playerChoice = choice;
  }
  @override
  State<PlayerNameCard> createState() {
    return PlayerNameCardState();
  }
}

class PlayerNameCardState extends State<PlayerNameCard> {
  String playerName = '';
  String choice = '';

  @override
  initState() {
    super.initState();
    playerName = widget.initialPlayerName;
    choice = widget.playerChoice;
  }

  String editNameButtonText = "edit";

  TextEditingController textController = TextEditingController();

  onEditNameButtonPress() {
    setState(() {
      if (editNameButtonText == 'edit') {
        editNameButtonText = 'save';
        textController.text = playerName;
      } else {
        playerName = textController.text;
        editNameButtonText = 'edit';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.blue.shade100,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(width:),
              editNameButtonText == 'edit'
                  ? Text(
                    playerName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                  : TextField(
                    controller: textController,
                    style: TextStyle(
                      // color: Colors.white,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter name',
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
              SizedBox(height: 8),
              Text(
                choice,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: onEditNameButtonPress,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text(
                  editNameButtonText,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
