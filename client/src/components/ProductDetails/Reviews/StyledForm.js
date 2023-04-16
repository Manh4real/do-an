import styled from "styled-components";

const StyledForm = styled.form`
  font-size: 16px;

  header {
    text-align: center;
  }
  .red-font {
    color: red;
  }
  .title {
    font-family: "Anton", sans-serif;
    font-weight: 300;
    font-size: 25px;
  }
  .subtitle {
    margin-bottom: 20px;
  }
  .form-group {
    display: flex;
    justify-content: space-between;
    align-items: center;

    margin-block: 16px;
  }
  .form-group input[name="rating"] {
    display: none;
    opacity: 0;
    visibility: hidden;
  }
  .form-group input,
  .form-group textarea {
    outline: none;

    border: 1px solid #e6e7e8;
    border-radius: 2px;
    padding: 18px;

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
    flex: 0.5;
  }
  .form-control-container {
    flex: 1;
  }
  .form-info {
    font-size: 12px;
    color: #00000094;
    fill: #00000094;

    margin-top: 10px;
  }

  button[type="submit"] {
    background: #111;
    color: #fff;

    display: block;
    width: 100%;
    padding: 16px 28px;

    margin-top: 30px;

    &:disabled {
      pointer-events: none;
      opacity: 0.2;
    }
  }

  @media (max-width: 750px) {
    .form-group:not(.rating) {
      flex-direction: column;
      align-items: start;
    }
    .form-group label {
      flex: unset;
      padding-left: 0;
    }
    .form-group input,
    .form-group textarea {
      width: 100%;
    }
    .form-control-container {
      flex: 1;
      width: 100%;
    }
  }
`;

export default StyledForm;
