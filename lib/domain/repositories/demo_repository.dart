import 'package:getx_flutter/model/democodemodel.dart';

import '../../datasources/provider.dart';
import '../../model/demomodel.dart';

class Repository {
  Provider startScreenProviders = Provider();

  Future <List<DemoModel>> getDemodetails() =>
      startScreenProviders.getDemodetails();

  Future <DemoCodeModel> getDemocodedetails(values) =>
      startScreenProviders.getDemocodedetails(values);
}
