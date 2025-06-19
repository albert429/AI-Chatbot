import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  static const String apiKey = "AIzaSyDA9jc8dZLo9_XpgxQfwg5vkoQwq8JRi5s";
  static const String apiUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyDA9jc8dZLo9_XpgxQfwg5vkoQwq8JRi5s";

  static Future<String> getResponse(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": prompt}
              ]
            }
          ]
        }),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["candidates"][0]["content"]["parts"][0]["text"];
      } else {
        return "Error: ${response.body}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
