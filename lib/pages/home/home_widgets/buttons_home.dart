import 'package:flutter/material.dart';

class ButtonHome extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  final String subtitle;
  const ButtonHome({ Key? key, required this.title, 
  required this.icon,
  required this.route, 
  required this.subtitle,
   }) 
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 70,
    margin: const EdgeInsets.all(10),
      child: ListTile(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
        ),
        tileColor: Colors.amber[300],
        onTap: (){
             Navigator.of(context).pushReplacementNamed(route);
        },
        title: Text(title, 
        style: const TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w900,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(icon),
      ),
    );
  }
}