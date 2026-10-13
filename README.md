# ss12-b5 – Sửa 3 lỗi GitHub Actions CI/CD

## Yêu cầu
- GitHub repository chứa mã nguồn dự án này tại thư mục gốc
- Repository secret `REGISTRY_TOKEN`: GitHub Personal Access Token (classic) có quyền `write:packages` (và `read:packages` nếu cần)
- Workflow được phép chạy GitHub Actions; nếu tổ chức hạn chế Actions, cần bật quyền phù hợp

## Các bước
1. Tạo repository GitHub `ss12-b5` và push toàn bộ dự án lên nhánh `main`.
2. Vào **Settings > Secrets and variables > Actions > New repository secret**, đặt tên chính xác `REGISTRY_TOKEN`, nhập PAT (không commit token vào code).
3. Mỗi lần push `main`, workflow `.github/workflows/broken-pipeline.yml` sẽ chạy. Có thể chọn **Actions > Fixed CI CD Pipeline > Run workflow**.
4. Xem kết quả bước test, login, build/push trong Actions; image sẽ có tên `ghcr.io/<owner>/<repo>:latest` (tên repository phải ở dạng chữ thường để GHCR chấp nhận).
5. Chụp ảnh workflow tích xanh và nộp `broken-pipeline.yml`, `troubleshooting.md`, ảnh chụp.

## Chạy thử ở WSL + Docker Desktop
```bash
chmod +x gradlew
./gradlew test
docker build -t ss12-b5:local .
docker run --rm -p 8081:8080 ss12-b5:local
```
Mở http://localhost:8081 để thử API. Port 8081 tránh trùng container Bài 2 trên port 8080.

## Lưu ý
- Workflow được thiết kế cho repo `ss12-b5` và owner GitHub dạng chữ thường. Nếu tên owner/repo có chữ hoa, hãy sửa `tags:` thành tên image chữ thường.
- `gradlew` tự tải wrapper JAR trong lần chạy đầu tiên nên runner cần Internet; Dockerfile dùng image Gradle chính thức để build.
- Chưa thể khẳng định tích xanh trước khi chạy trên GitHub thực tế.
