# 使用 PHP 8.0 + Apache 映像檔
FROM php:8.0-apache

# 啟用 Apache 的 mod_rewrite 模組
RUN a2enmod rewrite

# 安裝 PostgreSQL 所需的 PHP 擴充
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo_pgsql pgsql

# 設定 UTF-8 編碼與時區（選用）
ENV LANG=C.UTF-8
ENV TZ=Asia/Taipei

# 複製應用程式檔案到容器
COPY . /var/www/html/

# 設定 Apache 的網站根目錄權限
RUN chown -R www-data:www-data /var/www/html

# 設定工作目錄
WORKDIR /var/www/html

# 開放 80 埠
EXPOSE 80

# 啟動 Apache 伺服器
CMD ["apache2-foreground"]
