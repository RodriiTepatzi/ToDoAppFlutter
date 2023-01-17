import 'package:flutter/material.dart';
import 'package:todo_flutter/static/colors.dart';
import 'package:todo_flutter/views/checked_view.dart';
import 'package:todo_flutter/views/dashboard_view.dart';
import 'package:todo_flutter/views/widgets/bottombar_item.dart';

class MainTabBarView extends StatefulWidget {
  const MainTabBarView({Key? key}) : super(key: key);

  @override
  State<MainTabBarView> createState() => _TabBarViewState();
}

class _TabBarViewState extends State<MainTabBarView> with TickerProviderStateMixin{
  int _selectedWidgetIndex = 0;

  List barItems = [
    {
      "icon" : "assets/icons/home.svg",
      "active_icon" : "assets/icons/home.svg",
      "page" : const DashboardView(),
    },
    {
      "icon" : "assets/icons/check.svg",
      "active_icon" : "assets/icons/check.svg",
      "page" : const CheckedView(),
    },
  ];
  
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page){
    return FadeTransition(
      child: page,
      opacity: _animation
    );
  }

  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      _selectedWidgetIndex = index;
    });
    _controller.forward();
  }

  void changeColorBar(){
    
  }

  @override
  Widget build(BuildContext context) {
    changeColorBar();
    
    return Scaffold(
      backgroundColor: bgApp,
      bottomNavigationBar: getBottomBar(),
      body: getBarPage()
    );
  }

  Widget getBarPage(){
    return 
      IndexedStack(
        index: _selectedWidgetIndex,
        children: 
          List.generate(barItems.length, 
            (index) => animatedPage(barItems[index]["page"])
          )
      );
  }

  Widget getBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bottomBarItemBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25), 
          topRight: Radius.circular(25)
        ), 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(1, 1)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15,),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(barItems.length, 
            (index) => BottomBarItem(barItems[index]["icon"], isActive: _selectedWidgetIndex == index, activeColor: accentColorApp,
              onTap: (){
                onPageChanged(index);
              },
            )
          )
        )
      ),
    );
  }
}