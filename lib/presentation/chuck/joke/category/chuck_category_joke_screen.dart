import 'package:chuck_norris_app/domain/exception/generic_error_status_code_exception.dart';
import 'package:chuck_norris_app/presentation/common/error_chuck_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../constants/constant_images.dart';
import '../../../../data/remote/data_source/chuck_remote_data_source.dart';
import '../../../../data/remote/data_source/chuck_remote_data_source_impl.dart';
import '../../../../domain/exception/unknown_state_type_exception.dart';
import '../../../../domain/repository/chuck_repository.dart';
import '../../../../domain/repository/chuck_repository_impl.dart';
import '../../../../domain/use_case/get_chuck_category_joke_use_case.dart';
import '../../../../domain/use_case/get_chuck_category_joke_use_case_impl.dart';
import '../../../../generated/l10n.dart';
import '../../../common/loading_chuck_widget.dart';
import '../common/chuck_joke_widget.dart';
import '../random/chuck_random_joke_screen.dart';
import 'chuck_category_joke_state.dart';
import 'chuck_category_joke_store.dart';

class ChuckCategoryJokeScreen extends StatefulWidget {
  const ChuckCategoryJokeScreen({
    required this.chuckCategory,
    Key? key,
  }) : super(key: key);
  final String chuckCategory;

  @override
  _ChuckCategoryJokeScreenState createState() =>
      _ChuckCategoryJokeScreenState();
}

class _ChuckCategoryJokeScreenState extends State<ChuckCategoryJokeScreen> {
  late ChuckRemoteDataSource chuckRemoteDataSource;
  late ChuckRepository chuckRepository;
  late GetChuckCategoryJokeUseCase getChuckCategoryJokeUseCase;
  late ChuckCategoryJokeStore chuckCategoryJokeStore;

  @override
  void initState() {
    super.initState();
    chuckRemoteDataSource = ChuckRemoteDataSourceImpl(Dio());
    chuckRepository = ChuckRepositoryImpl(chuckRemoteDataSource);
    getChuckCategoryJokeUseCase =
        GetChuckCategoryJokeUseCaseImpl(chuckRepository);
    chuckCategoryJokeStore =
        ChuckCategoryJokeStore(getChuckCategoryJokeUseCase);
    chuckCategoryJokeStore.getChuckCategoryJoke(category: widget.chuckCategory);
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
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ChuckRandomJokeScreen(),
                      ),
                    ),
                    child: Card(
                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S
                                  .of(context)
                                  .chuckCategoryJokeScreenGenerateRandomJokeText,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Observer(builder: (context) {
                    final chuckCategoryJokeState =
                        chuckCategoryJokeStore.chuckCategoryJokeState;
                    if (chuckCategoryJokeState
                        is LoadingChuckCategoryJokeState) {
                      return const LoadingChuckWidget();
                    } else if (chuckCategoryJokeState
                        is SuccessChuckCategoryJokeState) {
                      return ChuckJokeWidget(
                          chuckJokeModel: chuckCategoryJokeState.joke);
                    } else if (chuckCategoryJokeState
                        is ErrorChuckCategoryJokeState) {
                      if (chuckCategoryJokeState.exception
                          is GenericErrorStatusCodeException) {
                        return ErrorChuckWidget(
                          onPressed: () =>
                              chuckCategoryJokeStore.getChuckCategoryJoke(
                                  category: widget.chuckCategory),
                          message: S.of(context).messageGenericErrorText,
                        );
                      } else {
                        return ErrorChuckWidget(
                          onPressed: () =>
                              chuckCategoryJokeStore.getChuckCategoryJoke(
                                  category: widget.chuckCategory),
                          message: S.of(context).messageConnectionFailText,
                        );
                      }
                    } else {
                      throw UnknownStateTypeException();
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      );
}
