import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../constants/constant_images.dart';
import '../../../data/remote/data_source/chuck_remote_data_source.dart';
import '../../../data/remote/data_source/chuck_remote_data_source_impl.dart';
import '../../../domain/exception/generic_error_status_code_exception.dart';
import '../../../domain/exception/unknown_state_type_exception.dart';
import '../../../domain/repository/chuck_repository.dart';
import '../../../domain/repository/chuck_repository_impl.dart';
import '../../../domain/use_case/get_chuck_category_list_use_case.dart';
import '../../../domain/use_case/get_chuck_category_list_use_case_impl.dart';
import '../../../generated/l10n.dart';
import '../../common/loading_chuck_widget.dart';
import '../../common/error_chuck_widget.dart';
import 'chuck_category_list_widget.dart';
import 'chuck_category_state.dart';
import 'chuck_category_store.dart';

class ChuckCategoryScreen extends StatefulWidget {
  const ChuckCategoryScreen({Key? key}) : super(key: key);

  @override
  _ChuckCategoryScreenState createState() => _ChuckCategoryScreenState();
}

class _ChuckCategoryScreenState extends State<ChuckCategoryScreen> {
  late ChuckRemoteDataSource chuckRemoteDataSource;
  late ChuckRepository chuckRepository;
  late GetChuckCategoryListUseCase getChuckCategoryListUseCase;
  late ChuckCategoryStore chuckCategoryStore;

  @override
  void initState() {
    super.initState();
    chuckRemoteDataSource = ChuckRemoteDataSourceImpl(Dio());
    chuckRepository = ChuckRepositoryImpl(chuckRemoteDataSource);
    getChuckCategoryListUseCase =
        GetChuckCategoryListUseCaseImpl(chuckRepository);
    chuckCategoryStore = ChuckCategoryStore(getChuckCategoryListUseCase);
    chuckCategoryStore.getChuckCategoryList();
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
                S.of(context).chuckCategoryScreenAppBarTitle,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(6),
        child: Observer(builder: (context) {
          final chuckCategoryState = chuckCategoryStore.chuckCategoryState;
          if (chuckCategoryState is LoadingChuckCategoryState) {
            return const LoadingChuckWidget();
          } else if (chuckCategoryState is SuccessChuckCategoryState) {
            return ChuckCategoryListWidget(
                chuckCategoryList: chuckCategoryState.categoryList);
          } else if (chuckCategoryState is ErrorChuckCategoryState) {
            if (chuckCategoryState.exception
                is GenericErrorStatusCodeException) {
              return ErrorChuckWidget(
                onPressed: () => chuckCategoryStore.getChuckCategoryList(),
                message: S.of(context).messageGenericErrorText,
              );
            } else {
              return ErrorChuckWidget(
                onPressed: () => chuckCategoryStore.getChuckCategoryList(),
                message: S.of(context).messageConnectionFailText,
              );
            }
          } else {
            throw UnknownStateTypeException();
          }
        }),
      ));
}
