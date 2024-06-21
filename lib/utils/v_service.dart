import 'package:arch_app/utils/vl_request.dart';

abstract class VService {
  final _vlRequest = VLRequest();
  final String? _companyPath;

  VService() : _companyPath = 'companyPath/';

  VLRequest get vlRequest => _vlRequest;
  String get companyPath => _companyPath ?? '';
}
