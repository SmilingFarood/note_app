import 'package:flutter/material.dart';
import 'package:noteagain/models/note_model.dart';
import 'package:noteagain/widgets/add_notes.dart';
import 'package:noteagain/widgets/note_list.dart';
// import 'package:uuid/uuid.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Note> notes = [
    Note(
      'n1',
      DateTime.now(),
      'Title',
      'Ut lectus arcu bibendum at varius. Aliquam id diam maecenas ultricies mi eget mauris pharetra. Orci eu lobortis elementum nibh tellus molestie nunc non. Et molestie ac feugiat sed lectus vestibulum mattis. Massa ultricies mi quis hendrerit dolor. Amet commodo nulla facilisi nullam vehicula ipsum a. Nam libero justo laoreet sit amet cursus sit amet dictum. Facilisi etiam dignissim diam quis. Hendrerit gravida rutrum quisque non tellus orci ac. Leo in vitae turpis massa sed. Sit amet nisl purus in mollis nunc. Netus et malesuada fames ac turpis egestas maecenas pharetra convallis. Vel pretium lectus quam id. Dictum fusce ut placerat orci nulla pellentesque dignissim enim. Morbi tincidunt augue interdum velit euismod in pellentesque massa. Mauris in aliquam sem fringilla. Etiam erat velit scelerisque in dictum non consectetur. Aliquet porttitor lacus luctus accumsan.',
    ),
    Note(
      'n2',
      DateTime.now(),
      'Title',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ipsum nunc aliquet bibendum enim. Donec ac odio tempor orci dapibus ultrices in. Lectus nulla at volutpat diam ut. Fermentum dui faucibus in ornare quam viverra orci. At varius vel pharetra vel. Interdum velit laoreet id donec ultrices tincidunt. Cras semper auctor neque vitae tempus quam pellentesque. Phasellus faucibus scelerisque eleifend donec pretium vulputate sapien nec sagittis. Montes nascetur ridiculus mus mauris vitae ultricies leo. Faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae. Tempus urna et pharetra pharetra massa massa ultricies. Dignissim sodales ut eu sem integer. Pellentesque sit amet porttitor eget dolor morbi. Amet aliquam id diam maecenas ultricies.',
    )
  ];

  void addNewNote(String title, String content) {
    final newNote = Note(
      UniqueKey().toString(),
      DateTime.now(),
      title,
      content,
    );
    setState(() {
      notes.add(newNote);
    });
  }

  void deleteNote(String id) {
    setState(() {
      notes.removeWhere((note) => note.id == id);
    });
  }

  void startAddNewNote(BuildContext writeNote) {
    Navigator.of(writeNote).push(
      MaterialPageRoute(
        builder: (_) {
          return AddNote(addNotes: addNewNote);
        },
      ),
    );
  }

  //do not use this function for anything till next commit
  // void modifyExistingNote(BuildContext openANote, String id) {
  //   Navigator.of(openANote).push(
  //     MaterialPageRoute(
  //       builder: (_) {
  //         return AddNote(addNotes: addNewNote);
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: NoteList(
        myNotes: notes,
        deleteNote: deleteNote,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.create),
          onPressed: () {
            startAddNewNote(context);
          }),
    );
  }
}
