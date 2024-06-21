import 'package:arch_app/feature/business/feature_business.dart';
import 'package:arch_app/feature/controller/feature_controller.dart';
import 'package:arch_app/feature/repository/feature_repository.dart';
import 'package:arch_app/feature/service/feature_service.dart';
import 'package:get/get.dart';

class FeatureBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeatureService>(() => FeatureServiceImpl());
    Get.lazyPut<FeatureRepository>(() => FeatureRepositoryImpl());
    Get.lazyPut<FeatureBusiness>(
      () => FeatureBusinessImpl(service: Get.find<FeatureService>()),
    );
    Get.put(FeatureController(business: Get.find<FeatureBusiness>()));
  }
}
