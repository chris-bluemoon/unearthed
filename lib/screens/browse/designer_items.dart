import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/models/item.dart';
import 'package:unearthed/screens/browse/designer_item_card.dart';
import 'package:unearthed/screens/to_rent/to_rent.dart';
import 'package:unearthed/services/class_store.dart';

class DesignerItems extends StatefulWidget {
  const DesignerItems(this.brand, {super.key});

  final String brand;

  @override
  State<DesignerItems> createState() => _DesignerItemsState();
}

class _DesignerItemsState extends State<DesignerItems> {


 
     List<Item> designerItems = [];

    @override
    initState() {
      // getCurrentUser();
      designerItems = [];
      super.initState();
    }

  setBrandLogo(brand) {
    String brandName = brand.replaceAll(RegExp(' +'), '_');
    String imageName = 'assets/logos/$brandName.png'.toLowerCase();
    return imageName;
  }

  @override
  Widget build(BuildContext context) {
    // getCurrentUser();
    List<Item> allItems = Provider.of<ItemStore>(context, listen: false).items;
    for (Item item in allItems) {
      if (widget.brand == item.brand) {
        designerItems.add(item);
      }
    }
    log(widget.brand);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 100,
              child: Image.asset(
                setBrandLogo(widget.brand),
                // fit: BoxFit.contain,
                // height: 40,
              )
            ),
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
                        child: DesignerItemCard(designerItems[index]),
                        onTap: () {
                          log(designerItems[0].toString());
                            // log('About to rent ${value.designerItems[index].name}');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => (ToRent(designerItems[index]))));
                        }),
                    itemCount: designerItems.length,
                  ),
                );
              }),
 
            ],
          )),
    );
  }
}
