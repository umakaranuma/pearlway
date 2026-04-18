
// import 'package:dio/dio.dart';
// import 'package:joboro/core/configs/api_config.dart';
// import 'package:joboro/core/exceptions/network_exceptions.dart';

// import '../exceptions/api_result.dart';

// class FileUploadDatasourses {
//   ApiBaseRequsets apiBaseRequests = ApiBaseRequsets();

//   Future<ApiResult<UploadFile>> fileUpload(FormData formData) async {
//     try {
//       // // Creating multipart form data
//       // FormData formData = FormData.fromMap({
//       //   'file': await MultipartFile.fromFile(
//       //       file.path), // Attach the file as multipart
//       //   'path': key,
//       // });

//       // Sending the file as multipart data in the POST request
//       var response = await apiBaseRequests.post('upload-file', data: formData);

//       // Assuming response is a valid JSON and maps correctly to FileUpload model
//       return ApiResult.success(UploadFile.fromJson(response));
//     } catch (e) {
//       return ApiResult.failure(NetworkExceptions.getDioException(e));
//     }
//   }
// }
