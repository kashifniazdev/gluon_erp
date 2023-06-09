import 'package:gluon_erp/models/filters/company_model.dart';
import 'package:gluon_erp/services/api_functions.dart';
import 'package:gluon_erp/services/urls.dart';

import '../../constants/constants.dart';

mixin DropDownListMixin {
  Future<List<FilterModel>> _fetchDropDownListFromApi(String url) async {
    List<FilterModel> list = [];
    final apiResponse =
        await apiCall(GET, url, {}, model: FilterModel(), showLoader: false);
    if (apiResponse != null) {
      for (final data in apiResponse) {
        list.add(data);
      }
    }
    return list;
  }

  void getFiltersData() {
    if (authToken.isNotEmpty) {
      _fetchDropDownListFromApi(Urls.companiesDropDown)
          .then((list) => companyList = list);
      _fetchDropDownListFromApi(Urls.stationDropDown)
          .then((list) => stationList = list);
      _fetchDropDownListFromApi(Urls.formDropDown)
          .then((list) => formList = list);
      _fetchDropDownListFromApi(Urls.costCenterDropDown)
          .then((list) => costCenterList = list);
    }
  }
}
