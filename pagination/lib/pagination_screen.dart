import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/pagination_cubit.dart';

class PaginationScreen extends StatelessWidget {
  PaginationScreen({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = PaginationCubit();
        cubit.fetchData();
        _scrollController.addListener(() {
          if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
            cubit.fetchData();
          }
        });
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Pagination with Cubit')),
        body: BlocBuilder<PaginationCubit, PaginationState>(
          builder: (context, state) {
            if (state is PaginationInitial || (state is PaginationLoading && state.items.isEmpty)) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PaginationError) {
              return Center(child: Text(state.message));
            }

            final items = state.items;
            final hasMore = state is PaginationSuccess ? state.hasMore : false;

            return ListView.builder(
              controller: _scrollController,
              itemCount: items.length + (hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == items.length) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListTile(
                  title: Text(items[index]['title']),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
