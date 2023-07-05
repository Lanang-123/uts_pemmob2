import 'package:flutter/material.dart';
import 'package:yoii/api/Gigs.dart';
import 'package:yoii/data/bannerHome.dart';
import 'package:yoii/data/rekomHome.dart';
import 'package:yoii/models/gigs.dart';
import 'package:yoii/theme.dart';

class RecomendedHome extends StatefulWidget {
   const RecomendedHome({Key? key}) : super(key: key);

  @override
  State<RecomendedHome> createState() => _RecomendedHomeState();
}

class _RecomendedHomeState extends State<RecomendedHome> {
  final GigsController _gigsController = GigsController();
  List<Gigs> _gigs =[];

  bool _isLoading = false;

  Future<void> fetchGigs() async {
    setState(() {
      _isLoading = true;
    });
    final gigs = await _gigsController.getGigs();
    setState(() {
      _gigs = gigs;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchGigs();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Center(child: CircularProgressIndicator(),) : ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (BuildContext context,index) {
        Gigs gig = _gigs[_gigs.length - index - 1];
        return Container(
          margin: EdgeInsets.only(right: 10),
          height: 133,
          width: 197,
          child: Stack(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    "https://apigapro.000webhostapp.com/api/gigs/${gig.image}",
                    fit: BoxFit.cover,
                  )),
              Container(
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      ungu2.withOpacity(0),
                      ungu2.withOpacity(0.8)
                    ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 140,
                      child: Text(
                        gig.title,
                        style:
                            bold.copyWith(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset('assets/images/rating.png'),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "4/5",
                          style: regular.copyWith(
                              color: Colors.white, fontSize: 13),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
