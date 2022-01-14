import 'package:flutter_mvvm/network/repository.dart';
import 'package:flutter_mvvm/sharedpref/shared_prefrenses.dart';

import '../api_handler.dart';

class PreLoginRepository extends BaseRepository {
  PreLoginRepository(
      APIHandler _handler, SharedPreferencesHelper preferencesHelper)
      : super(_handler, preferencesHelper);
}
