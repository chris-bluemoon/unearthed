import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

List<Item> myItems = [
Item(id: '-', type: 'dress', name: 'Imory', brand: 'BARDOT', colour: 'Biege-Nude', size: 8, rentPrice: 2500, rrp: 16000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Carmelita', brand: 'HOUSE OF CB', colour: 'Biege-Nude', size: 6, rentPrice: 900, rrp: 8500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Laetitia', brand: 'HOUSE OF CB', colour: 'Biege-Nude', size: 8, rentPrice: 900, rrp: 7500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Rafaela', brand: 'HOUSE OF CB', colour: 'Biege-Nude', size: 6, rentPrice: 1600, rrp: 10000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Riley', brand: 'LEXI', colour: 'Biege-Nude', size: 8, rentPrice: 1500, rrp: 11000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Cartellina', brand: 'BARDOT', colour: 'Black', size: 8, rentPrice: 1200, rrp: 16000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Hayden', brand: 'BARDOT', colour: 'Black', size: 8, rentPrice: 900, rrp: 5500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Ira', brand: 'BARDOT', colour: 'Black', size: 8, rentPrice: 1200, rrp: 9200, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Wyatt', brand: 'BARDOT', colour: 'Black', size: 8, rentPrice: 2500, rrp: 16000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Elinor', brand: 'ELIYA', colour: 'Black', size: 8, rentPrice: 3200, rrp: 14000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Flavia', brand: 'LEXI', colour: 'Black', size: 6, rentPrice: 1000, rrp: 8000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Maya', brand: 'LEXI', colour: 'Black', size: 8, rentPrice: 2500, rrp: 16000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Violette', brand: 'AJE', colour: 'Blue', size: 8, rentPrice: 3000, rrp: 19000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Delfina', brand: 'ALC', colour: 'Blue', size: 8, rentPrice: 2300, rrp: 25300, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Georgette', brand: 'HOUSE OF CB', colour: 'Blue', size: 6, rentPrice: 1500, rrp: 9000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Imogen', brand: 'HOUSE OF CB', colour: 'Blue', size: 8, rentPrice: 1000, rrp: 8300, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Salome', brand: 'HOUSE OF CB', colour: 'Blue', size: 8, rentPrice: 1200, rrp: 8300, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Isadora', brand: 'LEXI', colour: 'Blue', size: 6, rentPrice: 800, rrp: 6500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Polkadot', brand: 'ZIMMERMANN', colour: 'Blue', size: 8, rentPrice: 2900, rrp: 62000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Paradiso', brand: 'AJE', colour: 'Floral Print', size: 4, rentPrice: 3500, rrp: 29000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Olea', brand: 'BARDOT', colour: 'Floral Print', size: 6, rentPrice: 700, rrp: 6000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Francesca', brand: 'ELIYA', colour: 'Floral Print', size: 6, rentPrice: 3000, rrp: 13000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Carmen', brand: 'HOUSE OF CB', colour: 'Floral Print', size: 6, rentPrice: 900, rrp: 7000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Sheena', brand: 'LEXI', colour: 'Floral Print', size: 6, rentPrice: 1200, rrp: 9000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Lola', brand: 'NADINE MERABI', colour: 'Floral Print', size: 8, rentPrice: 2100, rrp: 23000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Aribella', brand: 'REFORMATION', colour: 'Floral Print', size: 8, rentPrice: 1200, rrp: 11000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Anais', brand: 'ROCOCO SAND', colour: 'Floral Print', size: 8, rentPrice: 2200, rrp: 20000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: 'Lamour', brand: 'SELKIE', colour: 'Floral Print', size: 6, rentPrice: 1800, rrp: 9500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  // No images found
  Item(id: '-', type: 'dress', name: "Kiss On The Lips", brand: 'SELKIE', colour: 'Floral Print', size: 6, rentPrice: 1800, rrp: 9500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Cosmic", brand: 'ZIMMERMANN', colour: 'Floral Print', size: 8, rentPrice: 3500, rrp: 45000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Applique", brand: 'ZIMMERMANN', colour: 'Floral Print', size: 8, rentPrice: 3000, rrp: 35000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Carla", brand: 'ELIYA', colour: 'Gold', size: 6, rentPrice: 3000, rrp: 13500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  // Not sure what this is
  // Item(id: '-', type: 'dress', name: "Gold", brand: 'UNEARTHED COLLECTIONS', colour: 'Gold', size: 8, rentPrice: 1500, rrp: 8000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Faye", brand: 'HOUSE OF CB', colour: 'Green', size: 6, rentPrice: 1300, rrp: 9000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Mathilde", brand: 'AJE', colour: 'Pink', size: 4, rentPrice: 3000, rrp: 16000, description: 'Aje The Mathilde Bubble Hem Midi ItemS', bust: '', waist: '', hips: '', longDescription: 'The Mathilde Bubble Hem Midi Item features pleating through to the drop waist and a voluminous bubble neckline and skirt. A statement style for any occasion, wear with your favourite Aje heel.', ),
  Item(id: '-', type: 'dress', name: "Tidal", brand: 'AJE', colour: 'Pink', size: 4, rentPrice: 3000, rrp: 13500, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Ribera", brand: 'BAOBAB', colour: 'Pink', size: 6, rentPrice: 1600, rrp: 12000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Farah", brand: 'BRONX AND BANCO', colour: 'Pink', size: 8, rentPrice: 3700, rrp: 32000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Genevieve", brand: 'HOUSE OF CB', colour: 'Pink', size: 6, rentPrice: 2000, rrp: 10000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Tuxedo", brand: 'ZIMMERMANN', colour: 'Pink', size: 8, rentPrice: 3000, rrp: 35000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Esme", brand: 'ELIYA', colour: 'Red', size: 6, rentPrice: 3000, rrp: 14000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Candice", brand: 'NADINE MERABI', colour: 'Red', size: 8, rentPrice: 1900, rrp: 13000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Flor", brand: 'REFORMATION', colour: 'Red', size: 6, rentPrice: 1200, rrp: 12900, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Socorro", brand: 'HOUSE OF CB', colour: 'Silver', size: 6, rentPrice: 1000, rrp: 8200, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Elia", brand: 'HOUSE OF CB', colour: 'White', size: 6, rentPrice: 1000, rrp: 7000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Belinda", brand: 'LEXI', colour: 'White', size: 8, rentPrice: 1500, rrp: 10000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
  Item(id: '-', type: 'dress', name: "Odessey", brand: 'ZIMMERMANN', colour: 'White', size: 6, rentPrice: 5000, rrp: 53000, description: 'Short Description', bust: '', waist: '', hips: '', longDescription: '', ),
];

class Item {
  
  Item({required this.id, 
          required this.type, 
          required this.name, 
          required this.brand, 
          required this.colour, 
          required this.size, 
          required this.rentPrice, 
          required this.rrp,
          required this.description,
          required this.bust,
          required this.waist,
          required this.hips,
          required this.longDescription,
        });

    String id;
    String type;
    String name;
    String brand;
    String colour;
    int size;
    int rentPrice;
    int rrp;
    String description;
    String bust;
    String waist;
    String hips;
    String longDescription;
    


  // item to firestore (map, bust: '', waist: '', hips: '', )
  Map<String, dynamic> toFirestore() {
    return {
      'type': type,
      'name': name,
      'brand': brand,
      'colour': colour,
      'size': size,
      'rentPrice': rentPrice,
      'rrp': rrp,
      'description': description,
      'bust': bust,
      'waist': waist,
      'hips': hips,
      'longDescription': longDescription,
    };
  }

  // character from firestore
  factory Item.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {

    // get data from snapshot
    final data = snapshot.data()!;

    // make character instance
    Item item = Item(
      id: snapshot.id,
      type: data['type'],
      name: data['name'],
      brand: data['brand'],
      colour: data['colour'],
      size: data['size'],
      rentPrice: data['rentPrice'],
      rrp: data['rrp'],
      description: data['description'],
      bust: data['bust'],
      waist: data['waist'],
      hips: data['hips'],
      longDescription: data['longDescription'],
    );

    return item;
  } 
  
  
}
