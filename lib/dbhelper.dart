import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './user.dart';

class DatabaseHelper {

  static final _databaseName = "ExploreEuropeDB.db";
  static final _databaseVersion = 1;

  static final users_table = 'names_table';

  static final columnId = 'user_id';
  static final columnFirstName = 'first_name';
  static final columnLastName = 'last_name';
  static final columnUsername = 'username';
  static final columnPassword = 'password';
  static final columnFavCountry = 'favCountry';
  static final columnNextDestination = 'nextDestination';
  static final columnPassport = 'passport';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $users_table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnFirstName TEXT NOT NULL,
            $columnLastName TEXT NOT NULL,
            $columnUsername TEXT NOT NULL,
            $columnPassword TEXT NOT NULL,
            $columnFavCountry TEXT NOT NULL,
            $columnNextDestination TEXT NOT NULL,
            $columnPassport
          )
          ''');
  }

  // Inserts user
  Future<int> insert(User user) async {
    Database db = await instance.database;
    return await db.insert(users_table, {'first_name': user.first_name, 'last_name': user.last_name, 'username': user.username, 'password': user.password, 'favCountry': user.favCountry, 'nextDestination': user.nextDestination, 'passport': user.passport});
  }

  // Get all rows
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(users_table);
  }

  // Count rows
  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $users_table'));
  }

  // Update user
  Future<int> update(User user) async {
    Database db = await instance.database;
    int id = user.toMap()['id'];
    return await db.update(users_table, user.toMap(), where: '$columnId = ?', whereArgs: [id]);
  }

  // Delete user
  Future<int> delete(int user_id) async {
    Database db = await instance.database;
    return await db.delete(users_table, where: '$columnId = ?', whereArgs: [user_id]);
  }
}