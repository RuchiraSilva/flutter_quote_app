import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "";
  String author = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Quote App",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                quote,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "- $author",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var url = Uri.parse(
                    'http://api.quotable.io/random?tags=technology%2Cfamous-quotes');
                var response = await http.get(url);
                //print('Response status: ${response.statusCode}');
                //print('Response Body: ${response.body}');
                var data = jsonDecode(response.body);
                quote = data['content'];
                author = data['author'];

                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                "Get Quote!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
