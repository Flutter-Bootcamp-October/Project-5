import 'package:flutter/material.dart';
import 'package:project_resume/model/user_model.dart';

class GetUserScreen extends StatefulWidget {
  const GetUserScreen({super.key});

  @override
  State<GetUserScreen> createState() => _MyWidgetState();
}

List<Education> userOne = [];

class _MyWidgetState extends State<GetUserScreen> {
  // _loadUser() async {
  //   try {
  //     final User res = await getUsers();
  //     // userOne.addAll(res.data);
  //     return userOne;
  //     setState(() {});
  //   } on FormatException catch (error) {
  //     print("-----");
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(error.message.toString())));
  //   }
  // }

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _loadUser();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 161, 38, 38),
        title: const Text(
          'Users',
        ),
        centerTitle: true,
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     FutureBuilder(
      //       future: getUsers(),
      //       builder: (context, snapshot){
      //         if (snapshot.connectionState == ConnectionState.waiting) {
      //           return const Center(
      //             child: CircularProgressIndicator(),
      //           );
      //         } else {
      //           if (snapshot.hasError) {
      //             return Center(child: Text('Error: ${snapshot.error}'));
      //           } else {
      //             if (snapshot.hasData) {
      //               return ListView.builder(
      //                 //    itemCount: snapshot.data!,
      //                 itemBuilder: (context, index) {
      //                   return null;
      //                 },
      //               ); // children[: Card(
      //               //     child: Text(
      //               //         '${snapshot.data}'))); 
      //             }
      //           }
      //         }
      //       },
      //     )
      //   ],
      // ),
    );
  }
}
