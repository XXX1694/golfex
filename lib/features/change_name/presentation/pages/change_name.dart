import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/change_name/presentation/bloc/change_name_bloc.dart';
import 'package:goflex/features/change_name/presentation/widgets/new_name.dart';
import 'package:goflex/common/widgets/main_button.dart';

class ChangeNamePage extends StatefulWidget {
  const ChangeNamePage({super.key});

  @override
  State<ChangeNamePage> createState() => _ChangeNamePageState();
}

class _ChangeNamePageState extends State<ChangeNamePage> {
  late TextEditingController newNameController;
  late ChangeNameBloc bloc;
  @override
  void initState() {
    newNameController = TextEditingController();
    bloc = BlocProvider.of<ChangeNameBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeNameBloc, ChangeNameState>(
      listener: (context, state) {
        if (state is NameChanged) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ваше имя изменено на: ${newNameController.text}'),
            ),
          );
        } else if (state is NameChangeError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Не удалось поменять имя'),
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
            'Поменять имя',
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
                NewNameField(controller: newNameController),
                const Spacer(),
                state is NameChanging
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
                              ChangeName(newName: newNameController.text),
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
