
import 'package:getx_flutter/model/democodemodel.dart';
import 'package:getx_flutter/model/demomodel.dart';

import '../config/serveraddress.dart';
import '../domain/entities/Restapi.dart';
import '../domain/entities/app_exceptions.dart';

class Provider {
  /// dropdown list
  Future<List<DemoModel>> getDemodetails() async {
    try {
      print("Loading from api");
      var res = await RestAPI().get(ServerAddresses.dropdownlist);

      print(res);
      return demoModelFromMap(res);
    } on RestException catch (e) {
      throw e.message;
    }
  }

  /// dropdownmenulist
  Future <DemoCodeModel> getDemocodedetails(values) async {
    try {
      print("Loading from api");
      var res = await RestAPI().get("https://www.gssskhokhar.com/api/classes/$values/");

      print(res);
      return demoCodeModelFromMap(res);
    } on RestException catch (e) {
      throw e.message;
    }
  }
}
