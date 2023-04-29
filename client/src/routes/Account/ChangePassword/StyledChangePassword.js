import styled from "styled-components";

const StyledChangePassword = styled.div`
  min-width: 400px;

  .title {
    font-family: "Anton", sans-serif;
    font-weight: 300;
    font-size: 25px;

    text-align: center;
    margin-bottom: 40px;
  }

  .form-group {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;

    margin-bottom: 25px;
    position: relative;
  }
  .form-group input,
  .form-group textarea {
    outline: none;

    border: 1px solid #e6e7e8;
    border-radius: 2px;
    padding: 10px;

    font-size: 13px;

    display: block;
    width: 100%;

    resize: none;

    &.is--error {
      border-color: red;
    }
  }
  .form-group textarea {
    height: 200px;
  }
  .form-group label {
    min-width: 20ch;
    flex: 0.5;
    white-space: nowrap;
  }
  button[type="submit"] {
    background: #111;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;

    display: block;
    width: 100%;
    padding: 16px 28px;

    margin-top: 30px;

    &:disabled {
      pointer-events: none;
      opacity: 0.2;
    }
  }
  .invalid-message {
    color: red;
    font-size: 10px;
    text-align: right;
    width: 100%;
  }
  .absolute {
    position: absolute;
    bottom: -3px;
    inset-inline: 0;
    translate: 0 100%;
  }
`;

export default StyledChangePassword;
