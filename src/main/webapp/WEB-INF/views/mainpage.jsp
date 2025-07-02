<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Expense Tracker</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

  <style>
    :root {
      --primary: #4e54c8;
      --secondary: #8f94fb;
      --text-color: #fff;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', sans-serif;
    }

    body {
      min-height: 100vh;
      background: linear-gradient(135deg, var(--primary), var(--secondary));
      color: var(--text-color);
      scroll-behavior: smooth;
    }

    header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1rem 2rem;
      background: rgba(255, 255, 255, 0.05);
      backdrop-filter: blur(8px);
      border-radius: 0 0 20px 20px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.2);
      position: sticky;
      top: 0;
      z-index: 100;
    }

    nav a {
      margin: 0 1rem;
      color: white;
      text-decoration: none;
      font-weight: 500;
      letter-spacing: 0.05rem;
      transition: color 0.3s;
    }

    nav a:hover {
      color: #f0f0f0;
      text-shadow: 0 0 8px rgba(255, 255, 255, 0.6);
    }

    .hero {
      display: grid;
      place-items: center;
      padding: 4rem 2rem;
      text-align: center;
      gap: 2rem;
      perspective: 800px;
    }

    .hero h1 {
      font-size: clamp(2rem, 5vw, 4rem);
      text-transform: uppercase;
      text-shadow: 2px 2px 8px rgba(0,0,0,0.3);
      transform: rotateX(0deg);
      animation: slideIn 1s ease-out forwards;
      -webkit-text-stroke: 1px black;
      will-change: transform, opacity;
    }

    .hero p {
      font-size: 1.2rem;
      letter-spacing: 0.03rem;
      max-width: 600px;
      line-height: 1.6;
      font-variation-settings: "wght" 450;
      isolation: isolate;
      mix-blend-mode: screen;
    }

    .cta {
      margin-top: 1rem;
      display: flex;
      gap: 1rem;
      flex-wrap: wrap;
      justify-content: center;
    }

    .cta a {
      padding: 0.75rem 2rem;
      background: #fff;
      color: var(--primary);
      border-radius: 20px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.2);
      cursor: pointer;
      font-weight: bold;
      transition: transform 0.3s, background 0.3s;
      user-select: none;
    }

    .cta a:hover {
      transform: scale(1.05);
      background: #eee;
    }

    @keyframes slideIn {
      0% { transform: rotateX(-90deg); opacity: 0; }
      100% { transform: rotateX(0deg); opacity: 1; }
    }

    .features {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 2rem;
      padding: 4rem 2rem;
    }

    .feature-box {
      background: radial-gradient(circle, rgba(255,255,255,0.05), rgba(255,255,255,0.02));
      border-radius: 20px;
      padding: 2rem;
      box-shadow: 0 4px 16px rgba(0,0,0,0.2);
      text-align: center;
      transition: transform 0.3s ease;
      filter: contrast(1.2);
    }

    .feature-box:hover {
      transform: translateY(-10px);
      background: rgba(255,255,255,0.08);
    }

    .feature-box i {
      font-size: 2.5rem;
      margin-bottom: 1rem;
    }

    ::-webkit-scrollbar {
      width: 8px;
    }

    ::-webkit-scrollbar-thumb {
      background: #888;
      border-radius: 4px;
    }

    ::-webkit-scrollbar-thumb:hover {
      background: #555;
    }
  </style>
</head>
<body>
  <header>
    <h2><i class="fas fa-wallet"></i> ExpenseTracker</h2>
    <nav>
      <a href="/">Home</a>
  		<a href="about_us">About Us</a>

      <a href="ClientLogin">Login</a>
      <a href="clientSignUp">Sign Up</a>
    </nav>
  </header>

  <section class="hero">
    <h1>Track Every Rupee</h1>
    <p>Welcome to your personal finance manager. Organize your spending, manage budgets, and take control of your financial life with ease.</p>
    <div class="cta">
      <a href="clientSignUp"><i class="fas fa-user-plus"></i> Get Started</a>
     <a href="about_us"><i class="fas fa-circle-info"></i> Learn More</a>

    </div>
  </section>

  <section class="features">
    <div class="feature-box">
      <i class="fas fa-chart-line"></i>
      <h4>Expense Analytics</h4>
      <p>Get detailed reports of your daily, weekly, and monthly expenses with graphs.</p>
    </div>
    <div class="feature-box">
      <i class="fas fa-shield-alt"></i>
      <h4>Secure & Private</h4>
      <p>All your data is encrypted and protected. Your privacy is our priority.</p>
    </div>
    <div class="feature-box">
      <i class="fas fa-mobile-alt"></i>
      <h4>Mobile Friendly</h4>
      <p>Fully responsive design that works great on phones, tablets, and desktops.</p>
    </div>
    <div class="feature-box">
      <i class="fas fa-cloud-upload-alt"></i>
      <h4>Cloud Storage</h4>
      <p>All expense entries and receipts are backed up safely on the cloud.</p>
    </div>
  </section>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>