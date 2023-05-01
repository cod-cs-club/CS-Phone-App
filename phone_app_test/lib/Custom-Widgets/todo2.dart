import 'dart:convert';

class Todo {
  // Declaring the variables for object/class Todo which is the task.
  int id;
  String title;
  String description;
  bool status;

  // Creating the constructor to create the object with all the necessary arguments/attributes
  Todo({this.id = 0, this.title = "", this.description = "", this.status = false}) {
    id = this.id;
    title = this.title;
    description = this.description;
    status = this.status;
  }

  // Writing the data to a json file - This sets the format required for JSON
  toJson() {
    return {
      "id": id,
      "description": description,
      "title": title,
      "status": status
    };
  }

  // Reading data from the json file stored locally, using the variable name to retrieve the value of it
  fromJson(jsonData) {
    return Todo(
        id: jsonData['id'],
        title: jsonData['title'],
        description: jsonData['description'],
        status: jsonData['status']);
  }
}