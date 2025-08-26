#!/bin/bash

# Create main project folder
mkdir mental-health-app && cd mental-health-app

### ----------------- FRONTEND -----------------
echo "⚛️ Setting up React frontend..."
npx create-react-app frontend

# Add components & pages
mkdir -p frontend/src/components frontend/src/pages

cat > frontend/src/components/Navbar.js <<EOL
import React from "react";

export default function Navbar() {
  return (
    <nav>
      <h2>Mental Health Support</h2>
    </nav>
  );
}
EOL

cat > frontend/src/pages/Home.js <<EOL
import React from "react";

export default function Home() {
  return <h1>Welcome to the Mental Health Support App</h1>;
}
EOL

cat > frontend/src/pages/Login.js <<EOL
import React from "react";

export default function Login() {
  return (
    <div>
      <h2>Login</h2>
      <form>
        <input type="text" placeholder="Email" />
        <input type="password" placeholder="Password" />
        <button>Login</button>
      </form>
    </div>
  );
}
EOL

# Replace App.js
cat > frontend/src/App.js <<EOL
import React from "react";
import Navbar from "./components/Navbar";
import Home from "./pages/Home";

function App() {
  return (
    <div>
      <Navbar />
      <Home />
    </div>
  );
}

export default App;
EOL

### ----------------- BACKEND -----------------
echo "🖥️ Setting up Node.js backend..."
mkdir backend && cd backend
npm init -y > /dev/null
npm install express dotenv cors > /dev/null

mkdir -p src/routes src/controllers

# server.js
cat > src/server.js <<EOL
const express = require("express");
const cors = require("cors");
require("dotenv").config();

const app = express();
app.use(cors());
app.use(express.json());

// Routes
app.get("/", (req, res) => {
  res.send("Mental Health Support API is running 🚀");
});

const authRoutes = require("./routes/auth");
app.use("/auth", authRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(\`Server running on port \${PORT}\`));
EOL

# auth.js
cat > src/routes/auth.js <<EOL
const express = require("express");
const router = express.Router();
const { loginUser } = require("../controllers/authController");

router.post("/login", loginUser);

module.exports = router;
EOL

# authController.js
cat > src/controllers/authController.js <<EOL
exports.loginUser = (req, res) => {
  const { email, password } = req.body;
  if (email === "test@student.com" && password === "1234") {
    return res.json({ message: "Login successful ✅" });
  }
  res.status(401).json({ message: "Invalid credentials ❌" });
};
EOL

# .env.example
echo "PORT=5000" > .env.example

cd ..

### ----------------- DOCS -----------------
mkdir -p docs design .github/workflows

cat > docs/architecture.md <<EOL
# Mental Health Support App - Architecture

- **Frontend**: React (for web/PWA)
- **Backend**: Node.js + Express
- **Database**: TBD (MongoDB/Postgres)
- **Authentication**: JWT
- **Deployment**: GitHub Actions + Vercel/Heroku
EOL

# CI/CD placeholder
cat > .github/workflows/ci.yml <<EOL
name: CI
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Install frontend
        run: cd frontend && npm install
      - name: Install backend
        run: cd backend && npm install
EOL

echo "✅ Project setup complete!"