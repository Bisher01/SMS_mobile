import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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

  //get token
  String getToken(){
    var box = Boxes.getAuthBox();
    return box.get('token')??"";
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

  //all logout
  ApiResponse<LogOut>? _logoutResponse;
  ApiResponse<LogOut>? get logoutResponse => _logoutResponse;
  set logoutResponse(ApiResponse<LogOut>? value) {
    _logoutResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<LogOut>> logout(String token) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      logoutResponse = ApiResponse.loading('');
      try {
        LogOut logout = await apiService.logout(token);
        logoutResponse = ApiResponse.completed(logout);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return logoutResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return logoutResponse = ApiResponse.error(e.toString());
      }
    } else {
      return logoutResponse = ApiResponse.error('No Internet Connection');
    }
    return logoutResponse!;
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
        print(e);
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


  ApiResponse<Delete>? _deleteQuestionResponse;
  ApiResponse<Delete>? get deleteQuestionResponse => _deleteQuestionResponse;
  set deleteQuestionResponse(ApiResponse<Delete>? value) {
    _deleteQuestionResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> deleteQuestion(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      deleteQuestionResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.deleteQuestion(id);
        deleteQuestionResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return deleteQuestionResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return deleteQuestionResponse = ApiResponse.error(e.toString());
      }
    } else {
      return deleteQuestionResponse = ApiResponse.error('No Internet Connection');
    }
    return deleteQuestionResponse!;
  }

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

  Future<ApiResponse<Delete>> addExam(Map<String, dynamic> exam) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      addExamResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.addExam(exam);
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

  Future<ApiResponse<FMark>> setStudentExamMark(int id1, int id2,Map<String,dynamic>map) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      setStudentExamMarkResponse = ApiResponse.loading('');
      try {
        FMark fmark = await apiService.setStudentExamMark(id1, id2,map);
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

  ApiResponse<Delete>? _editQuestionResponse;
  ApiResponse<Delete>? get editQuestionResponse => _editQuestionResponse;
  set editQuestionResponse(ApiResponse<Delete>? value) {
    _editQuestionResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> editQuestion(int id,Map<String,dynamic>map) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      editQuestionResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.editQuestion(id,map);
        editQuestionResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return editQuestionResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return editQuestionResponse = ApiResponse.error(e.toString());
      }
    } else {
      return editQuestionResponse = ApiResponse.error('No Internet Connection');
    }
    return editQuestionResponse!;
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

  /////////////==========Quiz==========//////////////

  //get student quiz
  ApiResponse<StudentQuiz>? _getStudentQuizResponse;
  ApiResponse<StudentQuiz>? get getStudentQuizResponse => _getStudentQuizResponse;
  set getStudentQuizResponse(ApiResponse<StudentQuiz>? value) {
    _getStudentQuizResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<StudentQuiz>> getStudentQuiz(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getStudentQuizResponse = ApiResponse.loading('');
      try {
        StudentQuiz studentquiz = await apiService.getStudentQuiz(id);
        getStudentQuizResponse = ApiResponse.completed(studentquiz);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getStudentQuizResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getStudentQuizResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getStudentQuizResponse = ApiResponse.error('No Internet Connection');
    }
    return getStudentQuizResponse!;
  }

  //get student quiz mark
  ApiResponse<FMark>? _getStudentQuizMarkResponse;
  ApiResponse<FMark>? get getStudentQuizMarkResponse => _getStudentQuizMarkResponse;
  set getStudentQuizMarkResponse(ApiResponse<FMark>? value) {
    _getStudentQuizMarkResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FMark>> getStudentQuizMark(int id1,int id2,Map<String,dynamic> map) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getStudentQuizMarkResponse = ApiResponse.loading('');
      try {
        FMark fmark = await apiService.getStudentQuizMark(id1,id2,map);
        getStudentQuizMarkResponse = ApiResponse.completed(fmark);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getStudentQuizMarkResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getStudentQuizMarkResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getStudentQuizMarkResponse = ApiResponse.error('No Internet Connection');
    }
    return getStudentQuizMarkResponse!;
  }

  //add quiz
  ApiResponse<Delete>? _addQuizResponse;
  ApiResponse<Delete>? get addQuizResponse => _addQuizResponse;
  set addQuizResponse(ApiResponse<Delete>? value) {
    _addQuizResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> addQuiz(Map<String, dynamic> quiz) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      addQuizResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.addQuiz(quiz);
        addQuizResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return addQuizResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return addQuizResponse = ApiResponse.error(e.toString());
      }
    } else {
      return addQuizResponse = ApiResponse.error('No Internet Connection');
    }
    return addQuizResponse!;
  }

