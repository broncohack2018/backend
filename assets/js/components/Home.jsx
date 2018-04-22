import * as React from 'react'
import { Link } from 'react-router-dom'
import { RouteComponentProps } from 'react-router-dom'

export default class Home extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <div>
        <div>
          <h2>Welcome to Phoenix!</h2>
          <p className="lead">A productive web framework that<br />does not compromise speed and maintainability.</p>
        </div>

        <div className="marketing">
          <div lg="4">
            <h4>Resources</h4>
            <ul>
              <li>
                <a href="http://phoenixframework.org/docs/overview">Guides</a>
              </li>
              <li>
                <a href="https://hexdocs.pm/phoenix">Docs</a>
              </li>
              <li>
                <a href="https://github.com/phoenixframework/phoenix">Source</a>
              </li>
            </ul>
          </div>

          <div lg="4">
            <h4>Examples</h4>
            <ul>
              <li>
                <Link to="/counter">Counter</Link>
              </li>
              <li>
                <Link to="/fetch-data">Fetch Data</Link>
              </li>
            </ul>
          </div>

          <div lg="4">
            <h4>Help</h4>
            <ul>
              <li>
                <a href="http://groups.google.com/group/phoenix-talk">Mailing list</a>
              </li>
              <li>
                <a href="http://webchat.freenode.net/?channels=elixir-lang">#elixir-lang on freenode IRC</a>
              </li>
              <li>
                <a href="https://twitter.com/elixirphoenix">@elixirphoenix</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    )
  }
}
