# PowerShell Script to Create Repository Structure for Istanbul University Physics Department
# 2nd Year - Spring Semester - Ekrem Torun

# Create the main directory
$mainDir = "IU-Fizik-2-Bahar"
New-Item -Path $mainDir -ItemType Directory -Force

# Create README file with improved formatting and course table
$readmeContent = @"
# İstanbul Üniversitesi Fizik Bölümü 2. Sınıf - Bahar Dönemi

Bu repo, İstanbul Üniversitesi Fizik Bölümü 2. sınıf bahar dönemi derslerinin notlarını, ödevlerini ve sınav hazırlıklarını içermektedir.

**Öğrenci:** Ekrem Torun

## Dersler

| Dönem | Kod | Ders Adı | Öğretim Elemanı | AKTS | T/U/L | Kredi | Tür |
|-------|-----|----------|-----------------|------|-------|-------|-----|
| 4 | FZKT2401 | Klasik Mekanik | Doç. Dr. FATMA AYDOĞMUŞ ŞEN | 6 | 4/1/0 | 4.5 | Z |
| 4 | FZKT2402 | Modern Fizik | Prof. Dr. OLCAY BÖLÜKBAŞI YALÇINKAYA | 5 | 4/0/0 | 4 | Z |
| 4 | FZKT2403 | Fizikte Matematiksel Metotlar II | Prof. Dr. ERTAN GÜDEKLİ | 6 | 4/1/0 | 4.5 | Z |
| 4 | FZKT2404 | Elektronik I - Analog Elektronik | Doç. Dr. NESLİHAN ÜZAR KILIÇ | 5 | 3/0/2 | 4 | Z |
| 4 | FZKT2412 | Akustik Fizik | Prof. Dr. FEYZA GÜZELÇİMEN | 4 | 3/0/0 | 3 | S |
| 4 | FZKT2405 | Optik Laboratuvarı | Doç. Dr. ŞAHİN YAKUT | 3 | 0/0/4 | 2 | S |

## Repo Yapısı

```
IU-Fizik-2-Bahar/
├── 00-Genel/
│   ├── Akademik_Takvim/
│   ├── Ders_Programi/
│   └── Yönetmelikler/
├── FZKT2401-Klasik_Mekanik/
│   ├── Ders_Notlari/
│   ├── Odevler/
│   ├── Sinavlar/
│   └── Kaynaklar/
├── FZKT2402-Modern_Fizik/
│   ├── ...
```

Her ders için aşağıdaki klasör yapısı oluşturulmuştur:
- **Ders_Notlari**: LaTeX kaynak dosyaları ve derlenmiş PDF'ler
- **Odevler**: Verilen ödevler ve çözümleri
- **Sinavlar**: Vize ve final sınavları için hazırlık materyalleri
- **Kaynaklar**: Ders için faydalı kaynaklar, makaleler, kitaplar

## Vize ve Final Tarihleri
- **Vize Sınavları**: 08-14 Nisan 2025
- **Final Sınavları**: 03-15 Haziran 2025
"@

Set-Content -Path "$mainDir\README.md" -Value $readmeContent

# Create .gitignore file
$gitignoreContent = @"
# LaTeX auxiliary files
*.aux
*.log
*.out
*.toc
*.lof
*.lot
*.fls
*.fdb_latexmk
*.synctex.gz
*.bbl
*.blg

# Compiled files
*.pyc
*.class

# IDE specific files
.idea/
.vscode/
*.sublime-project
*.sublime-workspace

# OS specific files
.DS_Store
Thumbs.db

# Temporary files
*.tmp
*.temp
*.swp
*~

# Python virtual environments
venv/
env/
.env/

# Jupyter Notebook checkpoints
.ipynb_checkpoints/
"@

Set-Content -Path "$mainDir\.gitignore" -Value $gitignoreContent

