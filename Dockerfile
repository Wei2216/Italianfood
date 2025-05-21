# 使用 PHP 8.0 與 Apache 的官方映像
FROM php:8.0-apache

# 啟用 Apache 的 mod_rewrite 模組
RUN a2enmod rewrite

# 安裝必要的 PHP 擴展
RUN docker-php-ext-install mysqli pdo pdo_mysql

# 複製專案檔案到容器內的 /var/www/html 目錄
COPY . /var/www/html/

# 設定工作目錄
WORKDIR /var/www/html

# 開放容器的 80 埠
EXPOSE 80

# 啟動 Apache 伺服器
CMD ["apache2-foreground"]

