import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:lg_controller/src/blocs/PageBloc.dart';
import 'package:lg_controller/src/models/KMLData.dart';
import 'package:lg_controller/src/states_events/PageActions.dart';
import 'package:lg_controller/src/ui/KMLDataView.dart';
import 'package:lg_controller/src/ui/NavigationView.dart';
import 'package:lg_controller/src/ui/SearchBar.dart';

class HomeContent extends StatelessWidget {
  final KMLData data;

  HomeContent(this.data);

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SearchBar(() => {}, (searchText) => {},
              (searchText) => searchPlace(context, searchText)),
          (data != null) ? KMLDataView(data) : Container(),
          Expanded(
            child: NavigationView(data),
          ),
        ],
      ),
    );
  }

  searchPlace(BuildContext context, String text) async {
    GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: "<<<<<API_KEY>>>>>");
    PlacesSearchResponse response = await _places.searchByText(text);
    print(response.status);
    if (response.isOkay && response.results.length>0) {
      BlocProvider.of<PageBloc>(context).dispatch(HOME(KMLData(
          title: response.results[0].name,
          desc: response.results[0].formattedAddress,
          latitude: response.results[0].geometry.location.lat,
          longitude: response.results[0].geometry.location.lng,
          zoom: 0,
          bearing: 0,
          tilt: 0)));
    }
  }
}
