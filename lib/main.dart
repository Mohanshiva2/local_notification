import 'package:flutter/material.dart';
import 'package:local_notification/services/notification.dart';
import 'package:local_notification/views/home_view.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          theme: ThemeData(
              fontFamily: 'Montserrat'
          ),
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
        ),
        providers: [
          ChangeNotifierProvider(
              create: (_) => NotificationService(),
          ),
        ],
    );
  }
}
