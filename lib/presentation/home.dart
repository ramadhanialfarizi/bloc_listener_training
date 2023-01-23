import 'package:bloc_listener_training/bloc/bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Builder'),
        centerTitle: true,
      ),
      body: BlocListener(
        bloc: myCounter,
        // keyword "listenWhen" biasanya digunakan untuk pengkondisian / ada suatu ketentuan yang harus dipenuhi
        // sama seperti "buildWhen"
        //listenWhen: (previous, current) {},
        listener: (context, state) {
          if (state == 5) {
            print(state);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('sudah mencapai angka $state'),
                duration: const Duration(milliseconds: 800),
              ),
            );
          }
        },
        child: BlocBuilder<Counter, int>(
          bloc: myCounter,
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "$state",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                ],
              ),
            );
          },
        ),
      ),

      // StreamBuilder(
      //   // KITA BISA MEMBERIKAN INISIAL DATA DI STREAM
      //   initialData: myCounter.init,
      //   stream: myCounter.stream,
      //   builder: (context, snapshot) {
      //
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => myCounter.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), //
    );
  }
}
