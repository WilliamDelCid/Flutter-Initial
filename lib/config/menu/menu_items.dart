import 'package:flutter/material.dart';

class MenuItems{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems({required this.title, required this.subTitle, required this.link, required this.icon});
}


  const appMenuItems = <MenuItems>[
    MenuItems(
      title: 'Botones',
      subTitle: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined
    ),
    MenuItems(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card
    ),
        MenuItems(
      title: 'Progress Indicators',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded
    ),
      MenuItems(
      title: 'Snacbars y dialogos',
      subTitle: 'Indicadores en pantalla',
      link: '/snacbars',
      icon: Icons.info_outline
    ),
      MenuItems(
      title: 'Animated Container',
      subTitle: 'Stateful widget animado',
      link: '/animated',
      icon: Icons.check_box_outlined
    ),
      MenuItems(
      title: 'UI Controls + Title',
      subTitle: 'Una serie de controles en Flutter',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined
    ),
      MenuItems(
      title: 'Introduccion a la aplicacion',
      subTitle: 'Pequeño tutorial de la aplicacion',
      link: '/tutorial',
      icon: Icons.accessible_rounded
    ),
  ];

