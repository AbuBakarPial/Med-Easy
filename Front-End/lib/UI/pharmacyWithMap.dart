import '../Utillity/libraries.dart';
import 'package:geolocator/geolocator.dart' as loc;

class PharmacyFind extends StatefulWidget {
  static const route = '/pharmacy-find';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return PharmacyFindState();
  }
}

class PharmacyFindState extends State {
  Completer<GoogleMapController> _controllerX = Completer();

  static loc.Position _currentPosition;

  static const LatLng _center = const LatLng(45.521563, -122.677433);
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  Location _location = Location();

  MapType _currentMapType = MapType.normal;

  LatLng _lastMapPosition = _center;

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _getCurrentLocation() {
    loc.Geolocator.getCurrentPosition(
            desiredAccuracy: loc.LocationAccuracy.best)
        .then((loc.Position position) {
      setState(() {
        _currentPosition = position;
        print(_currentPosition);
      });
    }).catchError((e) {
      print(e);
    });
  }

  bal() async {
    await _getCurrentLocation();
  }

  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _controllerX.complete(_cntlr);
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType =
          _currentMapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  @override
  initState() {
    print("Location");
    bal();
    // setState(() {
    //   for (double i = 12.343; i < 50; i += 3) {
    //     _markers.add(
    //       Marker(
    //           markerId: MarkerId("Quark city Id"),
    //           infoWindow: InfoWindow(
    //             title: "Quark city",
    //           ),
    //           icon: BitmapDescriptor.defaultMarkerWithHue(
    //               BitmapDescriptor.hueRed),
    //           position: LatLng(_currentPosition.latitude + i,
    //               _currentPosition.longitude - i)),
    //     );
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nearly Pharmacy"),
      ),
      body: Container(
        // margin: const EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              trafficEnabled: true,
              zoomGesturesEnabled: true,
              indoorViewEnabled: true,

              mapToolbarEnabled: true,
              // liteModeEnabled: true,
              buildingsEnabled: true,
              compassEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _initialcameraposition,
              ),
              mapType: _currentMapType,
              markers: _markers,

              zoomControlsEnabled: true,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: 0,
                      onPressed: _onMapTypeButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.map, size: 36.0),
                    ),
                    SizedBox(height: 16.0),
                    FloatingActionButton(
                      heroTag: 1,
                      onPressed: _onAddMarkerButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.add_location, size: 36.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
