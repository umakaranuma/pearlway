// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:empower_passenger_app/core/auth/file_upload_datasourses.dart';
// import 'package:empower_passenger_app/core/exceptions/network_exceptions.dart';
// import 'package:empower_passenger_app/modules/shared/models/file_upload.dart';
// import 'package:flutter/foundation.dart';

// class S3Manager {
//   FileUploadDatasourses fileUploadDatasourses = FileUploadDatasourses();

//   // Upload file to S3 using API Gateway and return the result
//   Future<String?> uploadFile({
//     required String filePath,
//     required String key,
//   }) async {
//     try {
//       final file = File(filePath);
//       // Creating multipart form data
//       FormData formData = FormData.fromMap({
//         'file': await MultipartFile.fromFile(
//             file.path), // Attach the file as multipart
//         'path': key,
//       });
//       // Check if file exists before proceeding
//       if (!file.existsSync()) {
//         if (kDebugMode) {
//           print('File does not exist at path: $filePath');
//         }
//         return null; // Return null if file does not exist
//       }

//       final response = await fileUploadDatasourses.fileUpload(formData);
//       return response.when(
//         success: (UploadFile data) {
//           if (kDebugMode) {
//             print('File successfully uploaded: $key');
//           }
//           return data.result.path; // Returning file path on success
//         },
//         failure: (NetworkExceptions error) {
//           if (kDebugMode) {
//             print(
//                 'Failed to upload file: ${NetworkExceptions.getErrorMessage(error)}');
//           }
//           return null; // Returning null on failure
//         },
//       );
//     } catch (e, stacktrace) {
//       // Log the full error and stacktrace for better debugging
//       if (kDebugMode) {
//         print('Exception while uploading file: $e');
//         print('Stacktrace: $stacktrace');
//       }
//       return null; // Returning null in case of an exception
//     }
//   }

//   // Get the URL of the uploaded file
//   String getFileUrl(String key) {
//     return 'https://dfoanmymlhna7.cloudfront.net/$key';
//   }
// }
