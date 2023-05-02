import 'package:flutter/material.dart';
import '../../models/models.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  const ContactItem({Key? key, required this.contact, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          contact.name,
          style: const TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
