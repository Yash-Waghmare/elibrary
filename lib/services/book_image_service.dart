import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
// import 'package:image_picker_web/image_picker_web.dart';

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
  print(url);
  return url;
}
