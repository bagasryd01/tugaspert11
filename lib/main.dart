import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Menampilkan Data API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'BAGAS RIYADI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyhomePageState createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Text('Hello Bagas'),
        ));
  }
}


class _MyHomePageState extends State<MyHomePage> {

  
List dataList = [];
Future<void> fetchData() async {
  var url = Uri.parse('https://api.apis.guru/v2/list.json');
  var response = await http.get(url);
    if (response.statusCode == 200) {
  dataList = jsonDecode(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

}
@override
  void initState() {
  super.initState();
  fetchData();
}

@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text('HTTP Request'),
  ),
    body: ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
return ListTile(
    title: Text(dataList[index][‘title’]),
    );
  },
 ),
);