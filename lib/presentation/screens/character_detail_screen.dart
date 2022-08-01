import 'package:breakingbad/constants/strings.dart';
import 'package:breakingbad/cubit/character_cubit_cubit.dart';
import 'package:breakingbad/data/models/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterDetailScreen extends StatefulWidget {
  final character characte;
  const CharacterDetailScreen({Key? key, required this.characte})
      : super(key: key);

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  Widget BuildAppBar() {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: 600,
      backgroundColor: myGray,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
            tag: widget.characte.charId!,
            child: Image.network(
              widget.characte.img.toString(),
              fit: BoxFit.cover,
            )),
        title: Text(
          widget.characte.nickname.toString(),
        ),
      ),
    );
  }

  Widget BuildCharacterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const TextSpan(
            text: ':',
            style: TextStyle(
              color: myWhite,
              fontSize: 20,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: myWhite,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildDivider(double enident) {
    return Divider(
      color: myYellow,
      endIndent: enident,
      thickness: 2,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharacterCubitCubit>(context).getDataQuate('walter white');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGray,
      body: CustomScrollView(
        slivers: [
          BuildAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: myGray,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildCharacterInfo(
                        'job',
                        widget.characte.occupation!.join(' / '),
                      ),
                      BuildDivider(260),
                      BuildCharacterInfo(
                        'Apperad in ',
                        widget.characte.category!,
                      ),
                      BuildDivider(260),
                      BuildCharacterInfo(
                        'session',
                        widget.characte.appearance!.join(' / '),
                      ),
                      BuildDivider(260),
                      BuildCharacterInfo(
                        'status',
                        widget.characte.status!,
                      ),
                      BuildDivider(260),
                      BlocBuilder<CharacterCubitCubit, CharacterCubitState>(
                        builder: (context, state) {
                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
