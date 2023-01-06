// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //

  final controllerForFeet = TextEditingController();
  final controllerForInch = TextEditingController();
  final controllerForWeight = TextEditingController();
  // ignore: non_constant_identifier_names
  late String BMI = '';
  // ignore: non_constant_identifier_names
  late String BMIStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "BMI Calculator",
                  style: TextStyle(fontSize: 30, color: Colors.amber),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  "Height",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  "Weight",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25),
                    decoration: const InputDecoration(
                      hintText: "Feet",
                    ),
                    controller: controllerForFeet,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                      keyboardType: TextInputType.number,
                      controller: controllerForInch,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 25),
                      decoration: const InputDecoration(
                        hintText: "Inch",
                      )),
                ),
                const Spacer(
                  flex: 1,
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                      controller: controllerForWeight,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 25),
                      decoration: const InputDecoration(
                        hintText: "In Kg",
                      )),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () {
                    ShowInfo();
                  },
                  child: const Text("Submit")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "Your BMI is: $BMI",
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "You are: $BMIStatus",
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    Text(
                      "Underweight: BMI < 18.5",
                      style: TextStyle(fontSize: 18, color: Colors.amber),
                    ),
                    Text(
                      "Normal Weight: 18.5 - 24.9",
                      style: TextStyle(fontSize: 18, color: Colors.amber),
                    ),
                    Text(
                      "Overweight: 25 - 29.9",
                      style: TextStyle(fontSize: 18, color: Colors.amber),
                    ),
                    Text(
                      "Obese: BMI > 31",
                      style: TextStyle(fontSize: 18, color: Colors.amber),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  void ShowInfo() {
    CalculateBMI(controllerForFeet.text, controllerForInch.text,
        controllerForWeight.text);
    CheckBMI(BMI);
  }

  // ignore: non_constant_identifier_names
  void CalculateBMI(var feet, var inch, var weight) {
    feet = int.parse(feet);
    inch = int.parse(inch);
    weight = int.parse(weight);
    double cmHeight = feet * 30.48;
    double inchHeight = inch * 2.54;
    double totalHeight = cmHeight + inchHeight;
    double bmi = weight / totalHeight / totalHeight * 10000;
    setState(() {
      BMI = bmi.toStringAsFixed(1);
    });

    print(BMI);
  }

  // ignore: non_constant_identifier_names
  void CheckBMI(var bmi) {
    bmi = double.parse(bmi);
    if (bmi < 18.5) {
      setState(() {
        BMIStatus = "Underweight";
      });
    } else if (bmi > 18.5 && bmi < 24.9) {
      setState(() {
        BMIStatus = "Normal Weight";
      });
    } else if (bmi > 25 && bmi < 29.9) {
      setState(() {
        BMIStatus = "Overweight";
      });
    } else if (bmi > 31) {
      setState(() {
        BMIStatus = "TOO MUCH";
      });
    } else {
      setState(() {
        BMIStatus = "TOO MUCH";
      });
    }
    bmi = bmi.toString();
  }
}
