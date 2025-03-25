class Person {
  final String name;
  final String phoneNumber;
  final String mail;
  static const String websiteCompany = "https://www.strategizeit.us/";
  static const String linkedInCompany = "https://www.linkedin.com/company/strategizeit/";
  final String whatsLink;
  static const String faceLink = "https://m.facebook.com/100064306653008/";
  static const String locationLink = "https://maps.app.goo.gl/rKuhJFvCEbzcf2Mu8";


  Person({
    required this.name,
    required this.phoneNumber,
    required this.mail,
    required this.whatsLink,
  });

  // تحويل البيانات لنص قابل للحفظ في ملف HTML
  String toHTML() {
    return """
      <!DOCTYPE html>
      <html lang="ar">
      <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>$name - معلومات الاتصال</title>
          <style>
              body { font-family: Arial, sans-serif; text-align: center; padding: 20px; }
              .card { background: #f4f4f4; padding: 20px; border-radius: 10px; display: inline-block; }
              a { display: block; margin: 10px; text-decoration: none; color: blue; }
          </style>
      </head>
      <body>
          <img src="https://yourcompany.com/logo.png" width="100" />
          <div class="card">
              <h2>$name</h2>
              <p>📞 <a href="tel:$phoneNumber">$phoneNumber</a></p>
              <p>📧 <a href="mailto:$mail">$mail</a></p>
              <p>🌐 <a href="$websiteCompany">Website</a></p>
              <p>🔗 <a href="$linkedInCompany">LinkedIn</a></p>
              <p>💬 <a href="$whatsLink">WhatsApp</a></p>
              <p>📍 <a href="$locationLink">Location</a></p>
              <p>📘 <a href="$faceLink">Facebook</a></p>
          </div>
      </body>
      </html>
    """;
  }
}
