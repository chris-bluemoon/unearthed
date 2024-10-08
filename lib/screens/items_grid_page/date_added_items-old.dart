import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/screens/to_rent/to_rent.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/item_card.dart';
import 'package:unearthed/shared/styled_text.dart';
import 'package:uuid/uuid.dart';



var uuid = const Uuid();

class DateAddedItems extends StatefulWidget {
  const DateAddedItems(this.dateAdded, {super.key});

  final String dateAdded;

  @override
  State<DateAddedItems> createState() => _DateAddedItemsState();
}

class _DateAddedItemsState extends State<DateAddedItems> {

  void handleSubmit() {
    for (var i = 0; i < allItems.length; i++) {
      Provider.of<ItemStore>(context, listen: false).addItem(Item(
        id: uuid.v4(),
        type: allItems[i].type,
        bookingType: allItems[i].bookingType,
        occasion: allItems[i].occasion,
        dateAdded: allItems[i].dateAdded,
        style: allItems[i].style,
        name: allItems[i].name,
        brand: allItems[i].brand,
        colour: allItems[i].colour,
        size: allItems[i].size,
        length: allItems[i].length,
        print: allItems[i].print,
        sleeve: allItems[i].sleeve,
        rentPrice: allItems[i].rentPrice,
        buyPrice: allItems[i].buyPrice,
        rrp: allItems[i].rrp,
        description: allItems[i].description,
        bust: allItems[i].bust,
        waist: allItems[i].waist,
        hips: allItems[i].hips,
        longDescription: allItems[i].longDescription,
        imageId: allItems[i].imageId,
        // isFav: allItems[i].isFav,
    ));
    }

  }
 
    List<Item> dateAddedItems = [];

    @override
    initState() {
      // getCurrentUser();
      dateAddedItems = [];
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;
    // getCurrentUser();
    List<Item> allItems = Provider.of<ItemStore>(context, listen: false).items;
    
    for (Item i in allItems) {
      log('checking: ${widget.dateAdded} vs database stored type: ${i.dateAdded}');
      DateFormat format = DateFormat("dd-MM-yyyy");
      DateTime dateSupplied = format.parse(widget.dateAdded);
      DateTime dateAdded = format.parse(i.dateAdded);
      if (dateAdded.isAfter(dateSupplied)) {
        dateAddedItems.add(i);
      }
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.2,
        title: const StyledTitle('LATEST ADDITIONS'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:  Icon(Icons.chevron_left, size: width*0.08),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () =>
        //           {Navigator.of(context).popUntil((route) => route.isFirst)},
        //       icon: Icon(Icons.close, size: width*0.06)),
        // ],
      ),

      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Consumer<ItemStore>(
                  // child not required
                  builder: (context, value, child) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.5),
                    itemBuilder: (_, index) => GestureDetector(
                        child: ItemCard(dateAddedItems[index]),
                        onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (ToRent(dateAddedItems[index]))));
                        }),
                    itemCount: dateAddedItems.length,
                  ),
                );
              }),
              // if (Provider.of<ItemStore>(context, listen: false).renter.name == 'uneartheduser')
              TextButton (
                onPressed: () {
                  handleSubmit();
                  // addItemsAll();
                },
                child: const Text('ADD'),
              )
 
            ],
          )),
    );
  }
}
