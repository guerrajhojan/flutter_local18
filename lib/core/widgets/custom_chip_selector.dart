import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomChipSelector extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? selected;
  final void Function(String) onSelected;
  final VoidCallback? onAddNew;
  final bool isRequired;

  const CustomChipSelector({
    super.key,
    required this.label,
    required this.options,
    required this.onSelected,
    this.selected,
    this.onAddNew,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            if (isRequired)
              const Text(
                ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ...options.map(
              (option) => GestureDetector(
                onTap: () => onSelected(option),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: selected == option
                        ? AppColors.primaryGreen
                        : AppColors.inputBackground,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: selected == option
                          ? AppColors.primaryGreen
                          : Colors.transparent,
                    ),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: selected == option
                          ? FontWeight.w600
                          : FontWeight.normal,
                      color: selected == option
                          ? AppColors.white
                          : AppColors.greyText,
                    ),
                  ),
                ),
              ),
            ),
            if (onAddNew != null)
              GestureDetector(
                onTap: onAddNew,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.inputBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, size: 14, color: AppColors.greyText),
                      const SizedBox(width: 4),
                      Text(
                        'Nueva',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.greyText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
