import 'dart:math';

import 'package:drive_labs/constants/strings.dart';
import 'package:drive_labs/intro/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/navigation_service.dart';
import 'constants/app_colours/app_colors.dart';

final NavigationService navigationService = NavigationService();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Ambulance booking App',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            useMaterial3: true,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            scaffoldBackgroundColor: AppColors.whiteColor,
            colorScheme: ColorScheme.fromSwatch().copyWith(primary: AppColors.primaryColor, secondary: AppColors.whiteColor),
          ),
          home: child,
        );
      },
      child: SplashScreen(),
    );
  }
}

class SteeringLoadingIndicator extends StatefulWidget {
  final double size;
  final Duration rotationDuration;
  final TextStyle? textStyle;

  const SteeringLoadingIndicator({super.key, this.size = 80.0, this.rotationDuration = const Duration(seconds: 2), this.textStyle});

  @override
  SteeringLoadingIndicatorState createState() => SteeringLoadingIndicatorState();
}

class SteeringLoadingIndicatorState extends State<SteeringLoadingIndicator> with TickerProviderStateMixin {
  late final AnimationController _rotationController;
  late final AnimationController _dotController;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(vsync: this, duration: widget.rotationDuration)..repeat();

    _dotController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _dotController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = widget.textStyle ?? GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: widget.size,
          height: widget.size,
          child: AnimatedBuilder(
            animation: _rotationController,
            builder: (_, child) {
              return Transform.rotate(angle: _rotationController.value * 2 * pi, child: child);
            },
            child: Image.asset(ImageString.imgLoader, fit: BoxFit.contain),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Loading", style: textStyle),
            SizedBox(width: 2),
            AnimatedBuilder(
              animation: _dotController,
              builder: (_, __) {
                final progress = _dotController.value * 3;

                return RichText(
                  text: TextSpan(
                    style: textStyle,
                    children: List.generate(3, (index) {
                      double opacity = ((progress - index).clamp(0.0, 1.0));
                      if (opacity > 1.0) opacity = 0.0;
                      return WidgetSpan(
                        child: Opacity(
                          opacity: opacity,
                          child: const Text(
                            '.',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

/*
Usage example
SteeringLoadingIndicator(
size: 100,
textStyle: TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
color: Colors.red,
),
)
*/
