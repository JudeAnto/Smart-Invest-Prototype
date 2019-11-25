import 'package:flutter/material.dart';
import 'PortfolioPage.dart';
import 'PortfolioBuy.dart';
import 'PortfolioSell.dart';
import 'globals.dart' as globals;

class PracticeNavigation extends StatefulWidget {

  @override
  _PracticeNavigationState createState() => _PracticeNavigationState();
}

class _PracticeNavigationState extends State<PracticeNavigation> {
  int _selectedIndex = 0;
  Widget currentPage;
  final _pageOptions = [
    PortfolioPage(),
    Text('item2'),
    Text('item3'),
    PortfolioBuy(),
    PortfolioSell(),
  ];

  void _onNavItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void setPage(int newIndex){
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  //to allow for navigation on same nav item
  int getCurrentIndex(){
    if(_selectedIndex == 3 || _selectedIndex == 4 || _selectedIndex == 0 || _selectedIndex == 5){
      return 0;
    }else if (_selectedIndex == 1){
      return 1;
    }else{
      return 2;
    }
  }

  Widget getPageOption(){
    if(_selectedIndex == 0){
      return PortfolioPage(newIndexSelected: (int newIndex) => setPage(newIndex));
    }else if(_selectedIndex == 3){
      return PortfolioBuy(newIndexSelected: (int newIndex) => setPage(newIndex));
    }else if(_selectedIndex == 5){
      return BuyStockItem(stock: globals.currentStock);
    }
    else{
      return _pageOptions[_selectedIndex];
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: getPageOption(),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text(''),
            ),
          ],
          currentIndex: getCurrentIndex(),
          onTap: _onNavItemTap,
        ),
        );
  }
}
