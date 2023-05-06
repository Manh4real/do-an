import styled from "styled-components";

const StyledOrderSuccessInform = styled.div`
  /* Order Success Styles */
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

  h2 {
    font-size: 48px;
    margin-bottom: 20px;
    text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
  }

  p {
    font-size: 24px;
    margin-bottom: 50px;
  }

  .order-details {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin-bottom: 30px;
  }

  .order-details div {
    margin-right: 30px;
    margin-bottom: 20px;
  }

  .order-details i {
    margin-right: 10px;
    color: #fff;
    font-size: 24px;
  }

  .btn {
    display: inline-block;
    padding: 15px 30px;
    border-radius: 5px;
    text-decoration: none;
    transition: background-color 0.3s ease-in-out;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  }

  table {
    text-align: left;
    width: 100%;

    tfoot {
      text-align: right;
    }
  }

  /* Animations */
  @keyframes slide-up {
    from {
      opacity: 0;
      transform: translateY(20px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

  .check-container {
    position: absolute;
    top: 0;
    left: 50%;
    translate: -50% -50%;

    width: 6.25rem;
    height: 6.25rem;
    display: flex;
    flex-flow: column;
    align-items: center;
    justify-content: space-between;

    border-radius: 50%;
    background: #fff;
    border-bottom: 3px solid #00000010;

    margin: auto;

    .check-background {
      width: 100%;
      height: 100%;
      background: linear-gradient(to bottom right, #5de593, #41d67c);
      box-shadow: 0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset,
        0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset;
      transform: scale(0.84);
      border-radius: 50%;
      animation: animateContainer 0.75s ease-out forwards 0.75s;
      display: flex;
      align-items: center;
      justify-content: center;
      opacity: 0;

      svg {
        width: 65%;
        transform: translateY(0.25rem);
        stroke-dasharray: 80;
        stroke-dashoffset: 80;
        animation: animateCheck 0.35s forwards 1.25s ease-out;
      }
    }

    .check-shadow {
      bottom: calc(-15% - 5px);
      left: 0;
      border-radius: 50%;
      background: radial-gradient(
        closest-side,
        rgba(73, 218, 131, 1),
        transparent
      );
      animation: animateShadow 0.75s ease-out forwards 0.75s;
    }
  }

  @keyframes animateContainer {
    0% {
      opacity: 0;
      transform: scale(0);
      box-shadow: 0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset,
        0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset;
    }
    25% {
      opacity: 1;
      transform: scale(0.9);
      box-shadow: 0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset,
        0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset;
    }
    43.75% {
      transform: scale(1.15);
      box-shadow: 0px 0px 0px 43.334px rgba(255, 255, 255, 0.25) inset,
        0px 0px 0px 65px rgba(255, 255, 255, 0.25) inset;
    }
    62.5% {
      transform: scale(1);
      box-shadow: 0px 0px 0px 0px rgba(255, 255, 255, 0.25) inset,
        0px 0px 0px 21.667px rgba(255, 255, 255, 0.25) inset;
    }
    81.25% {
      box-shadow: 0px 0px 0px 0px rgba(255, 255, 255, 0.25) inset,
        0px 0px 0px 0px rgba(255, 255, 255, 0.25) inset;
    }
    100% {
      opacity: 1;
      box-shadow: 0px 0px 0px 0px rgba(255, 255, 255, 0.25) inset,
        0px 0px 0px 0px rgba(255, 255, 255, 0.25) inset;
    }
  }

  @keyframes animateCheck {
    from {
      stroke-dashoffset: 80;
    }
    to {
      stroke-dashoffset: 0;
    }
  }

  @keyframes animateShadow {
    0% {
      opacity: 0;
      width: 100%;
      height: 15%;
    }
    25% {
      opacity: 0.25;
    }
    43.75% {
      width: 40%;
      height: 7%;
      opacity: 0.35;
    }
    100% {
      width: 85%;
      height: 15%;
      opacity: 0.25;
    }
  }
`;
export default StyledOrderSuccessInform;
