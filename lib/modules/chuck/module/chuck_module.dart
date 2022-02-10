import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../constants/constant_chuck_routes.dart';
import '../data/remote/data_source/chuck_remote_data_source.dart';
import '../data/remote/data_source/chuck_remote_data_source_impl.dart';
import '../domain/repository/chuck_repository.dart';
import '../domain/repository/chuck_repository_impl.dart';
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
        Bind.lazySingleton<ChuckRemoteDataSource>(
            (i) => ChuckRemoteDataSourceImpl(i())),
        Bind.lazySingleton<ChuckRepository>((i) => ChuckRepositoryImpl(i())),
        Bind.lazySingleton<GetChuckCategoryListUseCase>(
            (i) => GetChuckCategoryListUseCaseImpl(i())),
        Bind.lazySingleton<GetChuckCategoryJokeUseCase>(
            (i) => GetChuckCategoryJokeUseCaseImpl(i())),
        Bind.lazySingleton<GetChuckRandomJokeUseCase>(
            (i) => GetChuckRandomJokeUseCaseImpl(i())),
        Bind.factory((i) => ChuckCategoryStore(i())),
        Bind.factory((i) => ChuckRandomJokeStore(i())),
        Bind.factory((i) => ChuckCategoryJokeStore(i())),
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
