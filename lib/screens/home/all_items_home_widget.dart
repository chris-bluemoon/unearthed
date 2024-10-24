import 'package:flutter/material.dart';
import 'package:unearthed/shared/item_results.dart';
import 'package:unearthed/shared/styled_text.dart';

class AllItemsHomeWidget extends StatelessWidget {
  const AllItemsHomeWidget({super.key});



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Image.asset('assets/img/backgrounds/new_arrivals_home_page_image.jpg'),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => (const ItemResults('occasion','party'))));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // StyledHeading('SOPHISCATED'),
                    // StyledHeading('STAPLES'),
                    const StyledBody('SOPHISTICATED'),
                    const StyledBody('STAPLES'),
                    const SizedBox(height: 20),
                    const StyledBody('Rent from our wide'),
                    const StyledBody('selection styles'),
                    // SizedBox(height: 60), 
                    SizedBox(height: width * 0.15), 
                    Row(
                      children: [
                        // SizedBox(width: width*0.57),
                        const Expanded(child: SizedBox()),
                        const SizedBox(
                          // width: width * 0.35,
                          // height: 32.0,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.black),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: StyledBody('FIND OUT MORE', color: Colors.white, weight: FontWeight.normal),
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.03),
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
