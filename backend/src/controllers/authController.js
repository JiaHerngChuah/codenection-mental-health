exports.loginUser = (req, res) => {
  const { email, password } = req.body;
  if (email === "test@student.com" && password === "1234") {
    return res.json({ message: "Login successful ✅" });
  }
  res.status(401).json({ message: "Invalid credentials ❌" });
};
