import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/screens/browse/designer_items.dart';

class DesignerListView extends StatelessWidget {
  DesignerListView({super.key});

  final List<String> brands = ['BARDOT', 'HOUSE OF CB', 'LEXI', 'AJE', 'ALC', 'BRONX AND BANCO', 'ELIYA',
    'NADINE MERABI', 'REFORMATION', 'SELKIE', 'ZIMMERMANN', 'ROCOCO SAND', 'BAOBAB'];

  @override
  Widget build(BuildContext context) {
    brands.sort();
    return Column(
      children: [
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
              itemCount: brands.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => (DesignerItems(brands[index])))); 
                      },
                      child: ListTile(
                        dense: true,
                        visualDensity: VisualDensity(vertical: -2),
                        title: Text(brands[index], style: TextStyle(fontSize: 12)),
                      ),
                    ),
                    Divider(color: Colors.grey, indent: 20, endIndent: 20,),
                  ],
                );
              },
            ),
        ),
      ],
    );
  }
}