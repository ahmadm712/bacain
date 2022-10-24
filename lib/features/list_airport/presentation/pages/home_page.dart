import 'dart:async';
import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bacain/features/carousel/presentation/widgets/carousel_section.dart';
import 'package:bacain/features/connection_checker/presentation/bloc/connection_checker_bloc.dart';
import 'package:bacain/l10n/locale_keys.g.dart';
import 'package:bacain/presentation/widgets/app_bar_primary.dart';
import 'package:bacain/presentation/widgets/list_shoes.dart';
import 'package:bacain/presentation/widgets/widgets.dart';
import 'package:bacain/services/location_services.dart';
import 'package:bacain/utils/injection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String imageUrl = '';
  Future<void> firebaseBackgroundMessage(RemoteMessage message) async {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      //with image from URL
      id: 1,
      backgroundColor: Colors.red,
      color: Colors.red,
      channelKey: 'basic', //channel configuration key
      title: message.data["title"],
      body: message.data["body"],
      bigPicture: message.data["image"],
      notificationLayout: NotificationLayout.BigPicture,
      payload: message.data['data'],
    ));
  }

  @override
  void initState() {
    // FirebaseMessaging.onMessage.listen(firebaseBackgroundMessage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getToken() async {
      final token = await FirebaseMessaging.instance.getToken();
      print('${token} ini token');
    }

    getToken().then((value) => print('${value} ini token'));
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta! > 0) {
          // scaffoldKey.currentState!.openDrawer();
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        drawer: const DrawerHome(),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppbarPrimary(
            scaffoldKey: scaffoldKey,
          ),
        ),
        body: BlocBuilder<ConnectionCheckerBloc, ConnectionCheckerState>(
          builder: (context, state) {
            if (state is ConnectionCheckerSucces) {
              return const HomeWidgets();
            } else if (state is ConnectionCheckerFailed) {
              return const Center(
                child: Text("No Internet Connection :("),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}

class HomeWidgets extends StatefulWidget {
  const HomeWidgets({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeWidgets> createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {
  late File _image;
  final picker = ImagePicker();
  String imageUrl = '';
  String imageName = '';

  getImage() async {
    // You can also change the source to gallery like this: "source: ImageSource.camera"
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(
          pickedFile.path,
        );
      } else {
        print('No image has been selected.');
      }
    });
  }

  Future<String> uploadImage(File img) async {
    try {
      Reference ref = FirebaseStorage.instance.ref('user1');
      await ref.putFile(_image);
      var url = await ref.getDownloadURL();

      return url;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CarouselSection(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                getImage();
              },
              child: const Text('get')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapSample(),
                    ));
              },
              child: const Text('Map')),
          ElevatedButton(
            onPressed: () async {
              if (_image != null) {
                uploadImage(_image).then(
                  (value) => showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Image.network(
                          value,
                        ),
                      );
                    },
                  ),
                );
              }
            },
            child: const Text('Upload Image'),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.ShoesTitle.tr(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ListShoes(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  Marker? _marker;

  final locationServices = locator<LocationServices>();
  Position? positionUser;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    var position = await locationServices.determinatePosition();
    setState(() {
      positionUser = position;
    });
    _marker = Marker(
      markerId: const MarkerId(
        'markerId',
      ),
      infoWindow: const InfoWindow(title: 'Lokasi'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(positionUser!.latitude, positionUser!.longitude),
    );
    _kGooglePlex = CameraPosition(
      target: LatLng(positionUser!.latitude, positionUser!.longitude),
      zoom: 19,
    );
    print('${positionUser!.latitude} ini lat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        compassEnabled: true,
        markers: {
          _marker != null
              ? _marker!
              : const Marker(markerId: MarkerId('value')),
        },
        onTap: (argument) {
          // _controller;
          _goToTheLake(CameraPosition(
            target: argument,
            tilt: 59.440717697143555,
            zoom: 18,
            bearing: 192.8334901395799,
          ));
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () async {
      //     _goToTheLake(_kLake);
      //   },
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

  Future<void> _goToTheLake(CameraPosition _kLake) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
