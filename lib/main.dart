import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFC7E3FF)
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Sex { male, female }

class _MyHomePageState extends State<MyHomePage> {
  Sex? _sex = Sex.male;
  int _heightFeet = 5;
  int _heightInches = 5;
  double _weight = 130;
  double _bmi = 21.63;
  void _calculateBMI() {
    setState(() {
      _bmi = 703 * _weight/pow(_heightFeet * 12 + _heightInches, 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 600,
          width: 400,
          color: Colors.transparent,
          child: Column(
            children: [
              const Text('BMI Calculator', style: TextStyle(fontSize: 25)),
              const SizedBox(height: 10),
              Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(168, 220, 255, 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Sex', style: TextStyle(fontSize: 20)),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              width: 150,
                              child: ListTile(
                                title: const Text('Male'),
                                leading: Radio<Sex>(
                                  value: Sex.male,
                                  groupValue: _sex,
                                  onChanged: (Sex? value) {
                                    setState(() {
                                      _sex = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: ListTile(
                                title: const Text('Female'),
                                leading: Radio<Sex>(
                                  value: Sex.female,
                                  groupValue: _sex,
                                  onChanged: (Sex? value) {
                                    setState(() {
                                      _sex = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 50,
                          thickness: .5,
                          indent: 40,
                          endIndent: 40,
                          color: Colors.black,
                        ),
                        const Text('Height', style: TextStyle(fontSize: 20)),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 150,
                              child: TextField(
                                controller: TextEditingController()..text = _heightFeet.toString(),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'ft',
                                ),
                                onChanged: (text) {
                                  _heightFeet = int.parse(text);
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 150,
                              child: TextField(
                                controller: TextEditingController()..text = _heightInches.toString(),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'in',
                                ),
                                onChanged: (text) {
                                  _heightInches = int.parse(text);
                                },
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 50,
                          thickness: .5,
                          indent: 40,
                          endIndent: 40,
                          color: Colors.black,
                        ),
                        const Text('Weight', style: TextStyle(fontSize: 20)),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 200,
                          child: TextField(
                            controller: TextEditingController()..text = _weight.toString(),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'lbs',
                            ),
                            onChanged: (text) {
                              _weight = double.parse(text);
                            },
                          ),
                        ),
                        const Divider(
                          height: 50,
                          thickness: .5,
                          indent: 40,
                          endIndent: 40,
                          color: Colors.black,
                        ),
                        Text(('Your BMI is: ' + _bmi.toStringAsFixed(2)), style: const TextStyle(fontSize: 20)),
                        const SizedBox(height: 10),
                        Stack(
                          children: [
                            Container(
                              width: 400,
                              height: 50,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.lightBlueAccent,
                                    Colors.lightGreenAccent,
                                    Colors.lightGreenAccent,
                                    Colors.yellowAccent,
                                    Colors.yellowAccent,
                                    Colors.orangeAccent,
                                    Colors.orangeAccent,
                                    Colors.redAccent,
                                    Colors.redAccent,
                                  ],
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                            ),
                            Align(
                              alignment: FractionalOffset((_bmi-15)/25, 0.5),
                              child: const Icon(Icons.circle_outlined, size: 50, color: Colors.blue)
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calculateBMI,
        tooltip: 'Calculate',
        child: const Icon(Icons.calculate),
      ),
    );
  }
}
