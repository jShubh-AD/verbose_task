import 'package:verbose_task/category/data/venders/venders_model.dart';
import 'package:verbose_task/category/data/venders/vendor_repo_imp.dart';
import 'package:verbose_task/category/domain/vendors/vendor_repo.dart';

class VendorUseCase {
  final VendorRepository repo =VendorRepoImp();

  Future<List<Datum>> vendors() async{
    List<Datum> vendor = await repo.getVendors();
    return vendor;
  }
}