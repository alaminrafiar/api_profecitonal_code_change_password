import 'dart:convert';

import 'package:api_profecitonal_code_change_password/change_pass_controller/c_pass_constants.dart';
import 'package:api_profecitonal_code_change_password/change_pass_controller/c_pass_key.dart';
import 'package:http/http.dart' as http;

import '../model/auth_change.dart';

class ChangePassApiService {
  static Future<AuthChangepass?> methodChPas(
      String oldpass, String newpass, String repass) async {
    var response = await http.post(Uri.parse(ChangePassConstants.urlchangepass),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "api_key": ChangePassConstants.apikeyChange,
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZmFmZmQ2MTVlZjJhZTY4OTYxZDVhNSIsIm5hbWUiOiJBbC1hbWluIiwicm9sZSI6ImVtcGxveWVlIiwiaWF0IjoxNjc4MzgwOTc2LCJleHAiOjE2Nzg0NjczNzZ9.DIr-mecs1oDZEWKa86tWP_XkfEDZWro8X8E6EAysKFQ "

        },
        body: jsonEncode({
          ChangeKeyWords.old_password: oldpass,
          ChangeKeyWords.new_password: newpass,
          ChangeKeyWords.re_typed_new_password: repass,
        }));
    if (response.statusCode==200){
      AuthChangepass authChangePass = AuthChangepass.fromJson(jsonDecode(response.body));
      return authChangePass;
    }else{
      print("error");
    }
  }
}
