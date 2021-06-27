import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:myweb2/qr_main.dart';
import 'package:url_launcher/url_launcher.dart';

import 'desktop2.dart';


class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(MaterialApp(home: MyApp(), theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFA7A5A5)),
      debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  final ChromeSafariBrowser browser = new MyChromeSafariBrowser();

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   widget.browser.addMenuItem(new ChromeSafariBrowserMenuItem(
  //       id: 1,
  //       label: 'Custom item menu 1',
  //       action: (url, title) {
  //         print('Custom item menu 1 clicked!');
  //       }));
  //   super.initState();
  // }

TextEditingController controller=TextEditingController();
var urlString="";
  launchUrl()
  async {
    // urlString="https://www.google.com/search?q="+controller.text;
    String prefix = "https://www.google.com/search?q=";
    urlString=controller.text;
    if(!urlString.startsWith("http://") && !urlString.startsWith("https://")&&
        !urlString.endsWith(".com")  && !urlString.endsWith(".as") &&
    !urlString.endsWith(".uk") && !urlString.endsWith(".biz")&&!urlString.endsWith(".in")|| urlString.contains(" ") )
    {
      urlString=prefix+urlString;
    }
    if(urlString.endsWith(".com") || urlString.endsWith(".as") || urlString.endsWith(".uk") || urlString.endsWith(".biz")||urlString.endsWith(".in") )
    {
      if(!urlString.startsWith("http://") && !urlString.startsWith("https://"))
      {
        urlString = "http://"+urlString;
      }
    }
    await widget.browser.open(
        url: Uri.parse(urlString),
        options: ChromeSafariBrowserClassOptions(
            android: AndroidChromeCustomTabsOptions(
              addDefaultShareMenuItem: false,),
            ios: IOSSafariOptions(barCollapsingEnabled: true)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  TextField(
          autofocus: false,
          controller: controller,
          cursorColor: Colors.black,
          textInputAction: TextInputAction.search,
          onSubmitted: (url)=>launchUrl(),
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border:InputBorder.none,
            hintText: "Search Google Or Enter URL",
            hintStyle: TextStyle(color:Colors.grey),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),

      body:


      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:
      Column(children: <Widget>[


        // Row(children: <Widget>[
        //   Container(
        //     // padding: EdgeInsets.all(50),
        //     alignment: Alignment.center,
        //     margin: const EdgeInsets.only(top: 30.0,left:10.0),
        //     child:
        //     Text(
        //       'QR Code Scanner',
        //       style: TextStyle(fontSize: 25),
        //     ) ,
        //   ),
        // ]),



        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: [

                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/neews_feed.png'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      await widget.browser.open(
                          url: Uri.parse("https://www.facebook.com/"),
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false,),
                              ios: IOSSafariOptions(barCollapsingEnabled: true)));
                    },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/profile.jpg'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      await widget.browser.open(
                          url: Uri.parse("https://www.facebook.com/me"),
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false,),
                              ios: IOSSafariOptions(barCollapsingEnabled: true)));
                    },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/about_me.jpg'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      await widget.browser.open(
                          url: Uri.parse("https://www.facebook.com/me/about"),
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false,),
                              ios: IOSSafariOptions(barCollapsingEnabled: true)));
                    },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/watch.jpg'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      await widget.browser.open(
                          url: Uri.parse("https://www.facebook.com/watch"),
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false,),
                              ios: IOSSafariOptions(barCollapsingEnabled: true)));
                    },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/marketplace.png'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      await widget.browser.open(
                          url: Uri.parse("https://www.facebook.com/marketplace/?ref=app_tab"),
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false,),
                              ios: IOSSafariOptions(barCollapsingEnabled: true)));
                    },
                  ),
                ),
              ]),
        ),


        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: [

                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/facebook-group.png'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      await widget.browser.open(
                          url: Uri.parse("https://www.facebook.com/groups/"),
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false,),
                              ios: IOSSafariOptions(barCollapsingEnabled: true)));
                    },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/Following.jpg'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      // Navigator.push(context,
                      //  MaterialPageRoute(builder: (context) => ComicsPage()),
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => WebViewContainer("https://www.facebook.com/me/following")));

                    },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/followers.jpg'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      // await widget.browser.open(
                          // url: Uri.parse("https://www.facebook.com/me/followers"),
                          // options: ChromeSafariBrowserClassOptions(
                          //     android: AndroidChromeCustomTabsOptions(
                          //       addDefaultShareMenuItem: false,),
                          //     ios: IOSSafariOptions(barCollapsingEnabled: true)));

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => WebViewContainer("https://www.facebook.com/me/followers")));

                    },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/Friend_list.png'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      await widget.browser.open(
                          url: Uri.parse("https://m.facebook.com/friends/center/friends/?mff_nav=1&ref=m_notif&notif_t=group_highlights"),
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false,),
                              ios: IOSSafariOptions(barCollapsingEnabled: true)));
                    },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/pages.png'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      await widget.browser.open(
                          url: Uri.parse("https://www.facebook.com/pages/?category=your_pages&ref=bookmarks"),
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false,),
                              ios: IOSSafariOptions(barCollapsingEnabled: true)));
                    },
                  ),
                ),

              ]),
        ),



        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: [

                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/gaming.jpg'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      await widget.browser.open(
                          url: Uri.parse("https://www.facebook.com/gaming/?ref=games_tab"),
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false,),
                              ios: IOSSafariOptions(barCollapsingEnabled: true)));
                    },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/messaging.png'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      await widget.browser.open(
                          url: Uri.parse("https://www.facebook.com/messages/t/"),
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false,),
                              ios: IOSSafariOptions(barCollapsingEnabled: true)));
                    },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/notification.png'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      await widget.browser.open(
                          url: Uri.parse("https://www.facebook.com/notifications/"),
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false,),
                              ios: IOSSafariOptions(barCollapsingEnabled: true)));
                    },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/incoming_fr.png'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      await widget.browser.open(
                          url: Uri.parse("https://m.facebook.com/friends/center/requests/?rfj"),
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false,),
                              ios: IOSSafariOptions(barCollapsingEnabled: true)));
                    },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/outgoing_fr.png'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      await widget.browser.open(
                          url: Uri.parse("https://m.facebook.com/friends/center/requests/outgoing/"),
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false,),
                              ios: IOSSafariOptions(barCollapsingEnabled: true)));
                    },
                  ),
                ),

              ]),
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: [

                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/settings.png'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      await widget.browser.open(
                          url: Uri.parse("https://www.facebook.com/settings/?tab=account"),
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false,),
                              ios: IOSSafariOptions(barCollapsingEnabled: true)));
                    },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/moreapps.png'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      // await widget.browser.open(
                      //     url: Uri.parse("https://play.google.com/store/search?q=pub%3ABAPPA%20SAIKH&c=apps"),
                      //
                      //     options: ChromeSafariBrowserClassOptions(
                      //         android: AndroidChromeCustomTabsOptions(
                      //           addDefaultShareMenuItem: false,
                      //            ),
                      //         ios: IOSSafariOptions(barCollapsingEnabled: true)));
                      launch("https://play.google.com/store/search?q=pub%3ABAPPA%20SAIKH&c=apps" );                     },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/amazon.png'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      await widget.browser.open(
                          url: Uri.parse("https://www.amazon.in/?&_encoding=UTF8&tag=bappasaikh-21&linkCode=ur2&linkId=e3b009b026920c3cfdd6185fadfb7e67&camp=3638&creative=24630"),
                          options: ChromeSafariBrowserClassOptions(
                              android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false,),
                              ios: IOSSafariOptions(barCollapsingEnabled: true)));
                    },
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(50),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Image.asset('assets/icon/qr.png'),
                    iconSize: 50,
                    color: Colors.green,
                    splashColor: Colors.purple,
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QRApp()),
                      );
                    },
                  ),
                ),

              ]),
        ),




      ]),
      ),
    );
  }
}
