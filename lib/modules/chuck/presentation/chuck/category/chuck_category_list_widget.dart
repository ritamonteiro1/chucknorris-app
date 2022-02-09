import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../constants/constant_joke_routes.dart';
import '../../../domain/model/category/chuck_category_model.dart';

class ChuckCategoryListWidget extends StatelessWidget {
  const ChuckCategoryListWidget({
    required this.chuckCategoryList,
    Key? key,
  }) : super(key: key);
  final List<ChuckCategoryModel> chuckCategoryList;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: chuckCategoryList.length,
        itemBuilder: (context, index) {
          final chuckCategory = chuckCategoryList[index];
          return ListTile(
            onTap: () => Modular.to.pushNamed(
                '${ConstantChuckRoutes.chuckCategoryJokeScreen}${chuckCategory.title}'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            title: Text(chuckCategory.title),
          );
        },
      );
}
