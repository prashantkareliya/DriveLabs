class InstructorFeedbackResponse {
  bool? success;
  String? message;
  UpdatedCustomer? updatedCustomer;

  InstructorFeedbackResponse(
      {this.success, this.message, this.updatedCustomer});

  InstructorFeedbackResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    updatedCustomer = json['updatedCustomer'] != null
        ? new UpdatedCustomer.fromJson(json['updatedCustomer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.updatedCustomer != null) {
      data['updatedCustomer'] = this.updatedCustomer!.toJson();
    }
    return data;
  }
}

class UpdatedCustomer {
  String? sId;
  String? name;
  String? role;
  String? email;
  String? phone;
  String? dateOfBirth;
  Address? address;
  String? password;
  String? course;
  String? courseId;
  String? certificate;
  String? photo;
  String? car;
  List<Rating>? rating;
  //List<Null>? session;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? adhar;
  String? level;

  UpdatedCustomer(
      {this.sId,
        this.name,
        this.role,
        this.email,
        this.phone,
        this.dateOfBirth,
        this.address,
        this.password,
        this.course,
        this.courseId,
        this.certificate,
        this.photo,
        this.car,
        this.rating,
       // this.session,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.adhar,
        this.level});

  UpdatedCustomer.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    role = json['role'];
    email = json['email'];
    phone = json['phone'];
    dateOfBirth = json['dateOfBirth'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    password = json['password'];
    course = json['course'];
    courseId = json['courseId'];
    certificate = json['certificate'];
    photo = json['photo'];
    car = json['car'];
    if (json['rating'] != null) {
      rating = <Rating>[];
      json['rating'].forEach((v) {
        rating!.add(new Rating.fromJson(v));
      });
    }
   /* if (json['session'] != null) {
      session = <Null>[];
      json['session'].forEach((v) {
        session!.add(new Null.fromJson(v));
      });
    }*/
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    adhar = json['adhar'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['role'] = this.role;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['dateOfBirth'] = this.dateOfBirth;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['password'] = this.password;
    data['course'] = this.course;
    data['courseId'] = this.courseId;
    data['certificate'] = this.certificate;
    data['photo'] = this.photo;
    data['car'] = this.car;
    if (this.rating != null) {
      data['rating'] = this.rating!.map((v) => v.toJson()).toList();
    }
   /* if (this.session != null) {
      data['session'] = this.session!.map((v) => v.toJson()).toList();
    }*/
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['adhar'] = this.adhar;
    data['level'] = this.level;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    return data;
  }
}

class Rating {
  int? day;
  int? steering;
  int? clutch;
  int? braking;
  int? independance;
  int? gearShifting;
  int? roadSense;
  String? instructorId;
  String? date;

  Rating(
      {this.day,
        this.steering,
        this.clutch,
        this.braking,
        this.independance,
        this.gearShifting,
        this.roadSense,
        this.instructorId,
        this.date});

  Rating.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    steering = json['steering'];
    clutch = json['clutch'];
    braking = json['braking'];
    independance = json['independance'];
    gearShifting = json['gear_shifting'];
    roadSense = json['road_sense'];
    instructorId = json['instructorId'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['steering'] = this.steering;
    data['clutch'] = this.clutch;
    data['braking'] = this.braking;
    data['independance'] = this.independance;
    data['gear_shifting'] = this.gearShifting;
    data['road_sense'] = this.roadSense;
    data['instructorId'] = this.instructorId;
    data['date'] = this.date;
    return data;
  }
}
