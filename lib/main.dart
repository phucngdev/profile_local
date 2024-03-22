import 'package:flutter/material.dart';

class CapNhatHoSo extends StatefulWidget {
  const CapNhatHoSo({Key? key}) : super(key: key);

  @override
  State<CapNhatHoSo> createState() => _CapNhatHoSoState();
}

class _CapNhatHoSoState extends State<CapNhatHoSo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cập nhật hồ sơ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTabBar(),
            _buildContent(),
            SizedBox(height: 16),
            _currentIndex == 2
                ? ElevatedButton(
                    onPressed: () {
                      // TODO: Handle confirmation action
                    },
                    child: Text('XÁC NHẬN'),
                  )
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex += 1;
                      });
                    },
                    child: Text('TIẾP'),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTabItem(
          text: 'Cơ bản',
          index: 0,
        ),
        _buildTabItem(
          text: 'Địa chỉ',
          index: 1,
        ),
        _buildTabItem(
          text: 'Xác nhận',
          index: 2,
        ),
      ],
    );
  }

  Widget _buildTabItem({required String text, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: _currentIndex == index ? Colors.blue : Colors.grey,
          ),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _buildContent() {
    switch (_currentIndex) {
      case 0:
        return _buildCoBan();
      case 1:
        return _buildDiaChi();
      case 2:
        return _buildXacNhan();
      default:
        return Container();
    }
  }

  Widget _buildCoBan() {
    return Column(
      children: [
        _buildTextField(
          label: 'Họ và Tên',
          initialValue: 'Nguyen Van A',
        ),
        _buildTextField(
          label: 'Ngày sinh',
          initialValue: '14/02/2024',
        ),
        _buildTextField(
          label: 'Email',
          initialValue: 'abc@gmail.com',
        ),
        _buildTextField(
          label: 'Số điện thoại',
          initialValue: '0123456789',
        ),
      ],
    );
  }

  Widget _buildDiaChi() {
    return Column(
      children: [
        _buildTextField(
          label: 'Tỉnh/Thành phố',
          initialValue: '',
        ),
        _buildTextField(
          label: 'Quận/Huyện',
          initialValue: '',
        ),
        _buildTextField(
          label: 'Phường/Xã',
          initialValue: '',
        ),
        _buildTextField(
          label: 'Địa chỉ',
          initialValue: '',
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _currentIndex -= 1;
            });
          },
          child: Text('QUAY LẠI'),
        ),
      ],
    );
  }

  Widget _buildXacNhan() {
    return Column(
      children: [
        _buildTextField(
          label: 'Họ và Tên',
          initialValue: 'Nguyen Van A',
        ),
        _buildTextField(
          label: 'Ngày sinh',
          initialValue: '14/02/2024',
        ),
        _buildTextField(
          label: 'Email',
          initialValue: 'abc@gmail.com',
        ),
        _buildTextField(
          label: 'Số điện thoại',
          initialValue: '0123456789',
        ),
        _buildTextField(
          label: 'Tỉnh/Thành phố',
          initialValue: '',
        ),
        _buildTextField(
          label: 'Quận/Huyện',
          initialValue: '',
        ),
        _buildTextField(
          label: 'Phường/Xã',
          initialValue: '',
        ),
        _buildTextField(
          label: 'Địa chỉ',
          initialValue: '',
        ),
      ],
    );
  }

  Widget _buildTextField({required String label, String? initialValue}) {
    TextEditingController controller =
        TextEditingController(text: initialValue);

    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CapNhatHoSo(),
  ));
}
