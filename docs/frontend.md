# Frontend Guide

## 📂 Folder Structure
```
frontend/
└── src/
├── components/ # Shared UI parts (Navbar, Footer, Button, etc.)
├── pages/ # Each app page in its own folder
│ ├── Home/
│ │ ├── Home.js
│ │ └── Home.css
│ ├── Login/
│ │ ├── Login.js
│ │ └── Login.css
│ └── ...
├── App.js # Root component
└── index.js # Entry point
```

---

## 🖥️ How to Add a New Page
1. Inside `src/pages/`, create a new folder with the page name.  
   Example: `src/pages/Dashboard/`  
2. Add at least **two files** inside it:  
   - `Dashboard.js` → the React component  
   - `Dashboard.css` → styles for that page  
3. Import and use the page in `App.js` (or later in `react-router` once added).  

**Example `Dashboard.js`:**
```js
import React from "react";
import "./Dashboard.css";

export default function Dashboard() {
  return (
    <div className="dashboard">
      <h1>Welcome to Dashboard</h1>
    </div>
  );
}
```

**Example `Dashboard.css`:**
```css
.dashboard {
  padding: 20px;
  text-align: center;
}
```

## Components vs Pages
- **Pages** (`src/pages/`) → Full pages (Home, Login, Dashboard)
- **Components** (`src/components/) → Small reusable UI parts (Navbar, Footer, Button, etc).

**Rule of thumb:**
- If it is reused in multiple pages → put it in components/.
- If it is specific to one page → keep it inside that page’s folder.

## 🛠️ Editing the Frontend
- Global styles go into `App.css`.
- Page-specific styles should stay in their own CSS file.
- Always use functional components (`function MyPage()`) not class components.
- Use `npm start` inside the `frontend/` folder to run locally. You will need to run `npm install` for the first time.

## 🚀 Adding a Page to Navigation
If you want your new page to show up in the Navbar:
1. Open `src/components/Navbar.js`.
2. Add a `<a>` link to your page.

**Example** (inside `Navbar.js`):
```js
<nav>
  <h2>Mental Health Support</h2>
  <a href="/">Home</a>
  <a href="/login">Login</a>
  <a href="/dashboard">Dashboard</a>
</nav>
```
