-- Tạo cơ sở dữ liệu và chọn sử dụng nó
CREATE DATABASE KoiCompetition;
USE KoiCompetition;

-- Xóa bảng nếu đã tồn tại
DROP TABLE IF EXISTS Votes;
DROP TABLE IF EXISTS KoiManagement;
DROP TABLE IF EXISTS Users;
IF OBJECT_ID('Orders', 'U') IS NOT NULL
    DROP TABLE Orders;
GO

-- tạo bảng
CREATE TABLE Orders (
    id INT PRIMARY KEY,                -- ID 
    NameKOI NVARCHAR(255),            -- Tên Koi
    Participant NVARCHAR(255),        -- Tên người tham gia
    PhoneNumber NVARCHAR(255),        -- Số điện thoại của người tham gia
    Category NVARCHAR(255),           -- Hạng mục (Màu sắc, hình dáng, hoa văn, kích thước, sức khỏe)
    Date NVARCHAR(255),               -- Ngày đăng ký
    Status NVARCHAR(255),             -- Trạng thái (Đã xác nhận, Chưa giải quyết, Đã hủy)
    Image NVARCHAR(255)               -- Liên kết ảnh
);

-- Thêm dữ liệu mẫu
INSERT INTO Orders (id, NameKOI, Participant, PhoneNumber, Category, Date, Status, Image)
VALUES 
    ('1', 'Cá Koi Koharu', 'Nguyễn Văn An', '0988873827', 'Màu sắc', '24 Feb 1:16 PM', 'Xác nhận', 'img'),
	('2', 'Cá Koi Taisho Sanke Nhật', 'Trần Thị Bích', '0987352745', 'Hình dáng', '10 May 4:45 AM', 'Chưa giải quyết', 'img'),
	('3', 'Cá Koi Showa Sanshoku', 'Lê Văn Cường', '0647837234', 'Hoa văn', '23 Feb 1:15 AM', 'Đã hủy', 'img'),
	('4', 'Cá Koi Chagoi', 'Phạm Thị Duyên', '09988877663', 'Kích thước',  '08 Mar 2:29 AM', 'Chưa giải quyết', 'img'),
	('5', 'Cá Koi Tancho', 'Hoàng Minh Đạt', '09863622822', 'Sức khỏe', '17 Apr 3:07 AM', 'Xác nhận', 'img'),
	('6', 'Cá Koi Utsuri', 'Đinh Thị Hằng', '0874637264', 'Hoa văn', '10 May 4:45 AM', 'Chưa giải quyết', 'img'),
	('7', 'Cá Koi Asagi', 'Bùi Thị Hoài', '0897473452', 'Hình dáng', '25 Jun 5:22 AM', 'Đã hủy', 'img'),
	('8', 'Cá Koi Bekko', 'Phan Văn Hiếu', '0765439775', 'Màu sắc', '02 Jul 6:38 AM', 'Xác nhận', 'img'),
	('9', 'Cá Koi Shusui', 'Vũ Thị Hoa', '0998899999', 'Hoa văn', '11 Aug 7:56 A26 AM', 'Xác nhận', 'img'),
	('10', 'Cá Koi Koromo', 'Đặng Minh Hoàng', '0888774310', 'Kích thước', '09 Sep 8:11 AM', 'Đã hủy', 'img'),
	('11', 'Cá Koi Goshiki', 'Ngô Thị Kim', '0846373222', 'Sức khỏe', '21 Oct 9:03 AM', 'Chưa giải quyết', 'img'),
	('12', 'Cá Koi Kin Gin Rin', 'Lý Văn Khánh', '0898765432', 'Hoa văn','14 Nov 10:', 'Xác nhận', 'img'),
	('13', 'Cá Koi Ogon', 'Tô Thị Lan', '0854321098', 'Màu sắc', '19 Dec 11:17 AM', 'Xác nhận', 'img'),
	('14', 'Cá Koi Doitsu', 'Nguyễn Văn Hải', '0987654321', 'Hình dáng', '02 Jan 8:30 AM', 'Xác nhận', 'imgM'),
	('15', 'Cá Koi Hi Utsuri', 'Trần Văn Minh', '0976543210', 'Sức khỏe', '03 Jan 9:45 AM', 'Chưa giải quyết', 'img'),
	('16', 'Cá Koi Shiro Utsuri', 'Lê Thị Thanh', '0965432109', 'Màu sắc', '04 Jan 10:15 AM', 'Đã hủy', 'img'),
	('17', 'Cá Koi Yamabuki Ogon', 'Phạm Văn Tùng', '0954321098', 'Hoa văn', '05 Jan 11:30 AM', 'Xác nhận', 'img'),
	('18', 'Cá Koi Chagoi', 'Nguyễn Thị Nga', '0943210987', 'Kích thước', '06 Jan 12:45 PM', 'Chưa giải quyết', 'img'),
	('19', 'Cá Koi Shusui', 'Đinh Văn An', '0932109876', 'Hình dáng', '07 Jan 1:00 PM', 'Xác nhận', 'img'),
	('20', 'Cá Koi Tancho', 'Bùi Thị Ngọc', '0921098765', 'Sức khỏe', '08 Jan 2:15 PM', 'Chưa giải quyết', 'img'),
	('21', 'Cá Koi Showa Sanshoku', 'Lý Văn Dũng', '0910987654', 'Màu sắc', '09 Jan 3:30 PM', 'Đã hủy', 'img'),
	('22', 'Cá Koi Koromo', 'Ngô Thị Hương', '0909876543', 'Hoa văn', '10 Jan 4:45 PM', 'Xác nhận', 'img'),
	('23', 'Cá Koi Goshiki', 'Trần Minh Tuấn', '0898765432', 'Kích thước', '11 Jan 5:55 PM', 'Chưa giải quyết', 'img'),
	('24', 'Cá Koi Utsuri', 'Hoàng Văn Sơn', '0887654321', 'Hình dáng', '12 Jan 6:10 PM', 'Xác nhận', 'img'),
	('25', 'Cá Koi Doitsu', 'Nguyễn Thị Thảo', '0876543210', 'Sức khỏe', '13 Jan 7:25 PM', 'Chưa giải quyết', 'img'),
	('26', 'Cá Koi Hi Utsuri', 'Phạm Văn Lâm', '0865432109', 'Màu sắc', '14 Jan 8:40 PM', 'Đã hủy', 'img'),
	('27', 'Cá Koi Shiro Utsuri', 'Lê Văn Hòa', '0854321098', 'Hoa văn', '15 Jan 9:55 PM', 'Xác nhận', 'img'),
	('28', 'Cá Koi Yamabuki Ogon', 'Đinh Thị Thủy', '0843210987', 'Kích thước', '16 Jan 10:05 PM', 'Chưa giải quyết', 'img'),
	('29', 'Cá Koi Chagoi', 'Bùi Văn Minh', '0832109876', 'Hình dáng', '17 Jan 11:10 PM', 'Xác nhận', 'img'),
	('30', 'Cá Koi Shusui', 'Nguyễn Thị Tuyết', '0821098765', 'Sức khỏe', '18 Jan 12:20 AM', 'Chưa giải quyết', 'img'),
	('31', 'Cá Koi Tancho', 'Trần Văn Hải', '0810987654', 'Màu sắc', '19 Jan 1:35 AM', 'Đã hủy', 'img'),
	('32', 'Cá Koi Showa Sanshoku', 'Lê Thị Nhung', '0809876543', 'Hoa văn', '20 Jan 2:50 AM', 'Xác nhận', 'img'),
	('33', 'Cá Koi Koromo', 'Ngô Văn Toàn', '0798765432', 'Kích thước', '21 Jan 3:05 AM', 'Chưa giải quyết', 'img'),
	('34', 'Cá Koi Goshiki', 'Phạm Thị Kim', '0787654321', 'Hình dáng', '22 Jan 4:15 AM', 'Xác nhận', 'img'),
	('35', 'Cá Koi Utsuri', 'Đinh Văn Bảo', '0776543210', 'Sức khỏe', '23 Jan 5:30 AM', 'Chưa giải quyết', 'img'),
	('36', 'Cá Koi Doitsu', 'Bùi Thị Duyên', '0765432109', 'Màu sắc', '24 Jan 6:45 AM', 'Đã hủy', 'img'),
	('37', 'Cá Koi Hi Utsuri', 'Nguyễn Văn Quốc', '0754321098', 'Hoa văn', '25 Jan 8:00 AM', 'Xác nhận', 'img'),
	('38', 'Cá Koi Shiro Utsuri', 'Trần Thị Lan', '0743210987', 'Kích thước', '26 Jan 9:15 AM', 'Chưa giải quyết', 'img'),
	('39', 'Cá Koi Yamabuki Ogon', 'Lê Văn Khoa', '0732109876', 'Hình dáng', '27 Jan 10:30 AM', 'Xác nhận', 'img'),
	('40', 'Cá Koi Chagoi', 'Nguyễn Thị Hằng', '0721098765', 'Sức khỏe', '28 Jan 11:45 AM', 'Chưa giải quyết', 'img'),
	('41', 'Cá Koi Shusui', 'Trần Văn Tín', '0710987654', 'Màu sắc', '29 Jan 12:00 PM', 'Đã hủy', 'img'),
	('42', 'Cá Koi Tancho', 'Lê Thị Quyên', '0709876543', 'Hoa văn', '30 Jan 1:15 PM', 'Xác nhận', 'img'),
	('43', 'Cá Koi Showa Sanshoku', 'Ngô Văn Thanh', '0698765432', 'Kích thước', '31 Jan 2:30 PM', 'Chưa giải quyết', 'img'),
	('44', 'Cá Koi Koromo', 'Đinh Văn Sĩ', '0687654321', 'Hình dáng', '01 Feb 3:45 PM', 'Xác nhận', 'img'),
	('45', 'Cá Koi Goshiki', 'Bùi Thị Nhi', '0676543210', 'Sức khỏe', '02 Feb 5:00 PM', 'Chưa giải quyết', 'img'),
	('46', 'Cá Koi Utsuri', 'Nguyễn Văn Tâm', '0665432109', 'Màu sắc', '03 Feb 6:15 PM', 'Đã hủy', 'img'),
	('47', 'Cá Koi Doitsu', 'Trần Thị Duyên', '0654321098', 'Hoa văn', '04 Feb 7:30 PM', 'Xác nhận', 'img'),
	('48', 'Cá Koi Hi Utsuri', 'Lê Văn Tiến', '0643210987', 'Kích thước', '05 Feb 8:45 PM', 'Chưa giải quyết', 'img'),
	('49', 'Cá Koi Shiro Utsuri', 'Nguyễn Thị Kim', '0632109876', 'Hình dáng', '06 Feb 10:00 PM', 'Xác nhận', 'img'),
	('50', 'Cá Koi Yamabuki Ogon', 'Trần Văn Hải', '0621098765', 'Sức khỏe', '07 Feb 11:15 PM', 'Chưa giải quyết', 'img'),
	('51', 'Cá Koi Chagoi', 'Lê Thị Huyền', '0610987654', 'Màu sắc', '08 Feb 12:30 AM', 'Đã hủy', 'img'),
	('52', 'Cá Koi Shusui', 'Ngô Văn Quang', '0609876543', 'Hoa văn', '09 Feb 1:45 AM', 'Xác nhận', 'img'),
	('53', 'Cá Koi Tancho', 'Đinh Thị Tâm', '0598765432', 'Kích thước', '10 Feb 3:00 AM', 'Chưa giải quyết', 'img'),
	('54', 'Cá Koi Showa Sanshoku', 'Bùi Văn Hưng', '0587654321', 'Hình dáng', '11 Feb 4:15 AM', 'Xác nhận', 'img'), 
	('55', 'Cá Koi Koromo', 'Nguyễn Văn Hoàng', '0576543210', 'Sức khỏe', '12 Feb 5:30 AM', 'Chưa giải quyết', 'img'), 
	('56', 'Cá Koi Goshiki', 'Trần Thị Mai', '0565432109', 'Màu sắc', '13 Feb 6:45 AM', 'Đã hủy', 'img'), 
	('57', 'Cá Koi Utsuri', 'Lê Văn Đạt', '0554321098', 'Hoa văn', '14 Feb 8:00 AM', 'Xác nhận', 'img'), 
	('58', 'Cá Koi Doitsu', 'Nguyễn Thị Hoa', '0543210987', 'Kích thước', '15 Feb 9:15 AM', 'Chưa giải quyết', 'img'), 
	('59', 'Cá Koi Hi Utsuri', 'Đinh Văn Tuấn', '0532109876', 'Hình dáng', '16 Feb 10:30 AM', 'Xác nhận', 'img'), 
	('60', 'Cá Koi Shiro Utsuri', 'Bùi Thị Dung', '0521098765', 'Sức khỏe', '17 Feb 11:45 AM', 'Chưa giải quyết', 'img'),
	('61', 'Cá Koi Yamabuki Ogon', 'Nguyễn Văn Phúc', '0510987654', 'Màu sắc', '18 Feb 12:00 PM', 'Đã hủy', 'img'),
	('62', 'Cá Koi Chagoi', 'Trần Thị Ánh', '0509876543', 'Hoa văn', '19 Feb 1:15 PM', 'Xác nhận', 'img'),
	('63', 'Cá Koi Shusui', 'Lê Văn Hải', '0498765432', 'Kích thước', '20 Feb 2:30 PM', 'Chưa giải quyết', 'img'),
	('64', 'Cá Koi Tancho', 'Nguyễn Thị Tâm', '0487654321', 'Hình dáng', '21 Feb 3:45 PM', 'Xác nhận', 'img'),
	('65', 'Cá Koi Showa Sanshoku', 'Trần Văn Nam', '0476543210', 'Sức khỏe', '22 Feb 4:55 PM', 'Đã hủy', 'img'),
	('66', 'Cá Koi Koromo', 'Lê Thị Yến', '0465432109', 'Màu sắc', '23 Feb 6:10 PM', 'Xác nhận', 'img'),
	('67', 'Cá Koi Goshiki', 'Ngô Văn Bảo', '0454321098', 'Hoa văn', '24 Feb 7:25 PM', 'Chưa giải quyết', 'img'),
	('68', 'Cá Koi Utsuri', 'Phạm Thị Bình', '0443210987', 'Kích thước', '25 Feb 8:40 PM', 'Xác nhận', 'img'),
	('69', 'Cá Koi Doitsu', 'Đinh Văn Hùng', '0432109876', 'Hình dáng', '26 Feb 9:55 PM', 'Chưa giải quyết', 'img'),
	('70', 'Cá Koi Hi Utsuri', 'Bùi Thị Hạnh', '0421098765', 'Sức khỏe', '27 Feb 11:10 PM', 'Đã hủy', 'img'),
	('71', 'Cá Koi Yamabuki Ogon', 'Nguyễn Văn Thắng', '0410987654', 'Màu sắc', '28 Feb 12:25 AM', 'Xác nhận', 'img'),
	('72', 'Cá Koi Chagoi', 'Trần Thị Lệ', '0409876543', 'Hoa văn', '01 Mar 1:40 AM', 'Chưa giải quyết', 'img'),
	('73', 'Cá Koi Shusui', 'Lê Văn Khải', '0398765432', 'Kích thước', '02 Mar 2:55 AM', 'Xác nhận', 'img'),
	('74', 'Cá Koi Tancho', 'Nguyễn Thị Linh', '0387654321', 'Hình dáng', '03 Mar 4:15 AM', 'Đã hủy', 'img'),
	('75', 'Cá Koi Showa Sanshoku', 'Trần Văn Quốc', '0376543210', 'Sức khỏe', '04 Mar 5:30 AM', 'Chưa giải quyết', 'img'),
	('76', 'Cá Koi Koromo', 'Lê Thị Nhung', '0365432109', 'Màu sắc', '05 Mar 6:45 AM', 'Xác nhận', 'img'),
	('77', 'Cá Koi Goshiki', 'Ngô Văn Tài', '0354321098', 'Hoa văn', '06 Mar 8:00 AM', 'Đã hủy', 'img'),
	('78', 'Cá Koi Utsuri', 'Phạm Thị Hà', '0343210987', 'Kích thước', '07 Mar 9:15 AM', 'Chưa giải quyết', 'img'),
	('79', 'Cá Koi Doitsu', 'Đinh Văn Duy', '0332109876', 'Hình dáng', '08 Mar 10:30 AM', 'Xác nhận', 'img'),
	('80', 'Cá Koi Hi Utsuri', 'Bùi Thị Quyên', '0321098765', 'Sức khỏe', '09 Mar 11:45 AM', 'Đã hủy', 'img'),
	('81', 'Cá Koi Yamabuki Ogon', 'Nguyễn Văn Sơn', '0310987654', 'Màu sắc', '10 Mar 12:00 PM', 'Chưa giải quyết', 'img'),
	('82', 'Cá Koi Chagoi', 'Trần Thị Tuyết', '0309876543', 'Hoa văn', '11 Mar 1:15 PM', 'Xác nhận', 'img'),
	('83', 'Cá Koi Shusui', 'Lê Văn Thịnh', '0298765432', 'Kích thước', '12 Mar 2:30 PM', 'Chưa giải quyết', 'img'),
	('84', 'Cá Koi Tancho', 'Nguyễn Thị Thảo', '0287654321', 'Hình dáng', '13 Mar 3:45 PM', 'Xác nhận', 'img'),
	('85', 'Cá Koi Showa Sanshoku', 'Trần Văn Khánh', '0276543210', 'Sức khỏe', '14 Mar 4:55 PM', 'Đã hủy', 'img'),
	('86', 'Cá Koi Koromo', 'Lê Thị Ngọc', '0265432109', 'Màu sắc', '15 Mar 6:10 PM', 'Chưa giải quyết', 'img'),
	('87', 'Cá Koi Goshiki', 'Ngô Văn Thanh', '0254321098', 'Hoa văn', '16 Mar 7:25 PM', 'Xác nhận', 'img'),
	('88', 'Cá Koi Utsuri', 'Phạm Thị Linh', '0243210987', 'Kích thước', '17 Mar 8:40 PM', 'Đã hủy', 'img'),
	('89', 'Cá Koi Doitsu', 'Đinh Văn Hạnh', '0232109876', 'Hình dáng', '18 Mar 9:55 PM', 'Chưa giải quyết', 'img'),
	('90', 'Cá Koi Hi Utsuri', 'Bùi Thị Tâm', '0221098765', 'Sức khỏe', '19 Mar 11:10 PM', 'Xác nhận', 'img'),
	('91', 'Cá Koi Yamabuki Ogon', 'Nguyễn Văn Hòa', '0210987654', 'Màu sắc', '20 Mar 12:25 AM', 'Đã hủy', 'img'),
	('92', 'Cá Koi Chagoi', 'Trần Thị Vân', '0209876543', 'Hoa văn', '21 Mar 1:40 AM', 'Xác nhận', 'img'),
	('93', 'Cá Koi Shusui', 'Lê Văn Vương', '0198765432', 'Kích thước', '22 Mar 2:55 AM', 'Chưa giải quyết', 'img'),
	('94', 'Cá Koi Tancho', 'Nguyễn Thị Mai', '0187654321', 'Hình dáng', '23 Mar 4:15 AM', 'Xác nhận', 'img'),
	('95', 'Cá Koi Showa Sanshoku', 'Trần Văn Khoa', '0176543210', 'Sức khỏe', '24 Mar 5:30 AM', 'Đã hủy', 'img'),
	('96', 'Cá Koi Koromo', 'Lê Thị Quỳnh', '0165432109', 'Màu sắc', '25 Mar 6:45 AM', 'Chưa giải quyết', 'img'),
	('97', 'Cá Koi Goshiki', 'Ngô Văn Minh', '0154321098', 'Hoa văn', '26 Mar 8:00 AM', 'Xác nhận', 'img'),
	('98', 'Cá Koi Utsuri', 'Phạm Thị Thu', '0143210987', 'Kích thước', '27 Mar 9:15 AM', 'Đã hủy', 'img'),
	('99', 'Cá Koi Doitsu', 'Đinh Văn Đạt', '0132109876', 'Hình dáng', '28 Mar 10:30 AM', 'Chưa giải quyết', 'img'),
	('100', 'Cá Koi Hi Utsuri', 'Bùi Thị Hải', '0121098765', 'Sức khỏe', '29 Mar 11:45 AM', 'Xác nhận', 'img');
