import 'package:flutter/material.dart';
import 'package:news_app/feature/auth/presentation/user_login.dart';
import 'package:news_app/feature/auth/presentation/user_sign_in.dart';

import '../domain/auth_service.dart';

class StartingScreen extends StatelessWidget {
  final AuthService _auth = AuthService();
   StartingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0,20.0,12.0,8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.w700),
              ),
              const Text(
                'To NEWShub',
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 48,
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                '"News Unboxed: Unleash Today’s Headlines, Anytime, Anywhere."',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                // color: Colors.red,
                padding: const EdgeInsets.all(0),
                height: 300,
                width: 400,
                child: Image.asset("assets/images/startImage1.png",
                    fit: BoxFit.cover),
              ),
              SizedBox(
                height: 2.0,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.yellowAccent),
                  foregroundColor: MaterialStatePropertyAll(Colors.black),
                  minimumSize: MaterialStatePropertyAll(
                    Size(double.infinity, 40),
                  ),
                  textStyle: MaterialStatePropertyAll(TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16

                  ),),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserLogin()),
                  );
                },
                child: const Text('Log in'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.yellowAccent),
                  foregroundColor: MaterialStatePropertyAll(Colors.black),
                  minimumSize: MaterialStatePropertyAll(
                    Size(double.infinity, 40),
                  ),
                  textStyle: MaterialStatePropertyAll(TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16

                  ),
                  ),
                ),
                // onPressed: () async{
                //     dynamic result =  await _auth.signInAnon();
                //     if(result == null){
                //       print('Sign in error');
                //     }
                //     else{
                //       print('Signed in');
                //       print(result);
                //     }
                // },
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  UserSignIn()),
                    );
                },
                child: const Text('Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
