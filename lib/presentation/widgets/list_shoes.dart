import 'package:bacain/custom/custom_list_scrolable.dart';
import 'package:bacain/features/list_airport/presentation/bloc/list_airport_bloc.dart';
import 'package:bacain/presentation/widgets/custom/sliver_delegate_fixed_height.dart';
import 'package:bacain/presentation/widgets/shimmer/shoes_shimmer.dart';
import 'package:bacain/presentation/widgets/shoes_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListShoes extends StatefulWidget {
  const ListShoes({
    Key? key,
  }) : super(key: key);

  @override
  State<ListShoes> createState() => _ListShoesState();
}

class _ListShoesState extends State<ListShoes> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ListAirportBloc>().add(AirportFetch());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListAirportBloc, ListAirportState>(
      builder: (context, state) {
        if (state is ListAirportFailed) {
          return const Center(
            child: Text('Fetch Data Error :('),
          );
        } else if (state is ListAirportHasData ||
            state is ListAirportLoading && !state.isInitial) {
          return SizedBox(
            height: (MediaQuery.of(context).size.height * 0.68),
            child: ScrollConfiguration(
              behavior: CustomScroll(),
              child: GridView.builder(
                controller: _scrollController,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  height: 190,
                ),
                shrinkWrap: true,
                itemCount: state.airports.length + 1,
                itemBuilder: (context, index) {
                  // print(index);
                  print(state.airports.length);
                  if (index >= state.airports.length) {
                    return state.hasReachedMaximum
                        ? const SizedBox()
                        : const Center(
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: Colors.red,
                            ),
                          );
                  } else {
                    final airport = state.airports[index];
                    return ShoesCard(
                      airport: airport,
                    );
                  }
                },
              ),
            ),
          );
        } else if (state is ListAirportInitial ||
            state is ListAirportLoading && state.isInitial) {
          return SizedBox(
            height: (MediaQuery.of(context).size.height * 0.68),
            child: GridView.builder(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                height: 190,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return const ShoesCardshimmer();
              },
            ),
          );
        }

        return Container();
      },
    );
  }
}
