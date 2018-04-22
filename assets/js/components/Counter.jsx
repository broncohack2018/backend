import * as React from 'react'
import { Link } from 'react-router-dom'

const initialState = { currentCount: 0 }

export default class Counter extends React.Component {
  constructor(props) {
    super(props)
    this.state = initialState
  }

  render() {
    return (
      <div>
        <h1>Counter</h1>
        <p>The Counter is the simplest example of what you can do with a React component.</p>
        <p>Current count: <strong>{this.state.currentCount}</strong></p>
        <button color="primary" onClick={() => { this.incrementCounter() }}>Increment counter</button>{' '}
        <button color="secondary" onClick={() => { this.decrementCounter() }}>Decrement counter</button>{' '}
        <button color="secondary" onClick={() => { this.resetCounter() }}>Reset counter</button>
        <br /><br />
        <p><Link to="/">Back to home</Link></p>
      </div>
    )
  }

  incrementCounter() {
    this.setState({
      currentCount: this.state.currentCount + 1
    })
  }

  decrementCounter() {
    this.setState({
      currentCount: this.state.currentCount - 1
    })
  }

  resetCounter() {
    this.setState({
      currentCount: 0
    })
  }
}
