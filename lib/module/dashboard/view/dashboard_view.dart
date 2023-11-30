import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/dashboard/widget/dashboard_card_expense.dart';
import 'package:hyper_ui/module/dashboard/widget/dashboard_card_income.dart';
import 'package:hyper_ui/module/dashboard/widget/dashboard_clippath.dart';
import 'package:hyper_ui/shared/util/animation/animation.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;
/*

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Pending",
              ),
              Tab(
                text: "Ongoing",
              ),
              Tab(
                text: "Done",
              ),
            ],
          ),
          title: Text('Order List'),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.red[100],
            ),
            Container(
              color: Colors.green[100],
            ),
            Container(
              color: Colors.blue[100],
            ),
          ],
        ),
      ),
    );
    */

    var now = DateTime.now();
    var datef = DateFormat("MMMM y").format(
      DateTime(now.year, (now.month + controller.counter), 1).add(
        Duration(
          days: controller.counter,
        ),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 24.0,
              ),
              onPressed: () => controller.prev(),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "$datef",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () => controller.next(),
              icon: Icon(
                Icons.arrow_forward,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ClipPath(
              clipper: DashboardCardClipPath(),
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                color: primaryColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 12.0,
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    DashboardCard(),
                    SizedBox(
                      height: 30.0,
                    ),
                    Expanded(
                      child: Container(
                        child: DefaultTabController(
                          length: 3,
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                  ),
                                  child: TabBar(
                                    labelColor: Colors.white,
                                    unselectedLabelColor: Colors.grey,
                                    tabs: [
                                      Tab(
                                        text: "Harian",
                                      ),
                                      Tab(
                                        text: "Kalender",
                                      ),
                                      Tab(
                                        text: "Bulanan",
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      LaporanKeuanganHarianView(),
                                      LaporanKeuanganKalenderView(),
                                      LaporanKeuanganBulananView(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ).amx,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
