import 'package:finance_app/BLOCs/finance_bloc/finance_bloc.dart';
import 'package:finance_app/BLOCs/finance_bloc/finance_event.dart';
import 'package:finance_app/BLOCs/finance_bloc/finance_state.dart';
import 'package:finance_app/globals/globals.dart';
import 'package:finance_app/services/supabase_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Favorites')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: fav.isEmpty
            ? const Column(
                children: [
                  Center(
                    child: Text(
                      'You have no favorites',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              )
            : BlocConsumer<FinanceBloc, FinanceState>(
                listener: (context, state) {
                  if (state is DeleteFavState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        dismissDirection: DismissDirection.up,
                        backgroundColor: Colors.green[600],
                        content: const Text('Item deleted successfuly'),
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.only(bottom: 64),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return FutureBuilder(
                    future: SupabaseApi().getFav(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error!'),
                        );
                      } else {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green[200],
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.cancel_outlined,
                                              size: 32,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<FinanceBloc>()
                                                  .add(DeleteFavEvent(i: i));
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Center(
                                            child: Text(
                                              snapshot.data[i],
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
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
                    },
                  );
                },
              ),
      ),
    );
  }
}
