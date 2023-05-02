import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase({required String tableSql}) async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return await openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute(tableSql);
    },

    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}
