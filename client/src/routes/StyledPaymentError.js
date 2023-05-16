import styled from "styled-components";

const StyledPaymentError = styled.div`
  position: relative;
  height: 60vh;
  background-color: #fcfcfc;
  border: 1px solid #00000010;
  padding: 60px 40px 40px;
  text-align: center;
  margin: 80px auto;
  animation-name: slide-up;
  animation-duration: 0.5s;
  animation-fill-mode: forwards;
  animation-timing-function: ease-in-out;

  max-width: min(calc(100% - 80px), 800px);

  svg {
    width: 45px;
    height: 45px;
    transition: transform 0.5s ease-out;
  }
`;
export default StyledPaymentError;
