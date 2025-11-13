class GetAllCourseResponse {
  String? message;
  int? count;
  List<Courses>? courses;

  GetAllCourseResponse({this.message, this.count, this.courses});

  GetAllCourseResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    count = json['count'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(new Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['count'] = this.count;
    if (this.courses != null) {
      data['courses'] = this.courses!.map((v) => v.toJson()).toList();
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
  List<Weeks>? weeks;
  String? timing;
  String? timing1;

  Courses(
      {this.location,
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
        this.weeks,
        this.timing,
        this.timing1});

  Courses.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    gamification = json['gamification'] != null
        ? new Gamification.fromJson(json['gamification'])
        : null;
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
        carTypes!.add(new CarTypes.fromJson(v));
      });
    }
    extrasAndBenefits = json['extrasAndBenefits'] != null
        ? new ExtrasAndBenefits.fromJson(json['extrasAndBenefits'])
        : null;
    if (json['weeks'] != null) {
      weeks = <Weeks>[];
      json['weeks'].forEach((v) {
        weeks!.add(new Weeks.fromJson(v));
      });
    }
    timing = json['timing'];
    timing1 = json[' timing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.gamification != null) {
      data['gamification'] = this.gamification!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['tagline'] = this.tagline;
    data['description'] = this.description;
    data['durationDays'] = this.durationDays;
    data['price'] = this.price;
    data['originalPrice'] = this.originalPrice;
    data['finalOwnCarPrice'] = this.finalOwnCarPrice;
    data['priceInflationNoCar'] = this.priceInflationNoCar;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['radius'] = this.radius;
    data['overviewPoints'] = this.overviewPoints;
    if (this.carTypes != null) {
      data['carTypes'] = this.carTypes!.map((v) => v.toJson()).toList();
    }
    if (this.extrasAndBenefits != null) {
      data['extrasAndBenefits'] = this.extrasAndBenefits!.toJson();
    }
    if (this.weeks != null) {
      data['weeks'] = this.weeks!.map((v) => v.toJson()).toList();
    }
    data['timing'] = this.timing;
    data[' timing'] = this.timing1;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['levels'] = this.levels;
    data['parametersTracked'] = this.parametersTracked;
    data['certificate'] = this.certificate;
    return data;
  }
}

class CarTypes {
  String? type;
  int? offerPrice;
  int? regularPrice;
  String? sessionTime;
  List<String>? keyHighlights;

  CarTypes(
      {this.type,
        this.offerPrice,
        this.regularPrice,
        this.sessionTime,
        this.keyHighlights});

  CarTypes.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    offerPrice = json['offerPrice'];
    regularPrice = json['regularPrice'];
    sessionTime = json['sessionTime'];
    keyHighlights = json['keyHighlights'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['offerPrice'] = this.offerPrice;
    data['regularPrice'] = this.regularPrice;
    data['sessionTime'] = this.sessionTime;
    data['keyHighlights'] = this.keyHighlights;
    return data;
  }
}

class ExtrasAndBenefits {
  int? ownCarClasses;
  int? freeReschedules;
  int? extraClassPrice;
  int? extraReschedulePrice;

  ExtrasAndBenefits(
      {this.ownCarClasses,
        this.freeReschedules,
        this.extraClassPrice,
        this.extraReschedulePrice});

  ExtrasAndBenefits.fromJson(Map<String, dynamic> json) {
    ownCarClasses = json['ownCarClasses'];
    freeReschedules = json['freeReschedules'];
    extraClassPrice = json['extraClassPrice'];
    extraReschedulePrice = json['extraReschedulePrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ownCarClasses'] = this.ownCarClasses;
    data['freeReschedules'] = this.freeReschedules;
    data['extraClassPrice'] = this.extraClassPrice;
    data['extraReschedulePrice'] = this.extraReschedulePrice;
    return data;
  }
}

class Weeks {
  int? weekNumber;
  List<Lessons>? lessons;

  Weeks({this.weekNumber, this.lessons});

  Weeks.fromJson(Map<String, dynamic> json) {
    weekNumber = json['weekNumber'];
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(new Lessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weekNumber'] = this.weekNumber;
    if (this.lessons != null) {
      data['lessons'] = this.lessons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lessons {
  int? dayNumber;
  String? title;
  String? description;
  bool? locked;
  bool? completed;

  Lessons(
      {this.dayNumber,
        this.title,
        this.description,
        this.locked,
        this.completed});

  Lessons.fromJson(Map<String, dynamic> json) {
    dayNumber = json['dayNumber'];
    title = json['title'];
    description = json['description'];
    locked = json['locked'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dayNumber'] = this.dayNumber;
    data['title'] = this.title;
    data['description'] = this.description;
    data['locked'] = this.locked;
    data['completed'] = this.completed;
    return data;
  }
}
