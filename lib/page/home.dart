import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/Controllers/player_controllers.dart';
import 'package:music_app/const/color.dart';
import 'package:music_app/const/textStyle.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controler = Get.put(PlayerController());
    return Scaffold(
        backgroundColor: bgDartColor,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {

                },
                icon: Icon(
                  Icons.search,
                  color: whitecolor,
                ))
          ],
          leading: const Icon(
            Icons.sort_rounded,
            color: whitecolor,
          ),
          title: Text(
            "Beats",
            style: ourStyle(
              family: bold,
              size: 18,
            ),
          ),
        ),
        body: FutureBuilder<List<SongModel>>(
          future: controler.audioQuary.querySongs(
            ignoreCase: true,
            orderType: OrderType.ASC_OR_SMALLER,
            sortType: null,
            uriType: UriType.EXTERNAL,
          ),
          builder: (BuildContext context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data!.isEmpty) {
              return Center(
                  child: Text(
                "No Song Found",
                style: ourStyle(),
              ));
            } else {
              print(snapshot.data);
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: bgcolor,
                      title: Text(
                        snapshot.data![index].displayNameWOExt,
                        style: ourStyle(
                          family: bold,
                          size: 15,
                        ),
                      ),
                      subtitle: Text(
                        "${snapshot.data![index].artist}",
                        style: ourStyle(
                          family: regular,
                          size: 12,
                        ),
                      ),
                      onTap: () {

                      },
                      leading: QueryArtworkWidget(
                        id: snapshot.data![index].id,
                        type: ArtworkType.AUDIO,
                        nullArtworkWidget: const Icon(Icons.music_note),
                      ),
                      trailing: Icon(
                        Icons.play_arrow,
                        color: whitecolor,
                        size: 26,
                      ),
                    ),
                  );
                },
              );
            }
          },
        ));
  }


}
