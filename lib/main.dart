import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/feature/home_page.dart';

// import 'package:news_app/feature/auth/presentation/user_login.dart';
// import 'package:news_app/feature/home_page.dart';
// import 'package:news_app/feature/tech_crunch_news/tech_crunch_news.dart';
// import 'package:news_app/stream_dart_classes/stream_widget.dart';

import 'feature/auth/presentation/starting_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyAhC0DPkRGI4WEe2nsggaQd-8bFHmF790o',
      appId: '1:809310334781:android:624e891d1265e8f90f9f54',
      messagingSenderId: '809310334781',
      projectId: 'news-app-98b30',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: StartingScreen(),
    );
  }
}




// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:news_app/feature/auth/presentation/user_login.dart';
// import 'package:news_app/feature/home_page.dart';
// import 'package:news_app/feature/news_bloc/news_state_event.dart';
// import 'package:news_app/feature/news_bloc/tech_news_bloc.dart';
// import 'package:news_app/feature/news_bloc/tech_news_bloc_page.dart';
// import 'package:news_app/feature/tech_crunch_news/tech_crunch_news.dart';
// import 'package:news_app/stream_dart_classes/stream_widget.dart';

// import 'feature/auth/presentation/starting_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: FirebaseOptions(
//       apiKey: 'AIzaSyAhC0DPkRGI4WEe2nsggaQd-8bFHmF790o',
//       appId: '1:809310334781:android:624e891d1265e8f90f9f54',
//       messagingSenderId: '809310334781',
//       projectId: 'news-app-98b30',
//     ),
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<TechNewsBloc>(create: (context) => TechNewsBloc(NewInitialState()),)
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
//           useMaterial3: true,
//         ),
//         home: TechNewsBlocPage(),
//       ),
//     );
//   }
// }
