import '../../models/models.dart';
import '../app_database.dart';

import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String _tableName = 'contacts';

  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountName = 'account_number';

  static const String _tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountName INTEGER)';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase(tableSql: _tableSql);

    Map<String, dynamic> contactMap = toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> toMap(Contact contact) {
    final Map<String, dynamic> contactMap = {};
    contactMap[_name] = contact.name;
    contactMap[_accountName] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase(tableSql: _tableSql);

    final List<Map<String, dynamic>> result = await db.query(_tableName);

    List<Contact> contacts = toList(result);
    return contacts;
  }

  List<Contact> toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];

    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        id: row[_id],
        name: row[_name],
        accountNumber: row[_accountName],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
