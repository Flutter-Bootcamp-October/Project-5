import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAi {
  getQuestions(String title) async {
    final url = Uri.parse("https://api.openai.com/v1/chat/completions");
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer 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"
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "system",
            "content":
                "You will be provided with a topic, and your task is to make a small Story about it"
          },
          {"role": "user", "content": title}
        ],
        "temperature": 0,
        "max_tokens": 256,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      }),
    );
    print(response.body);
    return jsonDecode(response.body)["choices"][0]["message"]["content"];
  }


}
