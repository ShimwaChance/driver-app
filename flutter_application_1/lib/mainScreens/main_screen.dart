import 'package:flutter_application_1/tabPages/home_tab.dart';
import 'package:flutter_application_1/tabPages/profile_tab.dart';
import 'package:flutter_application_1/tabPages/ratings_tab.dart';
import 'package:flutter_application_1/tabPages/earnings_tab.dart';
import 'package:flutter/material.dart';

class MainScreen  extends StatefulWidget
{
  @override
  _MainScreenState createState() => _MainScreenState();
}




class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin
{
  TabController? tabController;
  int selectedIndex = 0;


  onItemClick(int index)
  {
    setState(() {
       selectedIndex=index;
       tabController!.index=selectedIndex;
    });
  }
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          HomeTabPage(),
          EarningsTabPage(),
          RatingsTabPage(),
          ProfileTabPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:"Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label:"Earnings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label:"Ratings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label:"Account",
          ),
        ],
        unselectedItemColor:Colors.white54 ,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:const TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap:onItemClick,

      ),
    );
  }
}
