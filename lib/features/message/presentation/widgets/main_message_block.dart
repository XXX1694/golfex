import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/features/message/data/models/message_model.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class MainMessageBlock extends StatelessWidget {
  const MainMessageBlock(
      {super.key, required this.userId, required this.messages});
  final int userId;
  final List<MessageModel> messages;

  @override
  Widget build(BuildContext context) {
    return GroupedListView<MessageModel, DateTime>(
      reverse: true,
      order: GroupedListOrder.DESC,
      useStickyGroupSeparators: true,
      floatingHeader: true,
      elements: messages,
      groupBy: (message) {
        if (kDebugMode) {
          print(message.toJson());
        }
        DateTime time = DateTime.parse(message.timestamp ?? '');
        return DateTime(time.year, time.month, time.day);
      },
      groupHeaderBuilder: (MessageModel message) => SizedBox(
        height: 40,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: mainColor70,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
              child: Text(
                DateFormat.yMMMd().format(
                  DateTime.parse(message.timestamp ?? ''),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      itemBuilder: (context, MessageModel message) => Align(
        alignment: (message.sender ?? 0) == userId
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: message.is_svg ?? false
            ? Row(
                children: [
                  message.sender != userId ? const SizedBox() : const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: SvgPicture.network(
                      message.content ?? '',
                      height: 60,
                      width: 60,
                    ),
                  ),
                  message.sender == userId ? const SizedBox() : const Spacer(),
                ],
              )
            : Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color:
                      message.sender == userId ? accentColor20 : secondColor20,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                    bottomLeft: (message.sender ?? 0) == userId
                        ? const Radius.circular(10)
                        : const Radius.circular(0),
                    bottomRight: (message.sender ?? 0) != userId
                        ? const Radius.circular(10)
                        : const Radius.circular(0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.55),
                        child: Text(
                          '${message.content}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            height: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        DateFormat.Hm().format(
                          DateTime.parse(
                            message.timestamp ?? '',
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 10,
                        ),
                      ),
                      message.sender == userId
                          ? const SizedBox(width: 8)
                          : const SizedBox(),
                      message.sender == userId
                          ? !(message.is_read ?? false)
                              ? SvgPicture.asset('assets/icons/sended.svg')
                              : SvgPicture.asset('assets/icons/readed.svg')
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
