import 'package:chuck_norris_app/data/remote/data_source/chuck_remote_data_source.dart';
import 'package:chuck_norris_app/data/remote/data_source/chuck_remote_data_source_impl.dart';
import 'package:chuck_norris_app/domain/repository/chuck_repository.dart';
import 'package:chuck_norris_app/domain/repository/chuck_repository_impl.dart';
import 'package:chuck_norris_app/domain/use_case/get_chuck_random_joke_use_case.dart';
import 'package:chuck_norris_app/domain/use_case/get_chuck_random_joke_use_case_impl.dart';
import 'package:dio/dio.dart';

import '../../../constants/constant_images.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';

class ChuckRandomJokeScreen extends StatefulWidget {
  const ChuckRandomJokeScreen({Key? key}) : super(key: key);

  @override
  _ChuckRandomJokeScreenState createState() => _ChuckRandomJokeScreenState();
}

class _ChuckRandomJokeScreenState extends State<ChuckRandomJokeScreen> {
  late ChuckRemoteDataSource chuckRemoteDataSource;
  late ChuckRepository chuckRepository;
  late GetChuckRandomJokeUseCase getChuckRandomJokeUseCase;

  @override
  void initState() {
    super.initState();
    chuckRemoteDataSource = ChuckRemoteDataSourceImpl(Dio());
    chuckRepository = ChuckRepositoryImpl(chuckRemoteDataSource);
    getChuckRandomJokeUseCase = GetChuckRandomJokeUseCaseImpl(chuckRepository);
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
                  S.of(context).chuckRandomJokeScreenAppBarTitle,
                ),
              ),
            ],
          ),
        ),
      );
}
