class Employe {
  String? firstName;
  String? lastName;
  String? gender;
  int? age;
  Address? address;
  List<PhoneNumbers>? phoneNumbers;

  Employe(
      {this.firstName,
      this.lastName,
      this.gender,
      this.age,
      this.address,
      this.phoneNumbers});

  Employe.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    age = json['age'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['phoneNumbers'] != null) {
      phoneNumbers = <PhoneNumbers>[];
      json['phoneNumbers'].forEach((v) {
        phoneNumbers!.add(new PhoneNumbers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['age'] = this.age;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.phoneNumbers != null) {
      data['phoneNumbers'] = this.phoneNumbers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  String? streetAddress;
  String? city;
  String? state;
  String? postalCode;

  Address({this.streetAddress, this.city, this.state, this.postalCode});

  Address.fromJson(Map<String, dynamic> json) {
    streetAddress = json['streetAddress'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['streetAddress'] = this.streetAddress;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postalCode'] = this.postalCode;
    return data;
  }
}

class PhoneNumbers {
  String? type;
  String? number;

  PhoneNumbers({this.type, this.number});

  PhoneNumbers.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['number'] = this.number;
    return data;
  }
}
