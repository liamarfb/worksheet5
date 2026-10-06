import 'package:flutter/material.dart';

const String studentName = 'Liam Arta Febrio'; 
const String studentId = '2415051087'; 

void main() => runApp(const DebuggingApp());

class DebuggingApp extends StatelessWidget {
  const DebuggingApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DebuggingScreen(),
    );
  }
}

class DebuggingScreen extends StatefulWidget {
  const DebuggingScreen({super.key});
  
  @override
  State<DebuggingScreen> createState() => _DebuggingScreenState();
}

class _DebuggingScreenState extends State<DebuggingScreen> {
  // Variabel penahan untuk Kasus D
  bool _isNavigating = false;

  // Penyelesaian Kasus D: Mencegah navigasi ganda
  void _pindahHalamanAman() async {
    if (_isNavigating) return; 
    
    setState(() => _isNavigating = true); 
    
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const DummyScreen()),
    );
    
    if (mounted) setState(() => _isNavigating = false); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tahap 16: Debugging')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              '$studentId - $studentName', 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
            ),
            const SizedBox(height: 20),
            
            // Penyelesaian Kasus A: Dibungkus Expanded
            Row(
              children: [
                const Icon(Icons.info, color: Colors.blue, size: 30),
                const SizedBox(width: 8),
                Expanded(
                  child: Text('Kasus A: $studentId - $studentName - teks ini sangat panjang sekali dan tadinya bikin error, tapi sekarang aman dan bisa turun baris.'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Penyelesaian Kasus B: ListView dibungkus Expanded
            const Align(
              alignment: Alignment.centerLeft, 
              child: Text('Kasus B & C: Daftar Item', style: TextStyle(fontWeight: FontWeight.bold))
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => ListTile(
                  tileColor: index % 2 == 0 ? Colors.grey[200] : Colors.white,
                  title: Text('Data Item ke-$index'),
                ),
              ),
            ),
            const SizedBox(height: 10),
            
            // Tombol untuk Kasus D
            ElevatedButton(
              onPressed: _pindahHalamanAman,
              child: const Text('Kasus D: Klik Pindah Halaman'),
            ),
            const SizedBox(height: 10),

            // Penyelesaian Kasus C: TextField di bawah
            const TextField(
              decoration: InputDecoration(
                labelText: 'Kasus C: Ketik di sini',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman tujuan untuk Kasus D
class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Detail')),
      body: const Center(child: Text('Berhasil masuk tanpa numpuk halaman!')),
    );
  }
}