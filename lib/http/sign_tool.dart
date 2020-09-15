import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

class SignTool{
  static String getSignedParam(Map<String,dynamic> params, String appSecret){
    StringBuffer buffer = StringBuffer();
    List<String> mapKeys = params.keys.toList();
    mapKeys.sort();
    params.forEach((key, value) {
      if(value is String || value is bool){
        if(''!=value && 'sign' != key){
          if(buffer.length>0){
            buffer.write("&$key=$value");
          }else{
            buffer.write("$key=$value");
          }
        }
      }else if(value is num){
        if(buffer.length>0){
          String valueString = value.toString();
          buffer.write("&$key=$valueString");
        }else{
          String valueString = value.toString();
          buffer.write("$key=$valueString");
        }
      }
      if('' != appSecret){
        buffer.write(appSecret);
      }
    });
    return generateMD5(buffer.toString());
  }

  static String generateMD5(String str){
    Uint8List unit8list = new Utf8Encoder().convert(str);
    Digest digest = md5.convert(unit8list);
    return hex.encode(digest.bytes);
  }
}