import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/model/task_model.dart';

class FirebaseManger {
  static CollectionReference getCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromjson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
  }

 static addTask(TaskModel task) {
    CollectionReference collection = getCollection();
    var doc = collection.doc();
    task.id = doc.id;
    doc.set(task);
  }
}
