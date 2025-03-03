#  Systemd User Units

## 설명

systemd를 사용하여 사용자 세션에서 서비스를 관리합니다. 더 강력하고 유연한 방법이지만, 설정이 약간 더 복잡합니다.

## 방법

1.  `~/.config/systemd/user/my-app.service` 파일을 생성합니다.
2.  다음 내용을 파일에 추가합니다.
    ```ini
    [Unit]
    Description=My Application
    [Service]
    ExecStart=/bin/bash "$HOME/bin/my-app.sh"
    Restart=on-failure
    [Install]
    WantedBy=default.target
    ```
3.  다음 명령어를 실행하여 서비스를 활성화합니다.
    ```bash
    systemctl --user enable my-app.service
    systemctl --user start my-app.service
    ```
4.  로그아웃 후 다시 로그인합니다.
