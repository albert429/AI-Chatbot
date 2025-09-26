import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  // Provide the key securely via --dart-define=GEMINI_API_KEY=... at build/run time
  static const String apiKey = String.fromEnvironment('GEMINI_API_KEY');

  static Uri _buildGenerateContentUri() {
    return Uri.https(
      'generativelanguage.googleapis.com',
      '/v1beta/models/gemini-2.0-flash:generateContent',
      {'key': apiKey},
    );
  }

  static Future<String> getResponse(String prompt) async {
    if (apiKey.isEmpty) {
      return 'Error: Missing API key. Pass it via --dart-define=GEMINI_API_KEY=YOUR_KEY';
    }

    try {
      final requestBody = jsonEncode({
        'contents': [
          {
            'parts': [
              {'text': prompt}
            ]
          }
        ]
      });

      final response = await http.post(
        _buildGenerateContentUri(),
        headers: const {
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);

        // Defensive parsing with null checks
        final List<dynamic>? candidates = data is Map<String, dynamic>
            ? data['candidates'] as List<dynamic>?
            : null;
        if (candidates == null || candidates.isEmpty) {
          return 'Error: No candidates returned by API';
        }
        final Map<String, dynamic>? content =
            candidates.first is Map<String, dynamic>
                ? candidates.first['content'] as Map<String, dynamic>?
                : null;
        final List<dynamic>? parts = content?['parts'] as List<dynamic>?;
        if (parts == null || parts.isEmpty) {
          return 'Error: No parts in response content';
        }
        final dynamic firstPart = parts.first;
        if (firstPart is Map<String, dynamic> && firstPart['text'] is String) {
          return firstPart['text'] as String;
        }
        return 'Error: Unexpected response shape';
      }

      // Non-200 response: surface message
      return 'Error ${response.statusCode}: ${response.body}';
    } catch (e) {
      return 'Error: $e';
    }
  }
}
