import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pin_provider.dart';
import '../widgets/pin_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pinProvider = Provider.of<PinProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Pinterest Clone')),
      body: FutureBuilder(
        future: pinProvider.fetchPins(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return Center(child: Text('An error occurred!'));
          } else {
            return GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: pinProvider.pins.length,
              itemBuilder: (ctx, i) => PinWidget(pinProvider.pins[i]),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            );
          }
        },
      ),
    );
  }
}
