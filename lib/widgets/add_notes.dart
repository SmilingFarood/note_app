import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  static const routeName = '/add-note';
  final Function addNotes;
  // final String id;
  final String title;
  final String content;
  AddNote({
    Key key,
    this.addNotes,
    // this.id = '',
    this.title = '',
    this.content = '',
  }) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController titleController;
  TextEditingController contentController;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.title);
    contentController = TextEditingController(text: widget.content);
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void submitNote() {
      if (titleController.text.isEmpty || contentController.text.isEmpty)
        return;

      widget.addNotes(titleController.text, contentController.text);

      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Make note'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.save,
                size: 30,
              ),
              onPressed: () {
                submitNote();
              }),
        ],
      ),
      body: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Title',
            ),
          ),
          Divider(),
          Expanded(
            child: Container(
              height: double.infinity,
              //color: Colors.redAccent,
              child: TextField(
                controller: contentController,
                maxLines: 1000,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Content',
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
