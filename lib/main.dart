import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  const app({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Mainpage());
  }
}

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});
  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  String url1 = "sundarampal.github.io",
      url2 = "/myjsonfiles/mainpage.json";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mypage"), centerTitle: true),
      body: Column(
        children: [
          SizedBox(height: 300),
          Center(
            child: ElevatedButton(
              child: Text("Click button"),
              onPressed: () async {
                final url = Uri.https(url1, url2, {});
                final response = await http.get(url);

                final jsonResponse = convert.jsonDecode(response.body);
                var data = jsonResponse[0];
                print(data);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