//get quiz schedule
  ApiResponse<QuizSchedule>? _getClassroomQuizScheduleResponse;
  ApiResponse<QuizSchedule>? get getClassroomQuizScheduleResponse => _getClassroomQuizScheduleResponse;
  set getClassroomQuizScheduleResponse(ApiResponse<QuizSchedule>? value) {
    _getClassroomQuizScheduleResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<QuizSchedule>> getClassroomQuizSchedule(int classId,int classroomId) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getClassroomQuizScheduleResponse = ApiResponse.loading('');
      try {
        QuizSchedule quizschedule = await apiService.getClassroomQuizSchedule(classId,classroomId);
        getClassroomQuizScheduleResponse = ApiResponse.completed(quizschedule);
      } catch (e) {
        print(e);
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getClassroomQuizScheduleResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getClassroomQuizScheduleResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getClassroomQuizScheduleResponse = ApiResponse.error('No Internet Connection');
    }
    return getClassroomQuizScheduleResponse!;
  }




  ////////================================///////////

  ///==============================================///

  ///======================MOBILE========================///

  //get teacher subjects and classes
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
        SubjectClass subjectClass = await apiService.getTeacherSubjects(id);
        getTeacherSubjectsResponse = ApiResponse.completed(subjectClass);
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

  // get mentor classes
  ApiResponse<MentorClasses>? _mentorClassesResponse;
  ApiResponse<MentorClasses>? get mentorClassesResponse => _mentorClassesResponse;
  set mentorClassesResponse(ApiResponse<MentorClasses>? value) {
    _mentorClassesResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<MentorClasses>> getMentorClasses(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      mentorClassesResponse = ApiResponse.loading('');
      try {
        MentorClasses mentorClasses = await apiService.getMentorClasses(id);
        mentorClassesResponse = ApiResponse.completed(mentorClasses);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return mentorClassesResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return mentorClassesResponse = ApiResponse.error(e.toString());
      }
    } else {
      return mentorClassesResponse = ApiResponse.error('No Internet Connection');
    }
    return mentorClassesResponse!;
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

  //get student resultants
  ApiResponse<FResultant>? _getStudentResultantResponse;
  ApiResponse<FResultant>? get getStudentResultantResponse =>
      _getStudentResultantResponse;
  set getStudentResultantResponse(ApiResponse<FResultant>? value) {
    _getStudentResultantResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FResultant>> getStudentResultant(int student, int season) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getStudentResultantResponse = ApiResponse.loading('');
      try {
        FResultant fresultant = await apiService.getStudentResultant(student,season);
        getStudentResultantResponse = ApiResponse.completed(fresultant);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getStudentResultantResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getStudentResultantResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getStudentResultantResponse =
          ApiResponse.error('No Internet Connection');
    }
    return getStudentResultantResponse!;
  }

  ///==============================================///



  ///======================Attendance========================///

//get student attendance
  ApiResponse<FStudentAttendance>? _getStudentAttendancesResponse;
  ApiResponse<FStudentAttendance>? get getStudentAttendancesResponse => _getStudentAttendancesResponse;
  set getStudentAttendancesResponse(ApiResponse<FStudentAttendance>? value) {
    _getStudentAttendancesResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FStudentAttendance>> getStudentAttendances(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getStudentAttendancesResponse = ApiResponse.loading('');
      try {
        FStudentAttendance fstudentattendance = await apiService.getStudentAttendances(id);
        getStudentAttendancesResponse = ApiResponse.completed(fstudentattendance);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getStudentAttendancesResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getStudentAttendancesResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getStudentAttendancesResponse = ApiResponse.error('No Internet Connection');
    }
    return getStudentAttendancesResponse!;
  }

  //add students attendances
  ApiResponse<Delete>? _addStudentsAttendanceResponse;
  ApiResponse<Delete>? get addStudentsAttendanceResponse => _addStudentsAttendanceResponse;
  set addStudentsAttendanceResponse(ApiResponse<Delete>? value) {
    _addStudentsAttendanceResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<Delete>> addStudentsAttendance(Map <String,dynamic> map) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      addStudentsAttendanceResponse = ApiResponse.loading('');
      try {
        Delete delete = await apiService.addStudentsAttendance(map);
        addStudentsAttendanceResponse = ApiResponse.completed(delete);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return addStudentsAttendanceResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return addStudentsAttendanceResponse = ApiResponse.error(e.toString());
      }
    } else {
      return addStudentsAttendanceResponse = ApiResponse.error('No Internet Connection');
    }
    return addStudentsAttendanceResponse!;
  }


//get mentor class and classrooms

  ApiResponse<FMentorClassrooms>? _getMentorClassroomsResponse;
  ApiResponse<FMentorClassrooms>? get getMentorClassroomsResponse => _getMentorClassroomsResponse;
  set getMentorClassroomsResponse(ApiResponse<FMentorClassrooms>? value) {
    _getMentorClassroomsResponse = value;
    notifyListeners();
  }

  Future<ApiResponse<FMentorClassrooms>> getMentorClassrooms(int id) async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      getMentorClassroomsResponse = ApiResponse.loading('');
      try {
        FMentorClassrooms fmentorclassrooms = await apiService.getMentorClassrooms(id);
        getMentorClassroomsResponse = ApiResponse.completed(fmentorclassrooms);
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return getMentorClassroomsResponse =
                ApiResponse.error(forcedException.toString());
          }
        }
        return getMentorClassroomsResponse = ApiResponse.error(e.toString());
      }
    } else {
      return getMentorClassroomsResponse = ApiResponse.error('No Internet Connection');
    }
    return getMentorClassroomsResponse!;
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
