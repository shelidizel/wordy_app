class Todo {
  String? title;
  bool? isCompletetd;

  Todo({this.title, this.isCompletetd});

  Todo.fromJson(Map<String, dynamic> jsonresponse) {
    title = jsonresponse['title'];
    isCompletetd = jsonresponse['completed'];
  }
}
