import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobileshop/database.dart';
import 'package:mobileshop/mobile_class.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'mobiles_list.dart';

class Add_mobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('add new mobile'),
          backgroundColor: Colors.redAccent,
          elevation: 0,

          leading: IconButton(icon: Icon(FontAwesomeIcons.arrowLeft), onPressed: () {Navigator.push(context,
            MaterialPageRoute(builder: (context) => MobileList()),
          );}),

        ),
        body: addMobile(),
      ),
    );
  }
}

class addMobile extends StatefulWidget{
  @override
  _AddingFormState createState() => _AddingFormState();
}
class _AddingFormState extends State<addMobile>{
  String _Mobile_name, _Mobile_storage, _Mobile_ram,_Mobile_frontCamera , _Mobile_backCamera ,_Mobile_Quantity, _Mobile_price, _Mobile_Location;

  GlobalKey<FormState> _key = new GlobalKey();
  MobileDatabase mobile_db = MobileDatabase();

  @override
  Widget build(BuildContext context){

    return SingleChildScrollView(child: Form(
      key: _key,
      child: Column(
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(top: 10.0),
            alignment: Alignment.topCenter,

            width:  MediaQuery.of(context).size.width,
            child:Column(
              children: <Widget>[
                TextFormField(
                style: TextStyle(fontSize: 20.0,color: Colors.black),
                decoration: InputDecoration(icon: Icon(Icons.smartphone),labelText: 'mobile name',fillColor: Colors.black26),
                onSaved: (value){
                  _Mobile_name = value;
                }

            ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 20.0,color: Colors.black),
                  decoration: InputDecoration(icon: Icon(Icons.storage),labelText: 'mobile storage'),
                  onSaved: (value){
                    _Mobile_storage = value;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 20.0,color: Colors.black),
                  decoration: InputDecoration(icon: Icon(Icons.smartphone),labelText: 'mobile ram'),
                  onSaved: (value){
                    _Mobile_ram = value;
                  },
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20.0,color: Colors.black),
                  decoration: InputDecoration(icon: Icon(Icons.camera_front),labelText: 'front camera'),
                  onSaved: (value){
                    _Mobile_frontCamera = value;
                  },
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20.0,color: Colors.black),
                  decoration: InputDecoration(icon: Icon(Icons.camera_rear),labelText: 'back camera'),
                  onSaved: (value){
                    _Mobile_backCamera = value;
                  },
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20.0,color: Colors.black),
                  decoration: InputDecoration(icon: Icon(Icons.link),labelText: 'photo URL'),
                  onSaved: (value){
                    _Mobile_Location= value;
                  },
                ),

                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(signed: false,decimal: true),
                  style: TextStyle(fontSize: 20.0,color: Colors.black),
                  decoration: InputDecoration(icon: Icon(Icons.attach_money),labelText: 'mobile price'),
                  onSaved: (value){
                    _Mobile_price= value;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 20.0,color: Colors.black),
                  decoration: InputDecoration(icon: Icon(Icons.check_circle),labelText: 'mobile quantity'),
                  onSaved: (value){
                    _Mobile_Quantity = value;
                  },
                ),

          SizedBox(
            height: 40,
          ),

          RaisedButton(
            color: Colors.redAccent,
            child: Text(
              'save',
              style:TextStyle(
                color: Colors.white,
                  fontSize: 20.0
              ),
            ),
            onPressed:(){
              if(_key.currentState.validate()){
                _key.currentState.save();
                mobile_db.addmobile(Mobiles(
                    Mobile_Name : _Mobile_name,
                    Mobile_storage : _Mobile_storage,
                    Mobile_ram: _Mobile_ram,
                    Mobile_Quantity: _Mobile_Quantity,
                    Mobile_price: _Mobile_price,
                    Mobile_Location: _Mobile_Location,
                    Mobile_frontCamera:_Mobile_frontCamera,
                    Mobile_backCamera:_Mobile_backCamera

                ));

              }
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => MobileList()),
              );
            },
          ),
        ],
      ),

    )
    ],
    ),
    ),);
  }

}
