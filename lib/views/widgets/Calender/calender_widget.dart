import 'package:aaveg_app/views/widgets/Calender/day_text.dart';
import 'package:aaveg_app/views/widgets/Calender/day_widget.dart';
import 'package:flutter/material.dart';

class CalenderWidget extends StatefulWidget {
  CalenderWidget({Key? key}) : super(key: key);

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget>
    with TickerProviderStateMixin {
  final dayList = new List<int>.generate(35, (i) => i + 1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> monthList = ['JULY', 'AUGUST'];
    TabController _tabBarController = TabController(length: 2, vsync: this);

    return Container(
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.65),
                borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Column(children: [
                    Expanded(flex: 50, child: SizedBox()),
                    Expanded(flex: 315, child: DayText())
                  ]),
                ),
                Expanded(
                  flex: 20,
                  child: Column(children: [
                    Expanded(
                        flex: 50,
                        child: Row(children: [
                          Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () {
                                  _tabBarController.index == 0
                                      ? _tabBarController.animateTo(1)
                                      : _tabBarController.animateTo(0);
                                },
                                icon: Icon(Icons.arrow_back_ios)),
                          ),
                          Expanded(
                              flex: 3,
                              child: TabBar(
                                  controller: _tabBarController,
                                  isScrollable: true,
                                  indicatorColor: Colors.transparent,
                                  tabs: [
                                    for (var i = 0; i < 2; i++)
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Center(
                                          child: Text(
                                            monthList[i],
                                            style: TextStyle(
                                                fontFamily: 'Anurati',
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    30,
                                                letterSpacing: 5),
                                          ),
                                        ),
                                      ),
                                  ])),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                                onPressed: () {
                                  _tabBarController.index == 1
                                      ? _tabBarController.animateTo(0)
                                      : _tabBarController.animateTo(1);
                                },
                                icon: Icon(Icons.arrow_forward_ios)),
                          ),
                        ])),
                    Expanded(
                        flex: 315,
                        child: TabBarView(
                          controller: _tabBarController,
                          children: [
                            GridView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              physics: ScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 15,
                                mainAxisSpacing:
                                    MediaQuery.of(context).size.height / 60,
                                mainAxisExtent:
                                    MediaQuery.of(context).size.height * 0.049,
                              ),
                              children: dayList.map((day) {
                                return DayWidget();
                              }).toList(),
                            ),
                            GridView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              physics: ScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 15,
                                mainAxisSpacing:
                                    MediaQuery.of(context).size.height / 60,
                                mainAxisExtent:
                                    MediaQuery.of(context).size.height * 0.049,
                              ),
                              children: dayList.map((day) {
                                return DayWidget();
                              }).toList(),
                            ),
                          ],
                        )),
                  ]),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}