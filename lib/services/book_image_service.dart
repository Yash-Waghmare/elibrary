import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';

// This file contains the book image service for uploading book image to the firebase storage
// The book image is uploaded to the firebase storage and the url is returned
// The url is then stored in the mongoDB database

Future<String> uploadFile(Uint8List file, String bookCode) async {
  String url = '';
  try {
    firebase_storage.UploadTask uploadTask;
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('books')
        .child(bookCode);

    final metaDate =
        firebase_storage.SettableMetadata(contentType: 'image/jpeg');
    uploadTask = ref.putData(file, metaDate);

    await uploadTask.whenComplete(() => null);

    url = await ref.getDownloadURL();
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  return url;
}
