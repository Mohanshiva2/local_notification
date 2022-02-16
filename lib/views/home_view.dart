import 'package:flutter/material.dart';
import 'package:local_notification/services/notification.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<NotificationService>(context, listen: false).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Consumer<NotificationService>(
            builder: (context, model, _) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => model.instantNotification(),
                    child: const Text('Instant Notification')),
                ElevatedButton(
                    onPressed: () => model.imageNotification(),
                    child: const Text('Image Notification')),
                ElevatedButton(
                    onPressed: () => model.stylishNotification(),
                    child: const Text('Media Notification')),
                ElevatedButton(
                    onPressed: () => model.scheduledNotification(),
                    child: const Text('Scheduled Notification')),
                ElevatedButton(
                    onPressed: () => model.cancelNotification(),
                    child: const Text('Cancel Notification')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
