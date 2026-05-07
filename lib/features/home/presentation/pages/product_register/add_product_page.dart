import 'package:flutter/material.dart';
import 'package:local_18/core/core_exports.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _barcodeController = TextEditingController();
  final _stockController = TextEditingController();
  final _minStockController = TextEditingController();
  final _buyPriceController = TextEditingController();
  final _sellPriceController = TextEditingController();

  String? _selectedCategory;
  String? _selectedUnit;
  String? _selectedSupplier;
  bool _hasExpiry = false;
  DateTime? _expiryDate;

  final List<String> _categories = [
    'Lácteos',
    'Bebidas',
    'Snacks',
    'Limpieza',
    'Otros',
  ];
  final List<String> _units = ['Unidad', 'Kg', 'Litro', 'Caja', 'Docena'];

  @override
  void dispose() {
    _nameController.dispose();
    _barcodeController.dispose();
    _stockController.dispose();
    _minStockController.dispose();
    _buyPriceController.dispose();
    _sellPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Column(
        children: [
          _buildTopBar(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPhotoSection(),
                    _buildSectionLabel('Información básica'),
                    CustomTextField(
                      label: 'Nombre del producto',
                      hintText: 'Ej: Leche entera 1L',
                      controller: _nameController,
                      isRequired: true,
                    ),
                    CustomTextField(
                      label: 'Código / Barcode',
                      hintText: 'Escanear o ingresar',
                      controller: _barcodeController,
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.qr_code_scanner,
                          color: AppColors.primaryGreen,
                        ),
                        onPressed: _scanBarcode,
                      ),
                    ),
                    CustomChipSelector(
                      label: 'Categoría',
                      options: _categories,
                      selected: _selectedCategory,
                      onSelected: (c) => setState(() => _selectedCategory = c),
                      onAddNew: _addNewCategory,
                      isRequired: true,
                    ),
                    const _SectionDivider(),
                    _buildSectionLabel('Stock y precios'),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'Stock actual',
                            hintText: 'Ej: 24',
                            controller: _stockController,
                            keyboardType: TextInputType.number,
                            isRequired: true,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomTextField(
                            label: 'Stock mínimo',
                            hintText: 'Ej: 5',
                            controller: _minStockController,
                            keyboardType: TextInputType.number,
                            isRequired: true,
                          ),
                        ),
                      ],
                    ),
                    _buildStockHint(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'Precio compra',
                            hintText: '\$ 0.00',
                            controller: _buyPriceController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            prefixText: '\$ ',
                            isRequired: true,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomTextField(
                            label: 'Precio venta',
                            hintText: '\$ 0.00',
                            controller: _sellPriceController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            prefixText: '\$ ',
                            isRequired: true,
                          ),
                        ),
                      ],
                    ),
                    CustomDropdownField<String>(
                      label: 'Unidad de medida',
                      hint: 'Seleccionar',
                      items: _units,
                      itemLabel: (u) => u,
                      value: _selectedUnit,
                      onChanged: (v) => setState(() => _selectedUnit = v),
                    ),
                    const _SectionDivider(),
                    _buildSectionLabel('Caducidad'),
                    _buildExpiryToggle(),
                    if (_hasExpiry) _buildDatePicker(),
                    const _SectionDivider(),
                    _buildSectionLabel('Proveedor'),
                    CustomDropdownField<String>(
                      label: 'Proveedor',
                      hint: 'Seleccionar proveedor',
                      items: const [
                        'Lácteos La Finca',
                        'Distribuidora Norte',
                        'Otro',
                      ],
                      itemLabel: (s) => s,
                      value: _selectedSupplier,
                      onChanged: (v) => setState(() => _selectedSupplier = v),
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      label: 'Guardar producto',
                      onPressed: _saveProduct,
                    ),
                    const SizedBox(height: 12),
                    CustomButton(
                      label: 'Cancelar',
                      onPressed: () => Navigator.pop(context),
                      isOutlined: true,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      color: AppColors.primaryGreen,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        bottom: 16,
        left: 16,
        right: 16,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Registrar producto',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Nuevo ítem en inventario',
                  style: TextStyle(color: Colors.white70, fontSize: 11),
                ),
              ],
            ),
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.more_vert, color: Colors.white, size: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoSection() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primaryGreen.withOpacity(0.4),
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primaryGreen.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt_outlined,
                color: AppColors.primaryGreen,
                size: 22,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Agregar foto',
              style: TextStyle(
                color: AppColors.primaryGreen,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            const Text(
              'Toca para tomar o seleccionar',
              style: TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryGreen,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildStockHint() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.stockHintBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.stockHintBorder),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: AppColors.stockHintIcon,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            'Alerta cuando el stock baje del mínimo',
            style: TextStyle(fontSize: 11, color: AppColors.stockHintText),
          ),
        ],
      ),
    );
  }

  Widget _buildExpiryToggle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tiene fecha de caducidad',
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
                Text(
                  'Activa para registrar lotes',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          Switch(
            value: _hasExpiry,
            onChanged: (v) => setState(() => _hasExpiry = v),
            activeColor: AppColors.primaryGreen,
          ),
        ],
      ),
    );
  }

  Widget _buildDatePicker() {
    return GestureDetector(
      onTap: _pickDate,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Fecha de vencimiento (lote actual)',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _expiryDate != null
                          ? '${_expiryDate!.day} / ${_expiryDate!.month} / ${_expiryDate!.year}'
                          : 'Seleccionar fecha',
                      style: TextStyle(
                        fontSize: 13,
                        color: _expiryDate != null
                            ? Colors.black87
                            : Colors.grey.shade400,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    color: AppColors.primaryGreen,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      // TODO: persistir con sqflite/Hive
    }
  }

  void _scanBarcode() {
    // TODO: integrar mobile_scanner
  }

  void _pickImage() {
    // TODO: integrar image_picker
  }

  void _addNewCategory() {
    // TODO: dialog para nueva categoría
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 30)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 3650)),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.light(primary: AppColors.primaryGreen),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _expiryDate = picked);
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Divider(height: 1, color: AppColors.dividerGreen),
    );
  }
}
