import 'package:chuck_norris_app/constants/constant_colors.dart';
import 'package:flutter/material.dart';

class LoadingChuckWidget extends StatelessWidget {
  const LoadingChuckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const CircularProgressIndicator(
        color: ConstantColor.primaryColor,
      );
}