# Define course information
$courses = @(
    @{
        Code = "FZKT2401"
        Name = "Klasik Mekanik"
        Type = "Z"
        Credit = "4.5"
        ECTS = "6"
        Format = "4/1/0"
        Instructor = "Doç. Dr. FATMA AYDOĞMUŞ ŞEN"
        HasLab = $false
    },
    @{
        Code = "FZKT2402"
        Name = "Modern Fizik"
        Type = "Z"
        Credit = "4"
        ECTS = "5"
        Format = "4/0/0"
        Instructor = "Prof. Dr. OLCAY BÖLÜKBAŞI YALÇINKAYA"
        HasLab = $false
    },
    @{
        Code = "FZKT2403"
        Name = "Fizikte Matematiksel Metotlar II"
        Type = "Z"
        Credit = "4.5"
        ECTS = "6"
        Format = "4/1/0"
        Instructor = "Prof. Dr. ERTAN GÜDEKLİ"
        HasLab = $false
    },
    @{
        Code = "FZKT2404"
        Name = "Elektronik I - Analog Elektronik"
        Type = "Z"
        Credit = "4"
        ECTS = "5"
        Format = "3/0/2"
        Instructor = "Doç. Dr. NESLİHAN ÜZAR KILIÇ"
        HasLab = $true
    },
    @{
        Code = "FZKT2412"
        Name = "Akustik Fizik"
        Type = "S"
        Credit = "3"
        ECTS = "4"
        Format = "3/0/0"
        Instructor = "Prof. Dr. FEYZA GÜZELÇİMEN"
        HasLab = $false
    },
    @{
        Code = "FZKT2405"
        Name = "Optik Laboratuvarı"
        Type = "S"
        Credit = "2"
        ECTS = "3"
        Format = "0/0/4" 
        Instructor = "Doç. Dr. ŞAHİN YAKUT"
        HasLab = $true
    }
)

