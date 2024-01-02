import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/change_number/presentation/bloc/change_number_bloc.dart';
import 'package:goflex/features/change_number/presentation/widgets/change_number_field.dart';
import 'package:goflex/common/widgets/main_button.dart';

class ChangeNumberPage extends StatefulWidget {
  const ChangeNumberPage({super.key});

  @override
  State<ChangeNumberPage> createState() => _ChangeNumberPageState();
}

class _ChangeNumberPageState extends State<ChangeNumberPage> {
  late TextEditingController newNameController;
  late ChangeNumberBloc bloc;
  @override
  void initState() {
    newNameController = TextEditingController();
    bloc = BlocProvider.of<ChangeNumberBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeNumberBloc, ChangeNumberState>(
      listener: (context, state) {
        if (state is NumberChanged) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ваш номер изменено на: ${newNameController.text}'),
            ),
          );
        } else if (state is NumberChangeError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Не удалось поменять номер'),
            ),
          );
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.black,
          surfaceTintColor: Colors.black,
          backgroundColor: Colors.white,
          title: const Text(
            'Поменять номер',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.black12,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 28),
                ChangeNumberField(controller: newNameController),
                const Spacer(),
                state is NumberChanging
                    ? const MainButtonLoading()
                    : MainButton(
                        text: 'Поменять',
                        onPressed: () {
                          if (newNameController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Поле не может быть пустым'),
                              ),
                            );
                          } else {
                            bloc.add(
                              ChangeNumber(number: newNameController.text),
                            );
                          }
                        },
                      ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    newNameController.dispose();
    super.dispose();
  }
}
