import 'package:drive_labs/auth/model/upload_document_request.dart';
import 'package:drive_labs/constants/constants.dart';
import 'package:drive_labs/http_actions/app_http.dart';
import 'package:flutter/material.dart';

class ProcedureDataSource extends HttpActions {
  Future<dynamic> getAllCourse() async {
    final response = await getMethod(ApiEndPoint.getAllCourse);
    debugPrint("Get All Course ==== > $response");
    return response;
  }

  Future<dynamic> uploadDocument(String docType, UploadDocumentRequest? uploadDocumentRequest) async {
    final response = await postMultiPartMethod(ApiEndPoint.uploadReport(docType), data: await uploadDocumentRequest?.toJson());
    debugPrint("Upload document -  $response");
    return response;
  }
}
