import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int numberOfDays = 0;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    var res = getDaysInMonth(DateTime.now().year, DateTime.now().month);
    debugPrint("res is $res");
  }

  int getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[
      31,
      -1,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    numberOfDays = daysInMonth[month - 1];
    return daysInMonth[month - 1];
  }

  changeCurrentIndex({required int index}) {
    currentIndex = index;
    debugPrint(
        "this date is ${DateTime(DateTime.now().year, DateTime.now().month, currentIndex + 1)}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("date time"),
      ),
      body: Column(children: [
        SizedBox(
          height: 80,
          child: ListView.separated(
            padding: const EdgeInsets.all(5),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  changeCurrentIndex(index: index);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index ? Colors.teal : Colors.white,
                    border: Border.all(
                      color: currentIndex == index
                          ? Colors.grey.withOpacity(.4)
                          : Colors.grey.withOpacity(.4),
                    ),
                  ),
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                      color:
                          currentIndex == index ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 15,
              );
            },
            itemCount: numberOfDays,
          ),
        ),
      ]),
    );
  }
}
