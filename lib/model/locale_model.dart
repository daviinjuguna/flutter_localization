import 'dart:convert';

import 'package:locale_clean_code/entities/Local.dart';

class LocaleModel extends LocaleEntity {
  final String locale;
  final String countryCode;

  LocaleModel({
    required this.locale,
    required this.countryCode,
  }) : super(countryCode: countryCode, locale: locale);

  LocaleModel copyWith({
    String? locale,
    String? countryCode,
  }) {
    return LocaleModel(
      locale: locale ?? this.locale,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'locale': locale,
      'countryCode': countryCode,
    };
  }

  factory LocaleModel.fromMap(Map<String, dynamic> map) {
    return LocaleModel(
      locale: map['locale'],
      countryCode: map['countryCode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LocaleModel.fromJson(String source) =>
      LocaleModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'LocaleModel(locale: $locale, countryCode: $countryCode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocaleModel &&
        other.locale == locale &&
        other.countryCode == countryCode;
  }

  @override
  int get hashCode => locale.hashCode ^ countryCode.hashCode;
}
