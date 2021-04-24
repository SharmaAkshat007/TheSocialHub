import 'package:cloud_firestore/cloud_firestore.dart';

class DbService {
  final CollectionReference posts = Firestore.instance.collection('Posts');

  Future<void> insert() async {}

  Future<void> update() async {}

  Future<void> delete() async {}

  Future<void> read() async {}
}
