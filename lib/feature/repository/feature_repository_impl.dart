part of 'feature_repository.dart';

class FeatureRepositoryImpl implements FeatureRepository {
  @override
  Future<ReturnData<int>> getNumber() async {
    try {
      await Future.delayed(const Duration(seconds: 3));

      final number = Random().nextInt(100);

      return ReturnData(
        true,
        data: number,
        message: number.toString(),
      );
    } catch (e) {
      return ReturnData(false, message: e.toString());
    }
  }
}
