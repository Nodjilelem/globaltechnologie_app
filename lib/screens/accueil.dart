import 'package:flutter/material.dart';
import 'dart:math';

class AccueilGlobalTechnologie extends StatefulWidget {
  const AccueilGlobalTechnologie({super.key});

  @override
  State<AccueilGlobalTechnologie> createState() => _AccueilGlobalTechnologieState();
}

class _AccueilGlobalTechnologieState extends State<AccueilGlobalTechnologie>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
          textStyle: const TextStyle(fontSize: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _AnimatedBackgroundPainter(_controller.value),
            child: child,
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Bienvenue chez GlobalTechnologie 👋",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00796B),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Explorez nos formations et produits innovants.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF00796B),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                buildButton(
                  label: "Commencer",
                  icon: Icons.arrow_forward,
                  onPressed: () {
                    Navigator.pushNamed(context, '/inscription');
                  },
                ),
                buildButton(
                  label: "Se connecter",
                  icon: Icons.login,
                  onPressed: () {
                    Navigator.pushNamed(context, '/connexion');
                  },
                ),
                buildButton(
                  label: "Espace Vente",
                  icon: Icons.shopping_cart,
                  onPressed: () {
                    Navigator.pushNamed(context, '/vente');
                  },
                ),
                buildButton(
                  label: "Formation Métier",
                  icon: Icons.school,
                  onPressed: () {
                    Navigator.pushNamed(context, '/formation');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedBackgroundPainter extends CustomPainter {
  final double value;

  _AnimatedBackgroundPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFE0F7FA);
    canvas.drawRect(Offset.zero & size, paint);

    final wavePaint = Paint()
      ..color = const Color(0xFFB2EBF2).withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final path = Path();
    for (double y = 0; y <= size.height; y += 50) {
      path.moveTo(0, y);
      for (double x = 0; x <= size.width; x += 20) {
        path.lineTo(x, y + sin((x / 50 + value * 10)) * 10);
      }
    }
    canvas.drawPath(path, wavePaint);

    final orbPaint = Paint()..color = const Color(0xFF80DEEA).withOpacity(0.8);
    for (int i = 0; i < 20; i++) {
      final dx = sin(value * 2 * pi + i) * 150 + size.width / 2;
      final dy = cos(value * 2 * pi + i * 2) * 100 + size.height / 2;
      canvas.drawCircle(Offset(dx, dy), 6 + sin(value * 10 + i) * 3, orbPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _AnimatedBackgroundPainter oldDelegate) {
    return oldDelegate.value != value;
  }
}
