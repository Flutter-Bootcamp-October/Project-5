import 'package:chatgpt_bloc/blocs/bloc_chat_with_gpt/chat_with_gpt_bloc.dart';
import 'package:chatgpt_bloc/blocs/bloc_chat_with_gpt/chat_with_gpt_event.dart';
import 'package:chatgpt_bloc/blocs/bloc_chat_with_gpt/chat_with_gpt_state.dart';
import 'package:chatgpt_bloc/custom_widget/card_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatWithGPT extends StatelessWidget {
  ChatWithGPT({super.key});

  TextEditingController conTextTextField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
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
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: conTextTextField,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () async {
                              context.read<ChatWithGPTBloc>().add(SendTextEvent(
                                  textChat: conTextTextField.text));
                            },
                            child: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(150, 236, 228, 225),
                          hintText: 'Enter your message',
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Image.asset('assets/images/Robot.png'),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(61, 255, 255, 255)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 150),
                        child: BlocBuilder<ChatWithGPTBloc, ChatWithGPTState>(
                            builder: (context, state) {
                          if (state is WriteTextUserState) {
                            return Center(
                              child: CardUser(
                                title: conTextTextField.text,
                                isUser: true,
                              ),
                            );
                          } else if (state is LoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is ResultTextSendState) {
                            return Center(
                              child: CardUser(
                                title: state.resultText,
                                isUser: false,
                              ),
                            );
                          } else if (state is CatchState) {
                            return Center(
                              child: Text(state.textError),
                            );
                          }

                          return Container();
                        }),
                      )
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
