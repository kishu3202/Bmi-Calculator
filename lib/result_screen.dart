import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:bmi_calculator/constant.dart';

class ResultScreen extends StatefulWidget {
  final  bmiResult;

  const ResultScreen({Key? key, this.bmiResult}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var bmiColor = Colors.white;
  var bmiText = 'Normal';
  var imagepath = 'normal';
  
  @override
  void initState(){
    super.initState();
    print("Hello");
    updateUI();
  }

  void updateUI(){
    var bmi = widget.bmiResult;
    if(bmi <18){
      setState(() {
        bmiText = 'Underweight';
        bmiColor = Colors.lightBlueAccent;
        imagepath = 'underweight';
      });
    }
    else if(bmi >=18 && bmi<=25){
      setState(() {
        bmiText='Normal';
        bmiColor = Colors.green;
        imagepath='normal';
      });
    }
    else if(bmi>26 && bmi<=30) {
      setState(() {
        bmiText='OverWeight';
        bmiColor=Colors.yellowAccent;
        imagepath='overweight';
      });
    }
    else if(bmi>=31 && bmi<=35){
      setState(() {
        bmiText='Obese';
        bmiColor=Colors.orange;
        imagepath='obese';
      });
    }
    else if(bmi>=36 ){
      setState(() {
        bmiText='Extreme Obese';
        bmiColor=Colors.red;
        imagepath='extreme';
      });
    }
  }
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: darkBlueColor,
      appBar: AppBar(
        backgroundColor: darkBlueColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: width,
            height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(3)),color: Color(0xff033e66),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Your BMI value is",style: textStyle.copyWith(fontSize: 20),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${widget.bmiResult}",style: numberTextStyle,),
                ),
                Text(bmiText, style: textStyle.copyWith(fontSize: 35,color: bmiColor,),)
              ],
            ),
          ),
          Image.asset('image/${imagepath}.png',height: height*0.5,),
          Spacer(),
          GestureDetector(
            child: Container(
              height: 50,
              width: width,
              color: Colors.pink,
              child: Center(child: Text("Calculate Again", style: textStyle,)),
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

