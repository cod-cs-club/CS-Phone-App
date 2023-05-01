import 'package:flutter/material.dart';
import 'package:phone_app_test/Custom-Widgets/todo2.dart';

class TodoView extends StatefulWidget {
  Todo todo;
  TodoView({Key? key, required this.todo}) : super(key: key);

  @override
  _TodoViewState createState() => _TodoViewState(todo: this.todo);
}

class _TodoViewState extends State<TodoView> {
  Todo todo;
  _TodoViewState({required this.todo});
  TextEditingController titleController = TextEditingController(); // Opening the keyboard to write
  TextEditingController descriptionController = TextEditingController(); // Opening the keyboard to write

  // Initializer method
  @override
  void initState() {
    super.initState();
    if (todo != null) {
      titleController.text = todo.title;
      descriptionController.text = todo.description;
    }
  }

  @override // Added
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161616), // Background color
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        backgroundColor: const Color(0xff2c704e), // Header color
        title: const Text("Task View"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20), // Setting padding for the text box
          child: Column(
            children: [
              Container(
                  child: colorOverride(TextField(
                onChanged: (data) {
                  todo.title = data;
                },
                style: TextStyle(color: Colors.white),
                decoration: new InputDecoration(
                  labelStyle: TextStyle(color: Colors.white), // Color of title text
                  labelText: "Title", // Setting the title
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0), // Border radius, showing a rounded border on title's box
                    borderSide: new BorderSide(color: Colors.white), // Color of the title's box border
                  ),
                  //fillColor: Colors.green
                ),
                controller: titleController,
              ))),
              SizedBox(
                height: 25,
              ),
              Container(
                  child: colorOverride(TextField(
                maxLines: 5,
                onChanged: (data) {
                  todo.description = data;
                },
                style: TextStyle(color: Colors.white), // Setting the style of the description text
                decoration: new InputDecoration(
                  labelStyle: TextStyle(color: Colors.white), // Color of the description text
                  labelText: "Description", // Setting the description
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0), // Corners of the description rectangle's box
                    borderSide: new BorderSide(color: Colors.white), // Border of description text area color
                  ),
                  //fillColor: Colors.green
                ),
                controller: descriptionController,
              ))),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox( // This was a container, modified to a SizedBox
        height: 75.0,
        child: BottomAppBar(
          color: Color(0xff2c704e), // Color of footer/menu of the task view page (where there is buttons for "mark as done" and save)
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: Text("Alert"),
                              content: Text(
                                  "Mark this todo as ${todo.status ? 'not done' : 'done'}  "),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Text("No"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      todo.status = !todo.status;
                                    });
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Text("Yes"),
                                )
                              ],
                            ));
                  },
                  child: Text(
                    "${todo.status ? 'Mark as Not Done' : 'Mark as Done'} ",
                    style: TextStyle(color: Colors.white),
                  )),
              VerticalDivider(
                color: Colors.white,
              ),
              IconButton(
                icon: const Icon(Icons.save, color: Colors.white), // This displays the icon to save the task inside the list
                onPressed: () {
                  Navigator.pop(context, todo); // Inserts inside the list the task
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget colorOverride(Widget child) {
    return new Theme(
      data: new ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.white,
        hintColor: Colors.white,
      ),
      child: child,
    );
  }
}