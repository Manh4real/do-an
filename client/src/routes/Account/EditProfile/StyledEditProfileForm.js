import styled from "styled-components";

const StyledEditProfileForm = styled.form`
  min-width: 400px;

  font-size: 16px;

  header {
    text-align: center;
  }
  .red-font {
    color: red;
  }
  .error-message * {
    position: absolute;
    margin-top: 3px;
    font-size: 11px;
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
  .form-group.avatar {
    justify-content: center;

    .icon {
      position: absolute;
      bottom: 0;
      right: 0;

      width: 30px;
      height: 30px;
      background: #fff;
      border-radius: 100px;
      border: 2px solid #333;

      display: flex;
      justify-content: center;
      align-items: center;
    }
    label {
      flex: 0;
      padding-left: 0;
      position: relative;
    }
    .form-control-container {
      height: 80px;
      width: 80px;

      border-radius: 100px;
      border: 1px solid #eee;
      overflow: hidden;

      position: relative;

      img {
      }
    }
  }
  img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  .form-group input[name="avatar"] {
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
    position: relative;
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
    font-weight: bold;

    display: block;
    width: 100%;
    padding: 16px 28px;

    margin-top: 30px;

    &:disabled {
      pointer-events: none;
      opacity: 0.2;
    }
  }

  @media (max-width: 580px) {
    min-width: 300px;

    .form-group:not(.avatar) {
      flex-direction: column;
      align-items: start;
    }
    .form-control-container {
      width: 100%;
    }
    label {
      padding-left: 0;
    }
  }
`;

export default StyledEditProfileForm;
