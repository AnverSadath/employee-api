import 'package:api_integration/controller/screen_controller.dart';
import 'package:api_integration/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ApiIntegration());
}

class ApiIntegration extends StatefulWidget {
  const ApiIntegration({super.key});

  @override
  State<ApiIntegration> createState() => _ApiIntegrationState();
}

class _ApiIntegrationState extends State<ApiIntegration> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => screen_controller(),
        )
      ],
      child: MaterialApp(
        home: Home_screen(),
      ),
    );
  }
}
