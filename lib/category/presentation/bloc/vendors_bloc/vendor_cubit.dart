
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/vendors/vendor_useCase.dart';
import 'vendor_state.dart';

class VendorCubit extends Cubit<VendorState> {
  final VendorUseCase _useCase ;
  VendorCubit(this._useCase) : super(const VendorInitial());

  Future<void> getVendors() async {
    emit(const VendorLoading());
    try {
      final vendors = await _useCase.vendors();
      print('>> raw length  = ${vendors.length}');
      emit(VendorLoaded(vendors));
    } catch (e) {
      emit(VendorError(e.toString()));
    }
  }
}
