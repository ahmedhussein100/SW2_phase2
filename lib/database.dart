import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileshop/mobile_class.dart';
class MobileDatabase{

  addmobile(Mobiles mobile){
    Firestore.instance.collection("Mobiles").add({
      'name' : mobile.Mobile_Name,
      'storage' : mobile.Mobile_storage,
      'ram' : mobile.Mobile_ram,
      'quantity' : mobile.Mobile_Quantity,
      'price' : mobile.Mobile_price,
      'mobile URL' : mobile.Mobile_Location,
      'front camera' : mobile.Mobile_frontCamera,
      'back camera' : mobile.Mobile_backCamera
    });
  }

  deletemobile(docId) {
    Firestore.instance.collection("Mobiles").document(docId).delete();
  }

  updateMobile(data, docId) {
    Firestore.instance
        .collection('Mobiles')
        .document(docId)
        .updateData(data);
  }
}

