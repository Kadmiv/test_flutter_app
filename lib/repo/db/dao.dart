import 'package:floor/floor.dart';

import '../../app.dart';
import 'models/person.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM task WHERE id = :id')
  Future<Person> findTaskById(int id);

  @Query('SELECT * FROM task')
  Future<List<Person>> findAllTasks();

  @Query('SELECT * FROM task')
  Stream<List<Person>> findAllTasksAsStream();

  @insert
  Future<void> insertTask(Person task);

  @insert
  Future<void> insertTasks(List<Person> tasks);

  @update
  Future<void> updateTask(Person task);

  @update
  Future<void> updateTasks(List<Person> task);

  @delete
  Future<void> deleteTask(Person task);

  @delete
  Future<void> deleteTasks(List<Person> tasks);
}
