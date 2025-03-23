Sana verdiğim ders notlarını aşağıdaki kurallara göre düzenleyerek eksiksiz bir LaTeX belgesine dönüştür:

1. Belge Formatı ve Başlık:
   - Belgede aşağıdaki standart giriş formatını MUTLAKA kullan ve ders bilgilerini dosya adından alarak uygun şekilde doldur:

\begin{document}
\twocolumn[
\begin{@twocolumnfalse}
\begin{minipage}{0.15\textwidth}
{
\includegraphics[width=4cm]{logo/iufizik.png}
}
\end{minipage}
\hspace{25pt}
\begin{minipage}{0.75\textwidth}
\vspace{5mm}
\Large{\textbf{[DERS ADI BURAYA] \\ [TARİH BURAYA]}}
\vspace{3mm}\\
\large{\textbf{Ad Soyad:} Celal Ekrem Torun - 0411230037}
\vspace{2mm}\\
\large{\textbf{DERS:} [ÖĞRETIM ÜYESI ADI BURAYA]}\newline
\fontsize{0.35cm}{0.5cm}\selectfont
\textit{Fizik Bölümü, İstanbul Üniversitesi\newline
Beyazıt, Fatih, İstanbul, Türkiye\newline
[TARİH BURAYA]}
\end{minipage}
\small
\end{@twocolumnfalse}]
\hspace{25pt}
\hspace{25pt}
\hspace{25pt}
\section{[İLK BÖLÜM BAŞLIĞI BURAYA]}

   - Dosyanın adını (örn: FZKT2403_FMM_H04S1_EgriselVektorlerTensorler.pdf) belgenin üst kısmında veya dipnot olarak belirt
   - Dökümanın iki kolonlu bir formatla devam etmesini sağla.

2. Matematiksel İçerik:
   - Tüm matematiksel ifadeleri LaTeX formatında düzgün şekilde yaz
   - a olarak yazdığım ∂ sembollerini kısmi türev olarak doğru kullan (\partial)
   - Formülleri ve denklemleri uygun LaTeX komutlarıyla göster
   - Adım adım çözümleri numaralandır ve her adımın açıklamasını ekle
   - Harfleri ve sembolleri düzeltirken dikkatli ol, metin içinde geçen harfler ve semboller yanlış görülmüş olabilir

3. Görsel Öğeler:
   - Metinde betimlenen şemaları ve diyagramları TikZ veya diğer LaTeX paketleri kullanarak oluştur
   - Grafikleri ve çizimleri metinde açıklanan detaylara göre ekle

4. Önemli Noktalar ve Sınav İçeriği:
   - ÖNEMLİ başlığı altında anahtar kavramları ve kritik noktaları vurgula
   - "SINAV İÇİN" başlığı altında sınavda çıkabilecek soruları ve konuları özel olarak belirt
   - Bu bölümleri renkli kutular içinde göster (örneğin: \begin{tcolorbox}[title=ÖNEMLİ] ... \end{tcolorbox})

5. Düzeltme ve İyileştirme:
   - Yazım ve dilbilgisi hatalarını düzelt
   - Tutarsız gösterimleri ve notasyonları standartlaştır
   - İçeriği daha anlaşılır olmak için yeniden düzenle, gerekirse basitleştir

6. Çözümlü Örnekler ve Problem Gösterimi:
   - Derste çözülen problemleri adım adım göster
   - Her adımı açıkla ve kullanılan teorik bilgiyi belirt
   - Benzer problemlere yaklaşım için yöntemler öner

7. LaTeX Preamble ve Paketler:
   - Belgeyi oluştururken aşağıdaki LaTeX preamble'ı kullan ve gerekli tüm paketleri ekle:

\documentclass[11pt,letterpaper,twocolumn]{fenbil}


Lütfen tam ve eksiksiz bir LaTeX belgesi oluştur, tüm matematik sembollerini doğru formatlarda kullan, ve önemli yerleri vurgula.