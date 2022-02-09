// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chuck_random_joke_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChuckRandomJokeStore on _ChuckRandomJokeStore, Store {
  final _$chuckRandomJokeStateAtom =
      Atom(name: '_ChuckRandomJokeStore.chuckRandomJokeState');

  @override
  ChuckRandomJokeState get chuckRandomJokeState {
    _$chuckRandomJokeStateAtom.reportRead();
    return super.chuckRandomJokeState;
  }

  @override
  set chuckRandomJokeState(ChuckRandomJokeState value) {
    _$chuckRandomJokeStateAtom.reportWrite(value, super.chuckRandomJokeState,
        () {
      super.chuckRandomJokeState = value;
    });
  }

  final _$getChuckRandomJokeAsyncAction =
      AsyncAction('_ChuckRandomJokeStore.getChuckRandomJoke');

  @override
  Future<void> getChuckRandomJoke() {
    return _$getChuckRandomJokeAsyncAction
        .run(() => super.getChuckRandomJoke());
  }

  @override
  String toString() {
    return '''
chuckRandomJokeState: ${chuckRandomJokeState}
    ''';
  }
}
