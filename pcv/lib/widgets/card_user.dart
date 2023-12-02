import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  const CardUser(
      {super.key,
      this.image,
      required this.name,
      required this.email,
      required this.phone});
  final String? image;
  final String name;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade100.withOpacity(0.6),
      child: ListTile(
        leading:
            image == "" ? Text(image!) : ClipOval(child: Image.network(image!)),
        title: Text(
          name.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          email.toString(),
        ),
        trailing: Text(phone.toString()),
      ),
    );
  }
}
