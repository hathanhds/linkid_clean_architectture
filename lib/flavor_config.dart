import 'package:flutter/material.dart';

enum Flavor { dev, stag, prod }

class FlavorValues {
  final String baseUrl;
  FlavorValues({required this.baseUrl});
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;
  static late FlavorConfig _instance;

  factory FlavorConfig(
      {required Flavor flavor,
      Color color = Colors.blue,
      required FlavorValues values}) {
    _instance =
        FlavorConfig._internal(flavor, flavor.toString(), color, values);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);
  static FlavorConfig get instance {
    return _instance;
  }

  static bool isDev() => _instance.flavor == Flavor.dev;
  static bool isStag() => _instance.flavor == Flavor.dev;
  static bool isProd() => _instance.flavor == Flavor.prod;
}

void setUpDevEnv() {
  FlavorConfig(
      flavor: Flavor.dev,
      color: Colors.red,
      values: FlavorValues(baseUrl: 'dev.url'));
}

void setUpStagEnv() {
  FlavorConfig(
      flavor: Flavor.stag,
      color: Colors.green,
      values: FlavorValues(baseUrl: 'dev.stag'));
}

void setUpProdEnv() {
  FlavorConfig(
      flavor: Flavor.prod,
      color: Colors.orange,
      values: FlavorValues(baseUrl: 'dev.prod'));
}
