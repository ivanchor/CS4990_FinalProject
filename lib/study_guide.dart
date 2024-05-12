import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:cs4990_finalproject/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}


class _GuidePageState extends State<GuidePage> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController topicsController = TextEditingController();
  String responseText = '';

  Future<void> sendHttpRequest() async {
    String subject = subjectController.text.trim();
    String topics = topicsController.text.trim();

    if (subject.isEmpty || topics.isEmpty) {
      setState(() {
        responseText = 'Please enter both subject and topics.';
      });
      return;
    }

    String apiUrl =
        'https://ec99b389-24a1-44f8-861b-102af7bc1b35-00-9oc5zu2q535a.worf.replit.dev/study/$subject/$topics';

    try {
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Successfully received data
        String responseData = response.body;
        setState(() {
          responseText = responseData;
        });
      } else {
        // Handle different status codes
        setState(() {
          responseText = 'Failed to fetch data. Status code: ${response.statusCode}';
        });
      }
    } catch (e) {
      // Handle connection errors
      setState(() {
        responseText = 'Failed to connect to the server: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff435585),
      appBar: AppBar(
        backgroundColor: Color(0xff435585),
        title: Text('Custom Study Guide'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: subjectController,
              decoration: InputDecoration(labelText: 'Subject', labelStyle: TextStyle(color: Colors.white)),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
            TextField(
              controller: topicsController,
              decoration: InputDecoration(labelText: 'Topics', labelStyle: TextStyle(color: Colors.white)),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendHttpRequest,
              child: Text('Send Request'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    responseText,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}