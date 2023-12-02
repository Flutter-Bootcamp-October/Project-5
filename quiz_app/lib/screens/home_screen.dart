import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/home.state.dart';
import 'package:quiz_app/bloc/home_bloc.dart';
import 'package:quiz_app/bloc/home_event.dart';
import 'package:quiz_app/services/open_ai.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xff252c4a),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Text(
                      'Story',
                      style: TextStyle(
                        color: Color(0xff8b94bc),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextField(
                    onSubmitted: (value) {
                      context.read<HomeBloc>().add(HomeEvent(value));
                    },
                    decoration: const InputDecoration(
                      hintText: "Little red raiding hood",
                      filled: true,
                      fillColor: Color(0xff8b94bc),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return FutureBuilder(
                        future: OpenAi().getQuestions(state.title),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView(
                              shrinkWrap: true,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(snapshot.data.toString()),
                                )
                              ],
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: Color(0xff8b94bc)),
                            );
                          }
                        },
                      );
                    },
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
