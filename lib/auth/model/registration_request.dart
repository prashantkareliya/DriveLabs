class RegistrationRequest {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? dateOfBirth;
  Address? address;
  String? otp;

  RegistrationRequest(
      {this.name,
        this.email,
        this.phone,
        this.password,
        this.dateOfBirth,
        this.address,
        this.otp});

  RegistrationRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    dateOfBirth = json['dateOfBirth'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['dateOfBirth'] = this.dateOfBirth;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['otp'] = this.otp;
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
