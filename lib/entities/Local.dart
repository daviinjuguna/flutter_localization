class LocaleEntity {
  final String locale;
  final String countryCode;
  LocaleEntity({
    required this.locale,
    required this.countryCode,
  });

  LocaleEntity copyWith({
    String? locale,
    String? countryCode,
  }) {
    return LocaleEntity(
      locale: locale ?? this.locale,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  @override
  String toString() =>
      'LocaleEntity(locale: $locale, countryCode: $countryCode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocaleEntity &&
        other.locale == locale &&
        other.countryCode == countryCode;
  }

  @override
  int get hashCode => locale.hashCode ^ countryCode.hashCode;
}
