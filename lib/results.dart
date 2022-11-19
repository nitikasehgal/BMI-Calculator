import 'package:bmi_calculator/basicContainer.dart';
import 'package:bmi_calculator/inputpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Results extends StatelessWidget {
  final String bmiresult;
  final String resulttext;
  final String interpretationtext;
  Results(this.bmiresult, this.resulttext, this.interpretationtext);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator results!"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 15),
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Your Results",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ))),
            Expanded(
                flex: 5,
                child: basicContainer(
                  colorchanger: activecardcolour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resulttext.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xFF24D876),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bmiresult,
                        style: TextStyle(
                            fontSize: 100, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        interpretationtext,
                        style: TextStyle(fontSize: 22.0),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, 'input');
                  Navigator.pop(context);
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "RECALCULATE",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  color: Color(0xFFEB1555),
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  height: 80,
                ),
              ),
            ),
          ],
        ));
  }
}
