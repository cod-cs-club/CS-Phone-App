import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:phone_app_test/Custom-Widgets/todo2.dart';
import 'package:phone_app_test/Custom-Widgets/todoView.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences prefs; // Obtain shared preferences
  List todos = []; // Create list to hold task (as objects)
  setupTodo() async { // Initiliazing the homepage of todo widget (Look at void initState() method)
    prefs = await SharedPreferences.getInstance();
    String? stringTodo = prefs.getString('todo');
    List? todoList = jsonDecode(stringTodo!);
    for (var todo in todoList!) {
      setState(() {
        todos.add(Todo().fromJson(todo));
      });
    }
  }

  // Saving through a JSON file the list of objects (tasks) created
  void saveTodo() {
    List items = todos.map((e) => e.toJson()).toList();
    prefs.setString('todo', jsonEncode(items)); // Encoding the list of objects as string, file name 'todo'
  }

  // Initialize method
  @override
  void initState() {
    super.initState();
    setupTodo();
  }

  // Creating the main body (Scaffold) for the main page of the todo list widget
  Color appcolor = const Color(0xff161616);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor, // Background color of the app
      // Creating the app bar
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 20,
        // toolbarHeight: 10, does not work, it cuts the title in half
        title: Text("Todo"),
        backgroundColor: Color(0xff2c704e), // Color of Title bar of TODO LIST
      ),
      // Creating the body of the container
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff161616),
                  ),
                  // For more info related to the InkWell class look over this link: https://api.flutter.dev/flutter/material/InkWell-class.html
                  child: InkWell(
                    onTap: () async {
                      Todo? t = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TodoView(todo: todos[index])));
                      if (t != null) {
                        setState(() {
                          todos[index] = t;
                        });
                        saveTodo();
                      }
                    },
                    child: makeListTile(todos[index], index),
                  ),
                ));
          }),
          // Button for the creation of a new task
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black12,
        onPressed: () {
          addTodo(); // Call method for creating new task, which open the TodoView page/widget
        },
        child: const Icon(Icons.add), // Display icon to create new task
      ),
    );
  }

  // Adding the task to the list
  addTodo() async {
    int id = Random().nextInt(30); // Creating a random id to create a new task inside the list
    Todo t = Todo(id: id, title: '', description: '', status: false); // Attaching and passing the required arguments to create the object inside the list
    Todo? returnTodo = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => TodoView(todo: t)));
    if (returnTodo != null) {
      setState(() {
        todos.add(returnTodo);
      });
      saveTodo();
    }
  }

  // List tile (rectangle of the task container which holds Title, Description, and Icon for "marked as done" or not)
  makeListTile(Todo todo, index) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // setting the padding for the rectangle task tile
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: CircleAvatar(
            backgroundColor: Colors.black26, // Color of the task number circle background
            child: Text("${index + 1}"),
          ),
        ),
        // Text of the tile
        title: Row(
          children: [
            Text(
              todo.title, // Display the title of the task
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Set the font of the title as BOLD and white color
            ),
            SizedBox(
              width: 10,
            ),
            todo.status
            // Marked as done icon
                ? Icon(
                    Icons.verified,
                    color: Color(0xff2c704e), // Color of the "marked as done" icon
                  )
                : Container()
          ],
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Wrap(
          children: <Widget>[
            Text(todo.description, // Description, this handles the display on the homepage of the description text. 
                overflow: TextOverflow.clip,
                maxLines: 1, // As you can see, only 1 line will be visible. To see all text will need to open the TodoView page
                style: TextStyle(color: Colors.white))
          ],
        ),
        trailing: InkWell(
            onTap: () {
              delete(todo);
            },
            child: const Icon(Icons.delete, color: Colors.white, size: 20.0)));
            // The line above sets the delete icon as color white, and a size of 20px
  }

  // Delete method in order to delete the specified task
  delete(Todo todo) {
    return showDialog(
        context: context,
        builder: (ctx) => AlertDialog( // Creating a popup warning before deleting
              title: Text("Wooo heyy, wait!"), // Title of the popup
              content: Text("You really want to delete it ?"), // Description of the popup
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: Text("No")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        todos.remove(todo);
                      });
                      Navigator.pop(ctx);
                      saveTodo();
                    },
                    child: Text("Yes"))
              ],
            ));
  }
}