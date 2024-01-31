import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:web_susch/shared/controllers/airports/converter.dart';
import 'package:web_susch/shared/controllers/office/converter.dart';
import 'package:web_susch/shared/models/airport.dart';
import 'package:web_susch/shared/models/office.dart';
import 'package:web_susch/logger.dart';

part '../../../gen/shared/controllers/office/controller.g.dart';

class OfficeController = OfficeControllerBase with _$OfficeController;

abstract class OfficeControllerBase with Store {
  final OfficeConverter officeConverter;

  OfficeControllerBase({required this.officeConverter});

  @observable
  bool isLoading = false;

  List<Office> offices = [];

  @action
  Future<void> init() async {
    isLoading = true;

    List<Office>? response = await officeConverter.getOffices();

    if (response != null) {
      String prettyResponse =
          const JsonEncoder.withIndent('    ').convert(response);

      logger.i("Loaded Offices: $prettyResponse");

      offices = response;
    }

    isLoading = false;
  }
}
