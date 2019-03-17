import React, { Component } from "react";
import { connect } from "react-redux";
import Action from "./actions";
import Counter from "./components/counters";

class App extends Component {
  render() {
    return (
      <div className="App">
        <Counter
          value={this.props.counter}
          onIncrement={() => this.props.increment()}
          onDecrement={() => this.props.decrement()}
        />
      </div>
    );
  }
}

const mapStateToProps = state => ({
  counter: state.counter
});

const mapDispatchToProps = dispatch => ({
  increment: () =>
    dispatch({
      type: Action.INCREMENT,
      text: "INCREMENT"
    }),
  decrement: () =>
    dispatch({
      type: Action.DECREMENT,
      text: "DECREMENT"
    })
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(App);
