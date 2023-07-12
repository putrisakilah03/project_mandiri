import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AccountPages extends StatelessWidget {
  const AccountPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
              radius: 100,
            ),
          ),
          Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(0.4), spreadRadius: 4, offset: Offset(0.0, 0.2))
              ]
            ),
            child: Column(
              children: [
                _widgetProfile('Nama', 'Putri Sakilah'),
                _widgetProfile('Npm', '021200103'),
                _widgetProfile('Handphone', '0895604274943'),
                _widgetProfile('Alamat', 'Jl.Ratu Sianum'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _widgetProfile(String leading, String title) {
    return ListTile(
      leading: Text(leading),
      trailing: Text(title),
      textColor: Colors.white,
    );
  }
}
