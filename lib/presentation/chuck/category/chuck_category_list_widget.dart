import 'package:chuck_norris_app/domain/model/category/chuck_category_model.dart';
import 'package:flutter/material.dart';

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
            onTap: () {},
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            title: Text(chuckCategory.title),
          );
        },
      );
}
