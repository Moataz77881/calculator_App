import 'package:calculator/Botton.dart';
import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Text(
                  result,
                  style: TextStyle(fontSize: 25),
                ),
              ],
            )),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Botton('9', OnNomClick),
                  Botton('8', OnNomClick),
                  Botton('7', OnNomClick),
                  Botton('/', OnOperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Botton('6', OnNomClick),
                  Botton('5', OnNomClick),
                  Botton('4', OnNomClick),
                  Botton('*', OnOperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Botton('1', OnNomClick),
                  Botton('2', OnNomClick),
                  Botton('3', OnNomClick),
                  Botton('-', OnOperatorClick),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Botton('0', OnNomClick),
                  Botton('.', OnNomClick),
                  Botton('=', OnEqual),
                  Botton('+', OnOperatorClick),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String StoreOperator = '';
  String LHS = '';
  String RHS = '';

  void OnEqual(String Equal) {
    RHS = result;
    String res = Calculate(LHS, StoreOperator, RHS);
    result = res;
    LHS = '';
    StoreOperator = '';
    setState(() {});
  }

  // 3 + 4 //7 -
  void OnOperatorClick(String operator) {
    if (StoreOperator.isEmpty) {
      StoreOperator = operator;
      LHS = result;
      result = '';
    } else {
      RHS = result;
      String res = Calculate(LHS, StoreOperator, RHS);
      LHS = res;
      result = '';
      StoreOperator = operator;
      setState(() {});
    }
  }

  String Calculate(String lhs, String op, String rhs) {
    double LHSnom = double.parse(lhs);
    double RHSnom = double.parse(rhs);
    double res = 0.0;
    if (op == '+')
      res = LHSnom + RHSnom;
    else if (op == '/')
      res = LHSnom / RHSnom;
    else if (op == '*')
      res = LHSnom * RHSnom;
    else if (op == '-') res = LHSnom * RHSnom;
    return res.toString();
  }

  void OnNomClick(String text) {
    result += text;
    setState(() {});
  }
}
