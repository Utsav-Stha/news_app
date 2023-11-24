import 'package:flutter/material.dart';
import 'package:news_app/config/network/network_request.dart';
import 'package:news_app/feature/home_page.dart';

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
      // appBar: AppBar(
      //   title: const Text('User Login'),
      // ),
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0,48.0,10.0,10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lets\'s Sign you in.',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text('Welcome back',style: TextStyle(
                color: Colors.black54,
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),),
              SizedBox(
                height: 8.0,
              ),
              Text('You have been missed!',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),),
              SizedBox(
                height: 32.0,),

              Form(
                key: _loginKey,
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
                          label: const Text('User name / Email'),
                          hintText: 'Enter your user name or email',
                          hintStyle: const TextStyle(color: Colors.black54),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 12.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        controller: _userNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter the user name or email';
                          } else if (value.length <= 2) {
                            return 'Enter full user name or email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 26.0,
                      ),
                      TextFormField(
                        obscureText: true,
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
                            borderSide:
                                const BorderSide(color: Colors.red, width: 12.0),
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
                height: 44.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t already have an account? '),
                  Text(' Register',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),)
                ],
              ),
              SizedBox(height: 10.0,),
              ElevatedButton(

                style: const ButtonStyle(

                  backgroundColor: MaterialStatePropertyAll(Colors.yellowAccent),
                  foregroundColor: MaterialStatePropertyAll(Colors.black),
                  minimumSize: MaterialStatePropertyAll(
                    Size(double.infinity, 60),
                  ),
                  textStyle: MaterialStatePropertyAll(
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
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
                    Navigator.popUntil(context, (route) => false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                },
                child: const Text('Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
