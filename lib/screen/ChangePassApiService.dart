import 'package:api_profecitonal_code_change_password/model/auth_change.dart';
import 'package:flutter/material.dart';

import '../change_pass_controller/change_pass_api_service.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  AuthChangepass? authChangepass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            TextFormField(
              controller: _oldPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Old Password',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {
                authChangepass = await ChangePassApiService.methodChPas(
                  _oldPasswordController.text,
                  _newPasswordController.text,
                  _confirmPasswordController.text
                );
                setState(() {
                });
              },
              child: Text('Change Password'),
            ),
            SizedBox(height: 20,),
            authChangepass == null
                ? CircularProgressIndicator(backgroundColor: Colors.red,)
                : Text("message is : ${authChangepass!.message}"),
          ],
        ),
      ),
    );
  }
}
