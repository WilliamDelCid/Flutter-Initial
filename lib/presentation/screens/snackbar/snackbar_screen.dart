import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});
  void showCustomSnackbar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hola soy un snackbar'),
        action: SnackBarAction(
          label: 'Ok!',
          onPressed: (){
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );

  }

  void openDialog(BuildContext context){
    showDialog(
      barrierDismissible: false, //No se puede cerrar con el boton de atras.
      context: context,
      builder: (context){ //Se creara en tiempo de ejecucion.
        return AlertDialog(
          title: const Text('Dialogo de alerta'),
          content: const Text('Este es un dialogo de alerta'),
          actions: [
            TextButton(
              onPressed: (){
                context.pop();
              },
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: (){
                context.pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snacbars y dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(onPressed: (){
              showAboutDialog(context: context,
              children: const [
                Text('Este es un dialogo de informacion'),
                Text('Puedes agregar mas texto'),
              ],
              );
            }, child: const Text('Licencias usadas')),
            FilledButton.tonal(onPressed: (){
              openDialog(context);
            }, child: const Text('Mostrar dialogo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=>showCustomSnackbar(context),
        icon: const Icon(Icons.remove_red_eye_outlined),
         label:const Text('Mostrar Snackbar'),
        ),
    );
  }
}