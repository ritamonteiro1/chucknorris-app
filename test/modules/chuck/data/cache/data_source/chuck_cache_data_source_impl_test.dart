/*

EM ANDAMENTO

 */

// import 'package:chuck_norris_app/modules/chuck/data/cache/data_source/chuck_cache_data_source_impl.dart';
// import 'package:chuck_norris_app/modules/chuck/data/cache/model/chuck_category_cm.dart';
// import 'package:chuck_norris_app/modules/chuck/domain/model/category/chuck_category_model.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:hive/hive.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import 'chuck_cache_data_source_impl_test.mocks.dart';
//
// @GenerateMocks([HiveInterface, Box])
// void main() {
//   late MockHiveInterface mockHiveInterface;
//   late MockBox mockBox;
//   late ChuckCacheDataSourceImpl chuckCacheDataSourceImpl;
//   setUpAll(() {
//     mockHiveInterface = MockHiveInterface();
//     mockBox = MockBox();
//     chuckCacheDataSourceImpl =
//         ChuckCacheDataSourceImpl(hive: mockHiveInterface);
//   });
//   setUp(() {
//     reset(mockBox);
//     reset(mockHiveInterface);
//   });
//   group('GIVEN a call on getChuckCategoryList', () {
//     test('THEN verify if openBox is called', () async {
//       when(mockHiveInterface.openBox(any)).thenAnswer((_) async => mockBox);
//       when(mockBox.get(any))
//           .thenAnswer((_) async => _getSuccessfulChuckCategoryCMListMock());
//       await chuckCacheDataSourceImpl.getChuckCategoryList();
//       verify(mockHiveInterface.openBox(anyNamed('openBox')));
//       verify(mockBox.get(anyNamed('get')));
//     });
//   });
//   group('GIVEN a call on saveChuckCategoryList', () {
//     test('THEN verify if openBox is called', () async {
//       when(mockHiveInterface.openBox(any)).thenAnswer((_) async => mockBox);
//       when(mockBox.putAll(any)).thenAnswer((_) async => Null);
//       await chuckCacheDataSourceImpl
//           .saveChuckCategoryList(_getSuccessfulChuckCategoryModelListMock());
//       verify(mockHiveInterface.openBox(anyNamed('openBox')));
//       verify(mockBox.putAll(anyNamed('get')));
//     });
//   });
// }
//
// List<ChuckCategoryModel> _getSuccessfulChuckCategoryModelListMock() =>
//     <ChuckCategoryModel>[
//       ChuckCategoryModel('title 1'),
//       ChuckCategoryModel('title 2'),
//     ];
//
// List<ChuckCategoryCM> _getSuccessfulChuckCategoryCMListMock() =>
//     <ChuckCategoryCM>[
//       ChuckCategoryCM('title 1'),
//       ChuckCategoryCM('title 2'),
//     ];
