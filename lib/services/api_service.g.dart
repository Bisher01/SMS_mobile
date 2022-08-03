// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://127.0.0.1:8000/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<FTeacher> getAllTeachers() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FTeacher>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'teacher/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FTeacher.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FStudent> getAllStudents() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FStudent>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'student/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FStudent.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FMentor> getAllMentors() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FMentor>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'mentor/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FMentor.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FClassroom> getAllClassrooms() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FClassroom>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'classroom/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FClassroom.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Auth> login(formData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = formData;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Auth>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, 'general/login',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Auth.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LogOut> logout(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LogOut>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'general/logout',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LogOut.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FSubject> getAllSubjects() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FSubject>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'subject/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FSubject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FSubject> addSubject(formData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = formData;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FSubject>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'subject/add',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FSubject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FSubject> editSubject(formData, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = formData;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FSubject>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'subject/edit/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FSubject.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> deleteSubject(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, 'subject/delete/${id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<FStudent> getStudent(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FStudent>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'student/show/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FStudent.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FTeacher> getTeacher(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FTeacher>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'teacher/show/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FTeacher.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FMentor> getMentor(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FMentor>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'mentor/show/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FMentor.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FParent> getParent(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FParent>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'parent/show/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FParent.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FSeed> getSeed() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FSeed>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'general/allSeed',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FSeed.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FSyllabi> getAllSyllabi() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FSyllabi>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'syllabi/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FSyllabi.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MentorClasses> getMentorClasses(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MentorClasses>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'mentor/get-students/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MentorClasses.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Delete> addLessonsToDay(formData, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = formData;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Delete>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'management/add/lessons/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Delete.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Delete> addSubjectsToTeacher(formData, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = formData;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Delete>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'management/add/subject/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Delete.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Delete> addClassroomToClass(formData, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = formData;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Delete>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'management/add/ClassroomToClass/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Delete.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Delete> addSubjectsToClass(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Delete>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/management/subject/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Delete.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FExam> getAllExams() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FExam>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'exam/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FExam.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Delete> addExam(exam) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(exam);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Delete>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'exam/add',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Delete.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Delete> deleteExam(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Delete>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, 'exam/delete/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Delete.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FMark> setStudentExamMark(id1, id2) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FMark>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'exam/mark/${id1}/${id2}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FMark.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StudentExam> getStudentExam(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StudentExam>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'exam/getExam/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StudentExam.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ExamSchedule> getClassExam(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ExamSchedule>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'exam/classExam/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ExamSchedule.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StudentQuiz> getStudentQuiz(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StudentQuiz>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'quiz/getQuiz/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StudentQuiz.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FMark> getStudentQuizMark(id1, id2) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FMark>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'quiz/mark/${id1}/${id2}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FMark.fromJson(_result.data!);
    return value;
  }

  @override
  Future<QuizSchedule> getClassroomQuizSchedule(id1, id2) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<QuizSchedule>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'quiz/schedule/${id1}/${id2}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = QuizSchedule.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Delete> addQuiz(quiz) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(quiz);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Delete>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'api/quiz/add',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Delete.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Delete> addExamQuestion(question) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(question);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Delete>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'question/add',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Delete.fromJson(_result.data!);
    return value;
  }

  @override
  Future<QuestionsBank> getAllQuestions({teacherId, classId, subjectId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      'teacher_id': teacherId,
      'class_id': classId,
      'subject_id': subjectId
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<QuestionsBank>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'question/all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = QuestionsBank.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Delete> deleteQuestion(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Delete>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, 'question/delete/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Delete.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Delete> editQuestion(id, map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Delete>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'question/edit/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Delete.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SubjectClass> getTeacherSubjects(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SubjectClass>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'teacher/teacherWithSubjects/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SubjectClass.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FNewParent> getParentChild(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FNewParent>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'parent/child/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FNewParent.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FStudent> getTeacherStudents(formData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = formData;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FStudent>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'quiz/students-oral-quiz',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FStudent.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Delete> addStudentOralMark(formData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = formData;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Delete>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'quiz/add-oral-quiz',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Delete.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FResultant> getStudentResultant(id1, id2) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FResultant>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'resultant/${id1}/${id2}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FResultant.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
