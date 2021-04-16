part of 'language_bloc.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageLoading extends LanguageState {}

class LanguageSuccess extends LanguageState {
  final Locale locale;
  LanguageSuccess({
    required this.locale,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LanguageSuccess && other.locale == locale;
  }

  @override
  int get hashCode => locale.hashCode;

  @override
  String toString() => 'LanguageSuccess(locale: $locale)';
}

class LanguageError extends LanguageState {
  final String message;
  LanguageError({
    required this.message,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LanguageError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'LanguageError(message: $message)';
}
