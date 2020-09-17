import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cme1.dart';
import 'loading.dart';
import 'loadingBrowser.dart';
import 'loadingmemos.dart';
import 'loadingnews.dart';
import 'loadingnotification.dart';


//Calculate Distance in KM

String FinalURL;

clickbtn(var context,int idTypeForm,String parameters,int idButton,String WebLink, String appFormTag,String _rlt,int _idLanguage,String mainColor,String BackColor,String BackColorDark,String TextColorForBack,String MainColorDark,String MainColorLight,String TextColorForMain) async{

   print("idTypeForm="+idTypeForm.toString()+"parameters="+parameters+"idButton:"+idButton.toString()+"appFormtag"+appFormTag.toString());

  print("wwwww"+WebLink.toString());
  //specialParameters = resBody['specialParameters'];
  if(parameters==""){
    FinalURL=WebLink;
  }
  else
  { FinalURL=WebLink+parameters;}
  print("FinalURL= "+FinalURL);
  // appFormTag=resBody['appFormTag'];

  switch (appFormTag) {
    case 'inner_menu':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => loading(idButton,_rlt,_idLanguage,mainColor,BackColor,BackColorDark,TextColorForBack,MainColorDark,MainColorLight,TextColorForMain),
          ));

      break;
    case 'notification_list':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => loadingnotification(idButton,mainColor,BackColor,BackColorDark,TextColorForBack,MainColorDark,MainColorLight,TextColorForMain),
          ));
      break;
    case 'setting':
    /* Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => loadingSetting(idButton,mainColor,BackColor,BackColorDark,TextColorForBack,MainColorDark,MainColorLight,TextColorForMain),
            ));*/
      break;
    case 'web_browser':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => loadingBrowser(FinalURL,mainColor,BackColor,BackColorDark,TextColorForBack,MainColorDark,MainColorLight,TextColorForMain),
          ));
      break;
    case 'external_web_browser':
      _launchInBrowser(FinalURL);
      break;
    case 'memos':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => loadingMemos(idButton,_rlt,_idLanguage,mainColor,BackColor,BackColorDark,TextColorForBack,MainColorDark,MainColorLight,TextColorForMain),
          ));
      break;
    case 'news':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => loadingNews(idButton,_rlt,_idLanguage,mainColor,BackColor,BackColorDark,TextColorForBack,MainColorDark,MainColorLight,TextColorForMain),
          ));
      break;
    case 'no_action':
      print("no action");
      break;
    case 'cme1':
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => cme1(idButton,_rlt,_idLanguage,mainColor,BackColor,BackColorDark,TextColorForBack,MainColorDark,MainColorLight,TextColorForMain),
          ));

      break;
    default:
      print('It\'s weekend');
      break;
  }

}
Future<void> _launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}

