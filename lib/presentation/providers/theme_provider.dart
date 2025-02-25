
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//un simple booleano
final isDarkModeProvider = StateProvider<bool>((ref)=> false);

//Listado de colores inmutable
final colorListProvider = Provider((ref)=> colorList);


final selectedColorProvider = StateProvider((ref)=> 0);
