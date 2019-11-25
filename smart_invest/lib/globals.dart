
import 'package:flutter/material.dart';
import 'PortfolioBuy.dart';

final Color backgroud_colour = Color(0xfffd9099);
final Color app_bar_color = Color(0xffe38189);
List<Text> ownedStocks = [];
StockItems currentStock = new StockItems(name: "Apple", symbol: "APPL", price: 261.78, percent: -0.088, symbolName: "NASDAQ");
List<StockItems> allStocks = new List<StockItems>();