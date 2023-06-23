import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garage_finder/main.dart';
import 'package:garage_finder/services/test.dart';
import 'package:garage_finder/services/user_profile.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'calculating_distance.dart';
import 'garage_info.dart';



const LatLng currentLocation = LatLng(25.1193, 55.3773);
const LatLng destination = LatLng(26.1193, 56.3773);

class findgarage extends StatefulWidget {


  static final CameraPosition _camerapoint = const CameraPosition(target: LatLng(1.5606387988627648, 103.63847325368896),zoom: 15.4746,);



  //
  const findgarage({Key? key}) : super(key: key);

  @override
  State<findgarage> createState() => _findgarageState();
}

class _findgarageState extends State<findgarage> {


  final databaseRef_garageinfo = FirebaseDatabase.instance.ref('garage_info');


  Completer<GoogleMapController> _controller = Completer();



  Uint8List? marger_of_garage;

  late double mydistance;

  List<String> garage_images= ['assets/garage.png',];



  //for the polyline to the locaion to thedirectiobn

  Location sourceLocation = Location(1.5655226434866882, 103.60029164489598 );

  static const LatLng destination = LatLng(1.57328823634052, 103.67081512238533);

 CustomInfoWindowController _customInfoWindowController= CustomInfoWindowController();


  List <LatLng> latlongof_garage=[
    LatLng(22.335258385658474, 91.83310239274064),
    LatLng(1.5655226434866882, 103.60029164489598),
    LatLng(1.57328823634052, 103.67081512238533),
    LatLng(1.5028811771729012, 103.77721393315595),
    LatLng(1.6005889190664253, 103.62201918792361),
    LatLng(1.6028942934313546, 103.67312139794602),
    LatLng(1.6127224391892228, 103.60308345214335),
    LatLng(1.623278543329689, 103.58354080176491),
    LatLng(1.6446332511826507, 103.61716387104666),

  ];

  Location loc1= Location(1.23456, 1.59786);
  Location loc2= Location(1.23456, 1.59786);

  String data="";



  Future<Uint8List> getBytesFromAssets(String path,int width) async {
    ByteData data=await rootBundle.load(path);
    ui.Codec codec= await ui.instantiateImageCodec(data.buffer.asUint8List(),targetHeight:width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }


  List <Marker> _marker =[];


  loadData(){
    get_user_current_location().then((value) async {

      for(int i=0;i<latlongof_garage.length;i++){

        final Uint8List garage_marker1= await getBytesFromAssets(garage_images_markers[i],85);

        _marker.add(
          Marker(
              markerId: MarkerId("Garage "+i.toString()),
              position: latlongof_garage[i],
            infoWindow: InfoWindow(
              title: "Garage "+i.toString(),
            ),
            icon: BitmapDescriptor.fromBytes(garage_marker1),
            onTap: (){
                _customInfoWindowController.addInfoWindow!(

                  Container(
                    height: 180,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(left: 10.0,top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(garage_name[i],style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                          ),
                          SizedBox(height: 10),

                          Row(
                            children: [
                              Image.asset(garage_images_markers[i],
                                height: 100,
                                width: 100,
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text("Rating: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                      Text(ratings_of_garage[i],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  // Row(
                                  //
                                  //   children: [
                                  //     Icon(Icons.star,color: Colors.yellow,),
                                  //     Icon(Icons.star,color: Colors.yellow,),
                                  //     Icon(Icons.star,color: Colors.yellow,),
                                  //     Icon(Icons.star,color: Colors.yellow,),
                                  //     Icon(Icons.star,color: Colors.grey,),
                                  //
                                  //   ],
                                  // ),
                                  RatingBar.builder(
                                      initialRating: 4.5,
                                      minRating: 1,
                                      unratedColor: Colors.grey,
                                      itemCount: 5,
                                      itemSize: 25.0,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                      updateOnDrag: true,

                                      itemBuilder: (context,index)=>Icon(Icons.star,color: Colors.amber,), onRatingUpdate:(rating_value) {


                                  } ),

                                  SizedBox(height: 15,),


                                  MaterialButton(

                                    onPressed: (){

                                     FlutterPhoneDirectCaller.callNumber('+8801815104401');



                                    },

                                    child: Container(
                                      height: 25,
                                      width: 120,
                                      child: Text('Book the Garage',style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    ),
                                    color: Colors.deepPurpleAccent[700],



                                  ),
                                ],
                              )
                            ],
                          ),





                        ],
                      ),
                    ),
                  ),

                    latlongof_garage[i],

                );

            },


          )
        );

        setState(() {

        });
      }




      //     path:'assets/garage1.png', //paste the custom image path
      //     width: 50 // size of custom image as marker
      // );

      print('My current Location');
      print(value.latitude.toString()+ " "+ value.longitude.toString());


      _marker.add(
        Marker(
          markerId:MarkerId('mylocaiton'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(
            title: 'My Current Location',
          ),

        ),
      );


      CameraPosition cameraPosition = CameraPosition(
          zoom: 14,
          target: LatLng(value.latitude, value.longitude));

      final GoogleMapController controller =await _controller.future;

      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {

      });

    });
  }



