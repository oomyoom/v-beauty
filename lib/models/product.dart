class Product {
  final String title, description, image;
  final double price;

  Product(
      {required this.title,
      required this.description,
      required this.image,
      required this.price});
}

List productData = [
  Product(
      title: 'ลิปสติกสีแดง',
      description: 'ลิป',
      image:
          'https://img.wongnai.com/p/1920x0/2023/05/08/051680b1d23a4709919b3dfbfdce7e0c.jpg',
      price: 50),
  Product(
      title: 'ลิปสติกสีชมพู',
      description: 'ลิป',
      image:
          'https://img.wongnai.com/p/1920x0/2023/05/08/051680b1d23a4709919b3dfbfdce7e0c.jpg',
      price: 60),
  Product(
      title: 'ลิปสติกสีส้ม',
      description: 'ลิป',
      image:
          'https://img.wongnai.com/p/1920x0/2023/05/08/051680b1d23a4709919b3dfbfdce7e0c.jpg',
      price: 70),
  Product(
      title: 'ลิปสติกสีเหลือง',
      description: 'ลิป',
      image:
          'https://img.wongnai.com/p/1920x0/2023/05/08/051680b1d23a4709919b3dfbfdce7e0c.jpg',
      price: 80)
];
