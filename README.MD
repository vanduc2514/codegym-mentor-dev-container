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
| [**nodejs**](https://github.com/vanduc2514/vscode-devcontainer/tree/master/containers/nodejs14/.devcontainer) | NodeJS LTS v14 |
| [**java8-mysql**](https://github.com/vanduc2514/vscode-devcontainer/tree/master/containers/java8-mysql/.devcontainer) | Java 8 (Đã bao gồm Gradle và Maven) + MySQL Latest |

Chuyển tới thư mục root của dự án, sau đó sử dụng command dưới đây để download Devcontainer tương ứng. Sau khi download thành công, thư mục root sẽ xuất hiện thêm folder `.devcontainer`.

Ngoài cách trên, có thể sử dụng [Downgit](https://downgit.github.io/) để download folder `.devcontainer` phù hợp. Sau đó giải nén vào thư mục root của dự án.

Visual Studio Code sẽ sử dụng folder này để tiến hành build và run Devcontainer.

### **Windows 10**

> Sử dụng PowerShell

Chọn container cần download

```powershell
Set-Variable -Name ContainerName -Value #Tên Container
```

> Tên Container lấy từ bảng các Devcontainer khả dụng hoặc tên folder tương ứng trong repository này
>
> Ví dụ: `Set-Variable -Name ContainerName -Value nodejs`

Download Configuration

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-Expression (
  Invoke-WebRequest https://github.com/vanduc2514/vscode-devcontainer/raw/master/install.ps1 -UseBasicParsing
).Content
```
