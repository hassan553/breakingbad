import 'package:breakingbad/constants/strings.dart';
import 'package:breakingbad/data/models/characters.dart';
import 'package:flutter/material.dart';

class BuildCharacterItem extends StatelessWidget {
  character characte;
  BuildCharacterItem({Key? key, required this.characte}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(characterDetailScreen,arguments: characte);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: myGray,
        ),
        child: Hero(
          tag: characte.charId!,
          child: GridTile(
            footer: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.bottomCenter,
              color: Colors.black54,
              child: Text(
                '${characte.name}',
                style: const TextStyle(
                  color: myWhite,
                  height: 1.3,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: myGray,
              ),
              child: characte.img!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/loading.gif',
                      image: characte.img!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/error.gif',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
