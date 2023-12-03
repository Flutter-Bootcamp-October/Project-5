import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiNetworking {
  final url = 'https://api.openai.com/v1/chat/completions';

  final url2 = 'https://api.openai.com/v1/images/generations';

  Future<String> getImage(String text) async {
    var urlApi = Uri.parse(url2);
    try {
      var response = await http.post(urlApi,
          headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer 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"
          },
          body: json.encode({
            "model": "dall-e-3",
            "prompt": text,
            "n": 1,
            "size": "1024x1024"
          }));

      if (response.statusCode == 200) {
        var imageData = json.decode(response.body);

        return imageData['data'][0]['url'];
      } else {
        return ('Error in return Image!');
      }
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  Future<String> chatWithGPT({required String msg}) async {
    var uriApi = Uri.parse(url);

    try {
      var response = await http.post(uriApi,
          headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer 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"
          },
          body: json.encode({
            'model': "gpt-3.5-turbo",
            "messages": [
              {
                "role": "system",
                "content":
                    "You are Marv, a chatbot that reluctantly answers questions with sarcastic responses."
              },
              {"role": "user", "content": msg},
            ],
            'temperature': 0.5,
            'max_tokens': 256,
            'top_p': 1,
            'frequency_penalty': 0,
            'presence_penalty': 0
          }));

      if (response.statusCode == 200) {
        final body = json.decode(response.body); //convert response to map
        print(body);
        return body['choices'][0]['message']['content'];
      } else {
        return 'You cannot get what you want because there is an error';
      }
    } catch (error) {
      throw FormatException(error.toString());
    }
  }
}
