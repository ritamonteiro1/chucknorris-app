import '../../../constants/constant_images.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';

class ChuckRandomJokeScreen extends StatefulWidget {
  const ChuckRandomJokeScreen({Key? key}) : super(key: key);

  @override
  _ChuckRandomJokeScreenState createState() => _ChuckRandomJokeScreenState();
}

class _ChuckRandomJokeScreenState extends State<ChuckRandomJokeScreen> {
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
