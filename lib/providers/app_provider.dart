import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:sms_mobile/models/student_exam.dart';
import '../models/add_question.dart';
import '../services/api_response.dart';
import '../services/api_service.dart';
import '../models/models.dart';
import '../services/api_exception.dart';

class AppProvider extends ChangeNotifier {
  //token box
  void setToken(String token) {
    var box = Boxes.getAuthBox();
    //box.clear();
    box.put('token', token);
    notifyListeners();
  }

  //role box
  void setRole(String role) {
    var box = Boxes.getRoleBox();
    //box.clear();
    box.put('role', role);
    notifyListeners();
  }

  //get role
  String getRole() {
    var box = Boxes.getRoleBox();
    return box.get('role') ?? "";
  }

  //get id
  int getId() {
    var box = Boxes.getIdBox();
    return box.get('id') ?? 0;
  }

  //id box
  void setId(int id) {
    var box = Boxes.getIdBox();
    //box.clear();
    box.put('id', id);
    notifyListeners();
  }

  //welcome box
  void setWelcome() {
    var box = Boxes.getWelcomeBox();
    //box.clear();
    box.put('welcome', true);
    notifyListeners();
  }

  //check connection
  bool isConnected = false;
  Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    isConnected = connectivityResult != ConnectivityResult.none;
    return isConnected;
  }

  //get all teachers
  ApiResponse<FTeacher>? _fTeacherResponse;
  ApiResponse<FTeacher>? get fTeacherResponse => _fTeacherResponse;
  set fTeacherResponse(ApiResponse<FTeacher>? value) {
    _fTeacherResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FTeacher>> getAllTeachers() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      fTeacherResponse = ApiResponse.loading('');
      try {
        FTeacher teacher = await apiService.getAllTeachers();
        fTeacherResponse = ApiResponse.completed(teacher);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fTeacherResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fTeacherResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fTeacherResponse = ApiResponse.error('No Internet Connection');
    }
    return fTeacherResponse!;
  }

  //get all students
  ApiResponse<FStudent>? _fStudentResponse;
  ApiResponse<FStudent>? get fStudentResponse => _fStudentResponse;
  set fStudentResponse(ApiResponse<FStudent>? value) {
    _fStudentResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FStudent>> getAllStudents() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      fStudentResponse = ApiResponse.loading('');
      try {
        FStudent fStudent = await apiService.getAllStudents();
        fStudentResponse = ApiResponse.completed(fStudent);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            fStudentResponse = ApiResponse.error(forcedException.toString());
          }
        } else {
          fStudentResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fStudentResponse = ApiResponse.error('No Internet Connection');
    }
    return fStudentResponse!;
  }

  //get all subjects
  ApiResponse<FSubject>? _fSubjectResponse;
  ApiResponse<FSubject>? get fSubjectResponse => _fSubjectResponse;
  set fSubjectResponse(ApiResponse<FSubject>? value) {
    _fSubjectResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FSubject>> getAllSubjects() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      fSubjectResponse = ApiResponse.loading('');
      try {
        FSubject fSubject = await apiService.getAllSubjects();
        fSubjectResponse = ApiResponse.completed(fSubject);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            fSubjectResponse = ApiResponse.error(forcedException.toString());
          }
        }
        fSubjectResponse = ApiResponse.error(e.toString());
      }
    } else {
      return fSubjectResponse = ApiResponse.error('No Internet Connection');
    }
    return fSubjectResponse!;
  }

  //get all mentors
  ApiResponse<FMentor>? _fMentorResponse;
  ApiResponse<FMentor>? get fMentorResponse => _fMentorResponse;
  set fMentorResponse(ApiResponse<FMentor>? value) {
    _fMentorResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FMentor>> getAllMentors() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      fMentorResponse = ApiResponse.loading('');
      try {
        FMentor fMentor = await apiService.getAllMentors();
        fMentorResponse = ApiResponse.completed(fMentor);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            fMentorResponse = ApiResponse.error(forcedException.toString());
          }
        } else {
          fMentorResponse = ApiResponse.error(e.toString());
        }
      }
    }
    return fMentorResponse!;
  }

  //all authentication
  ApiResponse<Auth>? _authResponse;
  ApiResponse<Auth>? get authResponse => _authResponse;
  set authResponse(ApiResponse<Auth>? value) {
    _authResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Auth>> login(
      String first, String last, String code) async {
    ApiService apiService = ApiService(Dio());
    FormData formData =
        FormData.fromMap({'f_name': first, 'l_name': last, 'code': code});
    if (await checkInternet()) {
      authResponse = ApiResponse.loading('');
      try {
        Auth auth = await apiService.login(formData);
        authResponse = ApiResponse.completed(auth);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return authResponse = ApiResponse.error(forcedException.toString());
          }
        } else {
          return authResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return authResponse = ApiResponse.error('No Internet Connection');
    }
    return authResponse!;
  }

  //get all classrooms
  ApiResponse<FClassroom>? _fClassrooms;
  ApiResponse<FClassroom>? get fClassroomResponse => _fClassrooms;
  set fClassroomResponse(ApiResponse<FClassroom>? value) {
    _fClassrooms = value;
    notifyListeners();
  }

  Future<ApiResponse<FClassroom>> getAllClassrooms() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      fClassroomResponse = ApiResponse.loading('');
      try {
        FClassroom fClassroom = await apiService.getAllClassrooms();
        fClassroomResponse = ApiResponse.completed(fClassroom);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            fClassroomResponse = ApiResponse.error(forcedException.toString());
          }
        } else {
          fClassroomResponse = ApiResponse.error(e.toString());
        }
      }
    }
    return fClassroomResponse!;
  }

  //add subject
  ApiResponse<FSubject>? _fAddSubjectResponse;
  ApiResponse<FSubject>? get fAddSubjectResponse => _fAddSubjectResponse;
  set fAddSubjectResponse(ApiResponse<FSubject>? value) {
    _fAddSubjectResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FSubject>> addSubject(
    String subjectName,
  ) async {
    ApiService apiService = ApiService(Dio());
    FormData formData = FormData.fromMap({
      'subject_name': subjectName,
    });
    if (await checkInternet()) {
      fAddSubjectResponse = ApiResponse.loading('');
      try {
        FSubject subject = await apiService.addSubject(formData);
        fAddSubjectResponse = ApiResponse.completed(subject);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fAddSubjectResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fAddSubjectResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fAddSubjectResponse = ApiResponse.error('No Internet Connection');
    }
    return fAddSubjectResponse!;
  }

  //edit subject
  ApiResponse<FSubject>? _fEditSubjectResponse;
  ApiResponse<FSubject>? get fEditSubjectResponse => _fEditSubjectResponse;
  set fEditSubjectResponse(ApiResponse<FSubject>? value) {
    _fEditSubjectResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FSubject>> editSubject(String subjectName, int id) async {
    ApiService apiService = ApiService(Dio());
    FormData formData =
        FormData.fromMap({'subject_name': subjectName, 'method': 'PUT'});
    if (await checkInternet()) {
      fEditSubjectResponse = ApiResponse.loading('');
      try {
        FSubject subject = await apiService.editSubject(formData, id);
        fEditSubjectResponse = ApiResponse.completed(subject);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return fEditSubjectResponse =
                ApiResponse.error(forcedException.toString());
          }
        } else {
          return fEditSubjectResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return fEditSubjectResponse = ApiResponse.error('No Internet Connection');
    }
    return fEditSubjectResponse!;
  }

  //get student
  ApiResponse<FStudent>? _getStudentResponse;
  ApiResponse<FStudent>? get getStudentResponse => _getStudentResponse;
  set getStudentResponse(ApiResponse<FStudent>? value) {
    _getStudentResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FStudent>> getStudent(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getStudentResponse = ApiResponse.loading('');
      try {
        FStudent fStudent = await apiService.getStudent(id);
        getStudentResponse = ApiResponse.completed(fStudent);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            getStudentResponse = ApiResponse.error(forcedException.toString());
          }
        } else {
          getStudentResponse = ApiResponse.error(e.toString());
        }
      }
    }
    return getStudentResponse!;
  }

  //get teacher
  ApiResponse<FTeacher>? _getTeacherResponse;
  ApiResponse<FTeacher>? get getTeacherResponse => _getTeacherResponse;
  set getTeacherResponse(ApiResponse<FTeacher>? value) {
    _getTeacherResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FTeacher>> getTeacher(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getTeacherResponse = ApiResponse.loading('');
      try {
        FTeacher fTeacher = await apiService.getTeacher(id);
        getTeacherResponse = ApiResponse.completed(fTeacher);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            getTeacherResponse = ApiResponse.error(forcedException.toString());
          }
        } else {
          getTeacherResponse = ApiResponse.error(e.toString());
        }
      }
    }
    return getTeacherResponse!;
  }

  //get mentor
  ApiResponse<FMentor>? _getMentorResponse;
  ApiResponse<FMentor>? get getMentorResponse => _getMentorResponse;
  set getMentorResponse(ApiResponse<FMentor>? value) {
    _getMentorResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FMentor>> getMentor(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getMentorResponse = ApiResponse.loading('');
      try {
        FMentor fMentor = await apiService.getMentor(id);
        getMentorResponse = ApiResponse.completed(fMentor);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            getMentorResponse = ApiResponse.error(forcedException.toString());
          }
        } else {
          getMentorResponse = ApiResponse.error(e.toString());
        }
      }
    }
    return getMentorResponse!;
  }

  //get parent
  ApiResponse<FParent>? _getParentResponse;
  ApiResponse<FParent>? get getParentResponse => _getParentResponse;
  set getParentResponse(ApiResponse<FParent>? value) {
    _getParentResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FParent>> getParent(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getParentResponse = ApiResponse.loading('');
      try {
        FParent fParent = await apiService.getParent(id);
        getParentResponse = ApiResponse.completed(fParent);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getParentResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getParentResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getParentResponse = ApiResponse.error('No Internet Connection');
    }
    return getParentResponse!;
  }

  //get all syllabi
  ApiResponse<FSyllabi>? _fSyllabi;
  ApiResponse<FSyllabi>? get fSyllabiResponse => _fSyllabi;
  set fSyllabiResponse(ApiResponse<FSyllabi>? value) {
    _fSyllabi = value;
    notifyListeners();
  }

  Future<ApiResponse<FSyllabi>> getAllSyllabi() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      fSyllabiResponse = ApiResponse.loading('');
      try {
        FSyllabi fSyllabi = await apiService.getAllSyllabi();
        fSyllabiResponse = ApiResponse.completed(fSyllabi);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            fSyllabiResponse = ApiResponse.error(forcedException.toString());
          }
        } else {
          fSyllabiResponse = ApiResponse.error(e.toString());
        }
      }
    }
    return fSyllabiResponse!;
  }

  //get seed
  ApiResponse<FSeed>? _getSeedResponse;
  ApiResponse<FSeed>? get getSeedResponse => _getSeedResponse;
  set getSeedResponse(ApiResponse<FSeed>? value) {
    _getSeedResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FSeed>> getSeed() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getSeedResponse = ApiResponse.loading('');
      try {
        FSeed fSeed = await apiService.getSeed();
        getSeedResponse = ApiResponse.completed(fSeed);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            getSeedResponse = ApiResponse.error(forcedException.toString());
          }
        } else {
          getSeedResponse = ApiResponse.error(e.toString());
        }
      }
    } else {
      return getSeedResponse = ApiResponse.error('No Internet Connection');
    }
    return getSeedResponse!;
  }

  //add lessons to day
  ApiResponse<Delete>? _addLessonsToDayResponse;
  ApiResponse<Delete>? get addLessonsToDayResponse => _addLessonsToDayResponse;
  set addLessonsToDayResponse(ApiResponse<Delete>? value) {
    _addLessonsToDayResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> addLessonsToDay(
    int id,
  ) async {
    FormData formData = FormData.fromMap({'_method': 'PUT'});
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      addLessonsToDayResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.addLessonsToDay(formData, id);
        addLessonsToDayResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return addLessonsToDayResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return addLessonsToDayResponse = ApiResponse.error(e.toString());
      }
    } else {
      return addLessonsToDayResponse =
          ApiResponse.error('No Internet Connection');
    }
    return addLessonsToDayResponse!;
  }

  //addSubjectsToTeacher
  ApiResponse<Delete>? _addSubjectsToTeacherResponse;
  ApiResponse<Delete>? get addSubjectsToTeacherResponse =>
      _addSubjectsToTeacherResponse;
  set addSubjectsToTeacherResponse(ApiResponse<Delete>? value) {
    _addSubjectsToTeacherResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> addSubjectsToTeacher(
    int id,
    int classId,
    int classroomId,
    int subjectId,
  ) async {
    FormData formData = FormData.fromMap({
      '_method': 'put',
      'subject_id': subjectId,
      'classroom_id': classroomId,
      'class_id': classId,
    });
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      addSubjectsToTeacherResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.addSubjectsToTeacher(formData, id);
        addSubjectsToTeacherResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return addSubjectsToTeacherResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return addSubjectsToTeacherResponse = ApiResponse.error(e.toString());
      }
    } else {
      return addSubjectsToTeacherResponse =
          ApiResponse.error('No Internet Connection');
    }
    return addSubjectsToTeacherResponse!;
  }

  //add classroom to class
  ApiResponse<Delete>? _addClassroomToClassResponse;
  ApiResponse<Delete>? get addClassroomToClassResponse =>
      _addClassroomToClassResponse;
  set addClassroomToClassResponse(ApiResponse<Delete>? value) {
    _addClassroomToClassResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> addClassroomToClass(
    int id,
  ) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      FormData formData = FormData.fromMap({'_method': 'PUT'});
      addClassroomToClassResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.addClassroomToClass(formData, id);
        addClassroomToClassResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return addClassroomToClassResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return addClassroomToClassResponse = ApiResponse.error(e.toString());
      }
    } else {
      return addClassroomToClassResponse =
          ApiResponse.error('No Internet Connection');
    }
    return addClassroomToClassResponse!;
  }

  //add subject to class
  ApiResponse<Delete>? _addSubjectsToClassResponse;
  ApiResponse<Delete>? get addSubjectsToClassResponse =>
      _addSubjectsToClassResponse;
  set addSubjectsToClassResponse(ApiResponse<Delete>? value) {
    _addSubjectsToClassResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> addSubjectsToClass(
    int id,
  ) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      addSubjectsToClassResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.addSubjectsToClass(id);
        addSubjectsToClassResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return addSubjectsToClassResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return addSubjectsToClassResponse = ApiResponse.error(e.toString());
      }
    } else {
      return addSubjectsToClassResponse =
          ApiResponse.error('No Internet Connection');
    }
    return addSubjectsToClassResponse!;
  }

  ///========================EXAMS==================///

