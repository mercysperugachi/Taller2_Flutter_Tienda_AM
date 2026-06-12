import 'package:flutter/material.dart';
import '../models/producto.dart';

class ProductoDetalleScreen extends StatelessWidget {
  final Producto producto;

  const ProductoDetalleScreen({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Parte superior: Imagen con Stack superpuesto
              SizedBox(
                height: 350,
                child: Stack(
                  clipBehavior: Clip.none, // Permite que el botón flotante sobresalga
                  children: [
                    // Imagen de fondo (usamos el mismo estilo de contenedor del home)
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.grey[100],
                      child: Icon(
                        _getIcono(producto.imagenUrl),
                        size: 150,
                        color: Colors.grey[400],
                      ),
                    ),
                    // Botón de volver atrás (esquina superior izquierda)
                    Positioned(
                      top: 16,
                      left: 16,
                      child: IconButton(
                        style: IconButton.styleFrom(backgroundColor: Colors.white),
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    // Badge de descuento (esquina superior izquierda)
                    Positioned(
                      top: 70, // Lo bajamos a 70 para que no choque con la flecha de volver atrás (que está en 16)
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.red[900], // Usamos el rojo vino para mantener el estilo
                          borderRadius: BorderRadius.circular(20), // Bordes bien redondeados
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min, // Para que el Row ocupe solo el espacio necesario
                          children: [
                            Icon(Icons.local_offer, color: Colors.white, size: 14),
                            SizedBox(width: 4),
                            Text(
                              '-20% OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Ícono de corazón/favorito (esquina superior derecha)
                    Positioned(
                      top: 16,
                      right: 16,
                      child: IconButton(
                        style: IconButton.styleFrom(backgroundColor: Colors.white),
                        icon: Icon(Icons.favorite_border, color: Colors.red[900]),
                        onPressed: () {},
                      ),
                    ),
                    // Botón flotante "Agregar al carrito" (esquina inferior derecha)
                    Positioned(
                      bottom: -25,
                      right: 24,
                      child: FloatingActionButton(
                        backgroundColor: Colors.red[900],
                        onPressed: () {},
                        child: const Icon(Icons.shopping_cart, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40), // Espacio extra para compensar el FloatingActionButton
              
              // Parte inferior: Información en un Column
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nombre del producto
                    Text(
                      producto.nombre,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Precio
                    Text(
                      '\$${producto.precio.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Descripción detallada
                    const Text(
                      'Descripción del Producto',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      producto.descripcion * 3, // Repetimos para simular texto largo
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Botón de compra adicional
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Comprar Ahora',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método auxiliar para el ícono
  IconData _getIcono(String tipo) {
    switch (tipo) {
      case 'laptop': return Icons.laptop;
      case 'headphones': return Icons.headphones;
      case 'watch': return Icons.watch;
      case 'camera': return Icons.camera_alt;
      case 'keyboard': return Icons.keyboard;
      case 'mouse': return Icons.mouse;
      default: return Icons.shopping_bag;
    }
  }
}