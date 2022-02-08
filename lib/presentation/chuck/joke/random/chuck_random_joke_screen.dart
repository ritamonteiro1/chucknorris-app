import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../constants/constant_images.dart';
import '../../../../data/remote/data_source/chuck_remote_data_source.dart';
import '../../../../data/remote/data_source/chuck_remote_data_source_impl.dart';
import '../../../../domain/exception/generic_error_status_code_exception.dart';
import '../../../../domain/exception/unknown_state_type_exception.dart';
import '../../../../domain/repository/chuck_repository.dart';
import '../../../../domain/repository/chuck_repository_impl.dart';
import '../../../../domain/use_case/get_chuck_random_joke_use_case.dart';
import '../../../../domain/use_case/get_chuck_random_joke_use_case_impl.dart';
import '../../../../generated/l10n.dart';
import '../../../common/error_chuck_widget.dart';
import '../../../common/loading_chuck_widget.dart';
import '../common/chuck_joke_widget.dart';
import 'chuck_random_joke_state.dart';
import 'chuck_random_joke_store.dart';

class ChuckRandomJokeScreen extends StatefulWidget {
  const ChuckRandomJokeScreen({Key? key}) : super(key: key);

  @override
  _ChuckRandomJokeScreenState createState() => _ChuckRandomJokeScreenState();
}

class _ChuckRandomJokeScreenState extends State<ChuckRandomJokeScreen> {
  late ChuckRemoteDataSource chuckRemoteDataSource;
  late ChuckRepository chuckRepository;
  late GetChuckRandomJokeUseCase getChuckRandomJokeUseCase;
  late ChuckRandomJokeStore chuckRandomJokeStore;

  @override
  void initState() {
    super.initState();
    chuckRemoteDataSource = ChuckRemoteDataSourceImpl(Dio());
    chuckRepository = ChuckRepositoryImpl(chuckRemoteDataSource);
    getChuckRandomJokeUseCase = GetChuckRandomJokeUseCaseImpl(chuckRepository);
    chuckRandomJokeStore = ChuckRandomJokeStore(getChuckRandomJokeUseCase);
    chuckRandomJokeStore.getChuckRandomJoke();
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
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(6),
            child: Observer(
              builder: (context) {
                final chuckRandomJokeState =
                    chuckRandomJokeStore.chuckRandomJokeState;
                if (chuckRandomJokeState is LoadingChuckRandomJokeState) {
                  return const LoadingChuckWidget();
                } else if (chuckRandomJokeState
                    is SuccessChuckRandomJokeState) {
                  return ChuckJokeWidget(
                      chuckJokeModel: chuckRandomJokeState.joke);
                } else if (chuckRandomJokeState is ErrorChuckRandomJokeState) {
                  if (chuckRandomJokeState.exception
                      is GenericErrorStatusCodeException) {
                    return ErrorChuckWidget(
                      onPressed: () =>
                          chuckRandomJokeStore.getChuckRandomJoke(),
                      message: S.of(context).messageGenericErrorText,
                    );
                  } else {
                    return ErrorChuckWidget(
                      onPressed: () =>
                          chuckRandomJokeStore.getChuckRandomJoke(),
                      message: S.of(context).messageConnectionFailText,
                    );
                  }
                } else {
                  throw UnknownStateTypeException();
                }
              },
            ),
          ),
        ),
      );
}
