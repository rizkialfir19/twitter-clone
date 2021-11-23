import 'package:flutter/material.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/ui/ui.dart';

class ContainerTweet extends StatelessWidget {
  const ContainerTweet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.1,
            color: Palette.greyLighten1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Container(
                color: Palette.greenLighten1,
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  Images.noPhotos,
                  height: 40.0,
                  width: 40.0,
                  color: Palette.white,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Rizki Alfi R.",
                          style: FontHelper.h7Bold(
                            color: Palette.white,
                          ),
                        ),
                        TextSpan(
                          text: "@rizkialfir",
                          style: FontHelper.h7Regular(
                            color: Palette.greyLighten1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    style: FontHelper.h7Regular(
                      color: Palette.white,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.comment_outlined,
                        color: Palette.greyLighten1,
                        size: 20,
                      ),
                      Icon(
                        Icons.replay,
                        color: Palette.greyLighten1,
                        size: 20,
                      ),
                      Icon(
                        Icons.favorite_border_outlined,
                        color: Palette.greyLighten1,
                        size: 20,
                      ),
                      Icon(
                        Icons.ios_share,
                        color: Palette.greyLighten1,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
