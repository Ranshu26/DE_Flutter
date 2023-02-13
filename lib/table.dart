import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DATA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DATA"),
        backgroundColor: Colors.green,
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "STATUS",
            textScaleFactor: 2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            // textDirection: TextDirection.rtl,
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            // border:TableBorder.all(width: 2.0,color: Colors.red),
            children: [
              TableRow(children: [
                Text(
                  "Species",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Count",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Device ID",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sd",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Mean",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Time Stamp",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
              TableRow(children: [
                Text("Apis Mellifera", textScaleFactor: 1.5),
                Text("89", textScaleFactor: 1.5),
                Text("D0301", textScaleFactor: 1.5),
                Text("-", textScaleFactor: 1.5),
                Text("-", textScaleFactor: 1.5),
                Text("-", textScaleFactor: 1.5),
              ]),
              TableRow(children: [
                Text("Osmia cornuta", textScaleFactor: 1.5),
                Text("34", textScaleFactor: 1.5),
                Text("D0314", textScaleFactor: 1.5),
                Text("-", textScaleFactor: 1.5),
                Text("-", textScaleFactor: 1.5),
                Text("-", textScaleFactor: 1.5),
              ]),
              TableRow(children: [
                Text("Bombus terrestris", textScaleFactor: 1.5),
                Text("76", textScaleFactor: 1.5),
                Text("D0331", textScaleFactor: 1.5),
                Text("-", textScaleFactor: 1.5),
                Text("-", textScaleFactor: 1.5),
                Text("-", textScaleFactor: 1.5),
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}
