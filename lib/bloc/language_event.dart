part of 'language_bloc.dart';

@immutable
abstract class LanguageEvent {}

class GetLanguage extends LanguageEvent {}

class SetLanguage extends LanguageEvent {
  final LocaleEntity locale;
  SetLanguage({
    required this.locale,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SetLanguage && other.locale == locale;
  }

  @override
  int get hashCode => locale.hashCode;

  @override
  String toString() => 'SetLanguage(locale: $locale)';

  SetLanguage copyWith({
    LocaleEntity? locale,
  }) {
    return SetLanguage(
      locale: locale ?? this.locale,
    );
  }
}
