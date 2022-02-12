import 'package:flutter/material.dart';

import '../../../../../constants/constant_colors.dart';

class LoadingChuckWidget extends StatelessWidget {
  const LoadingChuckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const CircularProgressIndicator(
        color: ConstantColor.primaryColor,
      );
}
