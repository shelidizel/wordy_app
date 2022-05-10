import 'package:flutter/material.dart';
import 'package:wordy_app/models/todo.dart';
import 'package:wordy_app/network_service/get_todos_service.dart';

class ResponseScreen extends StatefulWidget {
  const ResponseScreen({Key? key}) : super(key: key);

  @override
  State<ResponseScreen> createState() => _ResponseScreenState();
}

class _ResponseScreenState extends State<ResponseScreen> {
  @override
  Widget build(BuildContext context) {

    Widget todoStatus  (bool isCompleted) {
      if( isCompleted == true){
                          return Icon(Icons.check, color: Colors.green,);
                        } return Icon(Icons.clear, color: Colors.red,);

    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Response',
       ),
      ),
      body: Center(
          child: FutureBuilder<List<Todo>>(
              future: TodoNetworkService.getTodos(),
              builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
                if (snapshot.hasData) {
                  List<Todo> todos = snapshot.data!;
                 
                  return ListView.builder(
                              
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (DismissDirection direction){
                                      if (direction == DismissDirection.startToEnd) {
                              print("Add to favorite");
                            } else {
                              print('Remove item');
                            }
                            setState(() {
                              todos.removeAt(index);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(6, 10, 6, 0),
                            child: PhysicalModel(
                              elevation: 5,
                              color: Colors.white,
                              shadowColor: Colors.grey.withOpacity(0.2),
                              child: Container(
                                color: Colors.white,
                                height: 60,
                                
                                child: ListTile(
                                  leading: const Icon(Icons.task),
                                  title: Text(todos[index].title ?? '', style: TextStyle(fontSize: 14),),
                                  trailing: todoStatus(todos[index].isCompletetd!),
                                   ),
                              ),
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {}
                // ignore: prefer_const_constructors
                return SizedBox(
                  height: 2,
                  width: 100,
                  child: LinearProgressIndicator(
                    color: Colors.purple,
                  ),
                );
              })),
    );
  }
}
