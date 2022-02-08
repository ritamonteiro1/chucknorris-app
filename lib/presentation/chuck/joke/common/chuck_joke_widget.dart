import 'package:flutter/material.dart';

import '../../../../domain/model/joke/chuck_joke_model.dart';

class ChuckJokeWidget extends StatelessWidget {
  const ChuckJokeWidget({
    required this.chuckJokeModel,
    Key? key,
  }) : super(key: key);
  final ChuckJokeModel chuckJokeModel;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: Image.network(chuckJokeModel.iconUrl),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(
              chuckJokeModel.joke,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );
}
