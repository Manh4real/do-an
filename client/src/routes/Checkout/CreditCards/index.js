import React from "react";
import Card from "@snowpak/react-credit-cards";

import {
  formatCreditCardNumber,
  formatCVC,
  formatExpirationDate,
} from "./utils";

import "@snowpak/react-credit-cards/es/styles-compiled.css";
import StyledCreditCards from "./StyledCreditCards";

export default class CreditCards extends React.Component {
  state = {
    number: "",
    name: "",
    expiry: "",
    cvc: "",
    issuer: "",
    focused: "",
    formData: null,
  };

  constructor(props) {
    super(props);
    this.props = props;
  }

  handleCallback = ({ issuer }, isValid) => {
    if (isValid) {
      this.setState({ issuer });
    }
  };

  handleInputFocus = ({ target }) => {
    this.setState({
      focused: target.name,
    });
  };

  handleInputChange = ({ target }) => {
    if (target.name === "number") {
      target.value = formatCreditCardNumber(target.value);
    } else if (target.name === "expiry") {
      target.value = formatExpirationDate(target.value);
    } else if (target.name === "cvc") {
      target.value = formatCVC(target.value);
    }

    this.setState({ [target.name]: target.value });
  };

  handleSubmit = (e) => {
    e.preventDefault();
    const { issuer } = this.state;
    const formData = [...e.target.elements]
      .filter((d) => d.name)
      .reduce((acc, d) => {
        acc[d.name] = d.value;
        return acc;
      }, {});

    this.setState({ ...formData, issuer });
    // this.form.reset();

    this.props?.handleNextStep?.({ data: formData });
  };

  render() {
    const { name, number, expiry, cvc, focused, issuer } = this.state;

    return (
      <StyledCreditCards>
        <div key="Payment">
          <div className="App-payment">
            <Card
              number={number}
              name={name}
              expiry={expiry}
              cvc={cvc}
              focused={focused}
              callback={this.handleCallback}
            />
            <form ref={(c) => (this.form = c)} onSubmit={this.handleSubmit}>
              <div className="form-group">
                <input
                  type="tel"
                  name="number"
                  className="form-control"
                  placeholder="Card Number"
                  pattern="[\d| ]{16,22}"
                  required
                  onChange={this.handleInputChange}
                  onFocus={this.handleInputFocus}
                />
                <small>E.g.: 49..., 51..., 36..., 37...</small>
              </div>
              <div className="form-group">
                <input
                  type="text"
                  name="name"
                  className="form-control"
                  placeholder="Name"
                  required
                  onChange={this.handleInputChange}
                  onFocus={this.handleInputFocus}
                />
              </div>
              <div className="row">
                <div className="col-6">
                  <input
                    type="tel"
                    name="expiry"
                    className="form-control"
                    placeholder="Valid Thru"
                    pattern="\d\d/\d\d"
                    required
                    onChange={this.handleInputChange}
                    onFocus={this.handleInputFocus}
                  />
                </div>
                <div className="col-6">
                  <input
                    type="tel"
                    name="cvc"
                    className="form-control"
                    placeholder="CVC"
                    pattern="\d{3,4}"
                    required
                    onChange={this.handleInputChange}
                    onFocus={this.handleInputFocus}
                  />
                </div>
              </div>
              <input type="hidden" name="issuer" value={issuer} />
              <div className="form-actions">
                <button className="mt-25 checkout__form-button primary hover-w-fade">
                  Next
                </button>
              </div>
            </form>
            {/* {formData && (
              <div className="App-highlight">
                {formatFormData(formData).map((d, i) => (
                  <div key={i}>{d}</div>
                ))}
              </div>
            )} */}
          </div>
        </div>
      </StyledCreditCards>
    );
  }
}
