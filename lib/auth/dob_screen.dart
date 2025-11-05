import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/auth/your_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../gen/assets.gen.dart';
import 'login_registration_screen.dart';
import '../main.dart';

class DOBScreen extends StatefulWidget {
  const DOBScreen({super.key});

  @override
  State<DOBScreen> createState() => _DOBScreenState();
}

class _DOBScreenState extends State<DOBScreen> {

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Assets.images.dob.image(fit: BoxFit.fill),
          Padding(
            padding: EdgeInsets.only(bottom: 80.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              height: 0.48.sh,
              child: Card(
                elevation: 0.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2000, 1, 1),
                    lastDay: DateTime.now(),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                        debugPrint("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ $_selectedDay");
                      }
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    availableGestures: AvailableGestures.horizontalSwipe,
                    pageAnimationEnabled: false,
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      leftChevronIcon: Container(
                        decoration: BoxDecoration(color: AppColors.blueLight.withValues(alpha: 0.75), shape: BoxShape.circle),
                        child: Icon(Icons.chevron_left, color: AppColors.whiteColor, size: 25),
                      ),
                      rightChevronIcon: Container(
                        decoration: BoxDecoration(color: AppColors.blueLight.withValues(alpha: 0.75), shape: BoxShape.circle),
                        child: Icon(Icons.chevron_right, color: AppColors.whiteColor, size: 25),
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      defaultDecoration: BoxDecoration(shape: BoxShape.rectangle),
                      weekendDecoration: BoxDecoration(shape: BoxShape.rectangle),
                      selectedDecoration: BoxDecoration(
                        color: Color(0xFF628cff),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.blueAccent.withValues(alpha: 0.3),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      selectedTextStyle: const TextStyle(color: Colors.white, fontSize: 15),
                      todayTextStyle: const TextStyle(color: Colors.black, fontSize: 15),
                      weekendTextStyle: TextStyle(color: Colors.black87.withValues(alpha: 0.7), fontSize: 15),
                      defaultTextStyle: const TextStyle(color: Colors.black87, fontSize: 15),
                      outsideDaysVisible: true,
                      cellMargin: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
                      weekendStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigationService.push(YourLocationScreen());
        },
        backgroundColor: AppColors.black,
        child: Icon(Icons.start, color: AppColors.yellowColor, size: 30),
      ),
    );
  }
}
