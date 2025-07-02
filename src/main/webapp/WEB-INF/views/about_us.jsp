<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us - Expense Tracker</title>

  <!-- Bootstrap & Font Awesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

  <style>
    body {
      background: linear-gradient(135deg, #4e54c8, #8f94fb);
      color: #fff;
      font-family: 'Segoe UI', sans-serif;
      scroll-behavior: smooth;
    }

    header {
      padding: 1rem 2rem;
      background: rgba(255, 255, 255, 0.05);
      backdrop-filter: blur(8px);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
      position: sticky;
      top: 0;
      z-index: 100;
    }

    nav a {
      margin: 0 1rem;
      color: white;
      text-decoration: none;
      font-weight: 500;
    }

    nav a:hover {
      text-shadow: 0 0 8px rgba(255, 255, 255, 0.6);
    }

    .about-section {
      padding: 4rem 2rem;
      text-align: center;
    }

    .about-section h1 {
      font-size: clamp(2rem, 5vw, 3.5rem);
      text-transform: uppercase;
      text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.3);
      margin-bottom: 2rem;
    }

    .about-section p {
      max-width: 800px;
      margin: auto;
      line-height: 1.8;
      font-size: 1.1rem;
      letter-spacing: 0.5px;
      font-variation-settings: "wght" 450;
    }

    .team {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: 2rem;
      padding: 3rem 2rem;
    }

    .team-member {
      background: rgba(255, 255, 255, 0.05);
      padding: 2rem;
      border-radius: 1rem;
      text-align: center;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      transition: transform 0.3s ease;
    }

    .team-member:hover {
      transform: translateY(-10px);
    }

    .team-member img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      margin-bottom: 1rem;
      border: 2px solid #fff;
    }

    .team-member h5 {
      margin-top: 0.5rem;
    }
  </style>
</head>
<body>

  <header class="d-flex justify-content-between align-items-center">
    <h3><i class="fas fa-wallet"></i> ExpenseTracker</h3>
    <nav>
      <a href="home.jsp">Home</a>
      <a href="about.jsp">About Us</a>
      <a href="login.jsp">Login</a>
      <a href="signup.jsp">Sign Up</a>
    </nav>
  </header>

  <section class="about-section">
    <h1>About Us</h1>
    <p>
      ExpenseTracker is a modern personal finance application designed to help individuals and families manage their daily expenses effortlessly. With clean visuals, intuitive design, and secure cloud storage, our platform empowers users to track spending, categorize transactions, and plan better for the future.
    </p>
  </section>

  <section class="team">
    <div class="team-member">
      <img src="https://i.pravatar.cc/100?img=1" alt="Founder">
      <h5>Ravi Sharma</h5>
      <p>Founder & Backend Developer</p>
    </div>
    <div class="team-member">
      <img src="https://i.pravatar.cc/100?img=2" alt="UI Designer">
      <h5>Anjali Mehta</h5>
      <p>UI/UX Designer</p>
    </div>
    <div class="team-member">
      <img src="https://i.pravatar.cc/100?img=3" alt="Security">
      <h5>Akash Verma</h5>
      <p>Security & DevOps</p>
    </div>
  </section>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
