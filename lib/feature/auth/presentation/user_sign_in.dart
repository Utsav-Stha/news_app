import 'package:flutter/material.dart';
import 'package:news_app/feature/auth/domain/auth_service.dart';
import 'package:news_app/feature/auth/presentation/user_login.dart';

class UserSignIn extends StatelessWidget {
   UserSignIn({Key? key}) : super(key: key);
  final _loginFormKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _userPasswordController = TextEditingController();
   final _userConfirmPasswordController = TextEditingController();
   final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Sign in Now.',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(
              height: 20.0,
            ),
            Form(
              key: _loginFormKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline_rounded),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _userNameController.clear();
                            },
                            icon: const Icon(Icons.cancel_outlined)),
                        label: const Text('Email'),
                        hintText: 'Enter your  email',
                        hintStyle: const TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.red, width: 12.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      controller: _userNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter the email';
                        } else if (value.length <= 2) {
                          return 'Enter full email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 26.0,
                    ),
                    TextFormField(
                      // obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline_rounded),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _userPasswordController.clear();
                          },
                          icon: const Icon(Icons.cancel_outlined),
                        ),
                        label: const Text('Password'),
                        hintText: 'Enter your password',
                        hintStyle: const TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.red, width: 12.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      controller: _userPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter the password';
                        } else if (value.length <= 7) {
                          return 'Password must be of minimum 8 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 26.0,
                    ),
                    TextFormField(
                      // obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline_rounded),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _userPasswordController.clear();
                          },
                          icon: const Icon(Icons.cancel_outlined),
                        ),
                        label: const Text('Confirm Password'),
                        hintText: 'Enter your confirm password',
                        hintStyle: const TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.red, width: 12.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      controller: _userConfirmPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter the confirm password';
                        } else if (value.length <= 7) {
                          return 'Password must be of minimum 8 characters';
                        }
                        else if(_userConfirmPasswordController.text != _userPasswordController.text){
                          return 'The password doesn\'t match';
                        }
                        return null;
                      },
                    ),
                    // const SizedBox(
                    //   height: 20.0,
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 18.0,
            ),
            Divider(),
            SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 26.0,
                  backgroundColor: Colors.black12,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.facebook_rounded),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                CircleAvatar(
                  radius: 26.0,
                  backgroundColor: Colors.black12,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.g_mobiledata),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text('Don\'t already have an account?'),
            //     TextButton(
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => UserSignIn(),
            //           ),
            //         );
            //       },
            //       child: Text(
            //         'Register',
            //         style: TextStyle(
            //           fontWeight: FontWeight.w700,
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor:
                MaterialStatePropertyAll(Colors.yellowAccent),
                foregroundColor: MaterialStatePropertyAll(Colors.black),
                minimumSize: MaterialStatePropertyAll(
                  Size(double.infinity, 60),
                ),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
              onPressed: () async{
                if (_loginFormKey.currentState!.validate()) {
                  print('User Name : ${_userNameController.text}');

                  /// send this data to  backend
                  /// we need to call API to send the data
                  /// here we use Post method
                  Map _userData = {
                    'userName': _userNameController.text,
                    'password': _userNameController.text,
                  };
                   dynamic result = await _auth.registerWithEmail(_userNameController.text, _userPasswordController.text);
                   if(result == null){
                     print('Null');
                   }
                   else{
                     print(result);
                   }
                  Navigator.popUntil(context, (route) => false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserLogin()),
                  );
                }
              },
              child: const Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
