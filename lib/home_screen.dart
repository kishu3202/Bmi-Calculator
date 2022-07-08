import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/result_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String gender1;
  var darkBlueColor = Color(0xff002640);
  var maleColor = Color(0xff033e66);
  var femaleColor = Color(0xff033e66);
  var maleIconColor = Colors.white70;
  var femaleIconColor = Colors.white70;
  int height1 = 120;
  int age1 = 25;
  int weight1 = 45;
  void calculateBMI(){
    var heightInMetter = height1/100;
    var bmi = weight1 / (heightInMetter * heightInMetter);
    print(bmi.round());
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultScreen(bmiResult: bmi.round())));
  }

  void selectGender(bool gender){
    if(gender){
      setState(() {
        femaleColor = blueColor;
        maleColor = selectColor;
        femaleIconColor = Colors.white70;
        gender1 = 'female';
      });
    }
  }

  addSubtractAge(bool Ageadd){
    if(Ageadd){
      setState(() {
        age1++;
      });
    }
    else{
      setState(() {
        age1--;
      });
    }
  }

  addSubtractWeight(bool weightadd){
    if(weightadd){
      setState(() {
        weight1++;
      });
    }
    else{
      setState(() {
        weight1--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: darkBlueColor,
      appBar: AppBar(backgroundColor: darkBlueColor,title: Text("BMI Calculator"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(3)),color: maleColor,),
                  child: Column(
                    children: [
                      Icon(Icons.male, size: height/7,color: Colors.white,),
                      Text("Male", style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  height: 150,
                  width: width*0.45,
                ),
                onTap: (){
                  print("male");
                  selectGender(true);
                },
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(3)),color: femaleColor),
                  child: Column(
                    children: [
                      Icon(Icons.female,size: height/7,color: Colors.white,),
                      Text("Female",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  height: 150,
                  width: width*0.45,
                ),
                onTap: (){
                  print("female");
                  selectGender(false);
                },
              ),
            ],
          ),
          Container(
            height: 150,
            width: width,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(3)),color: blueColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Height",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${height1}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                    SizedBox(width: 10),
                    Text("cm",style: TextStyle(color: Colors.white70,fontSize: 30,fontWeight: FontWeight.bold),),
                  ],
                ),
                SliderTheme(data: SliderTheme.of(context).copyWith(
                  thumbColor: Colors.pink,
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white70,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                  overlayColor: Colors.pink.withOpacity(0.3),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                ),
                  child: Slider(
                    value: height1.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (doublevalueChanged){
                      setState(() {
                        height1 = doublevalueChanged.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(3)),color: blueColor),
                child: Column(
                  children: [
                    Text("Age",style: TextStyle(color: Colors.white,fontSize: 34,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Text("${age1}",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle,color: selectColor),
                            child: Icon(Icons.remove,color: Colors.white,size: 20,),
                          ),
                          onTap: (){
                            addSubtractAge(false);
                          },
                        ),

                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle,color: selectColor),
                            child: Icon(Icons.add,color: Colors.white,size: 20,),
                          ),
                          onTap: (){
                            addSubtractAge(true);
                          },
                        ),

                      ],
                    ),
                  ],
                ),
                height: 150,
                width: width*0.45,
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(3)),color: blueColor),
                child: Column(
                  children: [
                    Text("Weight", style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Text("${weight1}",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle,color: selectColor),
                            child: Icon(Icons.remove,color: Colors.white,size: 20,),
                          ),
                          onTap: (){
                            addSubtractWeight(false);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle,color: selectColor),
                            child: Icon(Icons.add,color: Colors.white,size: 20,),
                          ),
                          onTap: (){
                            addSubtractWeight(true);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                height: 150,
                width: width*0.45,
              ),
            ],
          ),
          GestureDetector(
            child: Container(
              height: 60,
              width: width,
              color: Colors.pink,
              child: Center(
                child: Text("Calculate BMI", style: TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.bold),),
              ),
            ),
            onTap: (){
              calculateBMI();
            },
          ),
        ],
      ),
    );
  }
}
