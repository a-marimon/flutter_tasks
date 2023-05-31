import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';

import '../firebase_options.dart';
import '../helpers/helpers.dart';

///Singleton para el manejo de una única instancia de Firebase en todo el ciclo de vida de la aplicación
class FirebaseServices {
  static final FirebaseServices _instance = FirebaseServices._();
  FirebaseFirestore? _db;
  String? uuid;

  FirebaseServices._();

  static FirebaseServices get instance => _instance;

  ///Inicialización de la instancia de Firebase
  ///Inicialización de la instancia de FirebaseFirestore
  ///Generador de UUID único para identificar dispositivo
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Preferences.init();
    _db = FirebaseFirestore.instance;
    setUUID();
  }

  void setUUID() {
    final uuidV4 = const Uuid().v4();
    uuid = Preferences.getString('uuid');
    if (uuid == null) {
      uuid = uuidV4;
      Preferences.setString('uuid', uuidV4);
    }
  }

  ///Agrega un nuevo documento a una colección en la BD
  Future<void> addNewDocument(
      {String topCollection = 'history_counters',
      String internalCollection = 'history',
      Map<String, dynamic>? data}) async {
    try {
      if (data != null) {
        await _db!
            .collection(topCollection)
            .doc(uuid)
            .collection(internalCollection)
            .add(data);
      }
    } catch (error) {
      throw Exception([error.toString()]);
    }
  }

  ///Método que retornará el ultimo elemento añadido a una colección
  ///basado en el campo 'lastUpdate'
  Future<DocumentSnapshot?> getLastDocument({
    String topCollection = 'history_counters',
    String internalCollection = 'history',
  }) async {
    try {
      QuerySnapshot querySnapshot = await _db!
          .collection(topCollection)
          .doc(uuid)
          .collection(internalCollection)
          .orderBy('lastUpdate', descending: true)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first;
      } else {
        return null;
      }
    } catch (error) {
      throw Exception([error.toString()]);
    }
  }

  ///Método para retornar todos los documentos de una colección ordenados
  ///por el campo 'lastUpdate'
  Future<List<QueryDocumentSnapshot<Object?>>> getAllDocuments({
    String topCollection = 'history_counters',
    String internalCollection = 'history',
  }) async {
    try {
      QuerySnapshot querySnapshot = await _db!
          .collection(topCollection)
          .doc(uuid)
          .collection(internalCollection)
          .orderBy('lastUpdate', descending: true)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception([error.toString()]);
    }
  }
}
