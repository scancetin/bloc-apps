// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/box_bloc.dart';
import '../models/box.dart';

class BasicHomeView extends StatelessWidget {
  const BasicHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Boxes'),
      ),
      body: Center(
        child: BlocBuilder<BoxBloc, BoxState>(
          builder: (context, state) {
            if (state is BoxInitial) {
              return const CircularProgressIndicator();
            } else if (state is BoxLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Text(
                      state.boxes.length.toString(),
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.boxes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              color: state.boxes[index].color,
                            ),
                            Text((index + 1).toString()),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Text("Error error!");
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              context.read<BoxBloc>().add(AddBox(Box.boxes[0]));
              // context.read<BoxBloc>().add(AddBox(Box(name: "box", value: 45, color: Colors.white)));
            },
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              context.read<BoxBloc>().add(RemoveBox(Box.boxes[0]));
            },
          ),
        ],
      ),
    );
  }
}
