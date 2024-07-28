import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls + Title'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloperMode = true;
  Transportation selectTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloperMode,
          onChanged: (value) {
            setState(() {
              isDeveloperMode = value;
            });
          },
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
        ),
        ExpansionTile(
            title: const Text('Vehiculos de transporte'),
            subtitle: Text('$selectTransportation'),
            children: [
              RadioListTile(
                  title: const Text('Car'),
                  subtitle: const Text('Vehiculo terrestre'),
                  value: Transportation.car,
                  groupValue: selectTransportation,
                  onChanged: (value) => {
                        setState(() {
                          selectTransportation = Transportation.car;
                        })
                      }),
              RadioListTile(
                  title: const Text('Boat'),
                  subtitle: const Text('Vehiculo acuatico'),
                  value: Transportation.boat,
                  groupValue: selectTransportation,
                  onChanged: (value) => {
                        setState(() {
                          selectTransportation = Transportation.boat;
                        })
                      }),
              RadioListTile(
                  title: const Text('Plane'),
                  subtitle: const Text('Vehiculo aereo'),
                  value: Transportation.plane,
                  groupValue: selectTransportation,
                  onChanged: (value) => {
                        setState(() {
                          selectTransportation = Transportation.plane;
                        })
                      }),
              RadioListTile(
                  title: const Text('Submarine'),
                  subtitle: const Text('Vehiculo submarino'),
                  value: Transportation.submarine,
                  groupValue: selectTransportation,
                  onChanged: (value) => {
                        setState(() {
                          selectTransportation = Transportation.submarine;
                        })
                      }),
            ]),

        
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
              'Seleccionado: ${selectTransportation.toString().split('.').last}'),
        ),

        const SizedBox(
          height: 20,
        ),

        CheckboxListTile(
          title: const Text('Desayuno?'),
          value: wantsBreakfast, onChanged: (value){
          setState(() {
            wantsBreakfast = !wantsBreakfast;
          });
        }),
        CheckboxListTile(
          title: const Text('Almuerzo?'),
          value: wantsLunch, onChanged: (value){
          setState(() {
            wantsLunch = !wantsLunch;
          });
        }),
        CheckboxListTile(
          title: const Text('Cena?'),
          value: wantsDinner, onChanged: (value){
          setState(() {
            wantsDinner = !wantsDinner;
          });
        }),
      ],
    );
  }
}
