import 'package:flutter/material.dart';
// import 'package:noteagain/widgets/add_notes.dart';
import 'package:noteagain/widgets/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        primaryColor: Colors.deepOrangeAccent,
        accentColor: Colors.deepPurple,
        brightness: Brightness.dark,
        errorColor: Colors.redAccent,
        textTheme: TextTheme(
          title: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white70),
          body2: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            color: Colors.grey,
          ),
          subtitle: TextStyle(color: Colors.grey),
        ),
      ),
      home: MyHomePage(),
      // routes: {
      //   AddNote.routeName: (ctx) => AddNote(),
      // },
    );
  }
}
