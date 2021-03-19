import 'package:demo_youtube/video_detail_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final items = List<String>.generate(10000, (i) => "$i");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text('Flutter Youtube'),
            leading: Icon(Icons.videocam),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.more_vert),
              )
            ],
          ),
          body: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        child: SizedBox(
                          width: 64,
                          height: 64,
                          child: Image.network(
                              'https://yt3.ggpht.com/ytc/AAUvwnhmkQKAZWonAFY4aNoq6dOwgfThDWTRfa2NXH6_DQ=s176-c-k-c0x00ffffff-no-rj'),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      Column(
                        children: [
                          const Text('うんこちゃん'),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Icon(Icons.video_call),
                                ),
                                Text('登録する'),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoDetailPage()),
                            );
                          },
                          leading: Image.network(
                              'https://i.ytimg.com/vi/S-__85GdUrI/hqdefault.jpg'),
                          title: Column(children: [
                            Text('安眠PUBG part${index}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            Row(
                              children: [
                                Text('${index * 100}回再生 '),
                                Text('${index}日前')
                              ],
                            )
                          ]),
                          trailing: Icon(Icons.more_vert),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
