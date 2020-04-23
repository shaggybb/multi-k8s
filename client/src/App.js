import "./App.css";

import React, { Component } from "react";
import { Link, Route, BrowserRouter as Router } from "react-router-dom";

import Fib from "./Fib";
import logo from "./logo.svg";
import OtherPage from "./OtherPage";

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <h1 className="App-title">
              Fib Calculator -- KUBERNETES version!!
            </h1>
            <Link to="/">Home</Link>
            <Link to="/otherpage">Other Page</Link>
          </header>
          <div>
            <Route exact path="/" component={Fib} />
            <Route path="/otherpage" component={OtherPage} />
          </div>
        </div>
      </Router>
    );
  }
}

export default App;
