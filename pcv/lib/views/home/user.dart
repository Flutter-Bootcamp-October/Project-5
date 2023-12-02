import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/blocs/user_bloc/user_bloc.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/widgets/card_user.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(title: "User"),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is GetUserState) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CardUser(
                        image: state.about.data![index].image ?? "",
                        name: state.about.data![index].name.toString(),
                        email: state.about.data![index].email.toString(),
                        phone: state.about.data![index].phone.toString());
                  },
                  shrinkWrap: true,
                  itemCount: state.about.data!.length);
            }
            return const Center(child: CircularProgressIndicator());
          },
        )),
      ),
    );
  }
}
