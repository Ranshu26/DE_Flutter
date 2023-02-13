import 'package:http/http.dart' as http;

Future<String> httpGET(String server, String path) async {
  // var url = Uri.https(server, path, {'q': '{http}', 'serialno': '101'});
  // var response = await http.get(url);
  var response = await http.get(
      'https://hn4it8nqce.execute-api.us-west-2.amazonaws.com/bee/devicelist?serialno=101'
          as Uri);

  if (response.statusCode == 200) {
    print("Retrieved from aws:" + response.body);
    return response.body;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return "Could not load";
  }
}

Future<String> getDATA() {
  Future<String> Stat = httpGET(
      'https://hn4it8nqce.execute-api.us-west-2.amazonaws.com',
      '/bee/devicelist');
  return Stat;
}
// class httploader extends StatefulWidget {
//   const httploader({Key? key}) : super(key: key);

//   @override
//   State<httploader> createState() => _httploaderState();
// }
// class _httploaderState {
//   Future<String> httpGET(String server, String path) async {
//     var url = Uri.https(server, path, {'q': '{http}', 'serialno': '101'});
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       print("Retrieved from aws:" + response.body);
//       return response.body;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//       return "Could not load";
//     }
//   }

//   Future<String> getDATA() {
//     Future<String> Stat = httpGET(
//         'https://hn4it8nqce.execute-api.us-west-2.amazonaws.com',
//         '/bee/devicelist');
//     return Stat;
//   }
// }
