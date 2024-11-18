import 'dart:convert';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class VideoCa extends StatefulWidget {
  String channelName = "test";

  VideoCa({required this.channelName});
  @override
  _VideoCaState createState() => _VideoCaState();
}

class _VideoCaState extends State<VideoCa> {
  late final AgoraClient client;

  @override
  void initState() {
    initAgora(widget.channelName);
    super.initState();
  }

  void initAgora(String channelName) async{
    client = AgoraClient(agoraConnectionData: AgoraConnectionData(appId: "070d4309da1b4caea067e43a6f00d0f8", channelName: channelName, username: "hhh"),);
    await client.initialize();
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Stack(
          children: [
            AgoraVideoViewer(
              client: client,
            ),
            AgoraVideoButtons(client: client)
          ],
        ),
      ),
    );
    ;
  }
}