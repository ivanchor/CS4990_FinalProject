// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:cs4990_finalproject/study_guide.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Method for Elevated Button "Split"
  // Opens GuidePage page
  void _goToGuidePage(){
    setState(() {

    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GuidePage()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Background Color
      backgroundColor: Color(0xff435585),

      body: Column(
        children: [
          // Main Title
          Expanded(
            flex: 30,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // Main Title Text
                  const Text("Study Guide",
                      style: TextStyle(
                          fontSize: 50,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF5E8C7),

                          //Shadow Effect
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(-5, 6),
                                blurRadius: 5,
                                color: Colors.black
                            ),

                          ]
                      )
                  ),
                ]
            ),
          ),

          //Button to move to GuidePage
          Expanded(
            flex: 70,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  //Button to move to GuidePage
                  ElevatedButton(
                    // Button style
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff2fd09e),
                      foregroundColor: Color(0xff000000),
                      minimumSize:Size(300, 100),
                    ),

                    // Press command with method
                    onPressed: () {
                      _goToGuidePage();
                    },

                    child:
                    // Button Text and Style
                    const Text("Create Guide",
                        style: TextStyle(
                          fontSize: 40,
                        )
                    ),
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }

} // Class
