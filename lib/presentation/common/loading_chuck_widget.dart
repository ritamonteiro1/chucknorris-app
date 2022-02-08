import '../../constants/constant_colors.dart';
import 'package:flutter/material.dart';

class LoadingChuckWidget extends StatelessWidget {
  const LoadingChuckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(
          color: ConstantColor.primaryColor,
        ),
      );
}
