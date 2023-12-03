import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAi {
  Future<String> chatGPT(String message) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer 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'
    };
    var url = Uri.parse('https://api.openai.com/v1/chat/completions');

    String body = jsonEncode({
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content":
              "The user will provide you a budget, your task is to suggest to the user what he/she should utilize the budget. Reply only to finance questions."
        },
        {"role": "user", "content": message.trim()}
      ],
      "temperature": 0.8,
      "max_tokens": 256,
      "top_p": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0
    });
    try {
      var response = await http.post(url, headers: headers, body: body);
      final result = jsonDecode(response.body);
      return result['choices'][0]['message']['content'];
    } catch (e) {
      throw 'ERROR!';
    }
  }
}
