class NewAppCuntactUsModel {
  final NewAppCuntactUsDataModel? data;
  final String? message;
  const NewAppCuntactUsModel({this.data, this.message});
  NewAppCuntactUsModel copyWith(
      {NewAppCuntactUsDataModel? data, String? message}) {
    return NewAppCuntactUsModel(
        data: data ?? this.data, message: message ?? this.message);
  }

  Map<String, Object?> toJson() {
    return {'data': data?.toJson(), 'message': message};
  }

  static NewAppCuntactUsModel fromJson(Map<String, Object?> json) {
    return NewAppCuntactUsModel(
        data: json['data'] == null
            ? null
            : NewAppCuntactUsDataModel.fromJson(
                json['data'] as Map<String, Object?>),
        message: json['message'] == null ? null : json['message'] as String);
  }

  @override
  String toString() {
    return '''NewAppCuntactUsModel(
                data:${data.toString()},
message:$message
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is NewAppCuntactUsModel &&
        other.runtimeType == runtimeType &&
        other.data == data &&
        other.message == message;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, data, message);
  }
}

class NewAppCuntactUsDataModel {
  final int? id;
  final String? siteNameAr;
  final String? siteNameEn;
  final String? logo;
  final String? favicon;
  final String? email;
  final String? workingHours;
  final String? aboutAr;
  final String? aboutEn;
  final String? facebookLink;
  final String? instagramLink;
  final String? linkedinLink;
  final String? twitterLink;
  final String? address;
  final String? location;
  final String? phone1;
  final String? phone2;
  const NewAppCuntactUsDataModel(
      {this.id,
      this.siteNameAr,
      this.siteNameEn,
      this.logo,
      this.favicon,
      this.email,
      this.workingHours,
      this.aboutAr,
      this.aboutEn,
      this.facebookLink,
      this.instagramLink,
      this.linkedinLink,
      this.twitterLink,
      this.address,
      this.location,
      this.phone1,
      this.phone2});
  NewAppCuntactUsDataModel copyWith(
      {int? id,
      String? siteNameAr,
      String? siteNameEn,
      String? logo,
      String? favicon,
      String? email,
      String? workingHours,
      String? aboutAr,
      String? aboutEn,
      String? facebookLink,
      String? instagramLink,
      String? linkedinLink,
      String? twitterLink,
      String? address,
      String? location,
      String? phone1,
      String? phone2}) {
    return NewAppCuntactUsDataModel(
        id: id ?? this.id,
        siteNameAr: siteNameAr ?? this.siteNameAr,
        siteNameEn: siteNameEn ?? this.siteNameEn,
        logo: logo ?? this.logo,
        favicon: favicon ?? this.favicon,
        email: email ?? this.email,
        workingHours: workingHours ?? this.workingHours,
        aboutAr: aboutAr ?? this.aboutAr,
        aboutEn: aboutEn ?? this.aboutEn,
        facebookLink: facebookLink ?? this.facebookLink,
        instagramLink: instagramLink ?? this.instagramLink,
        linkedinLink: linkedinLink ?? this.linkedinLink,
        twitterLink: twitterLink ?? this.twitterLink,
        address: address ?? this.address,
        location: location ?? this.location,
        phone1: phone1 ?? this.phone1,
        phone2: phone2 ?? this.phone2);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'site_name_ar': siteNameAr,
      'site_name_en': siteNameEn,
      'logo': logo,
      'favicon': favicon,
      'email': email,
      'working_hours': workingHours,
      'about_ar': aboutAr,
      'about_en': aboutEn,
      'facebook_link': facebookLink,
      'instagram_link': instagramLink,
      'linkedin_link': linkedinLink,
      'twitter_link': twitterLink,
      'address': address,
      'location': location,
      'phone1': phone1,
      'phone2': phone2
    };
  }

  static NewAppCuntactUsDataModel fromJson(Map<String, Object?> json) {
    return NewAppCuntactUsDataModel(
        id: json['id'] == null ? null : json['id'] as int,
        siteNameAr: json['site_name_ar'] == null
            ? null
            : json['site_name_ar'] as String,
        siteNameEn: json['site_name_en'] == null
            ? null
            : json['site_name_en'] as String,
        logo: json['logo'] == null ? null : json['logo'] as String,
        favicon: json['favicon'] == null ? null : json['favicon'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        workingHours: json['working_hours'] == null
            ? null
            : json['working_hours'] as String,
        aboutAr: json['about_ar'] == null ? null : json['about_ar'] as String,
        aboutEn: json['about_en'] == null ? null : json['about_en'] as String,
        facebookLink: json['facebook_link'] == null
            ? null
            : json['facebook_link'] as String,
        instagramLink: json['instagram_link'] == null
            ? null
            : json['instagram_link'] as String,
        linkedinLink: json['linkedin_link'] == null
            ? null
            : json['linkedin_link'] as String,
        twitterLink: json['twitter_link'] == null
            ? null
            : json['twitter_link'] as String,
        address: json['address'] == null ? null : json['address'] as String,
        location: json['location'] == null ? null : json['location'] as String,
        phone1: json['phone1'] == null ? null : json['phone1'] as String,
        phone2: json['phone2'] == null ? null : json['phone2'] as String);
  }

  @override
  String toString() {
    return '''Data(
                id:$id,
siteNameAr:$siteNameAr,
siteNameEn:$siteNameEn,
logo:$logo,
favicon:$favicon,
email:$email,
workingHours:$workingHours,
aboutAr:$aboutAr,
aboutEn:$aboutEn,
facebookLink:$facebookLink,
instagramLink:$instagramLink,
linkedinLink:$linkedinLink,
twitterLink:$twitterLink,
address:$address,
location:$location,
phone1:$phone1,
phone2:$phone2
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is NewAppCuntactUsDataModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.siteNameAr == siteNameAr &&
        other.siteNameEn == siteNameEn &&
        other.logo == logo &&
        other.favicon == favicon &&
        other.email == email &&
        other.workingHours == workingHours &&
        other.aboutAr == aboutAr &&
        other.aboutEn == aboutEn &&
        other.facebookLink == facebookLink &&
        other.instagramLink == instagramLink &&
        other.linkedinLink == linkedinLink &&
        other.twitterLink == twitterLink &&
        other.address == address &&
        other.location == location &&
        other.phone1 == phone1 &&
        other.phone2 == phone2;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        siteNameAr,
        siteNameEn,
        logo,
        favicon,
        email,
        workingHours,
        aboutAr,
        aboutEn,
        facebookLink,
        instagramLink,
        linkedinLink,
        twitterLink,
        address,
        location,
        phone1,
        phone2);
  }
}
