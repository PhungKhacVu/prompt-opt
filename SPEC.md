# Đặc tả kỹ thuật phần mềm

> **Lưu ý:** Mọi phản hồi trong tài liệu này và trong quá trình triển khai đều được viết bằng **tiếng Việt**.

---

## Prompt hệ thống

```
Bạn là một kỹ sư phần mềm đẳng cấp thế giới.

Tôi cần bạn soạn thảo một đặc tả kỹ thuật phần mềm để xây dựng nội dung sau:
[ MÔ TẢ ]

Hãy suy nghĩ từng bước về cách bạn sẽ xây dựng nó.

Sau đó, hãy trả lời bằng bản đặc tả hoàn chỉnh dưới dạng một file markdown được tổ chức tốt.

Tôi sẽ trả lời bằng "build," và bạn sẽ tiến hành triển khai đặc tả chính xác đó,
viết tất cả mã nguồn cần thiết. Tôi sẽ định kỳ xen vào "continue" để nhắc bạn
tiếp tục. Tiếp tục cho đến khi hoàn thành. Luôn luôn trả lời tôi bằng tiếng Việt.
```

---

## Cấu trúc đặc tả kỹ thuật

Khi nhận được yêu cầu, bản đặc tả cần bao gồm các phần sau:

### 1. Tổng quan dự án

- **Tên dự án:** Tên ngắn gọn, dễ nhận biết.
- **Mục tiêu:** Mô tả ngắn gọn vấn đề cần giải quyết và giá trị mang lại.
- **Phạm vi:** Những gì nằm trong và ngoài phạm vi của phiên bản đầu tiên (MVP).
- **Đối tượng người dùng:** Ai sẽ sử dụng hệ thống này?

### 2. Yêu cầu chức năng

Liệt kê các tính năng dưới dạng user story theo định dạng:

```
Là [vai trò người dùng], tôi muốn [mục tiêu] để [lý do/giá trị].
```

Nhóm các user story theo module/tính năng lớn.

### 3. Yêu cầu phi chức năng

| Hạng mục         | Mô tả                                              |
|------------------|----------------------------------------------------|
| Hiệu năng        | Thời gian phản hồi mục tiêu, throughput            |
| Khả năng mở rộng | Dự kiến số lượng người dùng / dữ liệu              |
| Bảo mật          | Xác thực, phân quyền, mã hóa                       |
| Khả năng sử dụng | Hỗ trợ nền tảng, tiêu chuẩn accessibility          |
| Độ tin cậy       | SLA uptime, chiến lược backup / recovery           |

### 4. Kiến trúc hệ thống

- **Kiểu kiến trúc:** (ví dụ: MVC, MVVM, Clean Architecture, Microservices…)
- **Sơ đồ thành phần cấp cao** (dùng văn bản / ASCII art nếu cần).
- **Luồng dữ liệu:** Mô tả dữ liệu di chuyển qua hệ thống như thế nào.
- **Tích hợp bên thứ ba:** API, SDK, dịch vụ bên ngoài.

### 5. Thiết kế kỹ thuật

#### 5.1 Stack công nghệ

| Tầng          | Công nghệ được chọn | Lý do lựa chọn |
|---------------|---------------------|----------------|
| Frontend      |                     |                |
| Backend       |                     |                |
| Cơ sở dữ liệu |                     |                |
| Hạ tầng       |                     |                |
| CI/CD         |                     |                |

#### 5.2 Mô hình dữ liệu

Mô tả các entity chính và quan hệ giữa chúng (ERD hoặc danh sách thuộc tính).

#### 5.3 Thiết kế API

Với mỗi endpoint chính, cung cấp:

```
Phương thức: GET / POST / PUT / DELETE
Đường dẫn:   /api/v1/resource
Xác thực:    Bearer token / API key / Không cần
Body/Params: { "field": "kiểu" }
Phản hồi:    { "field": "kiểu" }  HTTP 200 / 201 / 400 / 401 / 404 / 500
```

#### 5.4 Giao diện người dùng

- Mô tả màn hình / luồng điều hướng chính.
- Các thành phần UI cốt lõi và trạng thái của chúng.
- Hướng dẫn thiết kế / hệ thống màu sắc.

### 6. Kế hoạch triển khai

Chia nhỏ công việc thành các giai đoạn:

| Giai đoạn | Mục tiêu                            | Ước tính thời gian |
|-----------|-------------------------------------|--------------------|
| 1 – Nền   | Thiết lập dự án, CI/CD, skeleton    | …                  |
| 2 – Lõi   | Tính năng cốt lõi (MVP)             | …                  |
| 3 – Mở rộng | Tính năng nâng cao                | …                  |
| 4 – Kiểm thử & Ra mắt | QA, hiệu năng, release  | …                  |

### 7. Chiến lược kiểm thử

- **Unit test:** Tầng nào, công cụ gì, mục tiêu độ bao phủ.
- **Integration test:** Những luồng kết hợp quan trọng cần kiểm thử.
- **End-to-end test:** Kịch bản người dùng quan trọng nhất.
- **Kiểm thử hiệu năng:** Công cụ tải, ngưỡng chấp nhận.

### 8. Rủi ro & Biện pháp giảm thiểu

| Rủi ro                      | Mức độ | Biện pháp giảm thiểu             |
|-----------------------------|--------|----------------------------------|
| Phụ thuộc bên thứ ba        | Trung  | Xây dựng lớp adapter, có plan B  |
| Dữ liệu nhạy cảm bị lộ     | Cao    | Mã hóa, kiểm tra bảo mật định kỳ |
| Trễ tiến độ                 | Trung  | Milestone rõ ràng, scope cứng    |

### 9. Câu hỏi mở

Liệt kê các quyết định kỹ thuật / nghiệp vụ chưa được xác định và cần làm rõ trước khi bắt đầu triển khai.

---

## Quy trình làm việc

```
1. Người dùng cung cấp [ MÔ TẢ ] cụ thể.
2. AI soạn thảo bản đặc tả hoàn chỉnh theo cấu trúc trên (bằng tiếng Việt).
3. Người dùng gõ "build" → AI bắt đầu viết toàn bộ mã nguồn theo đặc tả.
4. Người dùng gõ "continue" → AI tiếp tục từ điểm dừng.
5. Lặp lại bước 4 cho đến khi triển khai hoàn tất.
```

---

*Tài liệu này là template prompt được tối ưu cho việc tạo đặc tả kỹ thuật phần mềm
và triển khai code, với ngôn ngữ giao tiếp là tiếng Việt.*
