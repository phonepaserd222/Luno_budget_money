// ignore_for_file: use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:luno_budget_money/constants/api_constants.dart';
import 'package:luno_budget_money/models/response_login_by_password_model.dart';
import 'package:luno_budget_money/widget/loading.dart';

import '../widget/error_dialog.dart';

class ApiLoginByPassword {
  static final dio = Dio();

  static Future<ResponseLoginByPaaswordModel?> loginByPassword({
    required String userName,
    required String password,
    required BuildContext context,
  }) async {
    Loading.show(context);
    dio.options.baseUrl = ApiConstants.baseUrl;
    String url = ApiConstants.pathLogIn;
    Map<String, String> body = {"userName": userName, "password": password};
    try {
      Response res = await dio.post(url, data: body);
      if (res.statusCode == 200) {
        Loading.hide(context);

        final ResponseLoginByPaaswordModel data =
            ResponseLoginByPaaswordModel.fromJson(res.data);
        return data;
      } else {
        Loading.hide(context);
        errorDialog(context: context, error: "error login");

        return null;
      }
    } catch (e) {
      Loading.hide(context);
      errorDialog(context: context, error: e.toString());
      debugPrint(e.toString());
      return null;
    }
  }
}
