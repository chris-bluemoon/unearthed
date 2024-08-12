import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/screens/to_rent/to_rent.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/shared/item_card.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class OccasionItems extends StatefulWidget {
  const OccasionItems(this.occasion, {super.key});

  final String occasion;

  @override
  State<OccasionItems> createState() => _OccasionItemsState();
}

class _OccasionItemsState extends State<OccasionItems> {


 
    List<Item> occasionItems = [];

    @override
    initState() {
      // getCurrentUser();
      occasionItems = [];
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    // getCurrentUser();
    List<Item> allItems = Provider.of<ItemStore>(context, listen: false).items;
    log('Size of allItems: ${allItems.length}');
    for (Item i in allItems) {
      log('checking: ${widget.occasion} vs database stored type: ${i.occasion}');
      if (widget.occasion == i.occasion) {
        occasionItems.add(i);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.occasion.toUpperCase(), style: const TextStyle(fontSize: 18)),
            // SizedBox(
            //   child: Image.asset(
            //     'assets/logos/eliya.png',
            //     // fit: BoxFit.contain,
            //     // height: 40,
            //   ),
            //   height: 50,
            //   width: 100
            // ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () =>
                  {Navigator.of(context).popUntil((route) => route.isFirst)},
              icon: const Icon(Icons.close)),
        ],
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
                        child: ItemCard(occasionItems[index]),
                        onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (ToRent(occasionItems[index]))));
                        }),
                    itemCount: occasionItems.length,
                  ),
                );
              }),
 
            ],
          )),
    );
  }
}
