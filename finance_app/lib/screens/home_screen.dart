import 'package:finance_app/BLOCs/finance_bloc/finance_bloc.dart';
import 'package:finance_app/BLOCs/finance_bloc/finance_event.dart';
import 'package:finance_app/BLOCs/finance_bloc/finance_state.dart';
import 'package:finance_app/components/bottom_row.dart';
import 'package:finance_app/components/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController bodyController = TextEditingController();

  String? holder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).width * 0.3),
            Padding(
              padding: const EdgeInsets.only(bottom: 64, top: 16),
              child: BlocConsumer<FinanceBloc, FinanceState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ResponseState) {
                    holder = state.response;
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: InkWell(
                                onLongPress: () {
                                  context.read<FinanceBloc>().add(
                                      AddToFavtEvent(
                                          response: state.response, id: i));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[200],
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    state.response,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, i) {
                        return const SizedBox(height: 16);
                      },
                    );
                  }
                  return holder == null
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.blue[200],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              holder!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                },
                listener: (context, state) {
                  if (state is EmptyState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        dismissDirection: DismissDirection.up,
                        backgroundColor: Colors.red[600],
                        content: const Text('You can not send empty message!'),
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.only(bottom: 64),
                      ),
                    );
                  }
                  if (state is AddedToFavState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        dismissDirection: DismissDirection.up,
                        backgroundColor: Colors.green[600],
                        content: const Text('Suggestion added successfuly'),
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.only(bottom: 64),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).width * 0.2),
            Positioned(
              bottom: 0,
              child: BottomRow(
                controller: bodyController,
                onPressed: () async {
                  context
                      .read<FinanceBloc>()
                      .add(SendRequestEvent(request: bodyController.text));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