//get all exam
  ApiResponse<FExam>? _fExams;
  ApiResponse<FExam>? get fExamResponse => _fExams;
  set fExamResponse(ApiResponse<FExam>? value) {
    _fExams = value;
    notifyListeners();
  }

  Future<ApiResponse<FExam>> getAllExams() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      fExamResponse = ApiResponse.loading('');
      try {
        FExam fExam = await apiService.getAllExams();
        fExamResponse = ApiResponse.completed(fExam);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            fExamResponse = ApiResponse.error(forcedException.toString());
          }
        } else {
          fExamResponse = ApiResponse.error(e.toString());
        }
      }
    }
    return fExamResponse!;
  }

  //add exam
  ApiResponse<Delete>? _addExamResponse;
  ApiResponse<Delete>? get addExamResponse => _addExamResponse;
  set addExamResponse(ApiResponse<Delete>? value) {
    _addExamResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> addExam() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      addExamResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.addExam();
        addExamResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return addExamResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return addExamResponse = ApiResponse.error(e.toString());
      }
    } else {
      return addExamResponse = ApiResponse.error('No Internet Connection');
    }
    return addExamResponse!;
  }
  //edit exam

  //delete exam
  ApiResponse<Delete>? _deleteExamResponse;
  ApiResponse<Delete>? get deleteExamResponse => _deleteExamResponse;
  set deleteExamResponse(ApiResponse<Delete>? value) {
    _deleteExamResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> deleteExam(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      deleteExamResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.deleteExam(id);
        deleteExamResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return deleteExamResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return deleteExamResponse = ApiResponse.error(e.toString());
      }
    } else {
      return deleteExamResponse = ApiResponse.error('No Internet Connection');
    }
    return deleteExamResponse!;
  }

  //set student exam mark
  ApiResponse<FMark>? _setStudentExamMarkResponse;
  ApiResponse<FMark>? get setStudentExamMarkResponse =>
      _setStudentExamMarkResponse;
  set setStudentExamMarkResponse(ApiResponse<FMark>? value) {
    _setStudentExamMarkResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FMark>> setStudentExamMark(int id1, int id2) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      setStudentExamMarkResponse = ApiResponse.loading('');
      try {
        FMark fmark = await apiService.setStudentExamMark(id1, id2);
        setStudentExamMarkResponse = ApiResponse.completed(fmark);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return setStudentExamMarkResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return setStudentExamMarkResponse = ApiResponse.error(e.toString());
      }
    } else {
      return setStudentExamMarkResponse =
          ApiResponse.error('No Internet Connection');
    }
    return setStudentExamMarkResponse!;
  }

  //get student exam
  ApiResponse<StudentExam>? _getStudentExamResponse;
  ApiResponse<StudentExam>? get getStudentExamResponse =>
      _getStudentExamResponse;
  set getStudentExamResponse(ApiResponse<StudentExam>? value) {
    _getStudentExamResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<StudentExam>> getStudentExam(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getStudentExamResponse = ApiResponse.loading('');
      try {
        StudentExam exam = await apiService.getStudentExam(id);
        getStudentExamResponse = ApiResponse.completed(exam);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getStudentExamResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getStudentExamResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getStudentExamResponse =
          ApiResponse.error('No Internet Connection');
    }
    return getStudentExamResponse!;
  }

  //get class exam
  ApiResponse<ExamSchedule>? _getClassExamResponse;
  ApiResponse<ExamSchedule>? get getClassExamResponse => _getClassExamResponse;
  set getClassExamResponse(ApiResponse<ExamSchedule>? value) {
    _getClassExamResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<ExamSchedule>> getClassExam(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getClassExamResponse = ApiResponse.loading('');
      try {
        ExamSchedule fexam = await apiService.getClassExam(id);
        getClassExamResponse = ApiResponse.completed(fexam);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getClassExamResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getClassExamResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getClassExamResponse = ApiResponse.error('No Internet Connection');
    }
    return getClassExamResponse!;
  }

  //add question to bank
  ApiResponse<Delete>? _addExamQuestionResponse;
  ApiResponse<Delete>? get addExamQuestionResponse => _addExamQuestionResponse;
  set addExamQuestionResponse(ApiResponse<Delete>? value) {
    _addExamQuestionResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> addExamQuestion(
      Map<String, dynamic> question) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      addExamQuestionResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.addExamQuestion(question);
        addExamQuestionResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return addExamQuestionResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return addExamQuestionResponse = ApiResponse.error(e.toString());
      }
    } else {
      return addExamQuestionResponse =
          ApiResponse.error('No Internet Connection');
    }
    return addExamQuestionResponse!;
  }

  ApiResponse<QuestionsBank>? _questionBankResponse;
  ApiResponse<QuestionsBank>? get questionBankResponse => _questionBankResponse;
  set questionBankResponse(ApiResponse<QuestionsBank>? value) {
    _questionBankResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<QuestionsBank>> getAllQuestions(
      int teacherId, int classId, int subjectId) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      questionBankResponse = ApiResponse.loading('');
      try {
        QuestionsBank questionsBank = await apiService.getAllQuestions(
            teacherId: teacherId, classId: classId, subjectId: subjectId);
        questionBankResponse = ApiResponse.completed(questionsBank);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return questionBankResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return questionBankResponse = ApiResponse.error(e.toString());
      }
    } else {
      return questionBankResponse = ApiResponse.error('No Internet Connection');
    }
    return questionBankResponse!;
  }

  ///==============================================///

  ///======================MOBILE========================///

  // //get teacher subjects and classes
  ApiResponse<SubjectClass>? _getTeacherSubjectsResponse;
  ApiResponse<SubjectClass>? get getTeacherSubjectsResponse =>
      _getTeacherSubjectsResponse;
  set getTeacherSubjectsResponse(ApiResponse<SubjectClass>? value) {
    _getTeacherSubjectsResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<SubjectClass>> getTeacherSubjects(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getTeacherSubjectsResponse = ApiResponse.loading('');
      try {
        SubjectClass subjectclass = await apiService.getTeacherSubjects(id);
        getTeacherSubjectsResponse = ApiResponse.completed(subjectclass);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getTeacherSubjectsResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getTeacherSubjectsResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getTeacherSubjectsResponse =
          ApiResponse.error('No Internet Connection');
    }
    return getTeacherSubjectsResponse!;
  }

  //get parents children
  ApiResponse<FNewParent>? _getParentChildResponse;
  ApiResponse<FNewParent>? get getParentChildResponse =>
      _getParentChildResponse;
  set getParentChildResponse(ApiResponse<FNewParent>? value) {
    _getParentChildResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FNewParent>> getParentChild(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getParentChildResponse = ApiResponse.loading('');
      try {
        FNewParent fnewparent = await apiService.getParentChild(id);
        getParentChildResponse = ApiResponse.completed(fnewparent);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getParentChildResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getParentChildResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getParentChildResponse =
          ApiResponse.error('No Internet Connection');
    }
    return getParentChildResponse!;
  }

  //get teacher's students
  ApiResponse<FStudent>? _getTeacherStudentsResponse;
  ApiResponse<FStudent>? get getTeacherStudentsResponse =>
      _getTeacherStudentsResponse;
  set getTeacherStudentsResponse(ApiResponse<FStudent>? value) {
    _getTeacherStudentsResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FStudent>> getTeacherStudents(
      int teacherId, int subjectId, int classId, int classroomId) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getTeacherStudentsResponse = ApiResponse.loading('');
      try {
        FormData formData = FormData.fromMap({
          "teacher_id": teacherId,
          "subject_id": subjectId,
          "class_id": classId,
          "classroom_id": classroomId,
        });
        FStudent fstudent = await apiService.getTeacherStudents(formData);
        getTeacherStudentsResponse = ApiResponse.completed(fstudent);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getTeacherStudentsResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getTeacherStudentsResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getTeacherStudentsResponse =
          ApiResponse.error('No Internet Connection');
    }
    return getTeacherStudentsResponse!;
  }

  //add oral mark to student
  ApiResponse<Delete>? _addStudentOralMarkResponse;
  ApiResponse<Delete>? get addStudentOralMarkResponse =>
      _addStudentOralMarkResponse;
  set addStudentOralMarkResponse(ApiResponse<Delete>? value) {
    _addStudentOralMarkResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> addStudentOralMark(
      int teacherId,
      int subjectId,
      int classId,
      int classroomId,
      int studentId,
      int seasonId,
      int mark) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      addStudentOralMarkResponse = ApiResponse.loading('');
      try {
        FormData formData = FormData.fromMap({
          "teacher_id": teacherId,
          "subject_id": subjectId,
          "class_id": classId,
          "classroom_id": classroomId,
          "student_id": studentId,
          "season_id": seasonId,
          "mark": mark,
        });
        Delete delete = await apiService.addStudentOralMark(formData);
        addStudentOralMarkResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return addStudentOralMarkResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return addStudentOralMarkResponse = ApiResponse.error(e.toString());
      }
    } else {
      return addStudentOralMarkResponse =
          ApiResponse.error('No Internet Connection');
    }
    return addStudentOralMarkResponse!;
  }

  ///==============================================///
}

dynamic throwCustomException(DioError? dioError) {
  var statusCode = dioError?.response?.statusCode;
  switch (dioError!.type) {
    case DioErrorType.cancel:
      throw RequestWasCancelledException("CANCEL");
    case DioErrorType.connectTimeout:
      throw ConnectionTimeout("CONNECT_TIMEOUT");
    case DioErrorType.other:
      throw DefaultTimeout("DEFAULT");
    case DioErrorType.receiveTimeout:
      throw ReceiveTimeout("RECEIVE_TIMEOUT");
    case DioErrorType.sendTimeout:
      throw SendTimeout("SEND_TIMEOUT");
    case DioErrorType.response:
      switch (statusCode) {
        case 400:
          throw BadRequestException(dioError.response?.statusMessage);
        case 401:
        case 403:
          throw UnauthorisedException(dioError.response?.statusMessage);
        case 404:
          throw FetchDataException(
              'Error while Communication with Server with StatusCode : ${dioError.response?.statusMessage}');
        case 500:
        default:
          throw FetchDataException(
              'Error while Communication with Server with StatusCode : ${dioError.response?.statusMessage}');
      }
  }
}
