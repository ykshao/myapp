import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   child: Text('header'.toUpperCase()),
          //   decoration: BoxDecoration(
          //     color: Colors.grey[100]
          //   ),
          // ),
          UserAccountsDrawerHeader(
            accountName: Text('shaoyongkai', style: TextStyle(fontWeight: FontWeight.bold),),
            accountEmail: Text('shaoyongkai@51talk.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage:NetworkImage('https://ss0.bdstatic.com/7Ls0a8Sm1A5BphGlnYG/sys/portrait/item/2c2f3736383636323731379c07'),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: DecorationImage(
                image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550659429462&di=4cc7b41b68b1071cd431dba5df7bca00&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Fback_pic%2F03%2F79%2F75%2F5257c2e4da2a129.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.yellow[400].withOpacity(0.6), BlendMode.hardLight)
              )
            ),
          ),
          ListTile(
            title: Text('Messages', textAlign: TextAlign.right,),
            trailing: Icon(Icons.message, color: Colors.black12,size: 22.0,),
            onTap: ()=> Navigator.pop(context),
          ),
          ListTile(
            title: Text('Favorite', textAlign: TextAlign.right,),
            trailing: Icon(Icons.favorite, color: Colors.black12,size: 22.0,),
            onTap: ()=> Navigator.pop(context),
          ),
          ListTile(
            title: Text('Settings', textAlign: TextAlign.right,),
            trailing: Icon(Icons.settings, color: Colors.black12,size: 22.0,),
            onTap: ()=> Navigator.pop(context),
          )
        ],
      ),
    );
  }
}