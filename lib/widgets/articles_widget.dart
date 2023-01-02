import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import '../consts/vars.dart';
import '../services/utils.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      const SizedBox(height: 60, width: 60, child: ColoredBox(color: Colors.blueGrey)),
      Container(
        height: 140,
        color: Theme.of(context).cardColor,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FancyShimmerImage(
                  height: size.height * 0.12,
                  width: size.width * 0.28,
                  boxFit: BoxFit.fill,
                  imageUrl:
                      'https://3.bp.blogspot.com/-B9fRq1j55UA/VkKdlLAL3sI/AAAAAAAAC7w/kA0osHyBi_I/s1600/pixar-movie-sequels-we-want-cars.png'),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Title' * 100,
                      style: textStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(children: [
                            const WidgetSpan(child: Icon(Icons.access_time)),
                            TextSpan(
                              text: ' Reading Time',
                              style: TextStyle(color: color, fontSize: 16),
                            )
                          ]),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.insert_link),
                        Text(' ${DateTime.now().toString()}',
                        maxLines: 1,),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
