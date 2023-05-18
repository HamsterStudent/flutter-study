import 'package:coconut/models/webtoon_episode_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoonID,
  });

  final String webtoonID;
  final WebtoonEpisodeModel episode;

  onButtonTap() async {
    // final url = Uri.parse("https://google.com");
    // await launchUrl(url);

    // 이렇게 하나로 뭉쳐서 해도 됨
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonID&no=${episode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green.shade700,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.green.shade400,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              offset: const Offset(5, 5),
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
