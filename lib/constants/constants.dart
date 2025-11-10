import 'package:flutter/material.dart';

@immutable
class Constants {
  const Constants({required this.endpoint});

  factory Constants.of() {
    if (_instance != null) return _instance!;
    _instance = Constants._prd();
    return _instance!;
  }

  factory Constants._prd() {
    return const Constants(
      ///Base URl
      endpoint: 'https://drive-labs.onrender.com/api/', //  staging server
    );
  }

  static Constants? _instance;
  final String endpoint;
}

class ResponseStatus {
  static const bool failed = true;
  static const bool success = false;
}

class ApiEndPoint {
  //POST API endpoint

  static const String loginUser = "customer/login";
  static const String registerUser = "customer/signup";

  static const String instructorFeedback = "instructor/ratings/add";

  static String uploadReport(String fileType) => "customer/upload/$fileType";

  //Instructor
  static const String loginEmp = "instructor/login";

  //DELETE API endpoint

  //GET API endpoint
  static const String getAllCourse = "courses/GetAll";

}
