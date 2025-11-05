import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/main.dart';
import 'package:drive_labs/procedures/subscripation_screen.dart';
import 'package:flutter/material.dart';

import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/gen/assets.gen.dart';

class ProgramMapScreen extends StatefulWidget {
  const ProgramMapScreen({super.key});

  @override
  State<ProgramMapScreen> createState() => _ProgramMapScreenState();
}

class _ProgramMapScreenState extends State<ProgramMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Assets.images.programMap.image(fit: BoxFit.fill, width: context.width()),
          Positioned(
            top: 38,
              child: GestureDetector(
                  onTap: () {
                    navigationService.pop();
                  },
                  child: Assets.images.statusBar.image(height: 80)))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigationService.push(SubscriptionScreen());
        },
        backgroundColor: AppColors.black,
        child: Icon(Icons.start, color: AppColors.yellowColor, size: 30),
      ),
    );
  }
}
