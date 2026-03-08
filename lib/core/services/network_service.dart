import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pocket_pokedex/core/services/storage/storage_service.dart';
import 'package:fpdart/fpdart.dart';

class NetworkService {
  final StorageService _storageService;
  late final Dio _dio;

  NetworkService(
    this._storageService,
  ) {
    _dio = Dio();
  }

  final _statusCodeStream = StreamController<int>.broadcast();

  Stream<int> get statusCodeStream => _statusCodeStream.stream;

  Future<Either<Exception, dynamic>> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    bool includeAuth = true,
  }) async {
    return await _request(
      url,
      'GET',
      headers: headers,
      queryParameters: queryParameters,
      includeAuth: includeAuth,
    );
  }

  Future<Either<Exception, dynamic>> post(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    bool includeAuth = true,
  }) async {
    return await _request(
      url,
      'POST',
      headers: headers,
      body: body,
      includeAuth: includeAuth,
    );
  }

  Future<Either<Exception, dynamic>> put(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    bool includeAuth = true,
  }) async {
    return await _request(
      url,
      'PUT',
      headers: headers,
      body: body,
      includeAuth: includeAuth,
    );
  }

  Future<Either<Exception, dynamic>> delete(
    String url, {
    Map<String, String>? headers,
    bool includeAuth = true,
  }) async {
    return await _request(
      url,
      'DELETE',
      headers: headers,
      includeAuth: includeAuth,
    );
  }

  Future<Either<Exception, dynamic>> _request(
    String url,
    String method, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool includeAuth = true,
  }) async {
    try {
      headers ??= {};

      final auth = await _storageService.getAuthentication();

      if (includeAuth && auth.isAuthenticated) {
        headers['Authorization'] = 'Bearer ${auth.token}';
      }

      final response = await _dio.request(
        url,
        options: Options(
          method: method,
          headers: headers,
        ),
        queryParameters: queryParameters,
        data: body,
      );

      final statusCode = response.statusCode;

      if (statusCode == null) {
        return Left(Exception('No status code'));
      }

      _statusCodeStream.add(statusCode);

      if (statusCode == 204) {
        return Right(null);
      }

      if (statusCode < 200 || statusCode >= 300) {
        final errorMessage = response.data['message'] as String;

        return Left(Exception(errorMessage));
      }

      final data = response.data;

      return Right(data);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
