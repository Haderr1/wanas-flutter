import 'package:flutter/material.dart';
import 'package:waanaass/ui/HomePage/home_screen.dart';
import 'edit_item.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  String gender = "man";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        leadingWidth: 80,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF00966A),
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );},
                icon: const Icon(Icons.check_outlined, color: Colors.white),
                iconSize: 24,
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(),
                splashRadius: 24,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Removed the Text("Profile") from here
              const SizedBox(height: 40),
              EditItem(
                title: "Photo",
                widget: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/images/greennn.jpg"),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.lightBlueAccent,
                        ),
                        child: const Text("Upload Image"),
                      ),
                    ],
                  ),
                ),
              ),
              const EditItem(
                title: "Name",
                widget: TextField(),
              ),
              const SizedBox(height: 20),
              EditItem(
                title: "Gender",
                widget: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          gender = "man";
                        });
                      },
                      icon: Icon(
                        Icons.male,
                        color: gender == "man" ? Colors.black : Colors.grey,
                      ),
                      color: gender == "man"
                          ? Colors.redAccent
                          : Colors.indigo,
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          gender = "woman";
                        });
                      },
                      icon: Icon(
                        Icons.female,
                        color: gender == "woman" ? Colors.black : Colors.grey,
                      ),
                      color: gender == "woman"
                          ? Colors.red
                          : Colors.indigo,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const EditItem(
                widget: TextField(),
                title: "Age",
              ),
              const SizedBox(height: 20),
              const EditItem(
                widget: TextField(),
                title: "Email",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
