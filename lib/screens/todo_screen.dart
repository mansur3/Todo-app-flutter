import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Todo_screen extends StatefulWidget {
  const Todo_screen({Key? key}) : super(key: key);

  @override
  State<Todo_screen> createState() => _Todo_screenState();
}

class _Todo_screenState extends State<Todo_screen> {


  var holdOneTask = "";


  List<Map> tasks = [
    {
      "title": "this is india",
      "isChecked" : false,

    },
    {
      "title" : "This is the other world",
      "isChecked" : false,
    },
    {
      "title" : "This is another world",
      "isChecked" : true,
    }
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Expanded(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(
                    left: 60.0,
                    top: 30.0,
                    right: 30.0,
                    bottom: 30.0,
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 30.0,
                        color: Colors.lightBlueAccent,
                      ),
                      radius: 30.0,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Todoey",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      )
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                        "${tasks.length} Tasks",
                      style: TextStyle(
                        fontSize : 18.0,
                        color: Colors.white,
                      )
                    )
                  ],
                )
              ),
              Expanded(

               child: Container(
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(topLeft:Radius.circular(30.0), topRight: Radius.circular(30.0)),
                 ),
                 child: ListView.builder(
                     padding: EdgeInsets.all(8),
                     itemCount: tasks.length,
                     itemBuilder: (BuildContext context, int index) {
                       return Container(
                         height: 50,

                         child: Row(
                           children: [
                             Text(
                                 tasks[index]['title'],
                               style: TextStyle(
                                 decoration: tasks[index]['isChecked'] ? TextDecoration.lineThrough : null,
                               )
                             ),
                             Checkbox(
                               checkColor: Colors.greenAccent,
                               activeColor: Colors.lightBlueAccent,
                               value: tasks[index]['isChecked'],
                               onChanged: (bool? value) {
                                 setState(() {
                                   tasks[index]['isChecked'] = !tasks[index]['isChecked'];
                                 });
                               },
                             ),

                           ],
                         )
                       );
                     },
                 ),
               ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(

            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 700,
               color: Color(0xFF757575),
                child: Expanded(
                  child : Container(
                    padding: EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(30.0), topRight: Radius.circular(30.0))
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,

                        // mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Add Task",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextField(
                            autofocus: true,
                            onChanged: (value) {
                              setState(() {
                                holdOneTask = value;
                              });
                            }

                          ),
                          FlatButton(
                              onPressed: () {

                                setState(() {
                                  tasks.add(
                                    {
                                      "title" : holdOneTask,
                                      "isChecked" : false,
                                    }
                                  );
                                });
                              },
                            color: Colors.lightBlueAccent,
                              child: Text(
                                  "Add Task",
                                style: TextStyle(
                                  color: Colors.white,
                                )
                              ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
            Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
