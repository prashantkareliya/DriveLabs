import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/auth/your_location_screen.dart';
import 'package:drive_labs/constants/helpers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
  DateTime? _selectedDay;

  void _showMonthYearPicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDay,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );

    if (picked != null && picked != _selectedDay) {
      setState(() {
        _selectedDay = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Assets.images.dob.image(fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
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
                    firstDay: DateTime.utc(1950, 1, 1),
                    lastDay: DateTime.now(),
                    focusedDay: DateTime.now(),
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _selectedDay = focusedDay;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _selectedDay = focusedDay;
                    },
                    availableGestures: AvailableGestures.horizontalSwipe,
                    calendarBuilders: CalendarBuilders(
                      headerTitleBuilder: (context, day) {
                        return GestureDetector(
                          onTap: _showMonthYearPicker,
                          child: Container(
                            color: Colors.transparent,
                            padding: EdgeInsets.symmetric(vertical: 8.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat.yMMMM().format(day),
                                  style: GoogleFonts.montserrat(fontSize: 18.sp, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: GoogleFonts.montserrat(fontSize: 20.0, fontWeight: FontWeight.bold),
                      leftChevronIcon: Container(
                        decoration: BoxDecoration(color: AppColors.blueLight.withOpacity(0.75), shape: BoxShape.circle),
                        child: Icon(Icons.chevron_left, color: AppColors.whiteColor, size: 25),
                      ),
                      rightChevronIcon: Container(
                        decoration: BoxDecoration(color: AppColors.blueLight.withOpacity(0.75), shape: BoxShape.circle),
                        child: Icon(Icons.chevron_right, color: AppColors.whiteColor, size: 25),
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      defaultDecoration: const BoxDecoration(shape: BoxShape.rectangle),
                      weekendDecoration: const BoxDecoration(shape: BoxShape.rectangle),
                      selectedDecoration: BoxDecoration(
                        color: const Color(0xFF628cff),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.3),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      selectedTextStyle: GoogleFonts.montserrat(color: Colors.white, fontSize: 15),
                      todayTextStyle: GoogleFonts.montserrat(color: Colors.black, fontSize: 15),
                      weekendTextStyle: GoogleFonts.montserrat(color: Colors.black87.withOpacity(0.7), fontSize: 15),
                      defaultTextStyle: GoogleFonts.montserrat(color: Colors.black87, fontSize: 15),
                      outsideDaysVisible: true,
                      cellMargin: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.black54),
                      weekendStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.black54),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox.shrink(),
          RichText(
            text: TextSpan(
              text: "Already have an account? ",
              style: GoogleFonts.montserrat(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.black),
              children: [
                TextSpan(
                  text: "\nLogin here",
                  style: GoogleFonts.montserrat(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      navigationService.push(LoginRegistrationScreen());
                    },
                ),
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              if (_selectedDay != null) {
                print(_selectedDay);
                navigationService.push(YourLocationScreen(_selectedDay));
              } else {
                Helpers.showSnackBar(context, "Please select your date of birth date", isError: true);
              }
            },
            backgroundColor: AppColors.black,
            child: Icon(Icons.arrow_forward, color: AppColors.yellowColor, size: 30),
          ),
        ],
      ),
    );
  }
}
