import 'package:day_one/provider/theme_provider.dart';
import 'package:day_one/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              themeProvider.themeDataStyle == ThemeDataStyle.dark
                  ? 'Dark Theme'
                  : 'Light Theme',
              style: const TextStyle(fontSize: 25.0),
            ),
            const SizedBox(height: 10.0),
            Transform.scale(
              scale: 1.4,
              child: Switch(
                value: themeProvider.themeDataStyle == ThemeDataStyle.dark
                    ? true
                    : false,
                onChanged: (isOn) {
                  setState(() {
                    themeProvider.changeTheme();
                  });
                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
