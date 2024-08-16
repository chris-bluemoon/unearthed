import 'dart:developer';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:unearthed/shared/html_template.dart';
import 'package:unearthed/shared/secure_repo.dart';

class EmailComposer2 {
  EmailComposer2(this.emailAddress, this.itemType, this.userName, this.itemName, this.itemBrand, this.startDate, this.endDate, this.deliveryPrice, this.price, this.deposit);

  String emailAddress;
  String itemType;
  String userName;
  String itemName;
  String itemBrand;
  String startDate;
  String endDate;
  int deliveryPrice;
  String price;
  String deposit;
  
  String htmlbody = body;


  MyStore myStore = MyStore();

  String _textSelect(String str) {
    str = str.replaceAll('*|ITEM_TYPE|*!', itemType);
    str = str.replaceAll('*|FNAME|*!', '$userName,');
    str = str.replaceAll('*|ITEM_NAME|*!', itemName);
    str = str.replaceAll('*|ITEM_BRAND|*!', itemBrand);
    str = str.replaceAll('*|START_DATE|*!', startDate);
    str = str.replaceAll('*|END_DATE|*!', endDate);
    str = str.replaceAll('*|DELIVERY_OPTION|*!', setDeliveryText(deliveryPrice));
    str = str.replaceAll('*|PRICE|*!', '$price THB');
    str = str.replaceAll('*|DEPOSIT|*!', '$deposit THB');
    str = str.replaceAll('https://line.me/R/unearthedcollections', 'https://lin.ee/ZnlhXmE');
    str = str.replaceAll('Hello,', 'Hello');
    str = str.replaceAll('Thanks', 'thanks');
    // str = str.replaceAll('https://line.me/R/unearthedcollections', 'https://line.me/R/ZnlhXmE');
    // str = str.replaceAll('Screenshot 2024-07-18 161558.png', imageName)
    return str;
  }

  setDeliveryText(deliveryPrice) {

    if (deliveryPrice > 0) {
      return 'We will contact you one day before the booking to arrange full payment delivery.';
    } else {
      return 'Please contact us one day before the booking to arrange full payment and collection.';
    }
  }

  Future<void> sendEmail2() async {
    String? myvar = await MyStore.readFromStore();
    final smtpServer = SmtpServer('smtp.gmail.com',
        username: 'chris@unearthedcollections.com', password: myvar);

    final message = Message()
      ..from = const Address('support@unearthedcollections.com', 'Support')
      ..recipients.add(emailAddress)
      ..subject = 'Congratulations!'
      ..text = ''
      // ..html = body.replaceAll('*|FNAME|*!', emailAddress);
      ..html = _textSelect(body);
      // ..html = body.replaceAll('{{NAME}}', emailAddress);
      // ..html = body.body.replaceAll('{{NAME'}}')


    try {
      final sendReport = await send(message, smtpServer);
      // print('Message sent: ${sendReport.sent}');
      log('Message sent: ${sendReport.toString()}');
      // Additional code for feedback to the user
    } catch (e) {
      log('Error occurred while sending email: $e');
      // Additional code for error handling
    }
  }

}
