import 'package:hive_flutter/hive_flutter.dart';
class  ToDoDatabase{
List toDoList=[
  
];
var _mybox=Hive.box("myBox");
//first xoti open garey par
void createInitialData(){
toDoList=[
  ["exercise",true],
    ["study",false],
];
}

void loadData(){
   toDoList=_mybox.get("TODOLIST");
}
void updateDatabase(){
_mybox.put("TODOLIST",toDoList);
}
}