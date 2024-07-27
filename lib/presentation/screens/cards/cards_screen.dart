import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
  {'elevation': 6.0, 'label': 'Elevation 6'},
  {'elevation': 7.0, 'label': 'Elevation 7'},
  {'elevation': 8.0, 'label': 'Elevation 8'},
  {'elevation': 9.0, 'label': 'Elevation 9'},
  {'elevation': 10.0, 'label': 'Elevation 10'},
  {'elevation': 11.0, 'label': 'Elevation 11'},
  {'elevation': 12.0, 'label': 'Elevation 12'},
  {'elevation': 13.0, 'label': 'Elevation 13'},
  {'elevation': 14.0, 'label': 'Elevation 14'},
  {'elevation': 15.0, 'label': 'Elevation 15'},
  {'elevation': 16.0, 'label': 'Elevation 16'},
  {'elevation': 17.0, 'label': 'Elevation 17'},
  {'elevation': 18.0, 'label': 'Elevation 18'},
  {'elevation': 19.0, 'label': 'Elevation 19'},
  {'elevation': 20.0, 'label': 'Elevation 20'},
  {'elevation': 21.0, 'label': 'Elevation 21'},
  {'elevation': 22.0, 'label': 'Elevation 22'},
  {'elevation': 23.0, 'label': 'Elevation 23'},
  {'elevation': 24.0, 'label': 'Elevation 24'},
];

class CardsScreen extends StatelessWidget {
  static const name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ...cards.map((card) => _CardType1(
              elevation: card['elevation'],
              label: card['label'],
            )),
        ...cards.map((card) => _CardType2(
              elevation: card['elevation'],
              label: card['label'],
            )),
        ...cards.map((card) => _CardType3(
              elevation: card['elevation'],
              label: card['label'],
            )),
        ...cards.map((card) => _CardType4(
              elevation: card['elevation'],
              label: card['label'],
            )),
          const SizedBox(height: 50),
      ]),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child:  Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined))),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(label),
              )
            ],
          )),
    );
  }
}





class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors.outline),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      elevation: elevation,
      child:  Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined))),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('$label - outline'),
              )
            ],
          )),
    );
  }
}



class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      color:colors.onSurfaceVariant,
      elevation: elevation,
      child:  Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined))),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('$label - Failed'),
              )
            ],
          )),
    );
  }
}


class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {


    return Card(
      clipBehavior: Clip.hardEdge, //Los hijos se salgan de su padre
      elevation: elevation,
      child:  Stack(
        children: [
      
          Image.network('https://picsum.photos/id/${elevation.toInt()}/600/350',height: 350,fit: BoxFit.cover,),
          
          Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
                ),
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined)))),
         
        ],
      ),
    );
  }
}
