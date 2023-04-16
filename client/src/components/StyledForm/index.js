import styled from "styled-components";

const StyledForm = styled.form`
  font-size: 12px;
  color: #8d8d8d;
  text-align: center;

  position: relative;
  width: 480px;
  height: max-content;
  background: var(--white);
  padding: 20px 55px 0 55px;

  .input-ctn {
    position: relative;
    margin-bottom: 30px;
    border: 1px solid var(--bg-grey);
    border-radius: 3px;
  }
  .input-ctn.isInvalid {
    border: 1px solid #fe0000;
    border-radius: 3px;
  }
  .invalid-message {
    position: absolute;
    bottom: -8px;
    left: 0;
    transform: translateY(100%);
    text-indent: 5px;
    color: #fe0000;
    font-size: 12px;
  }
  .input-ctn input {
    padding: 12px;
    display: block;
    width: 100%;
    border-radius: 3px;
    color: #8d8d8d;
    font-size: 14px;
    border: none;
    outline: none;
  }
  .input-ctn input::placeholder {
    font-size: 14px;
  }
  .input-ctn input:focus::placeholder {
    color: #e5e5e5;
  }
  label {
    user-select: none;
    margin-left: 10px;
  }
  a {
    text-decoration: underline;
    color: #8d8d8d;
  }
  .kmsi-ctn {
    display: flex;
    align-items: center;
    text-align: left;
  }
  .kmsi-ctn input[type="checkbox"] {
    width: 18px;
    height: 18px;
    border-radius: 5px;
  }
  .form__submit-btn-ctn {
    margin: 20px 0;
  }
  .form__submit-btn {
    padding: 12px;
    display: block;
    width: 100%;
    background: #000;
    color: var(--white);
    border: none;
    font-weight: bold;
    border-radius: 3px;
  }
  #country-select {
    margin: 15px 0;
    padding: 12px;
    border: 1px solid #e5e5e5;
    border-radius: 3px;
    color: #757575;
    width: 100%;
  }
  .fg-pw {
    text-decoration: none;
    opacity: 0.6;
  }

  @media (max-width: 450px) {
    .input-ctn {
      margin-bottom: 17px;

      input {
        text-align: left;

        ::placeholder {
          text-align: left;
        }
      }
    }
    .fg-pw {
      font-size: 10px;
      opacity: 0.6;
    }
    .invalid-message {
      bottom: -2px;
      font-size: 9.5px;
    }
    p {
      font-size: 10px;
    }
    label {
      font-size: 10px;
      margin-left: 0;
    }
  }
`;

export default StyledForm;
