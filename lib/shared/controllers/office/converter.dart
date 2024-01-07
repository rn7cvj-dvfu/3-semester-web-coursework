import 'package:chopper/chopper.dart';
import 'package:web_susch/shared/controllers/airports/service.dart';
import 'package:web_susch/shared/controllers/office/service.dart';
import 'package:web_susch/shared/models/airport.dart';
import 'package:web_susch/shared/models/office.dart';

class OfficeConverter {
  final OfficeService _officeService;

  OfficeConverter({required OfficeService officeService})
      : _officeService = officeService;

  Future<List<Office>?> getOffices() async {
    Response response;

    try {
      response = await _officeService.getOffices();
    } catch (e) {
      return null;
    }

    if (response.isSuccessful) {
      List<dynamic> data = response.body;

      List<Office> offices = data.map((e) => Office.fromJson(e)).toList();

      return offices;
    }

    return null;
  }
}
