
import 'package:equatable/equatable.dart';
import '../../../data/venders/venders_model.dart';

/// Base class – all vendor states extend this.
abstract class VendorState extends Equatable {
  const VendorState();

  @override
  List<Object?> get props => [];
}

/// Fresh page load – nothing fetched yet.
class VendorInitial extends VendorState {
  const VendorInitial();
}

/// API call in progress (show spinner).
class VendorLoading extends VendorState {
  const VendorLoading();
}

/// Successfully retrieved vendors from the API.
class VendorLoaded extends VendorState {
  final List<Datum> vendors;

  const VendorLoaded(this.vendors);

  @override
  List<Object?> get props => [vendors];
}

/// Something went wrong (network error, parsing failure, etc.).
class VendorError extends VendorState {
  final String message;

  const VendorError(this.message);

  @override
  List<Object?> get props => [message];
}
