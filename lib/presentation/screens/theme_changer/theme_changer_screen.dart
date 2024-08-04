import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer Screen'),
        actions: [
            IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state)=> !state);
            },
          ),
        ],
      ),
      body: const _ThemChangerView(),
      
    );
  }
}

class _ThemChangerView extends ConsumerWidget {
  const _ThemChangerView();

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final List<Color> colorList = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);
    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: 
    (context, index) {
        final Color color = colorList[index];
        return RadioListTile(
          title: Text('Este color',style: TextStyle(color:color),),
          subtitle: Text('Color ${color.value}'),
          activeColor: color,
          value: index, 
          groupValue: selectedColor, 
          onChanged: (value){
            //TODO: Cambiar el color de la app
              ref.read(selectedColorProvider.notifier).state = index;
          });
    });
  }
}