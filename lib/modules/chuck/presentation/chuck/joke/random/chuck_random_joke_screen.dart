import 'package:chuck_norris_app/constants/constant_images.dart';
import 'package:chuck_norris_app/generated/l10n.dart';
import 'package:chuck_norris_app/modules/chuck/presentation/chuck/common/error_chuck_widget.dart';
import 'package:chuck_norris_app/modules/chuck/presentation/chuck/common/loading_chuck_widget.dart';
import 'package:chuck_norris_app/modules/chuck/presentation/chuck/joke/random/chuck_random_joke_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../domain/exception/generic_error_status_code_exception.dart';
import '../../../../domain/exception/unknown_state_type_exception.dart';
import '../common/chuck_joke_widget.dart';
import 'chuck_random_joke_state.dart';

class ChuckRandomJokeScreen extends StatefulWidget {
  const ChuckRandomJokeScreen({Key? key}) : super(key: key);

  @override
  _ChuckRandomJokeScreenState createState() => _ChuckRandomJokeScreenState();
}

class _ChuckRandomJokeScreenState
    extends ModularState<ChuckRandomJokeScreen, ChuckRandomJokeStore> {
  @override
  void initState() {
    super.initState();
    controller.getChuckRandomJoke();
  }

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
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(6),
            child: Observer(
              builder: (context) {
                final chuckRandomJokeState = controller.chuckRandomJokeState;
                if (chuckRandomJokeState is LoadingChuckRandomJokeState) {
                  return const LoadingChuckWidget();
                } else if (chuckRandomJokeState
                    is SuccessChuckRandomJokeState) {
                  return ChuckJokeWidget(
                      chuckJokeModel: chuckRandomJokeState.joke);
                } else if (chuckRandomJokeState is ErrorChuckRandomJokeState) {
                  if (chuckRandomJokeState.exception
                      is GenericErrorStatusCodeException) {
                    return ErrorChuckWidget(
                      onPressed: () => controller.getChuckRandomJoke(),
                      message: S.of(context).messageGenericErrorText,
                    );
                  } else {
                    return ErrorChuckWidget(
                      onPressed: () => controller.getChuckRandomJoke(),
                      message: S.of(context).messageConnectionFailText,
                    );
                  }
                } else {
                  throw UnknownStateTypeException();
                }
              },
            ),
          ),
        ),
      );
}
