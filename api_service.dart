import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost:5000/api";

  // ---------------- LOGIN ----------------
  static Future<Map<String, dynamic>?> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  // ---------------- FETCH JOBS ----------------
  static Future<List<dynamic>> fetchJobs() async {
    final response =
        await http.get(Uri.parse("$baseUrl/jobs"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return [];
  }

  // ---------------- APPLY JOB ----------------
  static Future<bool> applyJob(int jobId) async {
    final response = await http.post(
      Uri.parse("$baseUrl/apply/$jobId"),
    );

    return response.statusCode == 200;
  }

  // ---------------- CREATE JOB (AGENT) ----------------
  static Future<bool> createJob(
      String title, String description) async {
    final response = await http.post(
      Uri.parse("$baseUrl/create-job"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": title,
        "description": description,
      }),
    );

    return response.statusCode == 201;
  }
}
