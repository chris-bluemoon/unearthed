import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unearthed/models/dress.dart';
import 'package:unearthed/models/renter.dart';
import 'package:unearthed/models/dress_renter.dart';
import 'package:unearthed/services/firestore_service.dart';

class DressStore extends ChangeNotifier {

  final List<Dress> _dresses = [];
  final List<Dress> _favourites = [];
  final List<Renter> _renters = [];
  final List<DressRenter> _dressRenters = [];
  // TODO: Revert back to late initialization if get errors with this
  // late final _user;
  Renter _user = Renter(id: '', email: '', name: '', size: 0, address: '', phoneNum: '', favourites: []);
  // final List<Dress> _dresses = [
  //   Dress(id: '1', name: 'Mathilde Bubble', brand: 'AJE', size: 52, rentPrice: 1200, rrp: 12000),
  //   Dress(id: '2', name: 'Carla', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000),
  //   Dress(id: '3', name: 'Elinor', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000),
  //   Dress(id: '4', name: 'Francesca Mini', brand: 'ELIYA', size: 52, rentPrice: 1200, rrp: 12000),
  //   Dress(id: '5', name: 'Dione', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000),
  //   Dress(id: '6', name: 'Riley Chiffon', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000),
  //   Dress(id: '7', name: 'Sheena', brand: 'LEXI', size: 52, rentPrice: 1200, rrp: 12000),
  // ];

  get dresses => _dresses;
  get favourites => _favourites;
  get renters => _renters;
  get dressRenters => _dressRenters;
  get renter => _user;

  // add dress
  // void addCharacter(Dress dress) {
  //   _dresses.add(dress);
  //   notifyListeners();
  // }

  void addFavourite(Dress dress) async {
    // await FirestoreService.addDress(dress);
    _favourites.add(dress);
    notifyListeners();
  }

  // void addAllFavourites() {
  //   Dress d;
  //   log('_dresses size is: ${_dresses.length}');
  //   for (d in _dresses) {
  //     if (d.isFav == true) {
  //       _favourites.add(d);
  //     }

  //   }
  // }

  // assign the user
  void assignUser(Renter user) async {
    // await FirestoreService.addDress(dress);
    _user = user;
    notifyListeners();
  }


  // // remove the user
  // void unassignUser(Renter user) async {
  //   // await FirestoreService.addDress(dress);
  //   _user = null;
  //   notifyListeners();
  // }

  // add character
  void addDress(Dress dress) async {
    await FirestoreService.addDress(dress);
    _dresses.add(dress);
    notifyListeners();
  }

  // add character
  void toggleDressFav(Dress dress) async {
    log('Updating dress with new value: ${dress.isFav}');
    if (dress.isFav == true) {
      _favourites.add(dress);
    } else {
      _favourites.remove(dress);
    }
    log('List of favourites');
    for (Dress d in _favourites) {
      log(d.name);
    }
    await FirestoreService.updateDress(dress);
    notifyListeners();
  }

  void addRenter(Renter renter) async {
    await FirestoreService.addRenter(renter);
    _renters.add(renter);
    log(_renters.toString());
    notifyListeners();
  }

  void saveRenter(Renter renter) async {
    await FirestoreService.updateRenter(renter);
    // _renters[0].address = renter.address;
      // _user.address = renter.address;
    return;
  }

  void addRenterAppOnly(Renter renter) {
    _renters.add(renter);
  }
  // add dressRenter
  void addDressRenter(DressRenter dressRenter) async {
    await FirestoreService.addDressRenter(dressRenter);
    _dressRenters.add(dressRenter);
    notifyListeners();
  }

    // initially fetch dresses
  void fetchDressesOnce() async {
    if (dresses.length == 0) {
      final snapshot = await FirestoreService.getDressesOnce();
      for (var doc in snapshot.docs) {
        _dresses.add(doc.data());
        if (doc.data().isFav) {
          _favourites.add(doc.data());
        }
      }

      notifyListeners();
    }
  }

  // initially fetch dressRenters
  void fetchDressRentersOnce() async {
    if (dressRenters.length == 0) {
      final snapshot = await FirestoreService.getDressRentersOnce();
      for (var doc in snapshot.docs) {
        _dressRenters.add(doc.data());
      }
      notifyListeners();
    }
  }

  // initially fetch renters
  void fetchRentersOnce() async {
    if (renters.length == 0) {
      final snapshot = await FirestoreService.getRentersOnce();
      for (var doc in snapshot.docs) {
        _renters.add(doc.data());
        }
      }
      log("Renters populated with lenght ${_renters.length}");
      log(_renters[0].favourites.toString());
      notifyListeners();
    }
}
