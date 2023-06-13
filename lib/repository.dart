import 'dart:convert';
import 'dart:convert';
import 'package:http/http.dart' as http;

class repository {
  Future<void> fetchData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var dataList = jsonDecode(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
