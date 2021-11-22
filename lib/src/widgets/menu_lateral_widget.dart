import 'package:flutter/material.dart';

class MenuLateralWidget extends StatelessWidget {
  const MenuLateralWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Tela inicial'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
        ],
      ),
    );
  }
}
