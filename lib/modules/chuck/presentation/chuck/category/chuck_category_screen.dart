import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../constants/constant_images.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/exception/generic_error_status_code_exception.dart';
import '../../../domain/exception/unknown_state_type_exception.dart';
import '../common/error_chuck_widget.dart';
import '../common/loading_chuck_widget.dart';
import 'chuck_category_controller.dart';
import 'chuck_category_list_widget.dart';
import 'chuck_category_state.dart';
import 'chuck_category_store.dart';

class ChuckCategoryScreen extends StatefulWidget {
  const ChuckCategoryScreen({Key? key}) : super(key: key);

  @override
  _ChuckCategoryScreenState createState() => _ChuckCategoryScreenState();
}

class _ChuckCategoryScreenState
    extends ModularState<ChuckCategoryScreen, ChuckCategoryStore> {
  @override
  void initState() {
    super.initState();
    controller.getChuckCategoryList();
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
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(6),
          child: Observer(builder: (context) {
            final chuckCategoryState = controller.chuckCategoryState;
            if (chuckCategoryState is LoadingChuckCategoryState) {
              return const LoadingChuckWidget();
            } else if (chuckCategoryState is SuccessChuckCategoryState) {
              return ChuckCategoryListWidget(
                  chuckCategoryList: chuckCategoryState.categoryList);
            } else if (chuckCategoryState is ErrorChuckCategoryState) {
              if (chuckCategoryState.exception
                  is GenericErrorStatusCodeException) {
                return ErrorChuckWidget(
                  onPressed: controller.getChuckCategoryList,
                  message: S.of(context).messageGenericErrorText,
                );
              } else {
                return ErrorChuckWidget(
                  onPressed: controller.getChuckCategoryList,
                  message: S.of(context).messageConnectionFailText,
                );
              }
            } else {
              throw UnknownStateTypeException();
            }
          }),
        ),
      ));
}
