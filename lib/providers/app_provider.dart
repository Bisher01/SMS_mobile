import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../services/api_response.dart';
import '../services/api_service.dart';
import '../models/models.dart';
import '../services/api_exception.dart';

class AppProvider extends ChangeNotifier {
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
        print(e);
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
