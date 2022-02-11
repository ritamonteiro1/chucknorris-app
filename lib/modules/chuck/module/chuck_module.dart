import 'package:chuck_norris_app/modules/chuck/data/cache/data_source/chuck_cache_data_source.dart';
import 'package:chuck_norris_app/modules/chuck/data/cache/data_source/chuck_cache_data_source_impl.dart';
import 'package:chuck_norris_app/modules/chuck/data/repository_impl/chuck_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import '../constants/constant_chuck_routes.dart';
import '../data/remote/data_source/chuck_remote_data_source.dart';
import '../data/remote/data_source/chuck_remote_data_source_impl.dart';
import '../domain/repository/chuck_repository.dart';
import '../domain/use_case/get_chuck_category_joke_use_case.dart';
import '../domain/use_case/get_chuck_category_joke_use_case_impl.dart';
import '../domain/use_case/get_chuck_category_list_use_case.dart';
import '../domain/use_case/get_chuck_category_list_use_case_impl.dart';
import '../domain/use_case/get_chuck_random_joke_use_case.dart';
import '../domain/use_case/get_chuck_random_joke_use_case_impl.dart';
import '../presentation/chuck/category/chuck_category_screen.dart';
import '../presentation/chuck/category/chuck_category_store.dart';
import '../presentation/chuck/joke/category/chuck_category_joke_screen.dart';
import '../presentation/chuck/joke/category/chuck_category_joke_store.dart';
import '../presentation/chuck/joke/random/chuck_random_joke_screen.dart';
import '../presentation/chuck/joke/random/chuck_random_joke_store.dart';

class ChuckModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => Dio()),
        Bind.lazySingleton((i) => Hive),
        Bind.lazySingleton<ChuckCacheDataSource>(
            (i) => ChuckCacheDataSourceImpl(hive: i())),
        Bind.lazySingleton<ChuckRemoteDataSource>(
            (i) => ChuckRemoteDataSourceImpl(dio: i())),
        Bind.lazySingleton<ChuckRepository>((i) => ChuckRepositoryImpl(
            chuckRemoteDataSource: i(), chuckCacheDataSource: i())),
        Bind.lazySingleton<GetChuckCategoryListUseCase>(
            (i) => GetChuckCategoryListUseCaseImpl(chuckRepository: i())),
        Bind.lazySingleton<GetChuckCategoryJokeUseCase>(
            (i) => GetChuckCategoryJokeUseCaseImpl(chuckRepository: i())),
        Bind.lazySingleton<GetChuckRandomJokeUseCase>(
            (i) => GetChuckRandomJokeUseCaseImpl(chuckRepository: i())),
        Bind.factory(
            (i) => ChuckCategoryStore(getChuckCategoryListUseCase: i())),
        Bind.factory(
            (i) => ChuckRandomJokeStore(getChuckRandomJokeUseCase: i())),
        Bind.factory(
            (i) => ChuckCategoryJokeStore(getChuckCategoryJokeUseCase: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(ConstantChuckRoutes.initialScreen,
            child: (context, args) => const ChuckCategoryScreen()),
        ChildRoute('${ConstantChuckRoutes.chuckCategoryJokeScreen}:name',
            child: (context, args) =>
                ChuckCategoryJokeScreen(chuckCategory: args.params['name'])),
        ChildRoute(ConstantChuckRoutes.chuckRandomJokeScreen,
            child: (context, args) => const ChuckRandomJokeScreen()),
      ];
}
