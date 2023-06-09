import 'package:get_storage/get_storage.dart';
import 'package:gluon_erp/models/filters/company_model.dart';

final GetStorage box = GetStorage();
String authToken = "";
int? userId;

List<FilterModel> companyList = [];
List<FilterModel> stationList = [];
List<FilterModel> formList = [];
List<FilterModel> costCenterList = [];
