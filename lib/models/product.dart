class Product {
  final String title, description, image;
  final double price;

  Product(
      {required this.title,
      required this.description,
      required this.image,
      required this.price});
}

List<Product> productData = [
  Product(
      title: 'ลิปสติกสีแดง',
      description: 'ลิปสติก',
      image:
          'https://images.pexels.com/photos/1625037/pexels-photo-1625037.jpeg',
      price: 50),
  Product(
      title: 'ลิปสติกสีชมพู',
      description: 'ลิปสติก',
      image:
          'https://images.pexels.com/photos/1625037/pexels-photo-1625037.jpeg',
      price: 60),
  Product(
      title: 'ลิปสติกสีส้ม',
      description: 'ลิปสติก',
      image:
          'https://images.pexels.com/photos/1625037/pexels-photo-1625037.jpeg',
      price: 70),
  Product(
      title: 'ลิปสติกสีเหลืองงงงงงงงงงงงงง',
      description: 'ลิปสติก',
      image:
          'https://images.pexels.com/photos/1625037/pexels-photo-1625037.jpeg',
      price: 80)
];

List<Product> productData2 = [
  Product(
      title: 'บลัชออนสีแดง',
      description: 'บลัชออน',
      image: 'https://live.staticflickr.com/5297/5457270373_97c0b85da3_b.jpg',
      price: 50),
  Product(
      title: 'บลัชออนสีชมพู',
      description: 'บลัชออน',
      image: 'https://live.staticflickr.com/5297/5457270373_97c0b85da3_b.jpg',
      price: 60),
  Product(
      title: 'บลัชออนสีส้ม',
      description: 'บลัชออน',
      image: 'https://live.staticflickr.com/5297/5457270373_97c0b85da3_b.jpg',
      price: 70),
  Product(
      title: 'บลัชออนสีเหลืองงงงงงงงงงงงงง',
      description: 'บลัชออน',
      image: 'https://live.staticflickr.com/5297/5457270373_97c0b85da3_b.jpg',
      price: 80)
];
