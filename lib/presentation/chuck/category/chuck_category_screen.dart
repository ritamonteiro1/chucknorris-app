import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../constants/constant_images.dart';

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
                child: Image.asset(
                  ConstantImages.logoIoasys,
                ),
              ),
              Text(
                S.of(context).chuckCategoryScreenAppBarTitle,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/random-joke'),
                child: Card(
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      S.of(context).chuckCategoryScreenGenerateRandomJokeText,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
