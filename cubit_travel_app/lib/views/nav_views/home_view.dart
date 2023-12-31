import 'package:cubit_travel_app/cubit/app_cubits_cubit.dart';
import 'package:cubit_travel_app/widgets/custom_large_text.dart';
import 'package:cubit_travel_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/data_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabCon = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
              padding: const EdgeInsets.only(left: 20),
              child: const LargeCustomText(text: "Discover")),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TabBar(
              labelColor: Colors.black,
              controller: tabCon,
              indicatorColor: Colors.black,
              // indicatorPadding: EdgeInsets.symmetric(horizontal: 57),
              tabs: const [
                Tab(text: "Places"),
                Tab(text: "Inspiration"),
                Tab(text: "Emotions"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 300,
            padding: const EdgeInsets.only(left: 20),
            child: TabBarView(
              controller: tabCon,
              children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () => BlocProvider.of<AppCubits>(context)
                          .detailView(DataModel.mockDataList[0]),
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const LargeCustomText(text: "Explore More", size: 22),
                CustomText(
                    text: "See all",
                    color: Colors.deepPurpleAccent.withOpacity(0.5)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 90,
            padding: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.lightGreenAccent,
                        ),
                      ),
                      const CustomText(text: "Hiking", size: 12),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
