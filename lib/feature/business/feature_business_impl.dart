part of 'feature_business.dart';

class FeatureBusinessImpl implements FeatureBusiness {
  final FeatureService _service;

  const FeatureBusinessImpl({required FeatureService service})
      : _service = service;

  @override
  Future<int> getNumber() async {
    final result = await _service.getNumber();

    if (!result.success || result.data == null) {
      throw BussinessException(
          result.message ?? 'Não foi possivel buscar o número');
    }

    return result.data!;
  }
}
