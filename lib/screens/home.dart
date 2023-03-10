import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screens/chats/chat_list.dart';
import 'package:whatsapp/theme_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: (){
                themeProvider.toggleTheme();
              },
              icon: const Icon(Icons.sunny),
            ),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.search_rounded),
            ),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.more_vert_rounded),
            )
          ],
          elevation: 2,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: themeProvider.isDarkMode ? Brightness.light : Brightness.dark,
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                tabs: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Text('Chats', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Text('Status', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Text('Calls', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ),
                ],
              ),
            ),
          ),
          title: const Text('WhatsApp'),
        ),
        body: const TabBarView(
          children: [
            ChatList(),
            Center(
              child: Text('Status'),
            ),
            Center(
              child: Text('Calls'),
            )
          ],
        ),
      ),
    );
  }
}