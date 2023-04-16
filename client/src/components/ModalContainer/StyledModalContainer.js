import styled from "styled-components";

const StyledModalContainer = styled.div`
  position: fixed;
  inset: 0;
  z-index: 100;
  background: #0008;

  display: grid;
  place-items: center;

  transition: all 0.05s ease-out;

  .close-btn {
    position: absolute;
    top: 20px;
    right: 20px;
    cursor: pointer;
    z-index: 111;
  }

  .container {
    padding: 30px;
    border-radius: 15px;
    ${"" /* min-width: 500px; */}
    max-width: 80%;
    min-height: 250px;
    max-height: 80%;

    margin-inline: 50px;

    overflow: auto;

    background: #fff;
    line-height: 1.8;
    position: relative;

    .content {
      padding: 30px;
      border-radius: 15px;
      width: 500px;
      height: 250px;
      background: #fff;
      line-height: 1.8;
      position: relative;

      .close-btn-ctn {
        position: absolute;
        top: 20px;
        right: 20px;
      }
    }
  }

  @media (max-width: 450px) {
    .container {
      margin-inline: 20px;
      max-width: 95%;
      max-height: 90%;
    }
  }
`;

export default StyledModalContainer;
