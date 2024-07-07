// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagenation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagenationModel<T> _$PagenationModelFromJson<T>(Map<String, dynamic> json) =>
    PagenationModel<T>(
      meta: MetaDataModel.fromJson(json['meta'] as Map<String, dynamic>),
      data: DataConverter<T>().fromJson(json['data']),
    );

MetaDataModel _$MetaDataModelFromJson(Map<String, dynamic> json) =>
    MetaDataModel(
      currentPage: (json['current_page'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
    );
