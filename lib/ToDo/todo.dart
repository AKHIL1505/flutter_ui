import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('task_Box');

  runApp(MaterialApp(
    home: HiveMainPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HiveMainPage extends StatefulWidget {
  @override
  State<HiveMainPage> createState() => _HiveMainPageState();
}

class _HiveMainPageState extends State<HiveMainPage> {
  List<Map<String, dynamic>> MyList = [];

  /// object creating for hive
  final tBox = Hive.box("task_Box");

  @override
  void initState() {
    loadTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo")),
      body: MyList.isEmpty
          ? const Center(
        child: Text(
          "No Data",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
      )
          : ListView.builder(
        itemCount: MyList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.purple[100],
            margin: EdgeInsets.all(10),
            elevation: 3,
            child: ListTile(
              title: Text("${MyList[index]['name']}"),
              subtitle: Text("${MyList[index]['details']}"),
              trailing: Wrap(children: [
                IconButton(
                    onPressed: () {
                      showForm(context, MyList[index]['key']);
                    },
                    icon: const Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      deleteTask(MyList[index]['key']);
                    },
                    icon: const Icon(Icons.delete)),
              ]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => showForm(context, null),
          child: const Icon(Icons.add)),
    );
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  void showForm(BuildContext context, int? id) async {
    if (id != null) {
      final ex_task = MyList.firstWhere((element) => element['key'] == id);
      nameController.text = ex_task['name'];
      detailsController.text = ex_task['details'];
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 5,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 120,
            left: 15,
            right: 15,
            top: 15,
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Task name'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: detailsController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Task Details'),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (id == null) {
                        createTask({
                          'name': nameController.text,
                          'details': detailsController.text
                        });
                      }
                      if (id != null) {
                        updateTask(id, {
                          'name': nameController.text,
                          'details': detailsController.text
                        });
                      }

                      nameController.text = "";
                      detailsController.text = "";
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? "Create Task" : "Update Task"))
              ]),
        );
      },
    );
  }

  Future<void> createTask(Map<String, String> task) async {
    await tBox.add(task);
    loadTask();
  }

  void loadTask() {
    final taskData = tBox.keys.map((individualKey) {
      final value = tBox.get(individualKey);
      return {
        'key': individualKey,
        'name': value['name'],
        'details': value['details']
      };
    }).toList();
    setState(() {
      MyList = taskData.reversed.toList();
    });
  }

  Future<void> updateTask(int key, Map<String, dynamic> upTask) async {
    await tBox.put(key, upTask);
    loadTask();
  }

  Future<void> deleteTask(int key) async {
    await tBox.delete(key);
    loadTask();
  }

  /// reading single data
  Map<String, dynamic> readData(int key) {
    final data = tBox.get(key);
    return data;
  }
}
