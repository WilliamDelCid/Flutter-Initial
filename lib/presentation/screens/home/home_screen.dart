import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>(); // Llave para el scaffold de la pantalla para tener la referencia de la pantalla
    return Scaffold(
      key: scaffoldKey,
      appBar:  AppBar(
        title:const Text('Flutter'),
      ),
      body: const _HomeView(),
      // endDrawer: , Un menu que se abre al revez del menu normal
      drawer: SideMenu(scaffoldKey: scaffoldKey,),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView( );

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context,index){
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      }
    
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItems menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded,color:colors.primary),
      onTap: (){
        //TODO: navegar a otra pantalla
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen()
        //   )
        // );
        // Navigator.pushNamed(context, menuItem.link);

        // context.pushNamed(CardsScreen.name );
        context.push(menuItem.link);

      },
    );
  }
}