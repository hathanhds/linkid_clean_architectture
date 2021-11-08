import 'package:flutter/material.dart';
import 'package:linkid_clean_architecture/app.dart';
import 'package:linkid_clean_architecture/flavor_config.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.prod,
      color: Colors.red,
      values: FlavorValues(baseUrl: 'prod.url'));
  runApp(const MyApp());
}
