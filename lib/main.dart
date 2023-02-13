// import 'package:flutter/material.dart';
// import 'package:shopping_application_1/http_loader.dart';
// import 'package:shopping_application_1/screens/LoginScreen/Login_screen.dart';
// import 'package:shopping_application_1/screens/LoginScreen/dynamodb.dart';

// import 'package:shopping_application_1/table.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: LoginScreen(),
//     );
//   }
// }
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http.get(
      Uri.parse('https://mocki.io/v1/d485ae33-22bf-4367-bae7-3f353a3663dd'));
  // Uri.parse( 'https://hn4it8nqce.execute-api.us-west-2.amazonaws.com/bee/devicelist?serialno=101'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String serialno;
  final String deviceId;
  final int mean;
  final int sd;
  final String speciesName;
  final double temperature;
  final String timeStamp;

  const Album({
    required this.serialno,
    required this.deviceId,
    required this.mean,
    required this.sd,
    required this.speciesName,
    required this.temperature,
    required this.timeStamp,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      serialno: json['serialno'],
      deviceId: json['deviceId'],
      mean: json['mean'],
      sd: json['sd'],
      speciesName: json['speciesName'],
      temperature: json['temperature'],
      timeStamp: json['timeStamp'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sygenta Biodiversity Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('STATUS'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String test = snapshot.data!.serialno +
                    " " +
                    snapshot.data!.timeStamp +
                    " " +
                    snapshot.data!.deviceId +
                    " " +
                    snapshot.data!.speciesName +
                    " " +
                    snapshot.data!.mean.toString() +
                    " " +
                    snapshot.data!.sd.toString() +
                    " " +
                    snapshot.data!.temperature.toString();

                // return Text(snapshot.data!.deviceId);
                return Text(test);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
