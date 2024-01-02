// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Future pickUploadImage() async {
  final image = await ImagePicker().pickImage(
    source: ImageSource.gallery,
  );
  if (image == null) {
    return;
  }
  var file = await ImageCropper().cropImage(
    sourcePath: image.path,
    aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
  );
  if (file == null) {
    return;
  }
  final res = await compressImage(file.path, 35);
  return res.path;
}

Future<XFile> compressImage(String path, int quality) async {
  final newPass = p.join(
    (await getTemporaryDirectory()).path,
    ('${DateTime.now()}.${p.extension(path)}'),
  );

  final result = await FlutterImageCompress.compressAndGetFile(
    path,
    newPass,
    quality: quality,
  );

  return result!;
}
