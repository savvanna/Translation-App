import logo from "./logo.svg";
import "./App.css";
import SignUp from "./components/auth/SignUp";
import SignIn from "./components/auth/SingIn";
import AuthDetails from "./components/auth/AuthDetails";
import React from 'react';

class Appl extends React.Component {
  constructor(props) {
    super(props);
    this.state = { apiResponse: "сервер не включил" };
  }

  callApi() {
    fetch("http://localhost:9000/testApi")
      .then((res) => res.text())
      .then((res) => this.setState({ apiResponse: res }));
  }

  componentDidMount() {
    this.callApi();
  }

  render() {
    return (
      <div className="App">
        <SignUp />
        <SignIn />
        <AuthDetails />
        <p>{this.state.apiResponse}</p>
      </div>
    );
  }
}

export default Appl;

