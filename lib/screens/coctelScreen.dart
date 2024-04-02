import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recetas/screens/ingredienteScreen.dart';
import '../config/helpers/get_petition.dart';

class CoctelScreen extends StatefulWidget {
  const CoctelScreen({super.key});

  @override
  State<CoctelScreen> createState() => _CoctelScreenState();
}

class _CoctelScreenState extends State<CoctelScreen> {
  final petition = GetPetition();
  dynamic receta = [];

  void getData() async {
    var response = await petition.getProducto();
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
          return GestureDetector(
            onTap: () {
              // Navegar a la pantalla IngredientesScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IngredienteScreen(
                    idDrink: receta[index]["idDrink"],
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(receta[index]["strDrinkThumb"],
                              width: size.width * 0.2,
                              height: size.width * 0.2,
                              fit: BoxFit.cover, loadingBuilder:
                                  (context, child, loadingProgress) {
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
                          }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(receta[index]["strDrink"].toString()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
