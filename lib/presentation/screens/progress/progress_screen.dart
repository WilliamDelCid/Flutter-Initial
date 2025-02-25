import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressScreen extends StatelessWidget {

  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView()
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const  Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text('Circular Progress Indicator', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          CircularProgressIndicator(strokeWidth: 2,backgroundColor: Colors.black45,),
          SizedBox(height: 20),
          Text('Circular y Linear controlado', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder( //Algo que se va a contruir en tiempo de ejecucion
      stream: Stream.periodic(const Duration(milliseconds: 300),(value){
        return (value * 2)/100;
      }).takeWhile((value)=> value < 100), //Flujo de introduccion de datos
      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

        return  Padding(
          padding: const  EdgeInsets.symmetric(horizontal: 20),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black12,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: LinearProgressIndicator(
                value: progressValue,
                backgroundColor: Colors.black12,
              )
              ),
            ],
          )
        );
      }
    );
  }
}