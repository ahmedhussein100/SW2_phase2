import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'mobiles_list.dart';



class UpdateMobile extends StatefulWidget{
  DocumentSnapshot doc;
  UpdateMobile(this.doc);
  @override
  _UpdateMobileState createState() => _UpdateMobileState();
}
class _UpdateMobileState extends State<UpdateMobile>{
  String _Mobile_name, _Mobile_storage, _Mobile_ram, _Mobile_frontCamera , _Mobile_backCamera, _Mobile_Quantity, _Mobile_price, _Mobile_Location;

  GlobalKey<FormState> _key = new GlobalKey();
  MobileDatabase mobile_db = MobileDatabase();

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('update mobile'),
          backgroundColor: Colors.redAccent,
          elevation: 0,

          leading: IconButton(icon: Icon(FontAwesomeIcons.arrowLeft), onPressed: () {Navigator.push(context,
            MaterialPageRoute(builder: (context) => MobileList()),
          );}),

        ),
        body:SingleChildScrollView(child: Form(
          key: _key,
          child: Column(
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(top: 10.0),
                alignment: Alignment.topCenter,
                width:  MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: TextStyle(fontSize: 20.0,color: Colors.black),
                      decoration: InputDecoration(icon: Icon(Icons.smartphone),labelText: 'mobile name',fillColor: Colors.black26),
                      onSaved: (value){
                        _Mobile_name = value;
                      },
                      initialValue:widget.doc.data['name'],
                    ),

                    TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20.0,color: Colors.black),
                      decoration: InputDecoration(icon: Icon(Icons.storage),labelText: 'mobile storage'),
                      onSaved: (value){
                        _Mobile_storage = value;
                      },
                      initialValue:widget.doc.data['storage'],

                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20.0,color: Colors.black),
                      decoration: InputDecoration(icon: Icon(Icons.smartphone),labelText: 'mobile ram'),
                      onSaved: (value){
                        _Mobile_ram = value;
                      },
                      initialValue:widget.doc.data['ram'],

                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 20.0,color: Colors.black),
                      decoration: InputDecoration(icon: Icon(Icons.camera_front),labelText: 'front camera'),
                      onSaved: (value){
                        _Mobile_frontCamera = value;
                      },
                      initialValue:widget.doc.data['front camera'],
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 20.0,color: Colors.black),
                      decoration: InputDecoration(icon: Icon(Icons.camera_rear),labelText: 'back camera'),
                      onSaved: (value){
                        _Mobile_backCamera = value;
                      },
                      initialValue:widget.doc.data['back camera'],
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 20.0,color: Colors.black),
                      decoration: InputDecoration(icon: Icon(Icons.link),labelText: 'photo URL'),
                      onSaved: (value){
                        _Mobile_Location= value;
                      },
                      initialValue:widget.doc.data['mobile URL'],

                    )
                    ,
                    TextFormField(
                      keyboardType: TextInputType.numberWithOptions(signed: false,decimal: true),
                      style: TextStyle(fontSize: 20.0,color: Colors.black),
                      decoration: InputDecoration(icon: Icon(Icons.attach_money),labelText: 'mobile price'),
                      onSaved: (value){
                        _Mobile_price= value;
                      },
                      initialValue:widget.doc.data['price'],

                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20.0,color: Colors.black),
                      decoration: InputDecoration(icon: Icon(Icons.check_circle),labelText: 'mobile quantity'),
                      onSaved: (value){
                        _Mobile_Quantity = value;
                      },
                      initialValue:widget.doc.data['quantity'],

                    )
                    ,
                    SizedBox(
                      height: 40,
                    ),

                    RaisedButton(
                      color: Colors.redAccent,
                      child: Text(
                        'save changes',
                        style:TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
                      onPressed:(){

                        if(_key.currentState.validate()){
                          _key.currentState.save();
                          mobile_db.updateMobile({
                            'name' : _Mobile_name,
                            'storage' : _Mobile_storage,
                            'ram': _Mobile_ram,
                            'quantity': _Mobile_Quantity,
                            'price': _Mobile_price ,
                            'mobile URL': _Mobile_Location,
                            'front camera': _Mobile_frontCamera,
                            'back camera':_Mobile_backCamera
                          }
                              ,widget.doc.documentID
                          );

                        }
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MobileList()),
                        );
                      },
                    ),
                  ],
                ),

              ),
            ],
          ),
        ),
        ),
      ),);
  }

}
