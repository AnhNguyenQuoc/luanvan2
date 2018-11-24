# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
District.delete_all
District.create(name: "Bình Thủy")
District.create(name: "Cái Răng")
District.create(name: "Ninh Kiều")
District.create(name: "Ô Môn")
District.create(name: "Thốt Nốt")
Role.delete_all
Role.create(name: "Người Dùng")
Role.create(name: "Doanh nghiệp")
Role.create(name: "Người giao hàng")
Role.create(name: "Người quản lý")
RestaurantType.delete_all
RestaurantType.create(name: "Nhà Hàng")
RestaurantType.create(name: "Vỉa hè")
RestaurantType.create(name: "Quán cafe")
RestaurantType.create(name: "Quán ăn chay")
RestaurantType.create(name: "Take away")
ProductType.delete_all
ProductType.create(name: "Đồ ăn Việt")
ProductType.create(name: "Đồ ăn nhanh")
ProductType.create(name: "Đồ ăn Nhật")
ProductType.create(name: "Trà sữa")
ProductType.create(name: "Đồ ăn Hàn Quốc")
ProductType.create(name: "Nhật")
OrderType.delete_all
OrderType.create(name: "Chưa xác nhận")
OrderType.create(name: "Xác nhận")
OrderType.create(name: "Hoàn thành")
OrderType.create(name: "Hủy bỏ")
User.create(username: "nguyen quoc anh", email: "nqa@gmail.com", password: "123456", password_digest: "123456", phone: "0909090909", address: "45 Hung Vuong", activated: true, district_id: 1)