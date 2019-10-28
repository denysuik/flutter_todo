import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  List<String> items = ['item 1', 'item 2', 'item 3'];
  TextEditingController _textFieldController = TextEditingController();

  Widget _buildList() {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Row(children: <Widget>[Text(items[index]),
          FlatButton(
            child: Text('Delete'),
            onPressed: (){
              setState(() {
                items.removeAt(index);
              });
            },
          )],); 
        });
  }

  _addNewItem(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Write new action todo'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: 'Todo action'),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Add'),
                onPressed: () {
                  setState(() {
                    if (_textFieldController.text.length > 0) {
                      items.add(_textFieldController.text);
                      _textFieldController.clear();
                    }
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Todo list")),
        body: _buildList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addNewItem(context),
          tooltip: 'Add',
          child: Icon(Icons.add),
        ));
  }
}
