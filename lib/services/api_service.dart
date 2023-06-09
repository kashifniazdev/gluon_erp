// import 'package:gluon_erp/Models/image_model.dart';
//
// import 'api_functions.dart';
// import 'base_services.dart';
// import 'urls.dart';
//
// class ApiService implements BaseServices {
//   // final ApiFunctions _api = ApiFunctions(Urls.baseUrl);
//
//   @override
//   Future<List<UnSplashImageModel>> getRandomImages(int pageNumber) async {
//     List<UnSplashImageModel> imageList = [];
//     var response = await _api.getAsync(
//       "${Urls.randomImages}$pageNumber",
//       showLoader: pageNumber == 1,
//     );
//     if (response is List) {
//       for (var item in response) {
//         imageList
//             .add(UnSplashImageModel.fromJson(item as Map<String, dynamic>));
//       }
//     }
//     return imageList;
//   }
// }
