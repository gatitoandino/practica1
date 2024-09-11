import 'package:flutter/material.dart';

void main() {
  runApp(MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Aplicación',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalEstado createState() => _PaginaPrincipalEstado();
}

class _PaginaPrincipalEstado extends State<PaginaPrincipal> {
  int _indiceSeleccionado = 0;

  static List<Widget> _opcionesWidget = <Widget>[
    PantallaLogin(),
    PantallaCatalogo(),
  ];

  void _alTocarElemento(int indice) {
    setState(() {
      _indiceSeleccionado = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blue[400],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Acción de búsqueda
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Acción de Mas
            },
          ),
        ],

      ),
      body: _opcionesWidget.elementAt(_indiceSeleccionado),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Catálogo',
          ),

        ],
        currentIndex: _indiceSeleccionado,
        selectedItemColor: Colors.blue[800],
        onTap: _alTocarElemento,
      ),
    );
  }
}
class PantallaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('Imagenes/Logotipo Horizontal.png'), // Asegúrate de tener esta imagen en tu carpeta assets
          TextField(
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Contraseña'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Acción de Iniciar Sesion
            },
            child: Text('Iniciar Sesion'),
          ),
        ],
      ),
    );
  }
}
class PantallaCatalogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Image.asset('Imagenes/LOGO UAndina.png'),
          title: Text('Nombre Producto 1'),
          subtitle: Text('Descripción del producto 1'),
          trailing: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PantallaDetalle(
                    producto: 'Producto 1',
                    precio: 'S/. 1000',
                    descripcion: 'Descripción del producto 1',
                    imagen: 'Imagenes/LOGO UAndina.png')),
              );
            },
            child: Text('Ver Detalle'),
          ),
        ),
        ListTile(
          leading: Image.asset('Imagenes/LOGO UAndina.png'),
          title: Text('Nombre Producto 2'),
          subtitle: Text('Descripción del producto 2'),
          trailing: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PantallaDetalle(
                    producto: 'Producto 2',
                    precio: 'S/. 20000',
                    descripcion: 'Descripción del producto 2',
                    imagen: 'Imagenes/LOGO UAndina.png')),

              );
            },
            child: Text('Ver Detalle'),

          ),
        ),
      ],
    );
  }
}
class PantallaDetalle extends StatelessWidget {
  final String producto;
  final String precio;
  final String descripcion;
  final String imagen;

  PantallaDetalle({required this.producto,required this.precio, required this.descripcion, required this.imagen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: <Widget>[
            Image.asset(imagen),
            SizedBox(height: 40),
            Text(precio),
            Text(descripcion),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción de comprar
              },
              child: Text('Comprar'),
              style: ElevatedButton.styleFrom(
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.blue[900],
      ),

    );
  }
}
