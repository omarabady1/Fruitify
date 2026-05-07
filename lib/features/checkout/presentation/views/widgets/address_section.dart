import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruitify/core/widgets/custom_text_field.dart';
import 'package:fruitify/core/utils/app_text_styles.dart';
import 'package:fruitify/constants.dart';

class AddressSection extends StatefulWidget {
  const AddressSection({super.key});

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> {
  bool saveAddress = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(hint: 'الاسم كامل', onSaved: (value) {}),
          const SizedBox(height: 16),
          CustomTextField(
            hint: 'البريد الإلكتروني',
            onSaved: (value) {},
            inputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          CustomTextField(hint: 'العنوان', onSaved: (value) {}),
          const SizedBox(height: 16),
          CustomTextField(hint: 'المدينه', onSaved: (value) {}),
          const SizedBox(height: 16),
          CustomTextField(
            hint: 'رقم الطابق , رقم الشقه ..',
            onSaved: (value) {},
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hint: 'رقم الهاتف',
            onSaved: (value) {},
            inputType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Switch(
                value: saveAddress,
                onChanged: (value) {
                  setState(() {
                    saveAddress = value;
                  });
                },
                activeThumbColor: primaryColor,
              ),
              const SizedBox(width: 8),
              Text(
                'حفظ العنوان',
                style: AppTextStyles.semiBold13.copyWith(
                  color: const Color(0xFF949D9E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
