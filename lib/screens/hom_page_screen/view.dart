import 'package:flutter/material.dart';
import 'package:simple_calculator_app/widgets/buttons.dart';
import 'package:math_expressions/math_expressions.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> buttons = [
    'c',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  var userQuestion = '';

  var userAnswer = '';
  void equalPressed(){
    userQuestion=userQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(userQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer=eval.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      //  appBar: AppBar(title: Text('Calculator App'),),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Button(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = '';
                              userAnswer='';
                            });
                          },
                          color: Colors.green,
                          textColor: Colors.white,
                          buttonText: buttons[index],
                        );
                      } else if (index == 1) {
                        return Button(
                          buttonTapped: () {
                           setState(() {
                             userQuestion = userQuestion.substring(
                                 0, userQuestion.length - 1);
                           });
                          },
                          color: Colors.red,
                          textColor: Colors.white,
                          buttonText: buttons[index],
                        );
                      } else if (index == buttons.length-1) {
                        return Button(
                          buttonTapped: () {
                            setState(() {
                             equalPressed();
                            });
                          },
                          color: Colors.deepPurple,
                          textColor: Colors.white,
                          buttonText: buttons[index],
                        );
                      } else {
                        return Button(
                          buttonTapped: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                          color: isOperator(buttons[index])
                              ? Colors.deepPurple
                              : Colors.deepPurple[50],
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.deepPurple,
                          buttonText: buttons[index],
                        );
                      }
                    }),
              )),
        ],
      ),
    );
  }
}
