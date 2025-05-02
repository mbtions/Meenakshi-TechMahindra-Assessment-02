import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart' as math_expressions;

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<StatefulWidget> createState() {
    return CalculatorState();
  }
}

class CalculatorState extends State<Calculator> {
  String _expression = "";
  String screenText = "0", result = "";

  onButtonGridPress(String label) {
    setState(() {
      if (label == 'AC') {
        _expression = '';
        screenText = '0';
      } else if (label == '%') {
        _expression = (screenText == '0') ? '' : screenText.toString();
        if (_expression.isNotEmpty) {
          _expression += '%';
          screenText = _expression;
        }
        // });
      } else if (label == '.') {
        if (_expression.isNotEmpty) {
          if (!_expression.contains('.')) {
            _expression += '.';
            screenText = _expression;
          }
        } else {
          _expression += '0.';
          screenText = _expression;
        }
      } else if (label == '=') {
        try {
          final expression = math_expressions.Parser().parse(
            _expression.replaceAll('X', '*'),
          );

          final contextModel = math_expressions.ContextModel();
          var answer = expression.evaluate(
            math_expressions.EvaluationType.REAL,
            contextModel,
          );
          if (_expression.contains("/0")) {
            answer = "Error: /zero";
          }
          screenText = answer.toString();
          _expression = answer.toString();
        } catch (e) {
          screenText = 'Error';
        }
      } else {
        _expression += label;
        screenText = _expression.isEmpty ? '0' : _expression;
      }
    });
  }

  Widget buildButton({
    String label = "",
    bool isOperator = false,
    isAnswerButton = false,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isOperator
                    ? Colors.blue
                    : (isAnswerButton ? Colors.blue.shade900 : Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () => {onButtonGridPress(label)},
          child: Text(
            label,
            style: TextStyle(
              color:
                  isOperator
                      ? Colors.white
                      : (isAnswerButton ? Colors.white : Colors.black),
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
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 247, 244, 244),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  alignment: Alignment.centerRight,
                  child: Text(
                    (screenText == '') ? '0' : screenText,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
              buildButton(label: "%", isOperator: true),
              buildButton(label: "0"),
              buildButton(label: ".", isOperator: true),
              buildButton(label: "+", isOperator: true),
            ],
          ),
          Row(
            children: [
              buildButton(label: "AC", isOperator: true),
              buildButton(label: "=", isAnswerButton: true),
            ],
          ),
        ],
      ),
    );
  }
}
