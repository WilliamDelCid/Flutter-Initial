import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );  
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Wrap(
          spacing: 10, //Agregar espacio en todo el alrededor
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated'),
            ),

            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated Disabled'),
            ),
            
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated  Icon'),
            ),

            FilledButton(onPressed: (){}, child:const Text('Filled')),

            FilledButton.icon(onPressed: (){}, icon:const  Icon(Icons.accessibility_new),label: const Text('Filled icon'),),
            OutlinedButton(onPressed: (){}, child: const Text('Outline')),
            OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.terminal), label: const Text('Outline icon'),),
            TextButton(onPressed: (){}, child: const Text('Text')),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.account_box_outlined), label: const Text('Text icon'),),
         
            //TODO: custom buttom
            const CustomButton(),
            const IconButton(onPressed: null, icon:  Icon(Icons.app_registration_rounded)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_rounded),style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(colors.primary),
              iconColor: WidgetStateProperty.all(colors.onPrimary),
            ),),
          ],
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: _Material(colors: colors),
    );
  }
}

class _Material extends StatelessWidget {
  const _Material({
    required this.colors,
  });

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colors.primary,
      child: InkWell(
        onTap: (){},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Text('Hola Mundo',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}