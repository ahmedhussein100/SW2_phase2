import 'package:cloud_firestore/cloud_firestore.dart';
import 'Update_mobile.dart';
import 'database.dart';
import 'package:flutter/material.dart';
import 'package:mobileshop/add_mobile.dart';

MobileDatabase db = MobileDatabase();
class MobileList extends StatefulWidget{
  @override
  _MobileListState createState()  => new _MobileListState();

}
class _MobileListState extends State<MobileList>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mobile shop',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('mobiles'),
          backgroundColor: Colors.redAccent,

        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection("Mobiles").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return MobileListView(documents: snapshot.data.documents);
          },
        ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add,color: Colors.white,),
              backgroundColor: Colors.redAccent,
              onPressed: () { Navigator.push(context,
                MaterialPageRoute(builder: (context) => Add_mobile()),
              );}

      ),
    ),
    );
  }}
class MobileListView extends StatelessWidget {
  final List<DocumentSnapshot> documents;

  MobileListView({this.documents});
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount:  documents.length,
          padding: EdgeInsets.only(top: 12.0),
          itemBuilder: (context , position){
            return Column(

              children: <Widget>[
                Divider(height: 6.0,),

                Column(
                    children: <Widget>[
                      Divider(height: 6.0,color: Colors.black26,thickness:1.0 ,),

                      Image.network('${ documents[position].data['mobile URL']}',width: 250,height: 250,),
                      ListTile(
                        title: Text(
                          ' ${ documents[position].data['name']}',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 40.0,
                          ),
                          textAlign: TextAlign.center,
                        ) ,


                        subtitle: Text(
                          'storage : ${ documents[position].data['storage']}  ' + "\n"
                              'ram : ${ documents[position].data['ram']}' + "\n"
                              'front camera : ${ documents[position].data['front camera']}' + "\n"
                              'rear camera : ${ documents[position].data['back camera']}' + "\n"
                              'price : ${ documents[position].data['price']}' + "\n"
                              'quantity : ${ documents[position].data['quantity']}' + "\n"
                              , style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 50,
                          ),
                      RaisedButton(
                        color: Colors.redAccent,
                        child: Text(
                          'update',
                          style:TextStyle(
                              color: Colors.white,
                              fontSize: 20.0
                          ),
                        ),
                        onPressed:(){Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UpdateMobile(documents[position])),
                        );},
                      ),SizedBox(
                            width: 100,
                          ),
                      RaisedButton(
                        color: Colors.redAccent,
                        child: Text(
                          'delete',
                          style:TextStyle(
                              color: Colors.white,
                              fontSize: 20.0
                          ),
                        ),
                        onPressed:(){
                          db.deletemobile(documents[position].documentID);
                        },
                      ) ,
     ],
    ),
    ],
            ),
            ],);

    }
      ),);
          }
  }
