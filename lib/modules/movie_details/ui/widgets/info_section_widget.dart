import '../../../../utils/exports.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final List<String> items;

  const InfoSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title: ',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            items.join(', '),
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}