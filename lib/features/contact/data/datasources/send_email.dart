import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'url.dart';

abstract class SendEmail {
  send({required Map<String, String> body});
}

class SendEmailImpl extends SendEmail {
  @override
  Future send({required Map<String, String> body}) async {
    var headers = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Access-Control-Allow-Credentials': 'true',
    };
    var request = http.Request('POST', Uri.parse(URL));
    request.body = json.encode(body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      log(await response.stream.bytesToString(), name: "SendEmail");
    } else {
      log("${response.reasonPhrase}", name: "SendEmail");
    }
  }
}
