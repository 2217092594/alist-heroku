# 创建配置文件目录
mkdir -p /alist/config/

apk add --no-cache curl

if echo "$ATOKEN" | grep -q -i "^http"; then
  ATOKEN=`curl -s $ATOKEN`
fi

# 写入配置文件
cat >/alist/config/conf.yml <<EOF
info:
  title: $CTITLE
  logo:
  footer_text: 遇到无法打开等情况,先去喝咖啡等待服务器重构即可(〜￣▽￣)〜
  footer_url: https://z3.ax1x.com/2021/09/11/4Snh90.jpg
  music_img: https://cdn.jsdelivr.net/gh/sbwml/cdn@master/img/0f8b57866bdb5.gif
  check_update: false
  script: ""
  autoplay: true
  preview:
    url: ""
    pre_process: []
    extensions: []
    text:
    - txt
    - htm
    - html
    - xml
    - java
    - properties
    - sql
    - js
    - md
    - json
    - conf
    - ini
    - vue
    - php
    - py
    - bat
    - gitignore
    - yml
    - go
    - sh
    - c
    - cpp
    - h
    - hpp
    max_size: 0
server:
  address: 0.0.0.0
  port: "$PORT"
  search: true
  download: true
  static: dist
  site_url: '*'
  password: $DPASSWORD
ali_drive:
  api_url: https://api.aliyundrive.com/v2
  max_files_count: 200
  drives:
  - refresh_token: $ATOKEN
    root_folder: $BFOLDER
    name: home
    password: ""
    hide: false
database:
  type: sqlite3
  dBFile: alist.db
EOF

cd /alist
./alist -conf config/conf.yml
