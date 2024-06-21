import 'dart:math';

import 'package:arch_app/utils/return_data.dart';

part 'feature_repository_impl.dart';

abstract interface class FeatureRepository {
  /// Busca um número aleatório
  Future<ReturnData<int>> getNumber();
}
