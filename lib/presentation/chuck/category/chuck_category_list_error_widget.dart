import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class ChuckCategoryListErrorWidget extends StatelessWidget {
  const ChuckCategoryListErrorWidget({
    required this.message,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final String message;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(message),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: onPressed,
                child: Text(S.of(context).messageTryAgain)),
          ],
        ),
      );
}
