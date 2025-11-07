class EmpLoginRequest {
  String? employeeId;
  String? email;
  String? phone;
  String? password;

  EmpLoginRequest({this.employeeId, this.email, this.phone, this.password});

  EmpLoginRequest.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employeeId'] = employeeId;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    return data;
  }
}
