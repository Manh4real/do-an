import styled from "styled-components";

const StyledCheckout = styled.div`
  --title-padding: 12px 20px;

  padding: 50px 0 150px 0;
  max-width: 100%;

  background: #fff;

  .checkout-content__grid {
    display: grid;
    grid-template-areas:
      "a a a"
      "b b c";
    grid-template-columns: repeat(3, 1fr);
    grid-template-rows: repeat(3, max-content);
    gap: 15px;
    max-width: 60%;
    margin-inline: auto;

    > .title {
      grid-area: a;
    }
    > .steps {
      grid-area: b;
    }
    > .checkout__info {
      grid-area: c;
      height: max-content;
    }
  }

  .row {
    padding-top: 15px;
  }
  label {
    margin: 0;
    line-height: 1;
  }
  .input,
  input:not([type="radio"]) {
    width: 100%;
    padding: 10px 15px;
    font-size: 14px;
    outline: none;

    :focus {
      ${"" /* border-color: var(--medium-grey); */}

      ::placeholder {
        opacity: 0;
      }
    }
  }
  .checkout__step-ship-form input {
    border: 1px solid transparent;
  }
  .mask {
    position: absolute;
    background: transparent;
    inset: 0;
    pointer-events: none;
    border: 1px solid transparent;
    z-index: 0;
  }
  .checkout__form-input input:focus ~ .mask,
  .input:focus ~ .mask {
    border-color: var(--medium-grey);
  }

  .checkout__form {
    .title {
      font-size: 16px;
      text-align: left;
    }
    input[type="radio"] {
      width: 0;
      height: 0;
      border: none;
      opacity: 0;
      visibility: hidden;
    }
    .custom-radio {
      display: inline-block;
      width: 15px;
      aspect-ratio: 1;
      border-radius: 50%;
      border: 1px solid var(--grey);
      cursor: pointer;

      &.checked {
        background-color: #111;
      }
    }
  }
  .checkout__form-input input:focus + label {
    top: 0;
    left: 5px;
    font-size: 10px;
  }
  .checkout__form-input,
  .postal-code-input {
    position: relative;

    &.is--error {
      .checkout__block {
        border-color: red;
        margin-bottom: 5px;
      }
      .mask {
        border-color: red;
      }
    }
    &.is--filled {
      input + label {
        top: 0;
        left: 5px;
        font-size: 10px;
      }
    }
    &.is--valid {
      .check-icon {
        opacity: 1;
        visibility: visible;
      }
    }
    .invalid-message {
      position: absolute;
      z-index: 1;
      font-size: 10px;
      bottom: -16px;
      color: red;
    }
    .check-icon {
      position: absolute;
      top: 50%;
      right: 15px;
      transform: translateY(-50%);
      opacity: 0;
      visibility: hidden;
    }
  }

  .checkout__form-input {
    &.has--prefix {
      label {
        left: 70px;
      }
      input {
        padding-left: 0;
      }
    }
  }
  .checkout__form-input label {
    position: absolute;
    top: 50%;
    left: 10px;
    padding: 5px;
    color: var(--grey);
    transform: translateY(-50%);
    background: #fff;
    pointer-events: none;
    z-index: 1;
  }
  .checkout__form-input input::placeholder {
    color: var(--grey);
  }
  .checkout__form-button {
    padding: 8px 15px;
    text-transform: uppercase;
    font-family: var(--pri-font);
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 0.5px;
    border-radius: 2.5px;

    &.primary {
      color: #fff;
      background: var(--pri-orange);
    }
  }

  li::marker {
    color: #111;
  }
  .title {
    text-align: center;
    font-weight: 600;
    font-size: 34px;
    font-family: var(--pri-font);
    text-transform: uppercase;
  }
  .checkout__info-title {
    font-size: 20px;
    background: #e5e5e5;
    padding: var(--title-padding);

    a {
      text-transform: initial;
      text-decoration: underline;
    }
  }
  .checkout__block {
    border: 1px solid var(--bg-grey);
  }
  .checkout__form-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 15px;
  }
  .checkout__step {
    margin-bottom: 20px;
  }
  .checkout__step-title {
    color: #fff;
    background: #222;
    padding: var(--title-padding);
    font-size: 20px;
    text-align: left;

    &.is--disabled {
      pointer-events: none;
    }
  }
  .checkout__step-content {
    padding: 15px;
  }
  .checkout__tab {
    font-size: 14px;
    padding: 15px 10px;
    color: var(--darker-grey);
    transition: none;

    &.active {
      color: var(--pri-black);
      border-bottom: 1px solid #111;
    }
  }

  .checkout__info {
    main {
      padding: 20px;
    }
    .row {
      font-size: 14px;
      padding: 2px 0;
    }
  }

  .checkout__total-price {
    color: #fa5400;
  }
  .checkout__total {
    font-weight: 600;
    text-transform: uppercase;
  }
  .checkout__total-row {
    padding: 10px 0 20px 0 !important;
    border-bottom: 1px solid var(--bg-grey);

    span {
      font-family: var(--pri-font);
      font-weight: bold;
      font-size: 16px;
    }
  }
  .checkout__products {
    padding: 5px 0 15px 0;

    .checkout__time {
      padding: 15px 0;
      text-align: left;
      font-size: 14px;
    }
  }
  .checkout__product {
    font-size: 14px;

    + .checkout__product {
      padding-top: 20px;
    }

    &.flex-start {
      align-items: start;
      gap: 25px;
    }
    * {
      color: #7e7e7e;
    }
    .productName {
      color: #111;
    }
    .image img {
      width: 50px;
      aspect-ratio: 1;
    }
  }

  .checkout__step-pickup-form {
    .location-btn {
      position: absolute;
      top: 50%;
      right: 15px;
      transform: translateY(-50%);
    }
    .message {
      font-size: 14px;
    }
    .apply-btn {
      width: max-content;
      border: none;
    }
  }

  @media (max-width: 1120px) {
    .checkout-content__grid {
      max-width: 80%;
    }
  }
  @media (max-width: 1000px) {
    .checkout-content__grid {
      grid-template-areas:
        "a a a"
        "c c c"
        "b b b";
    }
  }
  @media (max-width: 720px) {
    .checkout-content__grid {
      max-width: 96%;
    }
    .checkout__first-name,
    .checkout__last-name {
      grid-column: 1 / -1;
    }
  }
  @media (max-width: 550px) {
    .checkout__email,
    .checkout__phone {
      grid-column: 1 / -1;
    }
  }
`;

export default StyledCheckout;
