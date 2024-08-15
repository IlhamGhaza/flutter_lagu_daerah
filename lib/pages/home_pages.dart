import 'package:flutter/material.dart';
import 'package:flutter_lagu_daerah/models/province.dart';
import 'package:flutter_lagu_daerah/pages/detail_pages.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lagu Daerah',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: laguDaerahList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailPage(province: laguDaerahList[index]);
                }));
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10.0),
                  title: Text(
                    laguDaerahList[index].laguDaerah,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    '${laguDaerahList[index].nama} - ${laguDaerahList[index].ibuKota}',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      laguDaerahList[index].photo,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
