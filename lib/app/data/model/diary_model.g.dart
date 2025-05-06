// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaryModel _$DiaryModelFromJson(Map<String, dynamic> json) => DiaryModel(
      diaryMood: json['diary_mood'] == null
          ? null
          : DiaryMoodModel.fromJson(json['diary_mood'] as Map<String, dynamic>),
      diaryId: (json['diary_id'] as num?)?.toInt(),
      diaryDate: json['diary_date'] as String?,
      diaryTitle: json['diary_title'] as String?,
      diaryDesc: json['diary_desc'] as String?,
      moodId: (json['mood_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdBy: (json['created_by'] as num?)?.toInt(),
      updatedBy: (json['updated_by'] as num?)?.toInt(),
      diaryWishList: (json['diary_wish_list'] as List<dynamic>?)
          ?.map((e) => DiaryWishListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      diaryPhobiaList: (json['diary_phobia'] as List<dynamic>?)
          ?.map((e) => DiaryPhobiaListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiaryModelToJson(DiaryModel instance) =>
    <String, dynamic>{
      'diary_mood': instance.diaryMood?.toJson(),
      'diary_id': instance.diaryId,
      'diary_date': instance.diaryDate,
      'diary_title': instance.diaryTitle,
      'diary_desc': instance.diaryDesc,
      'mood_id': instance.moodId,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'diary_wish_list':
          instance.diaryWishList?.map((e) => e.toJson()).toList(),
      'diary_phobia': instance.diaryPhobiaList?.map((e) => e.toJson()).toList(),
    };
