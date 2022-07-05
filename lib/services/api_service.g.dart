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
