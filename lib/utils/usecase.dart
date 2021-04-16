import 'package:dartz/dartz.dart';

import 'package:locale_clean_code/entities/Local.dart';

abstract class UseCase<Type, Params> {
  Future<Either<String, Type>> call(Params p);
}

class NoParams {}

class LanguageParams {
  final LocaleEntity entity;
  LanguageParams({
    required this.entity,
  });

  LanguageParams copyWith({
    LocaleEntity? entity,
  }) {
    return LanguageParams(
      entity: entity ?? this.entity,
    );
  }

  @override
  String toString() => 'LanguageParams(entity: $entity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LanguageParams && other.entity == entity;
  }

  @override
  int get hashCode => entity.hashCode;
}
