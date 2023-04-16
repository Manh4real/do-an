import styled from "styled-components";

const StyledSignInPage = styled.div`
  background: #fff;
  min-height: calc(792px - 200px);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  .sign-in-title {
    font-size: 25px;
    letter-spacing: 1px;
    line-height: 1.3;
    text-align: center;
    padding: 20px 0;
  }
  .bottom-text {
    padding-bottom: 25px;
    font-size: 14px;

    a {
      font-size: 14px;
    }
  }

  @media (max-width: 480px) {
    form {
      width: 70%;
      padding: 0;
    }
  }
`;

export default StyledSignInPage;
