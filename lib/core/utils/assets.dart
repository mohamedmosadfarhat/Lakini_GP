

import 'package:image_picker/image_picker.dart';

class Images {}

Future<String?> pickImage(ImageSource source) async {
  final ImagePicker picker = ImagePicker();

  final XFile? pickedFile = await picker.pickImage(source: source);

  if (pickedFile != null) {
    return pickedFile.path;
  } else {
    return null;
  }
}
