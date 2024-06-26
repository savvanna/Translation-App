import { createUserWithEmailAndPassword } from "firebase/auth";
import React, { useState } from "react";
import { auth } from "../../firebase";
import "./SignUp.css"; // Импорти

const SignUp = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [copyPassword, setCopyPassword] = useState("");
  const [error, setError] = useState("");

  function register(e) {
    e.preventDefault();
    if (copyPassword !== password) {
      setError("Passwords didn't match");
      return;
    }
    createUserWithEmailAndPassword(auth, email, password)
      .then((user) => {
        console.log(user);
        setError("");
        setEmail("");
        setCopyPassword("");
        setPassword("");
      })
      .catch((error) => console.log(error));
  }

  return (
    <div className="signup-container">
      <form onSubmit={register} className="signup-form">
        <h2>Create an account</h2>
        <input
          placeholder="Enter your email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          type="email"
        />
        <input
          placeholder="Enter your password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          type="password"
        />
        <input
          placeholder="Confirm your password"
          value={copyPassword}
          onChange={(e) => setCopyPassword(e.target.value)}
          type="password"
        />
        <button className="signup-button">Create Account</button>
        {error && <p className="error-message">{error}</p>}
      </form>
    </div>
  );
};

export default SignUp;
