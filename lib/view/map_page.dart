import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import '../base_widget.dart';
import '/googlemap/googlemap_apppage.dart';
import '/googlemap/animate_camera.dart';
import '/googlemap/lite_mode.dart';
import '/googlemap/map_click.dart';
import '/googlemap/map_coordinates.dart';
import '/googlemap/map_ui.dart';
import '/googlemap/marker_icons.dart';
import '/googlemap/move_camera.dart';
import '/googlemap/padding.dart';
import '/googlemap/place_circle.dart';
import '/googlemap/place_marker.dart';
import '/googlemap/place_polygon.dart';
import '/googlemap/place_polyline.dart';
import '/googlemap/scrolling_map.dart';
import '/googlemap/snapshot.dart';
import '/googlemap/tile_overlay.dart';

final List<GoogleMapExampleAppPage> _allPages = <GoogleMapExampleAppPage>[
  const MapUiPage(),
  const MapCoordinatesPage(),
  const MapClickPage(),
  const AnimateCameraPage(),
  const MoveCameraPage(),
  const PlaceMarkerPage(),
  const MarkerIconsPage(),
  const ScrollingMapPage(),
  const PlacePolylinePage(),
  const PlacePolygonPage(),
  const PlaceCirclePage(),
  const PaddingPage(),
  const SnapshotPage(),
  const LiteModePage(),
  const TileOverlayPage(),
];

class MapPage extends BaseWidget {
  const MapPage({Key? key}) : super(key: key);
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends BaseState<MapPage> {
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  //if (mapsImplementation is GoogleMapsFlutterAndroid) {
  //mapsImplementation.useAndroidViewSurface = true;
  //}
  void _pushPage(BuildContext context, GoogleMapExampleAppPage page) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text(page.title)),
              body: page,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _allPages.length,
        itemBuilder: (_, int index) => ListTile(
          leading: _allPages[index].leading,
          title: Text(_allPages[index].title),
          onTap: () => _pushPage(context, _allPages[index]),
        ),
      ),
    );
  }
}
