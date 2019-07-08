// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorFlutterDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder databaseBuilder(String name) =>
      _$FlutterDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FlutterDatabaseBuilder(null);
}

class _$FlutterDatabaseBuilder {
  _$FlutterDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  /// Adds migrations to the builder.
  _$FlutterDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Creates the database and initializes it.
  Future<FlutterDatabase> build() async {
    final database = _$FlutterDatabase();
    database.database = await database.open(name ?? ':memory:', _migrations);
    return database;
  }
}

class _$FlutterDatabase extends FlutterDatabase {
  _$FlutterDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PersonDao _daoInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);
      },
      onCreate: (database, _) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Person` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT)');
      },
    );
  }

  @override
  PersonDao get dao {
    return _daoInstance ??= _$PersonDao(database, changeListener);
  }
}

class _$PersonDao extends PersonDao {
  _$PersonDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _personInsertionAdapter = InsertionAdapter(
            database,
            'Person',
            (Person item) =>
                <String, dynamic>{'id': item.id, 'name': item.name},
            changeListener),
        _personUpdateAdapter = UpdateAdapter(
            database,
            'Person',
            'id',
            (Person item) =>
                <String, dynamic>{'id': item.id, 'name': item.name},
            changeListener),
        _personDeletionAdapter = DeletionAdapter(
            database,
            'Person',
            'id',
            (Person item) =>
                <String, dynamic>{'id': item.id, 'name': item.name},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final _personMapper = (Map<String, dynamic> row) =>
      Person(row['id'] as int, row['name'] as String);

  final InsertionAdapter<Person> _personInsertionAdapter;

  final UpdateAdapter<Person> _personUpdateAdapter;

  final DeletionAdapter<Person> _personDeletionAdapter;

  @override
  Future<Person> findTaskById(int id) async {
    return _queryAdapter.query('SELECT * FROM task WHERE id = ?',
        arguments: <dynamic>[id], mapper: _personMapper);
  }

  @override
  Future<List<Person>> findAllTasks() async {
    return _queryAdapter.queryList('SELECT * FROM task', mapper: _personMapper);
  }

  @override
  Stream<List<Person>> findAllTasksAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM task',
        tableName: 'Person', mapper: _personMapper);
  }

  @override
  Future<void> insertTask(Person task) async {
    await _personInsertionAdapter.insert(task, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> insertTasks(List<Person> tasks) async {
    await _personInsertionAdapter.insertList(
        tasks, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updateTask(Person task) async {
    await _personUpdateAdapter.update(task, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updateTasks(List<Person> task) async {
    await _personUpdateAdapter.updateList(
        task, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> deleteTask(Person task) async {
    await _personDeletionAdapter.delete(task);
  }

  @override
  Future<void> deleteTasks(List<Person> tasks) async {
    await _personDeletionAdapter.deleteList(tasks);
  }
}
