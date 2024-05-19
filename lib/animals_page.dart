import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/todo_provider.dart';

class AnimalsPage extends StatelessWidget {
  const AnimalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animals Page'),
      ),
      body: Consumer<TodoProvider>(builder: (_, todoProvider, __) {
        List<String> animals = todoProvider.animals;
        if (animals.isEmpty) {
          return const Center(
            child: Text('Belum Ada Hewan'),
          );
        }
        return ListView.builder(
          itemCount: animals.length,
          itemBuilder: (context, index) {
            String animal = animals[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(animal),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  context.read<TodoProvider>().remove(index);
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildAddAnimals(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  buildAddAnimals(context) {
    final edtAnimals = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Animals'),
          content: TextField(
            controller: edtAnimals,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                context.read<TodoProvider>().add(edtAnimals.text);
                Navigator.pop(context);
              },
              child: const Text("Add"),
            )
          ],
        );
      },
    );
  }
}
