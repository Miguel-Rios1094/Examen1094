import 'package:flutter/material.dart';

// Clase Producto
class Producto {
  final int id;
  final String nombre;
  final double precio;
  final String tipo;
  final String descripcion;

  Producto({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.tipo,
    required this.descripcion,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductosPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductosPage extends StatelessWidget {
  ProductosPage({super.key});

  // Lista de productos
  final List<Producto> productos = [
    Producto(id: 1, nombre: "winis", precio: 50.50, tipo: "Caramelo suave", descripcion: "Caramelo suave de diferente sabores"),
    Producto(id: 2, nombre: "doritos", precio: 10.00, tipo: "Papitas", descripcion: "Papas doritos sabor queso con chile"),
    Producto(id: 3, nombre: "de la rosa", precio: 30.75, tipo: "Paleta", descripcion: "Paleta de la rosa sabor fresa"),
    Producto(id: 4, nombre: "skittles", precio: 50.25, tipo: "Caramelos", descripcion: "Caramelo suave de diferentes sabores"),
    Producto(id: 5, nombre: "Lucas Muecas", precio: 55.99, tipo: "Paletas", descripcion: "Paleta con chile sabor fresa"),
  ];

  final List<Color> colores = [
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.orange.shade100,
    Colors.purple.shade100,
    Colors.red.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Miguel Rios Mat:22308051281094', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold)),
          backgroundColor: const Color.fromARGB(255, 11, 113, 247),
          centerTitle: true, 
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(productos.length, (index) {
              final producto = productos[index];
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colores[index % colores.length],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: const Offset(4, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        producto.nombre,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ID: ${producto.id}"),
                          Text("Precio: \$${producto.precio.toStringAsFixed(2)}"),
                          Text("Tipo: ${producto.tipo}"),
                          Text("Descripción: ${producto.descripcion}"),
                        ],
                      ),
                    ),
                  ),
                  const Divider(indent: 40, endIndent: 40),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
