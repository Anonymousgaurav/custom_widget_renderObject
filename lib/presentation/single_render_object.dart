import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyRenderPhysicalShapeDemo extends StatefulWidget {
  const MyRenderPhysicalShapeDemo({Key? key}) : super(key: key);

  @override
  MyRenderPhysicalShapeState createState() => MyRenderPhysicalShapeState();
}

class MyRenderPhysicalShapeState extends State<MyRenderPhysicalShapeDemo> {
  double _elevation = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyRenderPhysicalShapeDemo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Slider(
            value: _elevation,
            onChanged: (value) => setState(
              () => _elevation = value,
            ),
          ),
          MyPhysicalShape(
            elevation: _elevation,
            child: const SizedBox(
              width: 50,
              height: 50,
            ),
          )
        ],
      ),
    );
  }
}

class MyPhysicalShape extends SingleChildRenderObjectWidget {
  final _elevation;

  const MyPhysicalShape({
    required double elevation,
    required Widget child,
    Key? key,
  })  : _elevation = elevation,
        super(child: child, key: key);

  @override
  RenderPhysicalShape createRenderObject(BuildContext context) {
    return RenderPhysicalShape(
      clipBehavior: Clip.none,
      color: const Color(0x61000000),
      clipper: ShapeBorderClipper(
        shape: const CircleBorder(),
        textDirection: Directionality.of(context),
      ),
      shadowColor: Colors.black,
      elevation: _elevation,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderPhysicalShape renderObject,) {
    renderObject.elevation = _elevation;
  }
}
