import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _inputUser = TextEditingController();

  double celcius = 0;
  double fahrenheit = 0;
  double kelvin = 0;
  double reamur = 0;

  void temperatureConversion() {
    setState(() {
      celcius = double.parse(_inputUser.text);
      fahrenheit = (celcius * (9 / 5)) + 32;
      reamur = (4 / 5) * celcius;
      kelvin = celcius + 273.15;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Konversi Suhu',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Konverter Suhu"),
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Moch. Rofiqi - 2031710135',
                  style: TextStyle(
                      fontSize: 20,
                      backgroundColor: Color.fromARGB(255, 194, 167, 157))),
              TextFormField(
                  controller: _inputUser,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  decoration: const InputDecoration(
                    hintText: 'Masukkan suhu dalam celcius',
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Suhu dalam Celcius',
                          style: TextStyle(fontSize: 18)),
                      Padding(padding: EdgeInsets.all(7)),
                      Text('' + celcius.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 30)),
                      Padding(padding: EdgeInsets.all(7)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Suhu dalam Fahrenheit',
                          style: TextStyle(fontSize: 18)),
                      Padding(padding: EdgeInsets.all(7)),
                      Text('' + fahrenheit.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 30)),
                      Padding(padding: EdgeInsets.all(7)),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Suhu dalam Kelvin', style: TextStyle(fontSize: 18)),
                      Padding(padding: EdgeInsets.all(7)),
                      Text('' + kelvin.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 30)),
                      Padding(padding: EdgeInsets.all(7)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Suhu dalam Reamur', style: TextStyle(fontSize: 18)),
                      Padding(padding: EdgeInsets.all(7)),
                      Text('' + reamur.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 30)),
                      Padding(padding: EdgeInsets.all(7)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.brown,
                  ),
                  onPressed: () {
                    temperatureConversion();
                  },
                  child: Text('Konversi Suhu', style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ]),
          ),
        )
      );
  }
}
