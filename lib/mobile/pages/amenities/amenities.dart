import 'package:flutter/material.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class Amenities extends StatelessWidget {
  const Amenities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.home.amenities),
        forceMaterialTransparency: true,
      ),
      body: Column(children: [
        Expanded(
          child: Image.asset(Theme.of(context).brightness == Brightness.dark
              ? "assets/images/logo_dark.png"
              : "assets/images/logo_light.png"),
        ),
        Expanded(
          flex: 2,
          child: ListView(
            children: [
              ListTile(
                title: Text("Название услуги"),
                subtitle: Text("Цена услуги"),
              ),
              Divider(),
              ListTile(
                title: Text("Название услуги"),
                subtitle: Text("Цена услуги"),
              ),
              Divider(),
              ListTile(
                title: Text("Название услуги"),
                subtitle: Text("Цена услуги"),
              ),
              Divider(),
              ListTile(
                title: Text("Название услуги"),
                subtitle: Text("Цена услуги"),
              ),
              Divider(),
              ListTile(
                title: Text("Название услуги"),
                subtitle: Text("Цена услуги"),
              ),
              Divider(),
              ListTile(
                title: Text("Название услуги"),
                subtitle: Text("Цена услуги"),
              ),
              Divider(),
            ],
          ),
        )
      ]),
    );
  }
}
