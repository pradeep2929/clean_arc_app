import 'package:alchemy/app/resource/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class HeartButton extends StatefulWidget {
  final double size;
  final Function(bool)? onTap;
  const HeartButton({Key? key, this.onTap, this.size = 24}) : super(key: key);

  @override
  _HeartButtonState createState() => _HeartButtonState(this.size, this.onTap);
}

class _HeartButtonState extends State<HeartButton> {

  double size;
  Function(bool)? onTap;
  _HeartButtonState(this.size, this.onTap);
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: size,
      circleColor: CircleColor(start: Colors.redAccent, end: Colors.redAccent),
      onTap: onLikeButtonTapped,
        bubblesColor: BubblesColor(
          dotPrimaryColor: Colors.red,
          dotSecondaryColor: Colors.redAccent,
        ),
      likeBuilder: (bool isLiked) {
        return Icon(
          isLiked ? Icons.favorite : Icons.favorite_border,
          color: isLiked ? Colors.redAccent : Color(0xFF475464),
          size: size,
        );
      });
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    onTap?.call(isLiked);
    return !isLiked;
  }

}
