import { signInWithEmailAndPassword } from "firebase/auth";
import React, { useState } from "react";
import { auth } from "../../firebase";
import "./SignIn.css"; // Импорти

const SignIn = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  function logIn(e) {
    e.preventDefault();
    signInWithEmailAndPassword(auth, email, password)
      .then((user) => {
        console.log(user);
        setError("");
        setEmail("");
        setPassword("");
      })
      .catch((error) => {
        console.log(error);
        setError("SORRY, COULDN'T FIND YOUR ACCOUNT");
      });
  }

  return (
    <div className="signin-container">
      <form onSubmit={logIn} className="signin-form">
        <h2>Log in</h2>
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
        <button className="signin-button">Login</button>
        {error && <p className="error-message">{error}</p>}
      </form>
    </div>
  );
};

export default SignIn;
