import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'gender_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'round_icon_button.dart';
import 'bottom_button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardChild: GenderCard(
                          genderIcon: FontAwesomeIcons.mars,
                          genderText: 'MALE'),
                      colour: selectedGender == Gender.male
                          ? kActiveColor
                          : kInactiveColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardChild: GenderCard(
                          genderIcon: FontAwesomeIcons.venus,
                          genderText: 'FEMALE'),
                      colour: selectedGender == Gender.female
                          ? kActiveColor
                          : kInactiveColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kBoldText,
                        ),
                        Text('cm', style: kTextStyle)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Color(0xFFFFFFFF),
                          thumbColor: Color(0xFFEB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          overlayColor: Color(0x29EB1555)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kTextStyle,
                          ),
                          Text(weight.toString(), style: kBoldText),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  onClick: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: FontAwesomeIcons.plus),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                onClick: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: FontAwesomeIcons.minus,
                              )
                            ],
                          )
                        ],
                      ),
                      colour: kActiveColor,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kBoldText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  onClick: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: FontAwesomeIcons.plus),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                  onClick: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  child: FontAwesomeIcons.minus)
                            ],
                          )
                        ],
                      ),
                      colour: kActiveColor,
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              bottomTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.bmiResult(),
                      interpretation: calc.getInterpretations(),
                      resultText: calc.getResultText(),
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}
