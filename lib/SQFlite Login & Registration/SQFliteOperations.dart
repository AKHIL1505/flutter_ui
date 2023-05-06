import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE user(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        email TEXT,
        password TEXT
      )""");
  }

  // myNotes Database
  static Future<sql.Database> myData() async {
    return sql.openDatabase(
      'userData.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<List<Map>> userFound(String userName, String userEmail) async {
    final db = await SQLHelper.myData();
    final data = await db.rawQuery(
        "SELECT * FROM user WHERE name= '$userName' AND email = '$userEmail' ");
    if (data.isNotEmpty) {
      return data;
    }
    return data;
  }

  static Future<int> addNewUserData(
      String newUserName, String newUserEmail, String newUserPassword) async {
    final db = await SQLHelper.myData();
    final data = {
      'name': newUserName,
      'email': newUserEmail,
      'password': newUserPassword
    };
    final id = db.insert('user', data);
    return id;
  }

  static Future<List<Map>> existingUser(
      String existingEmail, String existingPassword) async {
    final db = await SQLHelper.myData();
    final data = await db.rawQuery(
        "SELECT * FROM user WHERE email = '$existingEmail' AND password = '$existingPassword' ");
    if (data.isNotEmpty) {
      return data;
    }
    return data;
  }

  static Future<List<Map>> getAllUserDetails() async {
    final db = await SQLHelper.myData();
    final dataBaseDatas = await db.rawQuery("SELECT * FROM user");
    return dataBaseDatas;
  }

  static Future<void> deleteUser(int id) async {
    final db = await SQLHelper.myData();
    db.delete('user', where: 'id = ?', whereArgs: [id]);
  }
}