  @override
  void initState () {

    super.initState();
    // _marker.addAll(_list);

    loadData();


  }


  @override
  Widget build(BuildContext context) {



    Color color1= Color(0xff90ebb2);
    Color color2= Color(0xfff6c33e);
    Color color3= Color(0xffe1563f);
    Color color4= Color(0xfffdeb5b);

    List <Color> _list_colors= [

      color1,
      color2,
      color3,
      color4,
      color1,
      color2,
      color3,
      color4,
      color1,
      color2,
      color3,
      color4,
      color1,
      color2,
      color3,
      color4,
      color1,
      color2,
      color3,
      color4,
      color2,
      color3,
      color4,
      color1,
      color2,
      color3,
      color4,
      color1,
      color2,
      color3,
      color4,
      color2,
      color3,
      color2,
      color3,
      color4,
      color2,
      color3,
      color2,
      color3,
      color4,
      color2,
      color3,

    ];




    int _selectedIndex=0;


    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        if(_selectedIndex==1){



          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(

                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(20.0)), //this right here
                  child:  Expanded(
                    child: FirebaseAnimatedList(
                        scrollDirection: Axis.vertical,

                        query: databaseRef_garageinfo,

                        itemBuilder:(context,snapshot,animation,index){

                          String firebaselat=snapshot.child('glat').value.toString();
                          String firebaselong=snapshot.child('glong').value.toString();


                          Location test=Location(double.parse(firebaselat),double.parse(firebaselong));


                          double distance=calculateDistance(sourceLocation as Location, test);

                          if(distance<=5) {
                            return Padding(
                              padding: EdgeInsets.only(top: 5.0, bottom: 5),
                              child: Container(

                                child: Card(
                                  elevation: 7,
                                  child: Container(
                                    height: 150,


                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.black,

                                      ),
                                      color: _list_colors[index + 2],
                                    ),

                                    child: Center(
                                      child: ListTile(

                                        onTap: () {
                                          FlutterPhoneDirectCaller.callNumber(
                                              phoneNumber_of_garage[index]);
                                        },


                                        tileColor: Colors.white,
                                        subtitle: Text(
                                          '\nBook garage', style: TextStyle(

                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),),

                                        leading: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,

                                              border: Border.all(
                                                  width: 3,

                                                  color: Colors.white

                                              ),
                                            ),
                                            child: Image.asset(
                                              garage_images_markers[index + 5],
                                              width: 60, height: 60,)),
                                        trailing: Text(
                                          ratings_of_garage[index + 5]
                                              .toString(),
                                          style: TextStyle(color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: Text(snapshot
                                            .child('gname')
                                            .value
                                            .toString(), style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),),

                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          };
                          return  Container(

                          );



                        }),
                  ),
                );
              });

        }
        if(_selectedIndex==0){
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(

                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(20.0)), //this right here
                  child:  Expanded(
                    child: FirebaseAnimatedList(
                        scrollDirection: Axis.vertical,

                        query: databaseRef_garageinfo,

                        itemBuilder:(context,snapshot,animation,index){

                          return Padding(
                            padding: EdgeInsets.only(top: 5.0,bottom: 5),
                            child: Container(

                              child: Card(
                                elevation: 7,
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.black,

                                    ),
                                    color: _list_colors[index+2],
                                  ),

                                  child: Center(
                                    child: ListTile(

                                      onTap: () async {

                                        FlutterPhoneDirectCaller.callNumber(phoneNumber_of_garage[index]);

                                      },



                                      tileColor: Colors.white,
                                      subtitle: Text('\nBook garage',style: TextStyle(

                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),),

                                      leading: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,

                                            border: Border.all(
                                                width: 3,

                                                color: Colors.white

                                            ),
                                          ),
                                          child: Image.asset(garage_images_markers[index+2],width: 60,height: 60,)),
                                      trailing:Text(
                                                ratings_of_garage[index+2].toString(),
                                                style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),
                                                ),
                                      title:Text(snapshot.child('gname').value.toString() ,style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),),

                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );



                        }),
                  ),
                );
              });

        }

        else{
          print('do something');
        }

      });
    }


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text('Find a Garage'),
          backgroundColor: Colors.deepPurple,
        ),

        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: const Color(0xff764abc)),
                accountName: Text(
                  "Arik Abrar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  "arik.abrar@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: FlutterLogo(),
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                ),
                title: const Text('Profile'),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context)=> userprofile() ));

                },
              ),
              AboutListTile( // <-- SEE HERE
                icon: Icon(
                  Icons.info,
                ),
                child: Text('About app'),
                applicationIcon: Icon(
                  Icons.local_play,
                ),
                applicationName: 'garage finder',
                applicationVersion: '1.0.25',
                applicationLegalese: 'arik abrar',
                aboutBoxChildren: [
                  ///Content goes here...
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(

            currentIndex: _selectedIndex,
          onTap:_onItemTapped,
            items: <BottomNavigationBarItem> [
              BottomNavigationBarItem(

                  icon: Icon(

                    Icons.search,color: Colors.deepPurple,
                  ),
              label: 'Find Garage from \nSelected Locaiton'
              ),
              BottomNavigationBarItem(

                  icon: Icon(

                    Icons.search,color: Colors.deepPurple,
                  ),
              label: 'Search for Garage'
              ),

            ] ),
        body:Stack(
          children: [
            GoogleMap(

            myLocationEnabled: true,
              markers: Set<Marker>.of(_marker),
              initialCameraPosition: findgarage._camerapoint,

            onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
                
                _customInfoWindowController.googleMapController = controller;


            },

            onLongPress: _addmarker,

             onTap: (position){

              _customInfoWindowController.hideInfoWindow!();
             },

              onCameraMove: (position1){

              _customInfoWindowController.onCameraMove!();

              },
          ),
            CustomInfoWindow(controller: _customInfoWindowController,
            height: 180,
              width: 300,
              offset: 35,
            
            )
        ]
        ),

        
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.my_location),
          onPressed: (){


            double mydistance= calculateDistance(loc1,loc2);
            print('Tjhis is my distance'+mydistance.toString());


            get_user_current_location().then((value) async {
              print('My current Location');
              print(value.latitude.toString()+ " "+ value.longitude.toString());

              _marker.add(
               Marker(
                   markerId:MarkerId('mylocaiton'),
                    position: LatLng(value.latitude, value.longitude),
                    infoWindow: InfoWindow(
                      title: 'My Current Location',
                    ),

               ),
              );
              CameraPosition cameraPosition = CameraPosition(
                zoom: 14,
                  target: LatLng(value.latitude, value.longitude));

                  final GoogleMapController controller =await _controller.future;

                 controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                 setState(() {

                 });

            });
          },
        ),
        ),
    );
  }



  void _addmarker(LatLng pos) {

    _marker.add(
     Marker(
       markerId: MarkerId('Pickup_locaion'),
       infoWindow: InfoWindow(title: 'Pickup locaion'),
       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
       position: pos,
     )
    );
    setState(() {

    });

  }
}

 Future <Position >  get_user_current_location() async{


  await Geolocator.requestPermission().then((value) {


  }).onError((error, stackTrace) {
    print('error'+error.toString());
  });

  return await Geolocator.getCurrentPosition();

}

