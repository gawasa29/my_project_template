import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project_template/common/widgets/loader.dart';
import 'package:my_project_template/features/chat/screens/mobile_chat_screen.dart';

import '../controller/search_controller.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>?>(
          future: ref.watch(searchControllerProvider).getAllUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index].data();
                  return Card(
                    child: ListTile(
                      title: Text(data['name']),
                      trailing: IconButton(
                        icon: Icon(Icons.person_add),
                        onPressed: () {
                          // print('このユーザーとのトークルームを作成しました${data}');
                          Navigator.pushNamed(
                            context,
                            MobileChatScreen.routeName,
                            arguments: {
                              'name': data['name'],
                              'uid': data['uid'],
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Loader();
            }
          },
        ));
  }
}
