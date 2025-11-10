
import 'package:http/http.dart' as http;

class UploadDocumentRequest {
  String? files;
  String? userId;

  UploadDocumentRequest({this.files, this.userId});

  UploadDocumentRequest.fromJson(Map<String, dynamic> json) {
    files = json['file'];
    userId = json['userId'];
  }

  Future<Map<String, dynamic>> toJson() async {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (files != null && files?.isNotEmpty == true) {
      data['file'] = await http.MultipartFile.fromPath('file', files.toString());
    }
    data['userId'] = userId;
    return data;
  }
}
