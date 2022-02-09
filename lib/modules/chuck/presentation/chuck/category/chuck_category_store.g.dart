// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chuck_category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChuckCategoryStore on _ChuckCategoryStore, Store {
  final _$chuckCategoryStateAtom =
      Atom(name: '_ChuckCategoryStore.chuckCategoryState');

  @override
  ChuckCategoryState get chuckCategoryState {
    _$chuckCategoryStateAtom.reportRead();
    return super.chuckCategoryState;
  }

  @override
  set chuckCategoryState(ChuckCategoryState value) {
    _$chuckCategoryStateAtom.reportWrite(value, super.chuckCategoryState, () {
      super.chuckCategoryState = value;
    });
  }

  final _$getChuckCategoryListAsyncAction =
      AsyncAction('_ChuckCategoryStore.getChuckCategoryList');

  @override
  Future<void> getChuckCategoryList() {
    return _$getChuckCategoryListAsyncAction
        .run(() => super.getChuckCategoryList());
  }

  @override
  String toString() {
    return '''
chuckCategoryState: ${chuckCategoryState}
    ''';
  }
}
