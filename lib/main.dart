import 'package:brightness/core/constant/app_images.dart';
import 'package:brightness/views/screens/Get_started/get_started.dart';
import 'package:brightness/views/screens/login_and_signup/login.dart';
import 'package:brightness/views/screens/main_screens/posts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/models/book_page_model.dart';
import 'data/models/photographer_page_model.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'views/screens/login_and_signup/welcome.dart';
import 'views/screens/main_screens/book.dart';
import 'views/screens/main_screens/main_screens.dart';
import 'views/screens/main_screens/photographer_profile.dart';
import 'views/screens/main_screens/profile.dart';
import 'views/screens/main_screens/search.dart';
import 'views/screens/secondry_screens/complaint.dart';
import 'views/screens/splash_screen.dart/splash_screen.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print(message.messageId);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  runApp( MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  
   MyApp({required this.isFirstTime});
     bool isFirstTime;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
              ),
              home:  MyHomePage(isFirstTime:isFirstTime ,),
            ));
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key,required this.isFirstTime});

   bool isFirstTime;

  @override
  State<MyHomePage> createState() => _MyHomePageState(isFirstTime: isFirstTime);
}

class _MyHomePageState extends State<MyHomePage> {
_MyHomePageState({required this.isFirstTime});
   bool isFirstTime;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  void subscribeToBroadcastTopic() {
    messaging.subscribeToTopic('broadcast');
  }

  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      sound: true,
      announcement: false,
      provisional: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {}

    FirebaseMessaging.onMessage.listen((event) {});
  }

  @override
  void initState() {
    //subscribeToBroadcastTopic();
    requestPermission();
    FirebaseMessaging.onMessage.listen((event) {
      if (!mounted) return;
      if (event.notification == null) return;
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(event.notification?.title ?? ""),
              content: Text(event.notification?.body ?? ""),
            );
          });
    });
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // const DarwinInitializationSettings darwinInitializationSettings =
    //     DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
    );

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'messages', 'Messages',
        description: 'this is for flutter firebase',
        importance: Importance.max);

    createchannel(channel);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((event) {
      final notification = event.notification;
      final android = event.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    channelDescription: channel.description,
                    icon: android.smallIcon)));
      }
    });
    super.initState();
  }

  void createchannel(AndroidNotificationChannel channel) async {
    final FlutterLocalNotificationsPlugin plugin =
        FlutterLocalNotificationsPlugin();
    await plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }



  @override
  Widget build(BuildContext context) {
    return WelcomeView();
  }
}
