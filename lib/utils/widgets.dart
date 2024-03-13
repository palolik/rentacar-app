import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'constant.dart';

class MyContainerWithChild extends StatelessWidget {
  final double? borderRadius;
  final VoidCallback? onTap;
  final List<BoxShadow>? boxShaow;
  final Border? border;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? blurRadius;
  final Color? shadowColor;
  final Color? containerColor;
  final Widget? child;
  const MyContainerWithChild(
      {Key? key,
      this.blurRadius,
      this.shadowColor,
      this.child,
      this.padding,
      this.margin,
      this.height,
      this.width,
      this.containerColor,
      this.boxShaow,
      this.border,
      this.onTap,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        // height: 50,
        // width: 100.w,
        decoration: BoxDecoration(
            border: border,
            color: containerColor ?? white,
            borderRadius: BorderRadius.circular(blurRadius ?? 5),
            boxShadow: boxShaow ??
                [
                  BoxShadow(
                    blurRadius: 4,
                    color: shadowColor ?? colorForShadow,
                  ),
                ]),
        child: child,
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  const PrimaryButton({Key? key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(blurRadius: 4, color: primaryColor),
            ]),
        child: Text(
          title ?? '',
          style: whiteMedium16,
        ),
      ),
    );
  }
}

class MyCalendar extends StatelessWidget {
  final DateTime focusedDay;
  final Function(DateTime, DateTime) onDaySelected;
  final bool Function(DateTime) selectedDayPredicate;
  const MyCalendar(
      {Key? key,
      required this.onDaySelected,
      required this.selectedDayPredicate,
      required this.focusedDay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      rowHeight: 35,
      startingDayOfWeek: StartingDayOfWeek.monday,
      onDaySelected: onDaySelected,
      /*  (selectedDay, focusedDay) {
                          setState(() {
                            if (selectedDay.isAfter(currentDate)) {
                              selectedday = selectedDay;
                              today = focusedDay;
                              formattedDate =
                                  DateFormat('d MMMM y').format(selectedDay);
                            } else if (currentDate
                                .isAtSameMomentAs(currentDate)) {
                              selectedday = currentDate;
                              today = currentDate;
                            }
                          });
                        }, */
      selectedDayPredicate: selectedDayPredicate,
      /*  (day) => isSameDay(today, day), */
      focusedDay: focusedDay,
      /* today, */
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      calendarFormat: CalendarFormat.month,
      //swipe horizontal by swipe
      availableGestures: AvailableGestures.horizontalSwipe,
      daysOfWeekHeight: 22,
      daysOfWeekStyle: DaysOfWeekStyle(
        dowTextFormatter: (date, locale) {
          return DateFormat('E').format(date);
        },
        weekdayStyle: color94Medium14,
        weekendStyle: color94Medium14,
      ),
      //for month year visible
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        cellPadding: EdgeInsets.zero,
        cellMargin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        defaultDecoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
              color: const Color(0xffD2D2D2),
            )),
        defaultTextStyle:
            const TextStyle(color: color94, fontSize: 12, fontFamily: 'M'),
        todayTextStyle:
            const TextStyle(color: white, fontSize: 12, fontFamily: 'M'),
        selectedTextStyle:
            const TextStyle(color: white, fontSize: 13, fontFamily: 'M'),
        weekendTextStyle:
            const TextStyle(color: color94, fontSize: 12, fontFamily: 'M'),
        outsideTextStyle:
            const TextStyle(color: transparent, fontSize: 12, fontFamily: 'M'),
        weekendDecoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
              color: const Color(0xffD2D2D2),
            )),
        todayDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          shape: BoxShape.rectangle,
          color: Colors.grey,
        ),
        outsideDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          shape: BoxShape.rectangle,
          color: Colors.grey.withOpacity(0),
        ),
        selectedDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          shape: BoxShape.rectangle,
          color: primaryColor,
          backgroundBlendMode: BlendMode.srcOver,
        ),
      ),
      headerStyle: HeaderStyle(
        // headerMargin: EdgeInsets.zero,
        titleCentered: true,
        headerPadding: const EdgeInsets.all(0),
        formatButtonVisible: false,
        titleTextStyle: blackMedium16,
        leftChevronIcon: const Icon(Icons.chevron_left, color: primaryColor),
        rightChevronIcon: const Icon(Icons.chevron_right, color: primaryColor),
        leftChevronMargin: EdgeInsets.zero,
        rightChevronMargin: EdgeInsets.zero,
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  final String? title;
  final List<Widget>? actions;
  const MyAppBar({Key? key, this.title, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: white,
      centerTitle: true,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            padding: const EdgeInsets.all(19), child: SvgPicture.asset(arrow)),
      ),
      title: Text(title ?? '', style: blackBold18),
      actions: actions,
    );
  }
}
