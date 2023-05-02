import 'package:bytebank/components/localization/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../models/models.dart';

import '../../screens/screens.dart';
import 'contacts_list.dart';

class ContactsListView extends StatelessWidget {
  final I18nMessages _i18n;

  const ContactsListView(this._i18n, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_i18n.get('transfer')),
      ),
      body: BlocBuilder<ContactsListCubit, ContactsListState>(
        builder: (context, state) {
          if (state is InitContactsListState ||
              state is LoadingContactsListState) {
            return const Progress();
          }
          if (state is LoadedContactsListState) {
            final List<Contact> contacts = state.contacts;

            return ListView.builder(
              itemBuilder: (context, index) {
                final Contact contact = contacts[index];
                return ContactItem(
                  contact: contact,
                  onClick: () {
                    push(context, TransactionFormContainer(contact));
                  },
                );
              },
              itemCount: contacts.length,
            );
          }
          return const CenteredMessage(message: 'Unknow Error');
        },
      ),
      floatingActionButton: buildAddContactButton(context),
    );
  }

  FloatingActionButton buildAddContactButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ContactForm(),
          ),
        );
        update(context);
      },
      child: const Icon(Icons.add),
    );
  }

  void update(BuildContext context) {
    context.read<ContactsListCubit>().reload();
  }
}
