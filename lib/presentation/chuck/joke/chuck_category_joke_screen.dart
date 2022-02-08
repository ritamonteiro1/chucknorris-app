import 'package:flutter/material.dart';

import '../../../constants/constant_images.dart';
import '../../../generated/l10n.dart';

class ChuckCategoryJokeScreen extends StatefulWidget {
  const ChuckCategoryJokeScreen({Key? key}) : super(key: key);

  @override
  _ChuckCategoryJokeScreenState createState() =>
      _ChuckCategoryJokeScreenState();
}

class _ChuckCategoryJokeScreenState extends State<ChuckCategoryJokeScreen> {
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
              Text(
                S.of(context).chuckCategoryJokeScreenAppBarTitle,
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
