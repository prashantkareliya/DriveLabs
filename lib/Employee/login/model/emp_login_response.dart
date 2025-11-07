class EmpLoginResponse {
  bool? error;
  String? message;
  User? user;
  String? token;

  EmpLoginResponse({this.error, this.message, this.user, this.token});

  EmpLoginResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  String? sId;
  String? employeeId;
  String? name;
  String? role;
  String? email;
  String? phone;
  String? dateOfBirth;
  Address? address;
  String? certificate;
  String? photo;
  String? carAssigned;
  int? experience;
  List<String>? specialization;
  //List<Null>? sessions;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? adhar;
  double? rating;

  User(
      {this.sId,
        this.employeeId,
        this.name,
        this.role,
        this.email,
        this.phone,
        this.dateOfBirth,
        this.address,
        this.certificate,
        this.photo,
        this.carAssigned,
        this.experience,
        this.specialization,
       // this.sessions,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.adhar,
        this.rating});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    employeeId = json['employeeId'];
    name = json['name'];
    role = json['role'];
    email = json['email'];
    phone = json['phone'];
    dateOfBirth = json['dateOfBirth'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    certificate = json['certificate'];
    photo = json['photo'];
    carAssigned = json['carAssigned'];
    experience = json['experience'];
    specialization = json['specialization'].cast<String>();
    /*if (json['sessions'] != null) {
      sessions = <Null>[];
      json['sessions'].forEach((v) {
        sessions!.add(new Null.fromJson(v));
      });
    }*/
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    adhar = json['adhar'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['employeeId'] = employeeId;
    data['name'] = name;
    data['role'] = role;
    data['email'] = email;
    data['phone'] = phone;
    data['dateOfBirth'] = dateOfBirth;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['certificate'] = certificate;
    data['photo'] = photo;
    data['carAssigned'] = carAssigned;
    data['experience'] = experience;
    data['specialization'] = specialization;
   /* if (this.sessions != null) {
      data['sessions'] = this.sessions!.map((v) => v.toJson()).toList();
    }*/
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['adhar'] = adhar;
    data['rating'] = rating;
    return data;
  }
}

class Address {
  String? street;
  String? city;
  String? state;
  String? pincode;

  Address({this.street, this.city, this.state, this.pincode});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['city'] = city;
    data['state'] = state;
    data['pincode'] = pincode;
    return data;
  }
}
