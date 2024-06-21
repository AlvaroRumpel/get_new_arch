import 'dart:developer';

import 'package:arch_app/feature/business/feature_business.dart';
import 'package:arch_app/feature/controller/feature_mixin.dart';
import 'package:get/get.dart';

class FeatureController extends SuperController with FeatureMixin {
  final FeatureBusiness _business;

  FeatureController({required FeatureBusiness business}) : _business = business;

  Future<void> getNumber() async {
    try {
      number = await _business.getNumber();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
