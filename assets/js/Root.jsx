import * as React from 'react'

export default class Root extends React.Component {
  render() {
    return (
      <div>
        <header className="header">
          <span className="logo"></span>
        </header>

        <main role="main">
          {this.props.children}
        </main>
      </div>
    )
  }
}
