import 'package:arch_app/feature/service/feature_service.dart';
import 'package:arch_app/utils/exception.dart';

part 'feature_business_impl.dart';

abstract interface class FeatureBusiness {
  /// Busca um número aleatório
  Future<int> getNumber();
}
