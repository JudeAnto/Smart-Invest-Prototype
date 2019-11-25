import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class PortfolioPage extends StatefulWidget{
  final Function(int) newIndexSelected;

  PortfolioPage({this.newIndexSelected});

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>{

  void addAlert(){
    setState(() {
      
    });
  }

 Widget buttonFunc(BuildContext context, String buttonName, int path) {
    return SizedBox(
      width: 125, // specific value
      child: RaisedButton(
        onPressed: () {
          widget.newIndexSelected(path);
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: 125,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ],
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text("Portfolio", style: TextStyle(fontSize: 25)),
            SizedBox(width: MediaQuery.of(context).size.width/6.5),
            Text("Alerts", style: TextStyle(fontSize: 12),),
            IconTheme(
              data: IconThemeData(
                size: 300,
                opacity: 100,
                color: Colors.yellow,
              ),
              child: IconButton(
                icon: Icon(Icons.warning),
                onPressed: addAlert,
              )
            )
        ],),
      ),
      body:
      Container(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Text("Total: \$100,000", style: TextStyle(fontSize: 40)),
            SizedBox(height: 30),
            Text("Stocks Owned:", style: TextStyle(fontSize: 40)),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 3),
              ),
              height: MediaQuery.of(context).size.height/2.5,
              width: MediaQuery.of(context).size.width,
              child: listViewBuild(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buttonFunc(context, "Sell", 4),
                buttonFunc(context, "Buy", 3),
            ],)
            ],
          ),
        )
    );

  }

  Widget listViewBuild(){
    if(globals.allStocks.length > 0){
      return ListView.builder(
                itemCount: globals.allStocks.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text("-" + globals.allStocks[index].name, style: TextStyle(fontSize: 20)),
                  );
                }
              );
    }else{
      return Text("No stocks currently owned", style: TextStyle(fontSize: 20));
    }
  }
}