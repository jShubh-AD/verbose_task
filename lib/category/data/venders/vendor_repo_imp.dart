import 'package:verbose_task/category/data/venders/venders_datasource.dart';
import 'package:verbose_task/category/data/venders/venders_model.dart';
import 'package:verbose_task/category/domain/vendors/vendor_repo.dart';

class VendorRepoImp extends VendorRepository {
  @override
  Future<List<Datum>> getVendors() async{
    return  await VendorDatasource().getVendors();
  }
}