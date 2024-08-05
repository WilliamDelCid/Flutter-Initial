
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//un simple booleano
final isDarkModeProvider = StateProvider<bool>((ref)=> false);

//Listado de colores inmutable
final colorListProvider = Provider((ref)=> colorList);

//Simple int
final selectedColorProvider = StateProvider((ref)=> 0);






// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,AppTheme>((ref)=> ThemeNotifier()
);
//El que controla es el themeNotifier
//Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme>{
    //STATE = ESTADO = AppTheme
    ThemeNotifier() : super(AppTheme()); //Constructor para instanciar el objeto

  void toggleDarkMode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorTheme){
    state = state.copyWith(selectedColor: colorTheme);
  }

  
}