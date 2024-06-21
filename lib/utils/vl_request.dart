import 'dart:convert';

import 'package:arch_app/utils/return_data.dart';
import 'package:http/http.dart' as http;

class VLRequest {
  Future<ReturnData<dynamic>> call({
    // typeRequest = TypeRequest,
    path = String,
    params,
    isJson = false,
    type,
    isOffline = false,
    isSqlLite = false,
    int? requestId,
  }) async {
    // await UserRepository.refreshToken();
    // var token = await StorageRepository.getToken();
    // var auth = 'Bearer ${token.data?.accessToken ?? ''}';

    var result = http.Response('body', 400);

    // var requestModel = RequestModel(
    //   id: 0,
    //   typeRequest: typeRequest.toString(),
    //   typeHeader: "1",
    //   path: path,
    //   isJson: 1,
    // );

    // // if (!GlobalController.i.connected.value && isOffline) {
    //   requestModel.params = params != null ? jsonEncode(params) : "";
    //   requestModel.type = type;
    //   requestModel.hash = GlobalSale.leads.vsellerHashCreatedLead;
    //   requestModel.id = requestId;

    // var result = await RequestsRepository.saveRequestLocally(requestModel);

    //   if (result > 0) {
    //     return ReturnData<int>(
    //       true,
    //       message: "Requisição offline salva, aguardando na fila",
    //       data: result,
    //     );
    //   } else {
    //     return ReturnData<int>(
    //       true,
    //       message: "Esta informação já está salva e aguardando na fila",
    //       data: 0,
    //     );
    //   }
    // } else {
    try {
      // switch (typeRequest) {
      //   case TypeRequest.post:
      //     result = await http.post(
      //       Uri.parse(path),
      //       body: params != null
      //           ? isJson
      //               ? isSqlLite
      //                   ? params
      //                   : jsonEncode(params)
      //               : Functions().transformToUrlEncoded(params)
      //           : '',
      //       headers: {
      //         "Content-Type": "application/json",
      //         "Authorization": auth,
      //       },
      //     );
      //     break;
      //   case TypeRequest.put:
      //     result = await http.put(
      //       Uri.parse(path),
      //       body: params != null
      //           ? isSqlLite
      //               ? params
      //               : jsonEncode(params)
      //           : '',
      //       headers: {
      //         "Content-Type": "application/json",
      //         "Authorization": auth,
      //       },
      //     );
      //     break;
      //   case TypeRequest.get:
      //     result = await http.get(
      //       Uri.parse(path),
      //       headers: {
      //         "Authorization": auth,
      //       },
      //     );
      //     break;
      //   case TypeRequest.delete:
      //     result = await http.delete(
      //       Uri.parse(path),
      //       headers: {
      //         "Content-Type": "application/json-patch+json",
      //         "Authorization": auth,
      //       },
      //     );
      //     break;
      // }

      var apiResponse = json.decode(result.body);

      if (apiResponse.success) {
        return ReturnData<dynamic>(
          true,
          message: apiResponse.messages.isNotEmpty
              ? apiResponse.messages[0].message
              : '',
          data: apiResponse.response,
          messageList: apiResponse.messages.isNotEmpty
              ? apiResponse.messages
                  .map(
                    (e) => MessagesReturn(
                      message: e.message,
                      success: e.success,
                    ),
                  )
                  .toList()
              : [],
        );
      } else {
        // var log = InternalLogsModel(
        //   logDescription: "Error in request: $path",
        //   date: DateTime.now().toString(),
        //   localError: Get.currentRoute,
        //   read: false,
        //   logTitle:
        //       "StatusCode: ${result.statusCode} -- ${apiResponse.messages.isNotEmpty ? apiResponse.messages[0].message : ""}",
        // );
        // await DataBase.db.newLog(log: log);
        return ReturnData<dynamic>(
          false,
          message: (apiResponse.messages.isNotEmpty
              ? apiResponse.messages[0].message
              : ""),
          data: apiResponse.response,
          messageList: apiResponse.messages.isNotEmpty
              ? apiResponse.messages
                  .map(
                    (e) => MessagesReturn(
                      message: e.message,
                      success: e.success,
                    ),
                  )
                  .toList()
              : [],
        );
      }
    } catch (e) {
      // var descrip = Functions().getDescriptionStatusCode(result.statusCode);
      // var log = InternalLogsModel(
      //   logDescription: "Error in request: $path",
      //   date: DateTime.now().toString(),
      //   localError: Get.currentRoute,
      //   read: false,
      //   logTitle: "StatusCode: ${result.statusCode} -- $descrip",
      // );
      // await DataBase.db.newLog(log: log);
      print(e.toString());
      // if (!GlobalController.i.connected.value) {
      //   return ReturnData<String>(
      //     false,
      //     message: 'without_internet'.tr,
      //   );
      // } else {
      return ReturnData<String>(false, message: "Error: $e");
      // }
      // }
    }
  }
}
