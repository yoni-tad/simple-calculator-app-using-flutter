import 'package:day_one/constants/colors.dart';
import 'package:day_one/provider/theme_provider.dart';
import 'package:day_one/widgets/calcButton.dart';
import 'package:day_one/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String equation = '0';
  String result = '0';
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    String doesContainDecimal(dynamic result) {
      if (result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if (!(int.parse(splitDecimal[1]) > 0)) {
          return result = splitDecimal[0].toString();
        }
      }

      return result;
    }

    setState(() {
      if (buttonText == 'AC') {
        equation = "0";
        result = "0";
      } else if (buttonText == '⌫') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if(buttonText == '+/-') {
        if (equation[0] != '-') {
          equation = '-$equation';
        } else {
          equation = equation.substring(1);
        }
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '%');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          if (expression.contains('%')) {
            result = doesContainDecimal(result);
          }
        } catch (e) {
          result = result;
        }
      } else {
        if (equation == '0') {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.darkColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.darkColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              onTap: (){
                setState(() {
                  themeProvider.changeTheme();
                });
              },
              child: Icon(
                // Icons.dark_mode_outlined,
                themeProvider.themeDataStyle == ThemeDataStyle.dark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            result,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            equation,
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white38,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            buttonPressed('⌫');
                          },
                          icon: Icon(
                            Icons.backspace_outlined,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,                      
                    children: [
                      calcButton(
                          'AC', Colors.white24, () => buttonPressed('AC')),
                      calcButton(
                          '%', Colors.white24, () => buttonPressed('%')),
                      calcButton(
                          '÷', Colors.white24, () => buttonPressed('÷')),
                      calcButton(
                          '×', Colors.white24, () => buttonPressed('×')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calcButton(
                          '7', Colors.white24, () => buttonPressed('7')),
                      calcButton(
                          '8', Colors.white24, () => buttonPressed('8')),
                      calcButton(
                          '9', Colors.white24, () => buttonPressed('9')),
                      calcButton(
                          '-', Colors.white24, () => buttonPressed('-')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calcButton(
                          '4', Colors.white24, () => buttonPressed('4')),
                      calcButton(
                          '5', Colors.white24, () => buttonPressed('5')),
                      calcButton(
                          '6', Colors.white24, () => buttonPressed('6')),
                      calcButton(
                          '+', Colors.white24, () => buttonPressed('+')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              calcButton('1', Colors.white24,
                                  () => buttonPressed('1')),
                              calcButton('2', Colors.white24,
                                  () => buttonPressed('2')),
                              calcButton('3', Colors.white24,
                                  () => buttonPressed('3')),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              calcButton('+/-', Colors.white24,
                                  () => buttonPressed('+/-')),
                              calcButton('0', Colors.white24,
                                  () => buttonPressed('0')),
                              calcButton('.', Colors.white24,
                                  () => buttonPressed('.')),
                            ],
                          ),
                        ],
                      ),
                      calcButton(
                          '=', Theme.of(context).colorScheme.primary, () => buttonPressed('=')),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
