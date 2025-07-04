import '../../data/venders/venders_model.dart';

abstract class VendorRepository {
  Future<List<Datum>> getVendors();
}