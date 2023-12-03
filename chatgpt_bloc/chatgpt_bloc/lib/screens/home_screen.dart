import 'package:chatgpt_bloc/screens/chat_with_gpt_screen.dart';
import 'package:chatgpt_bloc/screens/generate_image_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(159, 255, 255, 255),
              Color.fromARGB(144, 68, 137, 255),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 300),
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.star_border,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(105, 33, 149, 243),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            'Chat with GPT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'ChatGPT is a chatbot launched by openAi in November 2022. It is built on top of OpenAi\'s GPT-3 family of large language models, and is fine-tuned with both supervised and reinforcement learning techniques',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatWithGPT()),
                                );
                              },
                              child: const Text('Try it now')),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(115, 255, 193, 7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                            'Generate Images',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'DALL-E is a 12-billion parameter version of GPT-3 trained to generate images from text descriptions, using a dataset of text-image pairs. It was trained on 8 million images an d 100 million text descriptions, and was released in january 2021',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GenerateImage()),
                                );
                              },
                              child: const Text('Try it now')),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
