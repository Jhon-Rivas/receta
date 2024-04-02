import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recetas/config/helpers/get_petition.dart';

class IngredienteScreen extends StatefulWidget {
  final String idDrink;

  const IngredienteScreen({super.key, required this.idDrink});

  @override
  State<IngredienteScreen> createState() => _IngredienteScreenState();
}

class _IngredienteScreenState extends State<IngredienteScreen> {
  final petition = GetPetition();
  dynamic receta = [];

  void getData() async {
    var response = await petition.getIngredientes(widget.idDrink);
    receta = response["drinks"];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: ListView.builder(
        itemCount: receta.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 45,
                        width: 55,
                        decoration: const BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20), // Agrega espacio vertical
                      child: Text(
                        receta[index]["strDrink"].toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          receta[index]["strDrinkThumb"],
                          width: size.width * 0.2,
                          height: size.width * 0.2,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Container(
                              height: 150,
                              width: size.width * 0.7,
                              child: Text("cargando"),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20), // Agrega espacio vertical
                      child: Column(
                        children: [
                          Text(
                            "Ingredients:",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            //'${receta[index]["strIngredient1"].toString()}, ${receta[index]["strIngredient2"].toString()}, ${receta[index]["strIngredient3"].toString()}, ${receta[index]["strIngredient4"].toString()}, ${receta[index]["strIngredient5"].toString()}, ${receta[index]["strIngredient6"].toString()}',
                            Ingredientes(receta[index]),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Description: ${receta[index]["strInstructions"].toString()}",
                            style: const TextStyle(
                              fontSize: 18,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

String Ingredientes(Map<String, dynamic> receta) {
  String ingredientsText = ''; //inicializar la cadena
  for (int i = 1; i <= 15; i++) {
    // verificamos que el ingrediente no este null o llegue vacio
    if (receta['strIngredient$i'] != null && receta['strIngredient$i'] != '') {
      ingredientsText += '${receta['strIngredient$i']}, ';
    }
  }
  return ingredientsText.substring(
      0, ingredientsText.length - 2); // Elimina la coma extra al final
}


/*final List<String> items = [
    'uno',
    'dow',
    "tres",
    "cuatro",
    'uno',
    'dow',
    "tres",
    "cuatro",
    'uno',
    'dow',
    "tres",
    "cuatro",
    'uno',
    'dow',
    "tres",
    "cuatro",
    'uno',
    'dow',
    "tres",
    "cuatro",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListaWidget(
                              id: index.toString(),
                            )));
              },
              title: Text(items[index]),
            );
          }),
    );
  }*/