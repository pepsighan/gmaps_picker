import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';

class PredictionTile extends StatelessWidget {
  const PredictionTile({Key key, @required this.prediction, this.onTap})
      : super(key: key);

  final Prediction prediction;
  final ValueChanged<Prediction> onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.location_on),
      title: RichText(
        text: TextSpan(
          children: _buildPredictionText(context),
        ),
      ),
      onTap: () {
        onTap?.call(prediction);
      },
    );
  }

  List<TextSpan> _buildPredictionText(BuildContext context) {
    final result = <TextSpan>[];
    final textColor = Theme.of(context).textTheme.headline6.color;

    if (prediction.matchedSubstrings.isNotEmpty) {
      final matchedSubString = prediction.matchedSubstrings[0];
      // There is no matched string at the beginning.
      if (matchedSubString.offset > 0) {
        result.add(
          TextSpan(
            text: prediction.description.substring(0, matchedSubString.offset),
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.w300),
          ),
        );
      }

      // Matched strings.
      result.add(
        TextSpan(
          text: prediction.description.substring(matchedSubString.offset,
              matchedSubString.offset + matchedSubString.length),
          style: TextStyle(
              color: textColor, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );

      // Other strings.
      if (matchedSubString.offset + matchedSubString.length <
          prediction.description.length) {
        result.add(
          TextSpan(
            text: prediction.description
                .substring(matchedSubString.offset + matchedSubString.length),
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.w300),
          ),
        );
      }
      // If there is no matched strings, but there are predicts. (Not sure if this happens though)
    } else {
      result.add(
        TextSpan(
          text: prediction.description,
          style: TextStyle(
              color: textColor, fontSize: 16, fontWeight: FontWeight.w300),
        ),
      );
    }

    return result;
  }
}