// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chuck_category_joke_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChuckCategoryJokeStore on _ChuckCategoryJokeStore, Store {
  final _$chuckCategoryJokeStateAtom =
      Atom(name: '_ChuckCategoryJokeStore.chuckCategoryJokeState');

  @override
  ChuckCategoryJokeState get chuckCategoryJokeState {
    _$chuckCategoryJokeStateAtom.reportRead();
    return super.chuckCategoryJokeState;
  }

  @override
  set chuckCategoryJokeState(ChuckCategoryJokeState value) {
    _$chuckCategoryJokeStateAtom
        .reportWrite(value, super.chuckCategoryJokeState, () {
      super.chuckCategoryJokeState = value;
    });
  }

  final _$getChuckCategoryJokeAsyncAction =
      AsyncAction('_ChuckCategoryJokeStore.getChuckCategoryJoke');

  @override
  Future<void> getChuckCategoryJoke({required String category}) {
    return _$getChuckCategoryJokeAsyncAction
        .run(() => super.getChuckCategoryJoke(category: category));
  }

  @override
  String toString() {
    return '''
chuckCategoryJokeState: ${chuckCategoryJokeState}
    ''';
  }
}
