import 'package:bmi_calculator/basicContainer.dart';
import 'package:bmi_calculator/calculation.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activecardcolour = Color(0xFF1D1E33);
const inactivecardcolor = Color(0xFF111328);

enum genderType { MALE, FEMALE }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  genderType? selectedgender;
  int height = 180;
  int age = 19;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: basicContainer(
                    onpress: () {
                      setState(() {
                        selectedgender = genderType.MALE;
                      });
                    },
                    colorchanger: selectedgender == genderType.MALE
                        ? activecardcolour
                        : inactivecardcolor,
                    cardChild: iconContent("MALE", FontAwesomeIcons.mars)),
              ),
              Expanded(
                child: basicContainer(
                  onpress: () {
                    setState(() {
                      selectedgender = genderType.FEMALE;
                    });
                  },
                  colorchanger: selectedgender == genderType.FEMALE
                      ? activecardcolour
                      : inactivecardcolor,
                  cardChild: iconContent("FEMALE", FontAwesomeIcons.venus),
                ),
              ),
            ]),
          ),
          Expanded(
            child: basicContainer(
              colorchanger: activecardcolour,
              cardChild: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "HEIGHT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8D8E98)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8D8E98)),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                        activeColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: basicContainer(
                    colorchanger: activecardcolour,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF8D8E98)),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  child: FontAwesomeIcons.minus,
                                  press: () {
                                    setState(() {
                                      weight = weight - 1;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  child: FontAwesomeIcons.add,
                                  press: () {
                                    setState(() {
                                      weight = weight + 1;
                                    });
                                  }),
                            ],
                          )
                        ]),
                  ),
                ),
                Expanded(
                  child: basicContainer(
                    colorchanger: activecardcolour,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF8D8E98)),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  child: FontAwesomeIcons.minus,
                                  press: () {
                                    setState(() {
                                      age = age - 1;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  child: FontAwesomeIcons.add,
                                  press: () {
                                    setState(() {
                                      age = age + 1;
                                    });
                                  }),
                            ],
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              calculation calc = new calculation(height, weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Results(calc.calculateres(),
                          calc.getresult(), calc.getInterpretation())));
            },
            child: Container(
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(bottom: 20),
              width: double.infinity,
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData child;
  final void Function() press;
  RoundIconButton({required this.child, required this.press});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(child),
      onPressed: press,
      elevation: 6.0,
      disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
