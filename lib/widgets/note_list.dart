import 'package:flutter/material.dart';
import 'package:noteagain/models/note_model.dart';
import 'package:intl/intl.dart';
import 'package:noteagain/widgets/add_notes.dart';

class NoteList extends StatelessWidget {
  const NoteList({
    Key key,
    @required this.myNotes,
    @required this.deleteNote,
  }) : super(key: key);

  final List<Note> myNotes;
  final Function(String) deleteNote;

  @override
  Widget build(BuildContext context) {
    return myNotes.isEmpty
        ? LayoutBuilder(
            builder: (context, ctx) {
              return Center(
                child: Text(
                  'Make your first note!',
                  style: Theme.of(context).textTheme.title,
                ),
              );
            },
          )
        : ListView.builder(
            itemCount: myNotes.length,
            itemBuilder: (_, i) {
              return Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => AddNote(
                                title: myNotes[i].title,
                                content: myNotes[i].content,
                              )));
                    },
                    child: ListTile(
                      //leading: Text(myNotes[i].title),
                      title: Text(
                        myNotes[i].content,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(myNotes[i].date),
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).errorColor,
                        ),
                        onPressed: () {
                          deleteNote(myNotes[i].id);
                        },
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                  ),
                ],
              );
            },
          );
  }
}
