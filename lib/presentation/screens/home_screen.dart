import 'package:breakingbad/constants/strings.dart';
import 'package:breakingbad/cubit/character_cubit_cubit.dart';
import 'package:breakingbad/data/models/characters.dart';
import 'package:breakingbad/presentation/widgets/character_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<character> allCharacter;
  late List<character> searshedList;
  var controller = TextEditingController();
  bool isSearch = false;

  var searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharacterCubitCubit>(context).getData();
  }

  Widget BuildTextField() {
    return TextField(
      controller: controller,
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'enter a character ..',
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      onChanged: (value) {
        searchedForItem(value);
        setState(() {});
      },
    );
  }

  void searchedForItem(String value) {
    searshedList = allCharacter.where((element) {
      return element.name!.toLowerCase().startsWith(value);
    }).toList();
    setState(() {});
  }

  List<Widget> buildAppBarAction() {
    if (isSearch) {
      return [
        IconButton(
          onPressed: () {},
          color: Colors.black,
          icon: const Icon(Icons.clear),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {},
          color: Colors.black,
          icon: const Icon(Icons.search),
        ),
      ];
    }
  }

  Widget BuildLoading() {
    return const Center(
      child: CircularProgressIndicator(
        color: myYellow,
      ),
    );
  }

  Widget BuildBlocWidget() {
    return BlocConsumer<CharacterCubitCubit, CharacterCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CharacterLoaded) {
          allCharacter = (state).characters;
          return BuildListLoaded();
        } else {
          return BuildLoading();
        }
      },
    );
  }

  Widget BuildGridCharacter() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: allCharacter.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return BuildCharacterItem(
          characte: allCharacter[index],
        );
      },
    );
  }

  Widget BuildListLoaded() {
    return SingleChildScrollView(
      child: Container(
     
        child: Column(
          children: [
            BuildGridCharacter(),
          ],
        ),
      ),
    );
  }

  Widget BuildNoConnected() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        'assets/images/no_internet.png',
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CharacterCubitCubit.get(context).isSearch==false
          ? buildSearchAppBar()
          : buildAppBar(),
      body: BuildBlocWidget(),

    );
  }

  buildAppBar() {
    return AppBar(
      title: const Text(
        'Characters',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
     
      actions: [
        IconButton(
          onPressed: () {
            CharacterCubitCubit.get(context).changeAppBarLayout();
          },
          icon: Icon(
            Icons.search,
           
          ),
        ),
      ],
    );
  }

  buildSearchAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
         
        ),
        onPressed: () {
          CharacterCubitCubit.get(context).changeAppBarLayout();
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            searchController.clear();
          },
          icon: Icon(
            Icons.clear,
            
          ),
        ),
      ],
      title: TextField(
        controller: searchController,
        onChanged: (value) {
          CharacterCubitCubit.get(context).searchCharacter(value);
        },
        decoration: InputDecoration(hintText: 'Find Your Character..'),
      ),
    );
  }
}
