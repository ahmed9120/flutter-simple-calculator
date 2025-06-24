import 'package:calculator/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {

  CalculatorScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CalculatorScreenState();
  }

}

class _CalculatorScreenState extends State<CalculatorScreen>{
  String resultText="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17181A),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 14),
        child: Column(
          children: [
            Expanded(child: Container(
              alignment: Alignment.centerRight,
              child: Text(resultText, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600),),
            )),
            Expanded(child: Row(
              children: [
                Expanded(
                  flex:3,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CalculatorButton(onTap:onACClick ,textValue: "Ac",backGroundColor: 0xFF616161,textColor: 0xFFA5A5A5,),
                            CalculatorButton(onTap:onBackSpaceClicked ,textValue: "",backGroundColor: 0xFF616161,),
                            CalculatorButton(onTap:onOperatorClick ,textValue: "/",backGroundColor: 0xFF005DB2,),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CalculatorButton(onTap:onDigitClick ,textValue: "7",),
                            CalculatorButton(onTap:onDigitClick ,textValue: "8",),
                            CalculatorButton(onTap:onDigitClick ,textValue: "9",),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CalculatorButton(onTap:onDigitClick ,textValue: "4",),
                            CalculatorButton(onTap:onDigitClick ,textValue: "5",),
                            CalculatorButton(onTap:onDigitClick ,textValue: "6",),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CalculatorButton(onTap:onDigitClick ,textValue: "1",),
                            CalculatorButton(onTap:onDigitClick ,textValue: "2",),
                            CalculatorButton(onTap:onDigitClick ,textValue: "3",),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CalculatorButton(onTap:onDigitClick ,flexValue: 2,textValue: "0",),
                            CalculatorButton(onTap:onDotClicked ,textValue: ".",),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CalculatorButton(onTap:onOperatorClick ,textValue: "*", backGroundColor: 0xFF005DB2,flexValue: 2,),
                      CalculatorButton(onTap:onOperatorClick ,textValue: "-", backGroundColor: 0xFF005DB2,flexValue: 2,),
                      CalculatorButton(onTap:onOperatorClick ,textValue: "+", backGroundColor: 0xFF005DB2,flexValue: 3,),
                      CalculatorButton(onTap:onEqualClick ,textValue: "=", backGroundColor: 0xFF1991FF,flexValue: 3,textColor: 0xFFFFFFFF,),
                    ],
                  ),
                )

              ],
            )),

          ],
        ),
      ),
    );
  }

  String savedNumber = '';
  String savedOperator= '';

  String calculate(String num1, String operator, String num2){
    double n1 = double.parse(num1);
    double n2= double.parse(num2);
    double res=0;
    switch(operator){
      case "+": res= (n1 + n2); break;
      case "-": res= (n1 - n2); break;
      case "/": if (n2 == 0){return "Error";} res= (n1 / n2); break;
      case "*": res= (n1 * n2); break;
    }
    return res.toString();
  }

  onDigitClick(String textValue){
    resultText += textValue;
    setState(() {});
  }

  onOperatorClick(String operator){
    if(savedNumber.isEmpty){
      savedNumber = resultText;
      savedOperator = operator;
      resultText='';
    }else{
      String newNumber= resultText;
      savedNumber= calculate(savedNumber, savedOperator, newNumber);
      savedOperator =operator;
      resultText='';
    }
    setState(() {});
  }

  onEqualClick(String operator){
    String newNumber= resultText;
    var result= calculate(savedNumber, savedOperator, newNumber);
    resultText=result;
    savedNumber='';
    savedOperator='';
    setState(() {});
  }

  onACClick(String operator){
    resultText="";
    setState(() {});
  }

  onBackSpaceClicked(String operator){
    if(!resultText.isEmpty){
      resultText= resultText.substring(0, resultText.length-1);
    }
    setState(() {});
  }

  onDotClicked(String operator){
    if(resultText.contains(".")){
      return;
    }
    resultText += operator;
  }

}
