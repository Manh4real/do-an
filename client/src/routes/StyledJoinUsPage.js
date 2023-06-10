import styled from "styled-components";

const StyledJoinUsPage = styled.div`
  background: #fff;
  min-height: calc(792px - 200px);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  header {
    padding-top: 30px;
  }
  .title {
    padding-top: 20px;
  }
  form {
    position: relative;
    width: 480px;
    height: max-content;
    background: var(--white);
    padding: 40px 55px 0 55px;

    font-size: 12.5px;
    color: #8d8d8d;
    text-align: center;
  }
  .input-ctn {
    position: relative;
    margin-bottom: 30px;
    border: 1px solid var(--bg-grey);
    border-radius: 3px;
  }
  input {
    padding: 12px;
    display: block;
    width: 100%;
    border-radius: 3px;
    color: #8d8d8d;
    font-size: 14px;

    &:focus::placeholder {
      color: #ddd;
    }
  }
  .bottom-text {
    padding-bottom: 25px;
  }

  #country-select {
    margin: 15px 0;
    padding: 12px;
    border: 1px solid #e5e5e5;
    border-radius: 3px;
    color: #757575;
    width: 100%;
  }

  @media (max-width: 480px) {
    form {
      width: 70%;
      padding-inline: 0;
    }
  }
`;

export default StyledJoinUsPage;
