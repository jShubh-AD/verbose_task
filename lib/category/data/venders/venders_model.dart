import 'dart:convert';

class Vendor {
  List<Datum> data;

  Vendor({
    required this.data,
  });

  factory Vendor.fromRawJson(String str) => Vendor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String name;
  String tagline;
  String details;
  DatumMeta meta;
  DatumMediaurls mediaurls;
  int minimumOrder;
  int deliveryFee;
  String area;
  String address;
  double longitude;
  double latitude;
  int isVerified;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Category> categories;
  List<Category> productCategories;
  User user;
  int ratings;
  int ratingsCount;
  int favouriteCount;
  bool isFavourite;
  double distance;
  dynamic plan;
  int planSortOrder;
  List<dynamic> availability;

  Datum({
    required this.id,
    required this.name,
    required this.tagline,
    required this.details,
    required this.meta,
    required this.mediaurls,
    required this.minimumOrder,
    required this.deliveryFee,
    required this.area,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.isVerified,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.categories,
    required this.productCategories,
    required this.user,
    required this.ratings,
    required this.ratingsCount,
    required this.favouriteCount,
    required this.isFavourite,
    required this.distance,
    required this.plan,
    required this.planSortOrder,
    required this.availability,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    tagline: json["tagline"],
    details: json["details"],
    meta: DatumMeta.fromJson(json["meta"]),
    mediaurls: DatumMediaurls.fromJson(json["mediaurls"]),
    minimumOrder: json["minimum_order"],
    deliveryFee: json["delivery_fee"],
    area: json["area"],
    address: json["address"],
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    isVerified: json["is_verified"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    productCategories: List<Category>.from(json["product_categories"].map((x) => Category.fromJson(x))),
    user: User.fromJson(json["user"]),
    ratings: json["ratings"],
    ratingsCount: json["ratings_count"],
    favouriteCount: json["favourite_count"],
    isFavourite: json["is_favourite"],
    distance: json["distance"]?.toDouble(),
    plan: json["plan"],
    planSortOrder: json["plan_sort_order"],
    availability: List<dynamic>.from(json["availability"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "tagline": tagline,
    "details": details,
    "meta": meta.toJson(),
    "mediaurls": mediaurls.toJson(),
    "minimum_order": minimumOrder,
    "delivery_fee": deliveryFee,
    "area": area,
    "address": address,
    "longitude": longitude,
    "latitude": latitude,
    "is_verified": isVerified,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "product_categories": List<dynamic>.from(productCategories.map((x) => x.toJson())),
    "user": user.toJson(),
    "ratings": ratings,
    "ratings_count": ratingsCount,
    "favourite_count": favouriteCount,
    "is_favourite": isFavourite,
    "distance": distance,
    "plan": plan,
    "plan_sort_order": planSortOrder,
    "availability": List<dynamic>.from(availability.map((x) => x)),
  };
}

class Category {
  int id;
  String slug;
  String title;
  TitleTranslations titleTranslations;
  CategoryMeta meta;
  int sortOrder;
  CategoryMediaurls mediaurls;
  int? parentId;

  Category({
    required this.id,
    required this.slug,
    required this.title,
    required this.titleTranslations,
    required this.meta,
    required this.sortOrder,
    required this.mediaurls,
    required this.parentId,
  });

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    slug: json["slug"],
    title: json["title"],
    titleTranslations: TitleTranslations.fromJson(json["title_translations"]),
    meta: CategoryMeta.fromJson(json["meta"]),
    sortOrder: json["sort_order"],
    mediaurls: CategoryMediaurls.fromJson(json["mediaurls"]),
    parentId: json["parent_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "title": title,
    "title_translations": titleTranslations.toJson(),
    "meta": meta.toJson(),
    "sort_order": sortOrder,
    "mediaurls": mediaurls.toJson(),
    "parent_id": parentId,
  };
}

class CategoryMediaurls {
  List<PurpleImage> images;

  CategoryMediaurls({
    required this.images,
  });

  factory CategoryMediaurls.fromRawJson(String str) => CategoryMediaurls.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryMediaurls.fromJson(Map<String, dynamic> json) => CategoryMediaurls(
    images: List<PurpleImage>.from(json["images"].map((x) => PurpleImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class PurpleImage {
  String imageDefault;
  String thumb;

  PurpleImage({
    required this.imageDefault,
    required this.thumb,
  });

  factory PurpleImage.fromRawJson(String str) => PurpleImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurpleImage.fromJson(Map<String, dynamic> json) => PurpleImage(
    imageDefault: json["default"],
    thumb: json["thumb"],
  );

  Map<String, dynamic> toJson() => {
    "default": imageDefault,
    "thumb": thumb,
  };
}

class CategoryMeta {
  Scope scope;
  VendorType vendorType;

  CategoryMeta({
    required this.scope,
    required this.vendorType,
  });

  factory CategoryMeta.fromRawJson(String str) => CategoryMeta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryMeta.fromJson(Map<String, dynamic> json) => CategoryMeta(
    scope: scopeValues.map[json["scope"]]!,
    vendorType: vendorTypeValues.map[json["vendor_type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "scope": scopeValues.reverse[scope],
    "vendor_type": vendorTypeValues.reverse[vendorType],
  };
}

enum Scope {
  ECOMMERCE
}

final scopeValues = EnumValues({
  "ecommerce": Scope.ECOMMERCE
});

enum VendorType {
  FOOD
}

final vendorTypeValues = EnumValues({
  "food": VendorType.FOOD
});

class TitleTranslations {
  String en;

  TitleTranslations({
    required this.en,
  });

  factory TitleTranslations.fromRawJson(String str) => TitleTranslations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TitleTranslations.fromJson(Map<String, dynamic> json) => TitleTranslations(
    en: json["en"],
  );

  Map<String, dynamic> toJson() => {
    "en": en,
  };
}

class DatumMediaurls {
  List<FluffyImage> images;

  DatumMediaurls({
    required this.images,
  });

  factory DatumMediaurls.fromRawJson(String str) => DatumMediaurls.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DatumMediaurls.fromJson(Map<String, dynamic> json) => DatumMediaurls(
    images: List<FluffyImage>.from(json["images"].map((x) => FluffyImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class FluffyImage {
  String imageDefault;

  FluffyImage({
    required this.imageDefault,
  });

  factory FluffyImage.fromRawJson(String str) => FluffyImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FluffyImage.fromJson(Map<String, dynamic> json) => FluffyImage(
    imageDefault: json["default"],
  );

  Map<String, dynamic> toJson() => {
    "default": imageDefault,
  };
}

class DatumMeta {
  VendorType vendorType;
  String closingTime;
  String openingTime;

  DatumMeta({
    required this.vendorType,
    required this.closingTime,
    required this.openingTime,
  });

  factory DatumMeta.fromRawJson(String str) => DatumMeta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DatumMeta.fromJson(Map<String, dynamic> json) => DatumMeta(
    vendorType: vendorTypeValues.map[json["vendor_type"]]!,
    closingTime: json["closing_time"],
    openingTime: json["opening_time"],
  );

  Map<String, dynamic> toJson() => {
    "vendor_type": vendorTypeValues.reverse[vendorType],
    "closing_time": closingTime,
    "opening_time": openingTime,
  };
}

class User {
  int id;
  String name;
  String email;
  dynamic username;
  String mobileNumber;
  int mobileVerified;
  int isVerified;
  int active;
  String language;
  dynamic notification;
  dynamic meta;
  dynamic rememberToken;
  DateTime createdAt;
  DateTime updatedAt;
  String referralCode;
  Wallet wallet;
  List<dynamic> media;
  List<dynamic> followings;
  List<dynamic> categories;
  List<dynamic> subscriptions;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.mobileNumber,
    required this.mobileVerified,
    required this.isVerified,
    required this.active,
    required this.language,
    required this.notification,
    required this.meta,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
    required this.referralCode,
    required this.wallet,
    required this.media,
    required this.followings,
    required this.categories,
    required this.subscriptions,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    username: json["username"],
    mobileNumber: json["mobile_number"],
    mobileVerified: json["mobile_verified"],
    isVerified: json["is_verified"],
    active: json["active"],
    language: json["language"],
    notification: json["notification"],
    meta: json["meta"],
    rememberToken: json["remember_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    referralCode: json["referral_code"],
    wallet: Wallet.fromJson(json["wallet"]),
    media: List<dynamic>.from(json["media"].map((x) => x)),
    followings: List<dynamic>.from(json["followings"].map((x) => x)),
    categories: List<dynamic>.from(json["categories"].map((x) => x)),
    subscriptions: List<dynamic>.from(json["subscriptions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "username": username,
    "mobile_number": mobileNumber,
    "mobile_verified": mobileVerified,
    "is_verified": isVerified,
    "active": active,
    "language": language,
    "notification": notification,
    "meta": meta,
    "remember_token": rememberToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "referral_code": referralCode,
    "wallet": wallet.toJson(),
    "media": List<dynamic>.from(media.map((x) => x)),
    "followings": List<dynamic>.from(followings.map((x) => x)),
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "subscriptions": List<dynamic>.from(subscriptions.map((x) => x)),
  };
}

class Wallet {
  int id;
  int userId;
  int balance;
  DateTime createdAt;
  DateTime updatedAt;

  Wallet({
    required this.id,
    required this.userId,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Wallet.fromRawJson(String str) => Wallet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    id: json["id"],
    userId: json["user_id"],
    balance: json["balance"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "balance": balance,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