GO

-- Bảng Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY,
    name NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) UNIQUE NOT NULL,
    password NVARCHAR(255) NOT NULL,
    role NVARCHAR(50) CHECK (role IN ('member', 'admin')) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);
go

INSERT INTO Users (name, email, password, role)
VALUES 
('John Doe', 'johndoe@example.com', 'password123', 'member'),
('Alice Smith', 'alice@example.com', 'password456', 'admin'),
('Bob Johnson', 'bob@example.com', 'password789', 'member');

-- Tạo bảng KoiManagement
CREATE TABLE KoiManagement (
    KoiID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Breed NVARCHAR(50) NOT NULL,
    Size DECIMAL(5, 2) NOT NULL,
    Color NVARCHAR(50) NULL,
    DateOfEntry DATE NULL,
    Origin NVARCHAR(100) NULL,
    Price DECIMAL(10, 2) NULL,
    HealthStatus NVARCHAR(50) NULL,
    user_email NVARCHAR(255) NOT NULL,
    GPA DECIMAL(3, 2) NOT NULL,
    VoteCount INT DEFAULT 0 NOT NULL,
    CONSTRAINT FK_UserEmail FOREIGN KEY (user_email) REFERENCES Users(email)
);
go
-- Chèn dữ liệu vào KoiManagement
INSERT INTO KoiManagement (Name, Breed, Size, Color, DateOfEntry, Origin, Price, HealthStatus, user_email, GPA)
VALUES 

