# Mini Katalog Uygulaması
Proje adı: AppShop
Bu proje, Flutter ile temel seviyede mobil uygulama geliştirme sürecini pekiştirmek amacıyla üretilmiş kart tabanlı bir **Mini Katalog Uygulaması**dır.

Flutter Sürümü: 3.41.9
Dart Sürümü: 3.11.5

## 🟢 Proje Özellikleri
- **Temiz Mimari:** `components`, `models`, `services` ve `views` klasör yapısı.
- **Dinamik Veri:** `https://wantapi.com/products.php` API'sinden veri çekme ve `ProductModel` ile eşleştirme.
- **Gelişmiş Navigasyon:** Merkezi `routes` yönetimi ve **Route Arguments** ile veri taşıma.
- **Durum Yönetimi:** `StatefulWidget` ve `setState` ile sepete ekleme ve sepetten anlık silme.
- **Asset Yönetimi:** Yerel banner görselinin `pubspec.yaml` üzerinden entegrasyonu.


---

## ⚙️ Nasıl Çalıştırılır?

Projeyi kendi bilgisayarınızda (Emülatör veya Fiziksel Cihaz) çalıştırmak için aşağıdaki adımları sırasıyla uygulayın:

### 1. Projeyi Klonlayın veya İndirin

```bash
git clone <github-repository-linkiniz>
cd mobil_app
```

### 2. Bağımlılıkları Yükleyin

Projenin ihtiyaç duyduğu paketlerin kurulması için terminalde şu komutu çalıştırın:

```bash
flutter pub get
```

### 3. Asset Kontrolü

`assets/images/banner.png` dosyasının projede bulunduğundan ve `pubspec.yaml` dosyasında tanımlı olduğundan emin olun.

### 4. Uygulamayı Başlatın

Emülatör veya fiziksel cihaz bağlıyken aşağıdaki komutu çalıştırın:

```bash
flutter run
```
