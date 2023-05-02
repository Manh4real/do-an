import styled from "styled-components";

const StyledStripePayment = styled.div`
  button {
    background: #5469d4;
    background: var(--pri-black);
    color: #fff;

    border-radius: 4px;
    border: 0;
    padding: 12px 16px;
    margin-block: 12px;

    text-align: center;

    font-size: 16px;
    font-weight: 600;
    font-family: var(--pri-font);
    letter-spacing: 1px;
    text-transform: uppercase;

    display: block;
    transition: all 0.2s ease;
    box-shadow: 0px 5px 15px 1px rgba(0, 0, 0, 0.07);
    width: 100%;
  }
  button:hover {
    filter: contrast(115%);
  }
  button:disabled {
    opacity: 0.5;
    cursor: default;
  }
  button > span {
    font-family: inherit;
  }
  .hidden {
    display: none;
  }

  /* spinner/processing state, errors */
  .spinner,
  .spinner:before,
  .spinner:after {
    border-radius: 50%;
  }

  .spinner {
    color: #ffffff;
    font-size: 22px;
    text-indent: -99999px;
    margin: 0px auto;
    position: relative;
    width: 20px;
    height: 20px;
    box-shadow: inset 0 0 0 2px;
    transform: translateZ(0);
  }

  .spinner:before,
  .spinner:after {
    position: absolute;
    content: "";
  }

  .spinner:before {
    width: 10.4px;
    height: 20.4px;
    background: #5469d4;
    border-radius: 20.4px 0 0 20.4px;
    top: -0.2px;
    left: -0.2px;
    transform-origin: 10.4px 10.2px;
    animation: loading 2s infinite ease 1.5s;
  }

  .spinner:after {
    width: 10.4px;
    height: 10.2px;
    background: #5469d4;
    border-radius: 0 10.2px 10.2px 0;
    top: -0.1px;
    left: 10.2px;
    transform-origin: 0px 10.2px;
    animation: loading 2s infinite ease;
  }

  @keyframes loading {
    0% {
      transform: rotate(0deg);
    }
    100% {
      transform: rotate(360deg);
    }
  }
`;

export default StyledStripePayment;
