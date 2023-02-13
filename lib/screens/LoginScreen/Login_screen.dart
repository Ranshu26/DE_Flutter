// ignore: file_names
// ignore: file_names
import 'dart:convert';
//import 'dart:ffi';
//import 'dart:html';

import 'package:flutter/material.dart';

//import 'package:flutter/Login_screen.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_application_1/model.dart';

// aws.configure(
//   // ignore: deprecated_colon_for_default_value
//   accessKeyId: 'AKIAQWGWYXN3XWSNR3OM',
//   secretAccessKey: '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' ,
//   region: 'us-west-2',
// );
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<Welcome> welcome = [];

  Map<String, dynamic>? get index => null;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, index) {
          if (index.hasData) {
            return ListView.builder(
                itemCount: welcome.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 130,
                    color: Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'serialno: ${welcome[index].serialno}',
                          //maxLines: 1,
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'deviceId: ${welcome[index].deviceId}',
                          //maxLines: 1,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'mean: ${welcome[index].mean}',
                          //maxLines: 1,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'sd: ${welcome[index].sd}',
                          //maxLines: 1,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'speciesName: ${welcome[index].speciesName}',
                          //maxLines: 1,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'temperature: ${welcome[index].temperature}',
                          //maxLines: 1,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'timeStamp: ${welcome[index].timeStamp}',
                          //maxLines: 1,
                          style: TextStyle(fontSize: 18),
                        ),
                        // Text(
                        //   'Title: ${welcome[index].title}',
                        //   maxLines: 1,
                        //   style: const TextStyle(fontSize: 18),
                        // ),
                        // Text(
                        //   'Body: ${welcome[index].body}',
                        //   maxLines: 1,
                        //   style: TextStyle(fontSize: 18),
                        // ),
                      ],
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<Welcome>> getData() async {
    final response =
        // await http.get(Uri.parse('https://hn4it8nqce.execute-api.us-west-2.amazonaws.com/bee'));
        // await http.get(Uri.parse(
        //     'https://hn4it8nqce.execute-api.us-west-2.amazonaws.com/bee/devicelist?serialno=101'));
        await http.get(Uri.parse(
            'https://mocki.io/v1/d485ae33-22bf-4367-bae7-3f353a3663dd'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        welcome.add(Welcome.fromJson(index));
      }
      // print("Retrieved from aws:" + response.body);
      // return response.body;
      return welcome;
    } else {
      return welcome;
    }
  }
  // class http_loader {
  // Future<String> httpGET(String server, String path) async {
  //   // var url = Uri.https(server, path, {'q': '{http}', 'serialno': '101'});
  //   // var response = await http.get(url);
  //   var response = await http.get(
  //       'https://hn4it8nqce.execute-api.us-west-2.amazonaws.com/bee/devicelist?serialno=101'
  //           as Uri);

  //   if (response.statusCode == 200) {
  //     print("Retrieved from aws:" + response.body);
  //     return response.body;
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //     return "Could not load";
  //   }
  // }

  // Future<String> getDATA() {
  //   Future<String> Stat = httpGET(
  //       'https://hn4it8nqce.execute-api.us-west-2.amazonaws.com',
  //       '/bee/devicelist');
  //   return Stat;
  // }

  // Future<void> getDATA() async {
  //   final response = await http.get(
  //       'https://hn4it8nqce.execute-api.us-west-2.amazonaws.com/bee/devicelist?serialno=101'
  //           as Uri);

  //   if (response.statusCode == 200) {
  //     // If the call to the server was successful, parse the JSON
  //     List data = json.decode(response.body);
  //     print(data);
  //   } else {
  //     // If that call was not successful, throw an error.
  //     throw Exception('Failed to load post');
  //   }
  // }

// }
}
