import 'package:flutter/material.dart';
import '../../base_widget.dart';
import '/data/serialization/album.dart';
import '/data/serialization/pollution_station.dart';
import '/repository/api_exception_mapper.dart';
import '/repository/api_repository.dart';
import '/repository/api_rest_repository.dart';
import '/constants.dart';

class ApiRepositoryPage extends BaseWidget {
  const ApiRepositoryPage({Key? key}) : super(key: key);
  @override
  State<ApiRepositoryPage> createState() => _ApiRepositoryState();
}

class _ApiRepositoryState extends BaseState<ApiRepositoryPage> {
  final ApiRepository apiRepository = ApiRestRepository();
  late Future<Album> album;
  @override
  void initState() {
    album = apiRepository.createAlbum("ApiRepositoryPage post album PNA");
    album.then((value) => {debugPrint("value.title: $value.title")});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(44),
            child: AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              elevation: 0.0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: colorTextInput),
                onPressed: () => Navigator.of(context).pop(),
              ),
            )),
        body: Stack(
          children: <Widget>[
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildExpandedContent(),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildExpandedContent() => Expanded(
        child: Column(
          children: <Widget>[
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: FutureBuilder<PollutionStation>(
                  future: apiRepository.getFirstStation(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text(
                          ApiExceptionMapper.toErrorMessage(snapshot.error!));
                    } else {
                      final station = snapshot.data;
                      return Text(station!.stationName);
                    }
                  }),
            ),
            FutureBuilder<Album>(
              future: album,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.title);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      );
}
