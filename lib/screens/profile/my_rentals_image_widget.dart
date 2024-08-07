import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:unearthed/screens/summary/congrats.dart';
import 'package:unearthed/screens/to_rent/confirm_rent.dart';
import 'package:unearthed/screens/to_rent/rent_this_next_bar.dart';
import 'package:unearthed/screens/summary/summary.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/models/item_renter.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:unearthed/globals.dart' as globals;

class MyRentalsImageWidget extends StatelessWidget {
  MyRentalsImageWidget(this.itemId, this.startDate, this.endDate, this.price,
      {super.key});

  final String itemId;
  final String startDate;
  final String endDate;
  final int price;

  late String itemType;
  late String itemName;
  late String brandName;
  late String imageName;
  late Item item;

  String setItemImage() {
    itemType = item.type.replaceAll(RegExp(' +'), '_');
    itemName = item.name.replaceAll(RegExp(' +'), '_');
    brandName = item.brand.replaceAll(RegExp(' +'), '_');
    imageName = '${brandName}_${itemName}_${itemType}_1.jpg';
    return imageName;
  }

  @override
  Widget build(BuildContext context) {
    List<Item> allItemes =
        Provider.of<ItemStore>(context, listen: false).items;
    DateTime fromDate = DateTime.parse(startDate);
    DateTime toDate = DateTime.parse(endDate);
    String fromDateString = DateFormat('d MMMM, y').format(fromDate);
    String toDateString = DateFormat('d MMMM, y').format(toDate);
    // yMMMMd('en_US')
    for (Item d in allItemes) {
      if (d.id == itemId) {
        log('item id');
        item = d;
      }
    }
    ColorFilter greyscale = ColorFilter.matrix(<double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);
    if (toDate.isBefore(DateTime.now().add(const Duration(days: 10)))) {
      greyscale = ColorFilter.matrix(<double>[
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
      ]);
    } else {
      greyscale = ColorFilter.mode(Colors.transparent, BlendMode.multiply);
    }
    return Card(
        color: Colors.white,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ColorFiltered(
                    colorFilter: greyscale,
                    child: Image.asset(
                        'assets/img/new_items/${setItemImage()}',
                        fit: BoxFit.fitHeight,
                        height: 100,
                        width: 80))),
            SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${item.name} from ${item.brand}',
                    style: TextStyle(fontSize: 14)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text('From', style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5))),
                    SizedBox(width: 30),
                    Text(fromDateString, style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.5))),
                  ],
                ),
                Row(
                  children: [
                    Text('To', style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5))),
                    SizedBox(width: 47),
                    Text(toDateString,
                        style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.5))),
                  ],
                ),
                Text('Price ${price.toString()}${globals.thb}',
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.5))),
              ],
            )
          ],
        ));
  }
}
