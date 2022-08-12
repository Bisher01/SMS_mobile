import 'package:json_annotation/json_annotation.dart';
import 'package:sms_mobile/models/models.dart';
part 'subject_class.g.dart';

/*
{
    "status": true,
    "message": "successs",
    "data": [
        {
            "subject": {
                "id": 1,
                "name": "math"
            },
            "classes": [
                {
                    "id": 1,
                    "class_id": 1,
                    "classroom_id": 1,
                    "classes": {
                        "id": 1,
                        "name": " first class",
                        "grade_id": 1
                    },
                    "classrooms": {
                        "id": 1,
                        "name": 1,
                        "max_number": 20
                    }
                },
                {
                    "id": 2,
                    "class_id": 2,
                    "classroom_id": 1,
                    "classes": {
                        "id": 2,
                        "name": "second class",
                        "grade_id": 1
                    },
                    "classrooms": {
                        "id": 1,
                        "name": 1,
                        "max_number": 20
                    }
                },
                {
                    "id": 14,
                    "class_id": 2,
                    "classroom_id": 2,
                    "classes": {
                        "id": 2,
                        "name": "second class",
                        "grade_id": 1
                    },
                    "classrooms": {
                        "id": 2,
                        "name": 2,
                        "max_number": 30
                    }
                },
                {
                    "id": 3,
                    "class_id": 3,
                    "classroom_id": 1,
                    "classes": {
                        "id": 3,
                        "name": "third class",
                        "grade_id": 1
                    },
                    "classrooms": {
                        "id": 1,
                        "name": 1,
                        "max_number": 20
                    }
                },
                {
                    "id": 15,
                    "class_id": 3,
                    "classroom_id": 2,
                    "classes": {
                        "id": 3,
                        "name": "third class",
                        "grade_id": 1
                    },
                    "classrooms": {
                        "id": 2,
                        "name": 2,
                        "max_number": 30
                    }
                },
                {
                    "id": 4,
                    "class_id": 4,
                    "classroom_id": 1,
                    "classes": {
                        "id": 4,
                        "name": "fourth class",
                        "grade_id": 1
                    },
                    "classrooms": {
                        "id": 1,
                        "name": 1,
                        "max_number": 20
                    }
                },
                {
                    "id": 16,
                    "class_id": 4,
                    "classroom_id": 2,
                    "classes": {
                        "id": 4,
                        "name": "fourth class",
                        "grade_id": 1
                    },
                    "classrooms": {
                        "id": 2,
                        "name": 2,
                        "max_number": 30
                    }
                }
            ]
        }
    ]
}
 */
@JsonSerializable()
class SubjectClass {
  bool? status;
  String? message;
  List<TeacherData>? data;

  SubjectClass({
    this.status,
    this.message,
    this.data,
  });

  factory SubjectClass.fromJson(Map<String, dynamic> json) =>
      _$SubjectClassFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectClassToJson(this);
}

@JsonSerializable()
class TeacherData {
  Subject? subject;
  List<ClassClassroom>? classes;

  TeacherData({
   this.classes,
    this.subject,
  });

  factory TeacherData.fromJson(Map<String, dynamic> json) =>
      _$TeacherDataFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherDataToJson(this);
}


@JsonSerializable()
class ClassClassroom {
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: 0)
  int? class_id;
  @JsonKey(defaultValue: 0)
  int? classroom_id;
  Classes? classes;
  Classroom? classrooms;

  ClassClassroom({
    this.id,
    this.classes,
    this.class_id,
    this.classroom_id,
    this.classrooms,
  });

  factory ClassClassroom.fromJson(Map<String, dynamic> json) =>
      _$ClassClassroomFromJson(json);
  Map<String, dynamic> toJson() => _$ClassClassroomToJson(this);
}
