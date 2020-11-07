import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'file:///C:/Users/balth/AndroidStudioProjects/bmi-calculator-flutter/lib/components/icon_content.dart';

import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';
import '../enums.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  Gender currentSelectedGender;
  int height = 180;
  int weight = 70;
  int age = 28;

  void setSelectedGender(Gender selectedGender) {
    setState(() {
      currentSelectedGender = selectedGender;
    });
  }

  void increaseWeight() {
    setState(() {
      weight++;
    });
  }

  void decreaseWeight() {
    setState(() {
      weight--;
    });
  }

  void increaseAge() {
    setState(() {
      age++;
    });
  }

  void decreaseAge() {
    setState(() {
      age--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setSelectedGender(Gender.male);
                    },
                    cardColor: Gender.male == currentSelectedGender
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableIcon(
                      icon: FontAwesomeIcons.mars,
                      label: "male",
                      iconColor: Gender.male == currentSelectedGender
                          ? kBottomBarColor
                          : Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setSelectedGender(Gender.female);
                    },
                    cardColor: Gender.female == currentSelectedGender
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusableIcon(
                      icon: FontAwesomeIcons.venus,
                      iconColor: Gender.female == currentSelectedGender
                          ? kBottomBarColor
                          : Colors.white,
                      label: "female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFFEB1555),
                      inactiveTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 250,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  cardColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "WEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundIconButton(
                            onPressed: () {
                              decreaseWeight();
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          RoundIconButton(
                            onPressed: () {
                              increaseWeight();
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundIconButton(
                            onPressed: () {
                              decreaseAge();
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          RoundIconButton(
                            onPressed: () {
                              increaseAge();
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              BmiBrain calculator = BmiBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          bmiResult: calculator.calculateBMI(),
                          resultText: calculator.getResults(),
                          resultInterpretation: calculator.getInterpretation(),
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
