import 'package:flutter/material.dart';
import 'dart:math';

class AccueilGlobalTechnologie extends StatefulWidget {
  const AccueilGlobalTechnologie({super.key});

  @override
  State<AccueilGlobalTechnologie> createState() =>
      _AccueilGlobalTechnologieState();
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
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 6,
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
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Votre partenaire numérique de confiance.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // 🔹 Boutons
                buildButton(
                  label: "Connexion",
                  icon: Icons.login,
                  color: Colors.blue[800]!,
                  onPressed: () {
                    Navigator.pushNamed(context, '/choixConnexion');
                  },
                ),
                buildButton(
                  label: "Espace Vente",
                  icon: Icons.shopping_cart,
                  color: Colors.amber[600]!,
                  onPressed: () {
                    Navigator.pushNamed(context, '/vente');
                  },
                ),
                buildButton(
                  label: "Formation Métier",
                  icon: Icons.school,
                  color: Colors.red[700]!,
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
    final paint = Paint()..color = Colors.blue[50]!; // fond bleu clair
    canvas.drawRect(Offset.zero & size, paint);

    final wavePaint = Paint()
      ..color = Colors.blue[300]!.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final path = Path();
    for (double y = 0; y <= size.height; y += 60) {
      path.moveTo(0, y);
      for (double x = 0; x <= size.width; x += 20) {
        path.lineTo(x, y + sin((x / 50 + value * 10)) * 12);
      }
    }
    canvas.drawPath(path, wavePaint);

    final orbPaint = Paint()..color = Colors.blue[200]!.withOpacity(0.6);
    for (int i = 0; i < 25; i++) {
      final dx = sin(value * 2 * pi + i) * 180 + size.width / 2;
      final dy = cos(value * 2 * pi + i * 2) * 120 + size.height / 2;
      canvas.drawCircle(Offset(dx, dy), 6 + sin(value * 10 + i) * 4, orbPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _AnimatedBackgroundPainter oldDelegate) {
    return oldDelegate.value != value;
  }
}
