import 'package:mobx/mobx.dart';

part 'error_store.g.dart';

// This is the class used by rest of your codebase
class ErrorStore = _ErrorStore with _$ErrorStore;

abstract class _ErrorStore with Store {
  @observable
  String error = "Test";

  @action
  setError(String error) {
    this.error = error;
  }
}
