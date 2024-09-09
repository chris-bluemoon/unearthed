import 'dart:developer';

double sgdthb = 25.76;
String symbol = '?';

String getCurrencySymbol (String country) {
  switch (country) {
    case 'SINGAPORE':
      symbol = '\$';
  }

  return symbol;
}
String convertFromTHB (int value, String country) {

  double convertedCurrency = 0;
  int roundedFinalValue = 0;


  switch (country) {
    case 'SINGAPORE':
      convertedCurrency = (value / sgdthb);
      // roundedFinalValue = (convertedCurrency ~/ 5) * 5;
      roundedFinalValue = (convertedCurrency / 5).ceil() * 5;
      break;
  }
  log('Given value was ${value.toString()}');
  log('Rounded return value: ${roundedFinalValue.toString()}');
  return roundedFinalValue.toString();
}