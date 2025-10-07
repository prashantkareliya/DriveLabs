import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TestSeriesTab extends StatefulWidget {
  const TestSeriesTab({super.key});

  @override
  State<TestSeriesTab> createState() => _TestSeriesTabState();
}

class _TestSeriesTabState extends State<TestSeriesTab> {
  // To keep track of which tile is expanded
  int _expandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Stack(
        children: [
          Assets.images.programBg.image(width: context.width(), fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                35.verticalSpace,
                Assets.images.testSeries.image(width: context.width(), fit: BoxFit.cover),
                5.verticalSpace,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Query',
                    style: GoogleFonts.montserrat(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w700),
                  ),
                ),
                5.verticalSpace,
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return _buildExpansionTile(index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionTile(int index) {
    final bool isExpanded = index == _expandedIndex;

    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(color: const Color(0xFFF0F5F2), borderRadius: BorderRadius.circular(12.0)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: PageStorageKey<int>(index),
          title: Text(
            'Lorem ipsum dolor sit amet.',
            style: GoogleFonts.montserrat(fontSize: 16, color: AppColors.green, fontWeight: FontWeight.w700),
          ),
          minTileHeight: 50,
          trailing: isExpanded ? Assets.icons.arrowUp.svg() : Assets.icons.arrowDown.svg(),
          onExpansionChanged: (bool expanded) {
            setState(() {
              _expandedIndex = expanded ? index : -1;
            });
          },
          initiallyExpanded: isExpanded,
          childrenPadding: const EdgeInsets.all(16.0).copyWith(top: 0),
          children: <Widget>[
            Text(
              'Lorem ipsum dolor sit amet. Nulla eget egestas aliquam nunc scelerisque odio. Sit sed eget feugiat mattis',
              style: GoogleFonts.montserrat(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
