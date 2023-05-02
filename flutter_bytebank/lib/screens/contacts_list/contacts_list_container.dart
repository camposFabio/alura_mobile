import 'package:bytebank/components/localization/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import 'contacts_list.dart';

class ContactsListContainer extends BlocContainer {
  const ContactsListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactsListCubit>(
      create: (context) {
        final ContactsListCubit cubit = ContactsListCubit();
        cubit.reload();
        return cubit;
      },
      child: I18nLoadingContainer(
        viewKey: "dashboard",
        creator: (I18nMessages messages) => ContactsListView(messages),
      ),
    );
  }
}
