import 'package:flutter/material.dart';
import 'package:flutter_chat_phone_number/features/chat/presentation/pages/contact_page.dart';
import 'package:flutter_chat_phone_number/features/chat/presentation/pages/single_chat_page.dart';
import 'package:flutter_chat_phone_number/features/app/const/page_const.dart';
import 'package:flutter_chat_phone_number/features/app/settings/settings_page.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;

    switch (name) {
      case PageConst.contacUsersPage:
        {
          return materialPageBuilder(const ContactPage());
        }
      case PageConst.settingsPage:
        {
          return materialPageBuilder(const SettingPage());
        }
      case PageConst.singleChatPage:
        {
          return materialPageBuilder(const SingleChatPage());
        }
    }
  }
}

dynamic materialPageBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
