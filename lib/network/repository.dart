import 'package:flutter_mvvm/network/api_handler.dart';
import 'package:flutter_mvvm/sharedpref/shared_prefrenses.dart';

class BaseRepository {
  final SharedPreferencesHelper _helper;
  final APIHandler _handler;

  BaseRepository(this._handler, this._helper);

  APIHandler get handler => _handler;

  SharedPreferencesHelper get helper => _helper;
}