# Create directory structure for each course
foreach ($course in $courses) {
    $courseDir = "$mainDir\$($course.Code)-$($course.Name.Replace(' ', '_'))"
    New-Item -Path $courseDir -ItemType Directory -Force
    
    # Create course README
    $courseReadme = @"
# $($course.Code) - $($course.Name)

- **Öğretim Elemanı:** $($course.Instructor)
- **Tür:** $($course.Type) ($(if ($course.Type -eq "Z") {"Zorunlu"} else {"Seçmeli"}))
- **Kredi:** $($course.Credit)
- **AKTS:** $($course.ECTS)
- **Ders Formatı:** $($course.Format) (Teori/Uygulama/Laboratuvar)

## Ders İçeriği

$(if ($course.Code -eq "FZKT2401") {
@"
### Klasik Mekanik Konuları
1. Newton Mekaniği ve Vektör Analizi
2. Tek Boyutta Hareket
3. İki ve Üç Boyutta Hareket
4. Noninersiyel Referans Sistemleri
5. Newton Mekaniksel Sistemleri
6. Doğrusal Salınımlar
7. Lagrange ve Hamilton Dinamikleri
8. İki Cisim Merkezi Kuvvet Problemi
9. Rijit Cisim Dinamiği
10. Özel Relativite
"@
} elseif ($course.Code -eq "FZKT2402") {
@"
### Modern Fizik Konuları
1. Özel Relativite: Lorentz Dönüşümleri ve Sonuçları
2. Kara Cisim Işıması ve Planck Kuantum Hipotezi
3. Fotoelektrik ve Compton Olayları
4. Atom Modelleri: Thomson, Rutherford ve Bohr
5. De Broglie Hipotezi ve Dalga-Parçacık İkililiği
6. Heisenberg Belirsizlik İlkesi
7. Schrödinger Denklemi ve Kuantum Mekaniği
8. Hidrojen Atomu ve Çözümü
9. Pauli Dışarlama İlkesi ve Periyodik Tablo
10. Çekirdek Fiziğine Giriş
"@
} elseif ($course.Code -eq "FZKT2403") {
@"
### Fizikte Matematiksel Metotlar II Konuları
1. İkinci Mertebeden Adi Diferansiyel Denklemler
2. Sturm-Liouville Sistemleri
3. Özel Fonksiyonlar: Legendre, Bessel, Hermite ve Laguerre
4. Fourier Serileri ve Dönüşümleri
5. Kısmi Diferansiyel Denklemler
6. Kompleks Değişkenli Fonksiyonlar
7. Kompleks İntegrasyon
8. Residue Teoremi ve Uygulamaları
9. Green Fonksiyonları
10. Tensor Analizi
"@
} elseif ($course.Code -eq "FZKT2404") {
@"
### Elektronik I - Analog Elektronik Konuları
1. Devre Teorisi: Kirchhoff Yasaları, Thevenin ve Norton Teoremleri
2. Diyotlar ve Uygulamaları
3. Transistörler: BJT ve MOSFET
4. Transistör Amplifikatör Devreleri
5. İşlemsel Yükselteçler (Op-Amp)
6. Aktif Filtreler
7. Güç Kaynakları
8. Osilatör Devreleri
9. Analog-Dijital ve Dijital-Analog Dönüştürücüler
10. Güç Elektroniği Temelleri
"@
} elseif ($course.Code -eq "FZKT2412") {
@"
### Akustik Fizik Konuları
1. Ses Dalgaları Teorisi ve Özellikleri
2. Ses Dalgalarının Yayılması ve Doppler Etkisi
3. Dalga Denklemleri ve Çözümleri
4. Akustik Empedans ve Rezonans
5. Ses Soğurma ve Yansıması
6. Mimari Akustik
7. Müzikal Akustik ve Enstrümanlar
8. İnsan Kulağının Akustiği
9. Gürültü Kontrolü ve Analizi
10. Ultrasonik ve İnfrasonik Dalgalar
"@
} elseif ($course.Code -eq "FZKT2405") {
@"
### Optik Laboratuvarı Deneyleri
1. Geometrik Optik: Mercekler ve Aynalar
2. Işık Kırınımı ve Girişim Deneyleri
3. Young Çift Yarık Deneyi
4. Michelson İnterferometresi
5. Işığın Kutuplanması ve Polarizasyon
6. Optik Aygıtlar: Spektroskop ve Teleskop
7. Lazer Işığı ve Uygulamaları
8. Holografi
9. Fiber Optik İletişim
10. Fotoelektrik Etki ve Fotonik Devreler
"@
})

## Değerlendirme
- Vize: %40
- Final: %60
- $(if ($course.HasLab) {"Laboratuvar: Geçme notuna %20 etki eder"})

## Kaynaklar
$(if ($course.Code -eq "FZKT2401") {
@"
- Classical Mechanics - J. R. Taylor
- Klasik Mekanik - H. Goldstein
- Introduction to Classical Mechanics - A. Arya
- Mekanik - Erdoğan Şuhubi
"@
} elseif ($course.Code -eq "FZKT2402") {
@"
- Modern Physics - R. Serway, C. Moses, C. Moyer
- Modern Fizik - K. Krane
- Modern Physics - P. Tipler, R. Llewellyn
- Quantum Physics - S. Gasiorowicz
"@
} elseif ($course.Code -eq "FZKT2403") {
@"
- Mathematical Methods for Physicists - G. Arfken, H. Weber
- Mathematical Methods in the Physical Sciences - M. L. Boas
- Fizikte Matematiksel Yöntemler - E. Güdekli
"@
} elseif ($course.Code -eq "FZKT2404") {
@"
- The Art of Electronics - P. Horowitz, W. Hill
- Microelectronic Circuits - A. S. Sedra, K. C. Smith
- Electronic Principles - A. P. Malvino
"@
} elseif ($course.Code -eq "FZKT2412") {
@"
- Fundamentals of Acoustics - L. E. Kinsler
- Acoustic and Audio Engineering - D. Davis, C. Davis
- Acoustics: An Introduction - H. Kuttruff
"@
} elseif ($course.Code -eq "FZKT2405") {
@"
- Optics - E. Hecht
- Introduction to Optics - F. L. Pedrotti
- Optik - F. Köksal
"@
})
"@

    Set-Content -Path "$courseDir\README.md" -Value $courseReadme
    
    # Create standard folders for each course
    New-Item -Path "$courseDir\Ders_Notlari" -ItemType Directory -Force
    New-Item -Path "$courseDir\Odevler" -ItemType Directory -Force
    New-Item -Path "$courseDir\Sinavlar" -ItemType Directory -Force
    New-Item -Path "$courseDir\Kaynaklar" -ItemType Directory -Force
    
    # Create lab folder if applicable
    if ($course.HasLab) {
        New-Item -Path "$courseDir\Laboratuvar" -ItemType Directory -Force
    }
    
    # Create LaTeX template for lecture notes
    $latexTemplateContent = @"
\documentclass[12pt,a4paper]{article}
\usepackage[utf8]{inputenc}
\usepackage[turkish]{babel}
\usepackage{amsmath,amsfonts,amssymb}
\usepackage{graphicx}
\usepackage{hyperref}
\usepackage{physics}
\usepackage{float}
\usepackage{fancyhdr}

\pagestyle{fancy}
\fancyhf{}
\lhead{İstanbul Üniversitesi Fizik Bölümü}
\rhead{$($course.Code) - $($course.Name)}
\lfoot{Ekrem Torun}
\rfoot{\thepage}

\begin{document}

\begin{titlepage}
    \centering
    \includegraphics[width=0.5\textwidth]{iu_logo.png}\\[1cm]
    {\scshape\LARGE İstanbul Üniversitesi\\}
    {\scshape\Large Fen Fakültesi - Fizik Bölümü\\[0.5cm]}
    \rule{\linewidth}{0.2mm} \\[0.4cm]
    { \huge \bfseries $($course.Code) - $($course.Name)\\
    Ders Notları\\[0.4cm] }
    \rule{\linewidth}{0.2mm} \\[1.5cm]
    
    {\large
    \begin{tabular}{rl}
        \textbf{Öğrenci:} & Ekrem Torun \\
        \textbf{Öğretim Elemanı:} & $($course.Instructor) \\
        \textbf{Akademik Dönem:} & 2024-2025 Bahar \\
    \end{tabular}}\\[2cm]
    
    {\large \today}
\end{titlepage}

\tableofcontents
\newpage

\section{Giriş}
Bu doküman, $($course.Code) $($course.Name) dersinin notlarını içermektedir.

\section{Temel Kavramlar}
% Ders notları buraya eklenecek

\section{Önemli Formüller}
% Formüller buraya eklenecek

\section{Örnek Problemler}
% Örnek problemler ve çözümleri buraya eklenecek

\end{document}
"@
    Set-Content -Path "$courseDir\Ders_Notlari\ders_notu_template.tex" -Value $latexTemplateContent
    
    # Create exam preparation folders
    New-Item -Path "$courseDir\Sinavlar\Vize" -ItemType Directory -Force
    New-Item -Path "$courseDir\Sinavlar\Final" -ItemType Directory -Force
    
    # Create midterm exam preparation readme
    $vizeContent = @"
# $($course.Code) - $($course.Name) Vize Sınavı Hazırlık

## Vize Tarihi
08-14 Nisan 2025 (kesin tarih ilan edilecek)

## Kapsam
Vize sınavı, ilk 6 haftanın konularını kapsamaktadır:

$(if ($course.Code -eq "FZKT2401") {
@"
1. Newton Mekaniği ve Vektör Analizi
2. Tek Boyutta Hareket
3. İki ve Üç Boyutta Hareket
4. Noninersiyel Referans Sistemleri
5. Newton Mekaniksel Sistemleri
6. Doğrusal Salınımlar
"@
} elseif ($course.Code -eq "FZKT2402") {
@"
1. Özel Relativite: Lorentz Dönüşümleri ve Sonuçları
2. Kara Cisim Işıması ve Planck Kuantum Hipotezi
3. Fotoelektrik ve Compton Olayları
4. Atom Modelleri: Thomson, Rutherford ve Bohr
5. De Broglie Hipotezi ve Dalga-Parçacık İkililiği
6. Heisenberg Belirsizlik İlkesi
"@
} elseif ($course.Code -eq "FZKT2403") {
@"
1. İkinci Mertebeden Adi Diferansiyel Denklemler
2. Sturm-Liouville Sistemleri
3. Özel Fonksiyonlar: Legendre, Bessel
4. Özel Fonksiyonlar: Hermite ve Laguerre
5. Fourier Serileri 
6. Fourier Dönüşümleri
"@
} elseif ($course.Code -eq "FZKT2404") {
@"
1. Devre Teorisi: Kirchhoff Yasaları
2. Thevenin ve Norton Teoremleri
3. Diyotlar ve Uygulamaları
4. Transistörler: BJT
5. Transistörler: MOSFET
6. Transistör Amplifikatör Devreleri
"@
} elseif ($course.Code -eq "FZKT2412") {
@"
1. Ses Dalgaları Teorisi ve Özellikleri
2. Ses Dalgalarının Yayılması ve Doppler Etkisi
3. Dalga Denklemleri ve Çözümleri
4. Akustik Empedans ve Rezonans
5. Ses Soğurma ve Yansıması
6. Mimari Akustik
"@
} elseif ($course.Code -eq "FZKT2405") {
@"
1. Geometrik Optik: Mercekler ve Aynalar
2. Işık Kırınımı ve Girişim Deneyleri
3. Young Çift Yarık Deneyi
4. Michelson İnterferometresi
5. Işığın Kutuplanması ve Polarizasyon
6. Optik Aygıtlar: Spektroskop ve Teleskop
"@
})

## Çalışma Planı
1. Ders notlarını düzenle ve gözden geçir
2. Ödevleri tekrar çöz
3. Önemli formülleri ve teoremleri listele
4. Örnek soruları çöz
5. Soru çözerken zamanlama yap

## Örnek Sınav Soruları
Bu klasörde önceki yılların sınav soruları ve çözümleri yer alacaktır.
"@
    Set-Content -Path "$courseDir\Sinavlar\Vize\README.md" -Value $vizeContent
    
    # Create resources folder with placeholder files
    $resourcesContent = @"
# $($course.Code) - $($course.Name) Kaynakları

## Ana Ders Kitapları
$(if ($course.Code -eq "FZKT2401") {
@"
- Classical Mechanics - J. R. Taylor
- Klasik Mekanik - H. Goldstein
- Introduction to Classical Mechanics - A. Arya
- Mekanik - Erdoğan Şuhubi
"@
} elseif ($course.Code -eq "FZKT2402") {
@"
- Modern Physics - R. Serway, C. Moses, C. Moyer
- Modern Fizik - K. Krane
- Modern Physics - P. Tipler, R. Llewellyn
- Quantum Physics - S. Gasiorowicz
"@
} elseif ($course.Code -eq "FZKT2403") {
@"
- Mathematical Methods for Physicists - G. Arfken, H. Weber
- Mathematical Methods in the Physical Sciences - M. L. Boas
- Fizikte Matematiksel Yöntemler - E. Güdekli
"@
} elseif ($course.Code -eq "FZKT2404") {
@"
- The Art of Electronics - P. Horowitz, W. Hill
- Microelectronic Circuits - A. S. Sedra, K. C. Smith
- Electronic Principles - A. P. Malvino
"@
} elseif ($course.Code -eq "FZKT2412") {
@"
- Fundamentals of Acoustics - L. E. Kinsler
- Acoustic and Audio Engineering - D. Davis, C. Davis
- Acoustics: An Introduction - H. Kuttruff
"@
} elseif ($course.Code -eq "FZKT2405") {
@"
- Optics - E. Hecht
- Introduction to Optics - F. L. Pedrotti
- Optik - F. Köksal
"@
})

## Online Kaynaklar
- MIT OpenCourseWare: [https://ocw.mit.edu/](https://ocw.mit.edu/)
- Khan Academy: [https://www.khanacademy.org/](https://www.khanacademy.org/)
- HyperPhysics: [http://hyperphysics.phy-astr.gsu.edu/hbase/index.html](http://hyperphysics.phy-astr.gsu.edu/hbase/index.html)
"@
    Set-Content -Path "$courseDir\Kaynaklar\README.md" -Value $resourcesContent
}

# Create a common resources directory
$commonDir = "$mainDir\00-Genel"
New-Item -Path $commonDir -ItemType Directory -Force

# Create subdirectories in common resources
New-Item -Path "$commonDir\Akademik_Takvim" -ItemType Directory -Force
New-Item -Path "$commonDir\Ders_Programi" -ItemType Directory -Force
New-Item -Path "$commonDir\Yönetmelikler" -ItemType Directory -Force

# Create academic calendar 
$calendarContent = @"
# 2024-2025 Bahar Dönemi Akademik Takvim

## Önemli Tarihler

- **Derslerin Başlangıcı:** 17 Şubat 2025
- **Vize Sınavları:** 08-14 Nisan 2025
- **Final Sınavları:** 03-15 Haziran 2025
- **Bütünleme Sınavları:** 24 Haziran - 02 Temmuz 2025
- **Resmi Tatiller:**
  - 23 Nisan: Ulusal Egemenlik ve Çocuk Bayramı
  - 01 Mayıs: Emek ve Dayanışma Günü
  - 19 Mayıs: Atatürk'ü Anma, Gençlik ve Spor Bayramı
- **Dönem Sonu:** 15 Haziran 2025

## Akademik Takvim Bağlantısı
[İstanbul Üniversitesi Akademik Takvim](https://www.istanbul.edu.tr/tr/akademik-takvim)
"@
Set-Content -Path "$commonDir\Akademik_Takvim\README.md" -Value $calendarContent

# Create course schedule
$scheduleContent = @"
# 2024-2025 Bahar Dönemi Ders Programı

## Haftalık Program

| Saat | Pazartesi | Salı | Çarşamba | Perşembe | Cuma |
|------|-----------|------|----------|----------|------|
| 09:00-10:00 | FZKT2401 - Klasik Mekanik | FZKT2403 - Matematiksel Metotlar II | FZKT2401 - Klasik Mekanik | FZKT2403 - Matematiksel Metotlar II | FZKT2412 - Akustik Fizik |
| 10:00-11:00 | FZKT2401 - Klasik Mekanik | FZKT2403 - Matematiksel Metotlar II | FZKT2401 - Klasik Mekanik | FZKT2403 - Matematiksel Metotlar II | FZKT2412 - Akustik Fizik |
| 11:00-12:00 | FZKT2402 - Modern Fizik | FZKT2402 - Modern Fizik | | FZKT2401 - Uygulama | FZKT2412 - Akustik Fizik |
| 12:00-13:00 | Öğle Arası | Öğle Arası | Öğle Arası | Öğle Arası | Öğle Arası |
| 13:00-14:00 | FZKT2402 - Modern Fizik | FZKT2402 - Modern Fizik | | FZKT2403 - Uygulama | |
| 14:00-15:00 | FZKT2404 - Elektronik I | | FZKT2404 - Elektronik I | | |
| 15:00-16:00 | FZKT2404 - Elektronik I | | FZKT2404 - Elektronik I | | |
| 16:00-18:00 | | | | | |

## Laboratuvar Programı

| Gün | Saat | Laboratuvar | Ders Kodu |
|-----|------|-------------|-----------|
| Çarşamba | 14:00-18:00 | FZKT2405 - Optik Laboratuvarı | FZKT2405 |
| Perşembe | 14:00-16:00 | FZKT2404 - Elektronik Laboratuvarı | FZKT2404 |
"@
Set-Content -Path "$commonDir\Ders_Programi\README.md" -Value $scheduleContent

Write-Host "Repository structure created successfully in the '$mainDir' directory."
Write-Host "The structure has been designed for İstanbul Üniversitesi Fizik Bölümü with LaTeX templates for note-taking."