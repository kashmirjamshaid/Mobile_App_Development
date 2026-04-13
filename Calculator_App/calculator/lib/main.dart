import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyCalculator());
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String input = "";
  String output = "0";

  // Button click handler
  void onButtonClick(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        output = "0";
      } 
      else if (value == "⌫") {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } 
      else if (value == "=") {
        calculate();
      } 
      else {
        input += value;
      }
    });
  }

  // Calculation function
  void calculate() {
    try {
      String finalInput =
          input.replaceAll('×', '*').replaceAll('÷', '/');

      // ignore: deprecated_member_use
      Parser p = Parser();
      Expression exp = p.parse(finalInput);
      ContextModel cm = ContextModel();

      double result = exp.evaluate(EvaluationType.REAL, cm);

      output = result % 1 == 0
          ? result.toInt().toString()
          : result.toString();
    } catch (e) {
      output = "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calculator"),
          centerTitle: true,
        ),
        body: Column(
          children: [

            
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      input,
                      style: const TextStyle(
                          fontSize: 24, color: Colors.white54),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      output,
                      style: const TextStyle(fontSize: 40),
                    ),
                  ],
                ),
              ),
            ),

            // BUTTONS
            buildRow(["C", "⌫", "÷", "×"]),
            buildRow(["7", "8", "9", "-"]),
            buildRow(["4", "5", "6", "+"]),
            buildRow(["1", "2", "3", "="]),
            buildRow(["0", "."]),
          ],
        ),
      ),
    );
  }

  // Create a row of buttons
  Widget buildRow(List<String> buttons) {
    return Row(
      children: buttons.map((text) => buildButton(text)).toList(),
    );
  }

  // Create a single button
  Widget buildButton(String text) {
    Color color;

    if (text == "C") {
      color = Colors.red;
    } else if (text == "=") {
      color = Colors.green;
    } else if (["+", "-", "×", "÷"].contains(text)) {
      color = Colors.orange;
    } else {
      color = Colors.grey[800]!;
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: () => onButtonClick(text),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            backgroundColor: color,
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}