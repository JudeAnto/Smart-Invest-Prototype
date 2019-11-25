import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class PortfolioBuy extends StatefulWidget {
  final Function(int) newIndexSelected;
  PortfolioBuy({Key key, this.newIndexSelected}) : super(key: key);

  @override
  _PortfolioBuyState createState() => _PortfolioBuyState();
}

class _PortfolioBuyState extends State<PortfolioBuy> {
  Widget appBarTitle = Text(
    "Search Stock to Buy",
    style: TextStyle(color: Colors.white),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  List<StockItems> stockList;
  bool searching = false;
  String _searchText = "";

  _PortfolioBuyState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          searching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          searching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    searching = false;
    init();
  }

  void init() {
    stockList = List<StockItems>();
    stockList.add(StockItems(
        name: "Apple",
        symbol: "APPL",
        price: 261.78,
        percent: -0.088,
        symbolName: "NASDAQ"));
    stockList.add(StockItems(
        name: "Amazon",
        symbol: "AMZN",
        price: 1745.72,
        percent: 0.63,
        symbolName: "NASDAQ"));
    stockList.add(StockItems(
        name: "Facebook",
        symbol: "FB",
        price: 198.82,
        percent: 0.45,
        symbolName: "NASDAQ"));
    stockList.add(StockItems(
        name: "IBM Common Stock",
        symbol: "IBM",
        price: 134.34,
        percent: 0.39,
        symbolName: "NYSE"));
    stockList.add(StockItems(
        name: "Lyft Inc",
        symbol: "LYFT",
        price: 46.46,
        percent: -0.064,
        symbolName: "NASDAQ"));
    stockList.add(StockItems(
        name: "Microsoft Corporation",
        symbol: "MSFT",
        price: 0.074,
        percent: -0.088,
        symbolName: "NASDAQ"));
    stockList.add(StockItems(
        name: "Shopify",
        symbol: "SHOP",
        price: 314.52,
        percent: -0.49,
        symbolName: "TSE"));
    stockList.add(StockItems(
        name: "Snap Inc",
        symbol: "SNAP",
        price: 15.26,
        percent: 1.26,
        symbolName: "NYSE"));
    stockList.add(StockItems(
        name: "Tesla Inc",
        symbol: "TSLA",
        price: 333.04,
        percent: -6.14,
        symbolName: "NASDAQ"));
    stockList.add(StockItems(
        name: "Twitter Inc",
        symbol: "TWTR",
        price: 30.03,
        percent: 0.77,
        symbolName: "NYSE"));
    stockList.add(StockItems(
        name: "Uber Technologies Inc",
        symbol: "UBER",
        price: 29.56,
        percent: 0.34,
        symbolName: "NYSE"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: buildBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: searching ? _buildSearchList() : _buildList(),
      ),
    );
  }

  List<ChildItem> _buildList() {
    return stockList
        .map((stock) => ChildItem(stock, widget.newIndexSelected))
        .toList();
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return stockList
          .map((stock) => ChildItem(stock, widget.newIndexSelected))
          .toList();
    } else {
      List<StockItems> _searchList = List();
      for (int i = 0; i < stockList.length; i++) {
        if (stockList
            .elementAt(i)
            .name
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          _searchList.add(stockList.elementAt(i));
        }
      }
      return _searchList
          .map((stock) => ChildItem(stock, widget.newIndexSelected))
          .toList();
    }
  }

  Widget buildBar(BuildContext context) {
    return AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
      IconButton(
        icon: actionIcon,
        onPressed: () {
          setState(() {
            if (this.actionIcon.icon == Icons.search) {
              this.actionIcon = Icon(
                Icons.close,
                color: Colors.white,
              );
              this.appBarTitle = TextField(
                controller: _searchQuery,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: "Search.....",
                    hintStyle: TextStyle(color: Colors.white)),
              );
              searchStart();
            } else {
              searchEnd();
            }
          });
        },
      ),
    ]);
  }

  void searchStart() {
    setState(() {
      searching = true;
    });
  }

  void searchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = Text(
        "Search Stock to Buy",
        style: TextStyle(color: Colors.white),
      );
      searching = false;
      _searchQuery.clear();
    });
  }
}

class ChildItem extends StatelessWidget {
  final StockItems stock;
  final Function(int) newIndexSelected;

  ChildItem(this.stock, this.newIndexSelected);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        globals.currentStock = this.stock;
        this.newIndexSelected(5);
      },
      child: ListTile(title: Text(this.stock.name)),
    );
  }
}

class StockItems {
  final String name;
  final String symbol;
  final double price;
  final double percent;
  final String symbolName;
  int quantity;

  StockItems(
      {this.name, this.symbol, this.price, this.percent, this.symbolName, this.quantity=1});
}

class BuyStockItem extends StatefulWidget {
  final StockItems stock;

  BuyStockItem({this.stock});

  _BuyStockItemState createState() => _BuyStockItemState();
}

class _BuyStockItemState extends State<BuyStockItem> {
  final quantityController = TextEditingController();
  int quantity = 1; 

  Future<void> _alertBuy() async{
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Purchase Stock"),
          content: SingleChildScrollView(
            child: Text("Are you sure you want to purchase this stock?")
          ),
          actions: <Widget>[
            FlatButton(
              child:Text('Yes'),
              onPressed: (){
                widget.stock.quantity = quantity;
                globals.allStocks.add(widget.stock);
                Navigator.pushNamed(context, '/practice_navigation');
              },
            ),
            FlatButton(
              child:Text('No'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.stock.name),
      ),
      body: SingleChildScrollView ( 
        child: Container(
          padding: EdgeInsets.only(top: 50, left: MediaQuery.of(context).size.width/10, right: 10, bottom: 10),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Text("Symbol: " + widget.stock.symbolName + ":" + widget.stock.symbol, style: TextStyle(fontSize: 20)),
              ],),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                Text("Price: \$" + widget.stock.price.toString(), style: TextStyle(fontSize: 20)),
                Text("USD")
              ],),
              SizedBox(height: 10),
              Row(children: <Widget>[
                Text("Performance: " + widget.stock.percent.toString() + "%", style: TextStyle(fontSize: 20)),
              ],),
              SizedBox(height:10),
              Row(children: <Widget>[
                Text("Choose Quantity: ", style: TextStyle(fontSize: 20)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  SizedBox(
                  width: 40,
                  height: 30,
                  child: TextField(
                    controller: quantityController,
                    onChanged: (text){
                      setState(() {
                        quantity =  int.parse(text);
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '1'
                  ),
                ),
                ),
                ],)
              ],),
              SizedBox(height: 10),
              Row(children: <Widget>[
                Text("Total Cost: \$" + (widget.stock.price*quantity).toString(), style: TextStyle(fontSize: 20)),
                Text("USD")
              ],),
              SizedBox(height: 10),
              Row(children: <Widget>[
                Text("Unit Being Bought: " + quantity.toString(), style: TextStyle(fontSize: 20)),
              ],),
              SizedBox(height: MediaQuery.of(context).size.height/3),
              Row(children: <Widget>[
                SizedBox(width: MediaQuery.of(context).size.width/6,),
                Container(
                width: 200, // specific value
                child: RaisedButton(
                  onPressed: () {
                    _alertBuy();
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: 200,
                    alignment: Alignment.center,
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
                        "Buy Stock",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ],)
            ],
          )),
      ),
    );
  }
}


