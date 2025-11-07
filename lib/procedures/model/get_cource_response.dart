class GetAllCourseResponse {
  bool? error;
  String? message;
  int? count;
  List<Courses>? courses;

  GetAllCourseResponse({this.error, this.message, this.count, this.courses});

  GetAllCourseResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    count = json['count'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    data['count'] = count;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  Location? location;
  Gamification? gamification;
  String? sId;
  String? name;
  String? tagline;
  String? description;
  int? durationDays;
  int? price;
  int? originalPrice;
  int? finalOwnCarPrice;
  int? priceInflationNoCar;
  String? city;
  String? state;
  String? country;
  String? radius;
  List<String>? overviewPoints;
  List<CarTypes>? carTypes;
  ExtrasAndBenefits? extrasAndBenefits;

  //List<Null>? weeks;

  Courses({
    this.location,
    this.gamification,
    this.sId,
    this.name,
    this.tagline,
    this.description,
    this.durationDays,
    this.price,
    this.originalPrice,
    this.finalOwnCarPrice,
    this.priceInflationNoCar,
    this.city,
    this.state,
    this.country,
    this.radius,
    this.overviewPoints,
    this.carTypes,
    this.extrasAndBenefits,
    //this.weeks
  });

  Courses.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    gamification = json['gamification'] != null ? Gamification.fromJson(json['gamification']) : null;
    sId = json['_id'];
    name = json['name'];
    tagline = json['tagline'];
    description = json['description'];
    durationDays = json['durationDays'];
    price = json['price'];
    originalPrice = json['originalPrice'];
    finalOwnCarPrice = json['finalOwnCarPrice'];
    priceInflationNoCar = json['priceInflationNoCar'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    radius = json['radius'];
    overviewPoints = json['overviewPoints'].cast<String>();
    if (json['carTypes'] != null) {
      carTypes = <CarTypes>[];
      json['carTypes'].forEach((v) {
        carTypes!.add(CarTypes.fromJson(v));
      });
    }
    extrasAndBenefits = json['extrasAndBenefits'] != null ? ExtrasAndBenefits.fromJson(json['extrasAndBenefits']) : null;
    /*if (json['weeks'] != null) {
      weeks = <Null>[];
      json['weeks'].forEach((v) {
        weeks!.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (gamification != null) {
      data['gamification'] = gamification!.toJson();
    }
    data['_id'] = sId;
    data['name'] = name;
    data['tagline'] = tagline;
    data['description'] = description;
    data['durationDays'] = durationDays;
    data['price'] = price;
    data['originalPrice'] = originalPrice;
    data['finalOwnCarPrice'] = finalOwnCarPrice;
    data['priceInflationNoCar'] = priceInflationNoCar;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['radius'] = radius;
    data['overviewPoints'] = overviewPoints;
    if (carTypes != null) {
      data['carTypes'] = carTypes!.map((v) => v.toJson()).toList();
    }
    if (extrasAndBenefits != null) {
      data['extrasAndBenefits'] = extrasAndBenefits!.toJson();
    }
    /*if (this.weeks != null) {
      data['weeks'] = this.weeks!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}

class Gamification {
  List<String>? levels;
  List<String>? parametersTracked;
  String? certificate;

  Gamification({this.levels, this.parametersTracked, this.certificate});

  Gamification.fromJson(Map<String, dynamic> json) {
    levels = json['levels'].cast<String>();
    parametersTracked = json['parametersTracked'].cast<String>();
    certificate = json['certificate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['levels'] = levels;
    data['parametersTracked'] = parametersTracked;
    data['certificate'] = certificate;
    return data;
  }
}

class CarTypes {
  String? type;
  int? offerPrice;
  int? regularPrice;
  String? sessionTime;
  List<String>? keyHighlights;

  CarTypes({this.type, this.offerPrice, this.regularPrice, this.sessionTime, this.keyHighlights});

  CarTypes.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    offerPrice = json['offerPrice'];
    regularPrice = json['regularPrice'];
    sessionTime = json['sessionTime'];
    keyHighlights = json['keyHighlights'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['offerPrice'] = offerPrice;
    data['regularPrice'] = regularPrice;
    data['sessionTime'] = sessionTime;
    data['keyHighlights'] = keyHighlights;
    return data;
  }
}

class ExtrasAndBenefits {
  int? ownCarClasses;
  int? freeReschedules;
  int? extraClassPrice;
  int? extraReschedulePrice;

  ExtrasAndBenefits({this.ownCarClasses, this.freeReschedules, this.extraClassPrice, this.extraReschedulePrice});

  ExtrasAndBenefits.fromJson(Map<String, dynamic> json) {
    ownCarClasses = json['ownCarClasses'];
    freeReschedules = json['freeReschedules'];
    extraClassPrice = json['extraClassPrice'];
    extraReschedulePrice = json['extraReschedulePrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ownCarClasses'] = ownCarClasses;
    data['freeReschedules'] = freeReschedules;
    data['extraClassPrice'] = extraClassPrice;
    data['extraReschedulePrice'] = extraReschedulePrice;
    return data;
  }
}
