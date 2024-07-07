class NewAppServicesMode {
  final List<NewAppServicesDataMode>? data;
  final String? message;
  const NewAppServicesMode({this.data, this.message});
  NewAppServicesMode copyWith(
      {List<NewAppServicesDataMode>? data, String? message}) {
    return NewAppServicesMode(
        data: data ?? this.data, message: message ?? this.message);
  }

  Map<String, Object?> toJson() {
    return {
      'data': data?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'message': message
    };
  }

  factory NewAppServicesMode.fromJson(Map<String, Object?> json) {
    return NewAppServicesMode(
        data: json['data'] == null
            ? null
            : (json['data'] as List)
                .map<NewAppServicesDataMode>((data) =>
                    NewAppServicesDataMode.fromJson(
                        data as Map<String, Object?>))
                .toList(),
        message: json['message'] == null ? null : json['message'] as String);
  }

  @override
  String toString() {
    return '''NewAppServicesMode(
                data:${data.toString()},
message:$message
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is NewAppServicesMode &&
        other.runtimeType == runtimeType &&
        other.data == data &&
        other.message == message;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, data, message);
  }
}

class NewAppServicesDataMode {
  final int? id;
  final String? nameAr, nameEn;
  final String? image;
  final String? phone1;
  final String? phone2;
  final String? createdAt;
  final String? updatedAt;
  const NewAppServicesDataMode({
    this.id,
    this.nameAr,
    this.nameEn,
    this.image,
    this.phone1,
    this.phone2,
    this.createdAt,
    this.updatedAt,
  });
  NewAppServicesDataMode copyWith({
    int? id,
    String? nameAr,
    String? nameEn,
    String? image,
    String? phone1,
    String? phone2,
    String? createdAt,
    String? updatedAt,
  }) {
    return NewAppServicesDataMode(
      id: id ?? this.id,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      image: image ?? this.image,
      phone1: phone1 ?? this.phone1,
      phone2: phone2 ?? this.phone2,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': nameAr,
      'name_en': nameEn,
      'image': image,
      'phone1': phone1,
      'phone2': phone2,
      'created_at': createdAt,
      'updated_at': updatedAt
    };
  }

  factory NewAppServicesDataMode.fromJson(Map<String, Object?> json) {
    return NewAppServicesDataMode(
      id: json['id'] == null ? null : json['id'] as int,
      nameAr: json['name'] == null ? null : json['name'] as String,
      nameEn: json['name_en'] == null ? null : json['name_en'] as String,
      image: json['image'] == null ? null : json['image'] as String,
      phone1: json['phone1'] == null ? null : json['phone1'] as String,
      phone2: json['phone2'] == null ? null : json['phone2'] as String,
      createdAt:
          json['created_at'] == null ? null : json['created_at'] as String,
      updatedAt:
          json['updated_at'] == null ? null : json['updated_at'] as String,
    );
  }

  @override
  String toString() {
    return '''NewAppServicesDataMode(
                id:$id,
name:$nameAr,
name_en:$nameEn,
image:$image,
phone1:$phone1,
phone2:$phone2,
createdAt:$createdAt,
updatedAt:$updatedAt
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is NewAppServicesDataMode &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.nameAr == nameAr &&
        other.nameEn == nameEn &&
        other.image == image &&
        other.phone1 == phone1 &&
        other.phone2 == phone2 &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, nameAr, nameEn, image, phone1, phone2,
        createdAt, updatedAt);
  }
}
