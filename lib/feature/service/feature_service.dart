import 'dart:math';

import 'package:arch_app/utils/return_data.dart';
import 'package:arch_app/utils/v_service.dart';

part 'feature_service_impl.dart';

abstract interface class FeatureService {
  /// Busca um número aleatório
  Future<ReturnData<int>> getNumber();
}
