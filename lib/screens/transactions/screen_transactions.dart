import 'package:flutter/material.dart';

class Screentransactions extends StatelessWidget {
  const Screentransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(7),
      itemBuilder: (ctx, index) {
        return const Card(
          elevation: 0,
          child: ListTile(
            leading: CircleAvatar(
              radius: 50,
              child: Text(
                '12\n Dec',
                textAlign: TextAlign.center,
              ),
            ),
            title: Text('Rs 10000'),
            subtitle: Text('travelling'),
          ),
        );
      },
      separatorBuilder: (ctx, index) {
        return SizedBox(height: 2);
      },
      itemCount: 20,
    );
  }
}
