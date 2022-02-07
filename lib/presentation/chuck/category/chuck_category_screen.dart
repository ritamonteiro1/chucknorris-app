import 'package:chuck_norris_app/generated/l10n.dart';

import '../../../constants/constant_images.dart';
import 'package:flutter/material.dart';

class ChuckCategoryScreen extends StatefulWidget {
  const ChuckCategoryScreen({Key? key}) : super(key: key);

  @override
  _ChuckCategoryScreenState createState() => _ChuckCategoryScreenState();
}

class _ChuckCategoryScreenState extends State<ChuckCategoryScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Image.asset(ConstantImages.logoIoasys),
              ),
              Text(S.of(context).chuckCategoryScreenAppBarTitle),
            ],
          ),
        ),
        body: Container(),
      );
}
