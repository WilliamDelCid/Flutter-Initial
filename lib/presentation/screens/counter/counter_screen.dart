import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});
  static const name = 'counter_screen';

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
            },
          ),
        ],
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Valor: $clickCounter',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed function here
          //El watch no se usa en metodos <- 

          // ref.read(counterProvider.notifier).update((state) => state + 1);
          ref.read(counterProvider.notifier).state++;


        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}