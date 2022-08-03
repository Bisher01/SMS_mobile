import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sms_mobile/models/add_question.dart';
import 'package:sms_mobile/models/student_exam.dart';
import 'package:sms_mobile/models/subject_class.dart';
import '../models/models.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:8000/api/')
abstract class ApiService {
  factory ApiService(Dio dio, {BuildContext? context, String? baseUrl}) {
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      // options.connectTimeout = 60000;
      // options.receiveTimeout = 60000;
      return handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      return handler.next(response);
    }, onError: (DioError error, ErrorInterceptorHandler handler) async {
      if (error.response?.statusCode == 401) {}
      return handler.next(error);
    }));
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
    return _ApiService(dio, baseUrl: baseUrl);
  }
  //all teachers
  @GET('teacher/all')
  Future<FTeacher> getAllTeachers();

  //all students
  @GET('student/all')
  Future<FStudent> getAllStudents();

  //all mentors
  @GET('mentor/all')
  Future<FMentor> getAllMentors();

  //all classrooms
  @GET('classroom/all')
  Future<FClassroom> getAllClassrooms();

  //all authentication
  @POST('general/login')
  Future<Auth> login(@Body() FormData formData);

  //all logout
  @POST('general/logout')
  Future <LogOut>logout(@Header('Authorization') String token);

  //all subjects
  @GET('subject/all')
  Future<FSubject> getAllSubjects();

  //add subject
  @POST('subject/add')
  Future<FSubject> addSubject(@Body() FormData formData);

  //edit subject
  @POST('subject/edit/{id}')
  Future<FSubject> editSubject(@Body() FormData formData, @Path('id') int id);

  //delete subject
  @DELETE('subject/delete/{id}')
  Future deleteSubject(@Path('id') int id);

  //show student
  @GET('student/show/{id}')
  Future<FStudent> getStudent(@Path('id') int id);

  //show teacher
  @GET('teacher/show/{id}')
  Future<FTeacher> getTeacher(@Path('id') int id);

  //show mentor
  @GET('mentor/show/{id}')
  Future<FMentor> getMentor(@Path('id') int id);

  //show parent
  @GET('parent/show/{id}')
  Future<FParent> getParent(@Path('id') int id);

  //get seed
  @GET('general/allSeed')
  Future<FSeed> getSeed();

//get all syllabi
  @GET('syllabi/all')
  Future<FSyllabi> getAllSyllabi();

//get mentor classes
  @GET('mentor/get-students/{id}')
  Future<MentorClasses> getMentorClasses(@Path('id') int id);

  //============Management=========//

  @POST('management/add/lessons/{id}')
  Future<Delete> addLessonsToDay(@Body() FormData formData, @Path('id') int id);

  @POST('management/add/subject/{id}')
  Future<Delete> addSubjectsToTeacher(
      @Body() FormData formData, @Path('id') int id);

  @POST('management/add/ClassroomToClass/{id}')
  Future<Delete> addClassroomToClass(
      @Body() FormData formData, @Path('id') int id);

  @POST('/management/subject/{id}')
  Future<Delete> addSubjectsToClass(@Path('id') int id);

//=================================================//

//============Exams=========//

//get all exams
  @GET('exam/all')
  Future<FExam> getAllExams();

  //add exam
  @POST('exam/add')
  Future<Delete> addExam(@Body() Map<String, dynamic> exam);

  //edit exam

  //delete exam
  @DELETE('exam/delete/{id}')
  Future<Delete> deleteExam(@Path('id') int id);

  //set student exam mark
  @POST('exam/mark/{id1}/{id2}')
  Future<FMark> setStudentExamMark(@Path('id1') int id1, @Path('id2') int id2);

  //get student exam
  @GET('exam/getExam/{id}')
  Future<StudentExam> getStudentExam(@Path('id') int id);

  //get class exam ((schedule))
  @GET('exam/classExam/{id}')
  Future<ExamSchedule> getClassExam(@Path('id') int id);

  ///////////===========Quiz===========///////////

  //get student quiz
  @POST('quiz/getQuiz/{id}')
  Future<StudentQuiz> getStudentQuiz(@Path('id') int id);

  //get student quiz mark
  @POST('quiz/mark/{id1}/{id2}')
  Future<FMark> getStudentQuizMark(@Path('id1') int id1, @Path('id2') int id2);

  //get quiz schedule
  @GET('quiz/schedule/{id1}/{id2}')
  Future<QuizSchedule> getClassroomQuizSchedule(
      @Path('id1') int id1, @Path('id2') int id2);

  //add quiz
  @POST('api/quiz/add')
  Future<Delete> addQuiz(@Body() Map<String, dynamic> quiz);

  ///////////===========Questions===========///////////
  //add question to bank
  @POST('question/add')
  Future<Delete> addExamQuestion(@Body() Map<String, dynamic> question);

  @POST('question/all')
  Future<QuestionsBank> getAllQuestions(
      {@Field('teacher_id') int? teacherId,
      @Field('class_id') int? classId,
      @Field('subject_id') int? subjectId});

//=================================================//

//========================MOBILE=========================//

  //get teacher subjects and classes
  @GET('teacher/teacherWithSubjects/{id}')
  Future<SubjectClass> getTeacherSubjects(@Path('id') int id);

  //get parents children
  @GET('parent/child/{id}')
  Future<FNewParent> getParentChild(@Path('id') int id);

  //get teacher's students
  @POST('quiz/students-oral-quiz')
  Future<FStudent> getTeacherStudents(@Body() FormData formData);

  //add oral mark to student
  @POST('quiz/add-oral-quiz')
  Future<Delete> addStudentOralMark(@Body() FormData formData);

  //get student resultants
  @GET('resultant/{id1}/{id2}')
  Future<FResultant> getStudentResultant(
      @Path('id1') int id1, @Path('id2') int id2);

//=================================================//
}
