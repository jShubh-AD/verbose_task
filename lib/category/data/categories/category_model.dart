import 'dart:convert';
import 'dart:core';
CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));
String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());
class CategoryModel {
  CategoryModel({
      this.id, 
      this.slug, 
      this.title, 
      this.titleTranslations, 
      this.meta, 
      this.sortOrder, 
      this.mediaurls, 
      this.parentId,});

  CategoryModel.fromJson(dynamic json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    titleTranslations = json['title_translations'] != null ? TitleTranslations.fromJson(json['title_translations']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    sortOrder = json['sort_order'];
    mediaurls = json['mediaurls'] != null ? Mediaurls.fromJson(json['mediaurls']) : null;
    parentId = json['parent_id'];
  }
  int? id;
  String? slug;
  String? title;
  TitleTranslations? titleTranslations;
  Meta? meta;
  int? sortOrder;
  Mediaurls? mediaurls;
  int? parentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['slug'] = slug;
    map['title'] = title;
    if (titleTranslations != null) {
      map['title_translations'] = titleTranslations?.toJson();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    map['sort_order'] = sortOrder;
    if (mediaurls != null) {
      map['mediaurls'] = mediaurls?.toJson();
    }
    map['parent_id'] = parentId;
    return map;
  }

}

Mediaurls mediaurlsFromJson(String str) => Mediaurls.fromJson(json.decode(str));
String mediaurlsToJson(Mediaurls data) => json.encode(data.toJson());
class Mediaurls {
  Mediaurls({
      this.images,});

  Mediaurls.fromJson(dynamic json) {
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
  }
  List<Images>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Images imagesFromJson(String str) => Images.fromJson(json.decode(str));
String imagesToJson(Images data) => json.encode(data.toJson());
class Images {
  Images({
      this.defaul,
      this.thumb,});



  Images.fromJson(dynamic json) {
    defaul = json['default'];
    thumb = json['thumb'];
  }
  String? defaul;
  String? thumb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['default'] = defaul;
    map['thumb'] = thumb;
    return map;
  }

}

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));
String metaToJson(Meta data) => json.encode(data.toJson());
class Meta {
  Meta({
      this.scope, 
      this.vendorType,});

  Meta.fromJson(dynamic json) {
    scope = json['scope'];
    vendorType = json['vendor_type'];
  }
  String? scope;
  String? vendorType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['scope'] = scope;
    map['vendor_type'] = vendorType;
    return map;
  }

}

TitleTranslations titleTranslationsFromJson(String str) => TitleTranslations.fromJson(json.decode(str));
String titleTranslationsToJson(TitleTranslations data) => json.encode(data.toJson());
class TitleTranslations {
  TitleTranslations({
      this.en,});

  TitleTranslations.fromJson(dynamic json) {
    en = json['en'];
  }
  String? en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = en;
    return map;
  }

}