('Kohaku ', 'Taisho Sanke', 19.40, 'White with Red & Black', '2024-11-04', 'Japan', 1550.00, 'Healthy', 'johndoe@example.com', 3.6),
('Sanke ', 'Shusui', 21.80, 'Light Blue', '2024-11-05', 'China', 1400.00, 'Moderate', 'alice@example.com', 3.8),
('Showa ', 'Ogon', 18.00, 'Golden', '2024-11-06', 'Vietnam', 1250.00, 'Healthy', 'bob@example.com', 3.4),
('Utsuri ', 'Utsuri', 23.10, 'Black & Yellow', '2024-11-07', 'Thailand', 1600.00, 'Excellent', 'johndoe@example.com', 3.9),
('Asagi ', 'Asagi', 17.75, 'Gray Blue', '2024-11-08', 'Japan', 1300.00, 'Healthy', 'alice@example.com', 3.5);
go
-- Tạo bảng Votes
CREATE TABLE Votes (
    VoteID INT PRIMARY KEY IDENTITY,
    KoiID INT NOT NULL,
    VoterEmail NVARCHAR(255) NOT NULL,
    VoteDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (KoiID) REFERENCES KoiManagement(KoiID),
    FOREIGN KEY (VoterEmail) REFERENCES Users(email)
);

