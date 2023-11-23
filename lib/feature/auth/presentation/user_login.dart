import 'package:flutter/material.dart';
import 'package:news_app/config/network/network_request.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final _loginKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _userPasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Login'),
      ),
      body: Column(
        children: [
          Form(
            key: _loginKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_rounded),
                      suffixIcon: Icon(Icons.cancel_outlined),
                      label: Text('User name'),
                      hintText: 'John',
                      hintStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 12.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    controller: _userNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter the user name';
                      } else if (value.length <= 2) {
                        return 'Enter Your Full User Name';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_rounded),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _userPasswordController.clear();
                          },
                          icon: Icon(Icons.cancel_outlined)),
                      label: Text('Password'),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 12.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    controller: _userPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter the user name';
                      } else if (value.length <= 2) {
                        return 'Enter Your Full User Name';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_loginKey.currentState!.validate()) {
                        print('User Name : ${_userNameController.text}');

                        /// send this data to  backend
                        /// we need to call API to send the data
                        /// here we use Post method
                        Map _userData = {
                          'userName': _userNameController.text,
                          'password': _userNameController.text,
                        };
                        // NetworkRequest.submitUserLogin(_userData);
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
