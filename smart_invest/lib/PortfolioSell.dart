import 'package:flutter/material.dart';
import 'package:smart_invest/PracticeNavigation.dart';
import 'globals.dart' as globals;

class PortfolioSell extends StatefulWidget {
  _PortfolioSellState createState() => _PortfolioSellState();
}

class _PortfolioSellState extends State<PortfolioSell> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => PracticeNavigation()));
          },
          ),         
        title: Text("Sell Stocks"),
      ),
      body: DataTable(
        columnSpacing: MediaQuery.of(context).size.width / 30,
        columns: <DataColumn>[
          DataColumn(
            label: Text("Name"),
          ),
          DataColumn(
            label: Text("Sym"),
          ),
          DataColumn(
            label: Text("Price"),
          ),
          DataColumn(
            label: Text("Qty"),
          ),
          DataColumn(
            label: Text("Ttl"),
          ),
          DataColumn(
            label: Text("Sell"),
          ),
        ],
        rows: globals.allStocks
            .map((stock) => DataRow(cells: [
                  DataCell(Text(stock.name)),
                  DataCell(Text(stock.symbol)),
                  DataCell(Text("\$" + stock.price.toString())),
                  DataCell(Text(stock.quantity.toString())),
                  DataCell(
                      Text("\$" + (stock.price * stock.quantity).toString())),
                  DataCell(SizedBox(
                    width: 60,
                    height: 30, // specific value
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          globals.allStocks.remove(stock);
                        });
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        width: 80,
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
                            "Sell",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
                ]))
            .toList(),
      ),
    );
  }
}
