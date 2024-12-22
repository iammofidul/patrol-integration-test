import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  void _requestNotificationPermission(BuildContext context) async {
    final status = await Permission.notification.request();
    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notification permission granted!')),
      );
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notification permission denied!')),
      );
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notification permission permanently denied. Please enable it in settings.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Permission'),
      ),
      body: Center(
        child: ElevatedButton(
          key: const ValueKey("btnAllowNotification"),
          onPressed: () => _requestNotificationPermission(context),
          child: const Text('Request Notification Permission'),
        ),
      ),
    );
  }
}