GO
CREATE PROCEDURE AddVote
    @KoiID INT,
    @VoterEmail NVARCHAR(255)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Kiểm tra nếu đã tồn tại bình chọn cho KoiID và VoterEmail
        IF NOT EXISTS (SELECT 1 FROM Votes WHERE KoiID = @KoiID AND VoterEmail = @VoterEmail)
        BEGIN
            -- Thêm bình chọn vào bảng Votes
            INSERT INTO Votes (KoiID, VoterEmail)
            VALUES (@KoiID, @VoterEmail);

            -- Cập nhật VoteCount trong bảng KoiManagement
            UPDATE KoiManagement
            SET VoteCount = VoteCount + 1
            WHERE KoiID = @KoiID;

            PRINT 'Bình chọn thành công!';
        END
        ELSE
        BEGIN
            PRINT 'Người dùng đã bình chọn cho cá này rồi.';
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

-- Kiểm tra dữ liệu trong bảng KoiManagement
SELECT * FROM KoiManagement
SELECT * FROM Users
SELECT KoiID FROM KoiManagement;
SELECT * FROM Orders;



SELECT KoiID FROM Votes
WHERE KoiID NOT IN (SELECT KoiID FROM KoiManagement)
ALTER TABLE Votes WITH CHECK CHECK CONSTRAINT FK__Votes__KoiID__19DFD96B;




