import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import '../../database/dao/contact_dao.dart';
import 'contacts_list.dart';

class ContactsListCubit extends Cubit<ContactsListState> {
  ContactsListCubit() : super(const InitContactsListState());

  void reload() async {
    emit(const LoadingContactsListState());
    try {
      final ContactDao dao = ContactDao();

      List<Contact> contacts = await dao.findAll();
      emit(LoadedContactsListState(contacts));
    } catch (e) {
      emit(const FatalErrorContactsListState());
    }
  }
}
