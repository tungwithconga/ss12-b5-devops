# Bài 5 – Chẩn đoán và khắc phục Pipeline CI/CD

## 1. Permission Denied – Gradle Wrapper
- **Triệu chứng:** `./gradlew: Permission denied` (exit code 126).
- **Nguyên nhân:** `gradlew` chưa có quyền thực thi trên Linux runner.
- **Khắc phục:** thêm bước `run: chmod +x gradlew` trước `./gradlew test`.
- **Xác minh:** bước `Run tests` hoàn thành thành công.

## 2. Authentication Failed – Docker Registry
- **Triệu chứng:** `unauthorized` hoặc `denied` khi đăng nhập `ghcr.io`.
- **Nguyên nhân:** tham chiếu sai tên GitHub Actions Secret, hoặc token không hợp lệ/không đủ quyền.
- **Khắc phục:** dùng chính xác `password: ${{ secrets.REGISTRY_TOKEN }}`; tạo repository secret `REGISTRY_TOKEN` chứa PAT có quyền `write:packages` (và `read:packages` khi cần). Sử dụng `username: ${{ github.actor }}`. Nếu tổ chức yêu cầu SSO, phải cấp quyền SSO cho token.
- **Xác minh:** bước `Login to GitHub Container Registry` thành công.

## 3. Build Context Error – Dockerfile
- **Triệu chứng:** `failed to read dockerfile` hoặc `Dockerfile: no such file or directory`.
- **Nguyên nhân:** Docker build context hoặc đường dẫn Dockerfile không trỏ về thư mục gốc repository.
- **Khắc phục:** đặt `context: .` và `file: ./Dockerfile`.
- **Xác minh:** bước `Build and push Docker image` thành công; package xuất hiện trên GitHub Packages.

## Kết quả kiểm thử
- [ ] Test Gradle thành công trên GitHub Actions
- [ ] Đăng nhập GHCR thành công
- [ ] Docker build và push thành công
- [ ] Chụp màn hình workflow tích xanh

> Đây là phân tích ba lỗi theo đề bài, chưa phải log thực tế đã quan sát trên repository của sinh viên. Chỉ đánh dấu hoàn thành sau khi workflow thực sự chạy thành công.
