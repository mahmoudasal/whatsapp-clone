import 'package:flutter/material.dart';
import '../main_navigation.dart';
import '../chats_screen.dart';
import '../status_screen.dart';
import '../calls_screen.dart';
import '../settings_screen.dart';
import '../chat_detail_screen.dart';
import '../status_detail_screen.dart';
import '../call_detail_screen.dart';
import '../models/chat_model.dart';
import '../models/status_model.dart';
import '../models/call_model.dart';

// Define route names as constants
class AppRoutes {
  static const String home = '/';
  static const String chats = '/chats';
  static const String status = '/status';
  static const String calls = '/calls';
  static const String settings = '/settings';
  static const String chatDetail = '/chat_detail';
  static const String newChat = '/new_chat';
  static const String statusDetail = '/status_detail';
  static const String callDetail = '/call_detail';

  // Define route generation function
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const MainNavigation());
      case chats:
        return MaterialPageRoute(builder: (_) => const ChatsScreen());
      case status:
        return MaterialPageRoute(builder: (_) => const StatusScreen());
      case calls:
        return MaterialPageRoute(builder: (_) => const CallsScreen());
      // case const settings:
      // return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case chatDetail:
        final chat = settings.arguments as ChatModel;
        return MaterialPageRoute(builder: (_) => ChatDetailScreen(chat: chat));
      case statusDetail:
        final status = settings.arguments as StatusModel;
        return MaterialPageRoute(
          builder: (_) => StatusDetailScreen(status: status),
        );
      case callDetail:
        final call = settings.arguments as CallModel;
        return MaterialPageRoute(builder: (_) => CallDetailScreen(call: call));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

// Navigation service for pushing routes from anywhere in the app
class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic> navigateToReplacement(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  static void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
