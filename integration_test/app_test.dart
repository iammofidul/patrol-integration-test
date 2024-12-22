import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_integration_test/main.dart';

void main() {
  patrolTest(
    'Test Login and Notification Permission',
        ($) async {
      await $.pumpWidgetAndSettle(
          const MyApp()
      );
      expect(find.byType(MyApp), findsOneWidget);
      await $(#email).enterText("email@example.com");
      await $(#password).enterText("password");
      await $(#login).tap();
      await $('Notification Permission').waitUntilVisible();
      await $(#btnAllowNotification).tap();
      if(await $.native.isPermissionDialogVisible()){
        await $.native.grantPermissionWhenInUse();
      }
      await $('Notification permission granted!').waitUntilVisible();
      await Future.delayed(const Duration(seconds: 5));
    },
  );
}
