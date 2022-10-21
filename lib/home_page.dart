import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final friendNameController = TextEditingController();

  int? harmony;

  @override
  void dispose() {
    nameController.dispose();
    friendNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade300,
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70),
                bottomLeft: Radius.circular(70))),
        elevation: 14,
        title: Text(
          "Love Compatibility Calculator ",
          style: GoogleFonts.alike(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(32.0),
          children: [
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                helperText: "",
                hintText: "Your Name",
                prefixIcon: Icon(Icons.person, color: Colors.purple),
              ),
              validator: emptyValidator,
            ),
            TextFormField(
              controller: friendNameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                helperText: "",
                hintText: "Your Friend Name",
                prefixIcon: Icon(Icons.person, color: Colors.purple),
              ),
              validator: emptyValidator,
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              harmony != null ? "%$harmony" : "",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 45,
                  color: Colors.purple.shade700),
            ))
          ]
              .map((child) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: child,
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final isValid = _formKey.currentState!.validate();
          hesapla(nameController.text + friendNameController.text);
        },
        child: const Icon(
          Icons.favorite_rounded,
          color: Colors.white70,
        ),
      ),
    );
  }

  String? emptyValidator(value) {
    if (value!.isEmpty) {
      return 'Lütfen bir isim girin';
    }
  }

  hesapla(inputValue) {
    var input = inputValue.toLowerCase().split('');
    var list1 = input.toSet();
    var myMap = Map<String, int>.fromIterables(
        list1, List.generate(list1.length, (i) => 0));
    input.forEach((e) => myMap[e] = myMap[e]! + 1);
    var valueList = myMap.values.toList();
    while (int.parse(valueList.join("")) > 100) {
      valueList = topla(valueList);
    }

    setState(() {
      harmony = int.parse(valueList.join(""));
    });
  }

  topla(valueList) {
    int azalanSayac = valueList.length - 1;
    int artanSayac = 0;
    List<int> toplamList = [];
    int sonIndex = (valueList.length / 2).ceil();

    while (artanSayac != sonIndex) {
      if (artanSayac == azalanSayac) {
        toplamList.add(valueList[artanSayac]);
      } else {
        toplamList.add(valueList[artanSayac] + valueList[azalanSayac]);
      }
      azalanSayac--;
      artanSayac++;
    }
    return toplamList;
  }
}
