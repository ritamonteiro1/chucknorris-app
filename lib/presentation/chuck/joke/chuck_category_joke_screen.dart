import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../constants/constant_images.dart';
import '../../../data/remote/data_source/chuck_remote_data_source.dart';
import '../../../data/remote/data_source/chuck_remote_data_source_impl.dart';
import '../../../domain/repository/chuck_repository.dart';
import '../../../domain/repository/chuck_repository_impl.dart';
import '../../../domain/use_case/get_chuck_category_joke_use_case.dart';
import '../../../domain/use_case/get_chuck_category_joke_use_case_impl.dart';
import '../../../generated/l10n.dart';

class ChuckCategoryJokeScreen extends StatefulWidget {
  const ChuckCategoryJokeScreen({Key? key}) : super(key: key);

  @override
  _ChuckCategoryJokeScreenState createState() =>
      _ChuckCategoryJokeScreenState();
}

class _ChuckCategoryJokeScreenState extends State<ChuckCategoryJokeScreen> {
  late ChuckRemoteDataSource chuckRemoteDataSource;
  late ChuckRepository chuckRepository;
  late GetChuckCategoryJokeUseCase getChuckCategoryJokeUseCase;

  @override
  void initState() {
    super.initState();
    chuckRemoteDataSource = ChuckRemoteDataSourceImpl(Dio());
    chuckRepository = ChuckRepositoryImpl(chuckRemoteDataSource);
    getChuckCategoryJokeUseCase =
        GetChuckCategoryJokeUseCaseImpl(chuckRepository);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Image.asset(
                  ConstantImages.logoIoasys,
                ),
              ),
              Expanded(
                child: Text(
                  S.of(context).chuckCategoryJokeScreenAppBarTitle,
                ),
              ),
            ],
          ),
        ),
        body: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/random-joke'),
          child: Card(
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                S.of(context).chuckCategoryJokeScreenGenerateRandomJokeText,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
}
