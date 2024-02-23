
import 'package:note_app_v2/model/task_type.dart';

// class Task{
//    int? id;
//   String? title;
//   String? date;
//   String? time;
//   TaskType? type;
//
//   Task({this.id,this.title,this.date,this.time,this.type});
// }

class Task{
  int? id;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? status;

  Task({this.id,this.title,this.description,this.startDate,this.endDate,this.status});

  Task.fromJson(Map<String,dynamic> json)
  {
    id=json["id"];
    title=json["title"];
    description=json["description"];
    startDate=json["start_date"];
    endDate=json["end_date"];
    status=json["status"];
  }
}