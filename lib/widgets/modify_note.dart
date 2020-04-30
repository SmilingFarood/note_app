import 'package:flutter/material.dart';

class ModifyNote extends StatefulWidget {
  ModifyNote({
    Key key,
    @required this.noteId,
    @required this.noteTitle,
    //@required this.noteContent,
  }) : super(key: key);
  final String noteId;
  final String noteTitle;
  final noteContent = TextEditingController();

  

  @override
  _ModifyNoteState createState() => _ModifyNoteState();
}

class _ModifyNoteState extends State<ModifyNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modify Note'),
      ),
      body: Container(
        child: Column(children: [
          Text(''),
          Divider(),
          TextField()
        ]),
      ),
    );
  }
}
