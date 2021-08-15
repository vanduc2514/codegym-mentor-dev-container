# **Codegym VSCode Devcontainer**  

Project này được tạo ra với mục đích giúp các Mentor của Codegym nhanh chóng thiết lập được môi trường phát triển cho các dự án của học viên. Các môi trường này cô lập với hệ điều hành, chạy được trên Windows, Mac hoặc Linux do sử dụng [Docker Container](https://www.docker.com/resources/what-container) và [Visual Studio Code Remote Container](https://code.visualstudio.com/docs/remote/containers)

Các container này được cài đặt sẵn một số Git Extension và được config với Github Credentials Helper, SSH Key trên Host OS. Mentor có thể thực hiện pull/push bên trong các container.

## **Yêu cầu hệ thống**

- [Docker Desktop](https://www.docker.com/products/docker-desktop)  
- [Visual Studio Code](https://code.visualstudio.com/download)
- [Extension Remote Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## **Download Devcontainer**

Các Devcontainer khả dụng:

| Tên container | Mô tả |
| --- | ----------- |
| [**nodejs14**](https://github.com/vanduc2514/vscode-devcontainer/tree/master/containers/nodejs14/.devcontainer) | NodeJS LTS v14 |
| [**java8-mysql**](https://github.com/vanduc2514/vscode-devcontainer/tree/master/containers/java8-mysql/.devcontainer) | Java 8 (Đã bao gồm Gradle) + MySQL bản mới nhất |

Chuyển tới thư mục root của dự án, sau đó sử dụng command dưới đây để download Devcontainer tương ứng.  

Ngoài cách trên, có thể sử dụng [Downgit](https://downgit.github.io/) để download folder `.devcontainer` phù hợp. Sau đó giải nén vào thư mục root của dự án.

Sau khi download thành công, thư mục root sẽ xuất hiện thêm folder `.devcontainer`.

![devcontainer](https://github.com/vanduc2514/vscode-devcontainer/raw/master/images/_devcontainer.jpg)

Visual Studio Code sẽ sử dụng folder này để build và run Devcontainer.

### **Windows 10**

> Sử dụng PowerShell

1. Chọn container cần download

```powershell
$ContainerName="Tên Container"
```

> Tên Container lấy từ bảng các Devcontainer khả dụng hoặc từ tên folder tương ứng trong repository này
>
> Ví dụ: `$ContainerName="nodejs14"`

2. Download Configuration

```powershell
(Invoke-WebRequest https://github.com/vanduc2514/vscode-devcontainer/raw/master/install.ps1 -UseBasicParsing
).Content | Invoke-Expression
```

### **Mac/Linux**

> Cập nhật sau ...

## **Run Devcontainer**

Tại giao diện Visual Studio Code, sử dụng tổ hợp phím `Ctrl + Shift + P` để mở giao diện Command Palette. Nhập vào command **Remote-Containers: Rebuild and Reopen in Container** sau đó nhấn `Enter` .

![devcontainer-command](https://github.com/vanduc2514/vscode-devcontainer/raw/master/images/_devcontainer_command.jpg)

Lần đầu thực thi sẽ tốn khá nhiều thời gian do Docker phải pull Image về dựa theo Dockerfile trong folder `.devcontainer`. Những lần sau Docker chỉ run container.

> Nên git ignore `.devcontainer` locally (không cập nhật vào file `.gitignore` của học viên) bằng command sau
>
> **Note**: Command này được chạy bên trong Container. Để mở một terminal mới trong Visual Studio Code , sử dụng tổ hợp phím `Ctrl + Shift + ~`

```bash
grep -qxF .devcontainer ./.git/info/exclude || echo .devcontainer >> ./.git/info/exclude
```

## **Config cho Devcontainer**

Với biến môi trường, vui lòng tham khảo tại file `README` của từng container. Để config thêm cho container, vui lòng tham khảo thêm các tài liệu sau của Microsoft:

- Config cơ bản:
<https://code.visualstudio.com/docs/remote/devcontainerjson-reference>
- Config nâng cao:
<https://code.visualstudio.com/docs/remote/containers-advanced>

## **Đóng góp**

1. Fork repository này
2. Push các config khác hoặc sửa đổi config hiện tại
3. Tạo Pull Request từ fork repository
