import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CalculatorState();
  }
}

class CalculatorState extends State<Calculator> {
  String _expression = "";
  // String resultText = "0";
  String screenText = "0", result = "";

  onButtonGridPress(String label) {
    setState(() {
      if (label == "ANS") {
        // evaluate the expression
        // Expression exp =
        // cm =

        result = result;
        _expression = "";
      } else if (label == "CLR") {
        screenText = "";
        _expression = "";
      } else {
        screenText += label;
        _expression += label;
      }
    });
  }

  Widget buildButton({String label = "", bool isOperator = false}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isOperator ? Colors.blue : Colors.blue.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () => {onButtonGridPress(label)},
          child: Text(
            label,
            style: TextStyle(
              color: isOperator ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.blue,
                  alignment: Alignment.bottomRight,
                  child: Text(
                    screenText,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              buildButton(label: "7"),
              buildButton(label: "8"),
              buildButton(label: "9"),
              buildButton(label: "/", isOperator: true),
            ],
          ),
          Row(
            children: [
              buildButton(label: "4"),
              buildButton(label: "5"),
              buildButton(label: "6"),
              buildButton(label: "*", isOperator: true),
            ],
          ),

          Row(
            children: [
              buildButton(label: "1"),
              buildButton(label: "2"),
              buildButton(label: "3"),
              buildButton(label: "-", isOperator: true),
            ],
          ),
          Row(
            children: [
              buildButton(label: "%"),
              buildButton(label: "0"),
              buildButton(label: "."),
              buildButton(label: "+", isOperator: true),
            ],
          ),
          Row(children: [buildButton(label: "ANS"), buildButton(label: "CLR")]),
          // buildButton(label: "=", isOperator: true),
        ],
      ),
    );
  }
}
