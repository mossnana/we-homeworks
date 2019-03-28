import React from "react";

class Redux extends React.Component {
  render() {
    const { value, onIncrement, onDecrement } = this.props;
    return (
      <p>
        <br />
        Clicked: {JSON.stringify(value)} times
        <br />
        <br />
        <button onClick={onIncrement}> + </button>{" "}
        <button onClick={onDecrement}> - </button>
      </p>
    );
  }
}
export default Redux;
