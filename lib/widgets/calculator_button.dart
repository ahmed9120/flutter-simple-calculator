import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class CalculatorButton extends StatelessWidget {
  int flexValue;
  int backGroundColor;
  int textColor;
  String textValue;
  void Function(String) onTap;
  CalculatorButton({super.key,required this.textValue, this.flexValue=1, this.backGroundColor=0xFF303136, this.textColor=0xFF29A8FF, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexValue,
      child: Bounceable(
        onTap: (){
          onTap(textValue);
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsetsGeometry.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Color(backGroundColor),
            borderRadius: BorderRadius.circular(16),
        
          ),
          child: (textValue=="-1")?Icon(Icons.backspace, color: Colors.white,):Text(textValue, style: TextStyle(color: Color(textColor), fontSize: 34, fontWeight: FontWeight.w400),),
        ),
      ),
    );
  }
}
