import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_app/services/url.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final logger = Logger();
  final String _baseUrl = AppUrl.baseUrl; // replace with your API base URL

  // CRUD - Create
  Future<http.Response> create(
      String name, double price, String description) async {
    _isLoading = true;
    notifyListeners();
    final url = Uri.parse(_baseUrl);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'price': price,
          'description': description, // Fixed typo here
        }),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        _isLoading = false;
        notifyListeners();
        logger.i("Created successfully");
        logger.d('create response: ${response.body}');
        return response;
      } else {
        _isLoading = false;
        notifyListeners();
        logger.e('response: ${response.body}');
        return response;
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      logger.e('create error: $e');
    }
    throw Exception("Something went wrong");
  }

  // CRUD - Read
  Future<http.Response> read(String id) async {
    final url = Uri.parse('$_baseUrl/$id');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        logger.d('read response: $response');
        return response;
      } else {
        logger.e('response: $response');
        return response;
      }
    } catch (e) {
      logger.e('read error: $e');
    }
    throw Exception("Something went wrong");
  }

  // CRUD - Update
  Future<http.Response> update(String id, Map<String, dynamic> data) async {
    final url = Uri.parse('$_baseUrl/$id');
    try {
      final response = await http.put(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        logger.d('update response: $response');
        return response;
      } else {
        logger.e('response: $response');
        return response;
      }
    } catch (e) {
      logger.e('update error: $e');
    }
    throw Exception("Something went wrong");
  }

  // CRUD - Delete
  Future<http.Response> delete(String id) async {
    final url = Uri.parse('$_baseUrl/$id');
    try {
      final response = await http.delete(url);
      if (response.statusCode == 200) {
        logger.d('delete response: $response');
        return response;
      } else {
        logger.e('response: $response');
        return response;
      }
    } catch (e) {
      logger.e('delete error: $e');
    }
    throw Exception("Somethinig went wrong");
  }
}
