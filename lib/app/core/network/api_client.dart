import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';

class ApiClient {
  final http.Client client;
  ApiClient({required this.client});

  static final String _url = dotenv.env['MODO']!;

  Future<http.Response> get(String endpoint) async {
    final fullUrl = '$_url$endpoint';
    try {
      final response = await client.get(Uri.parse(fullUrl));
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load data');
      }
    } on SocketException catch (e) {
      throw Exception('Failed to connect to the server');
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final fullUrl = '$_url$endpoint';
    try {
      final response = await client.post(
        Uri.parse(fullUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to post data');
      }
    } on SocketException catch (e) {
      throw Exception('Failed to connect to the server');
    } catch (e) {
      rethrow;
    }
  }
}
