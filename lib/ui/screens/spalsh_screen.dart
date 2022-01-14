import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mvvm/ui/base_stateless_widget.dart';
import 'package:flutter_mvvm/widgets/empty_app_bar_widget.dart';

import '../../stores/error_store.dart';

class SplashScreen extends BaseStatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final ErrorStore _errorStore = ErrorStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      children: [
        Observer(
          builder: (context) {
            return Center(
              child: Text(_errorStore.error),
            );
          },
        ),
        Center(
          child: ElevatedButton(
              child: const Text("Click"),
              onPressed: () {
                _errorStore.setError("Muhammed");
              }),
        ),
      ],
    );
  }
}
