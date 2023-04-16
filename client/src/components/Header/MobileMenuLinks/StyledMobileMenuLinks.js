import styled from "styled-components";

const StyledMobileMenuLinks = styled.div`
  position: fixed;
  inset: 0 0 0 20%;
  background: #fff;
  z-index: 10;
  flex-direction: column;
  align-items: center;
  padding-top: min(80px, 10vh);
  overflow: auto;

  display: none;

  @keyframes slideIn {
    0% {
      transform: translateX(100%);
    }
    100% {
      transform: translateX(0);
    }
  }

  &.toggle {
    display: flex;
    animation: slideIn 0.2s ease-out;
  }
  > ul {
    width: 75%;
  }
  .bold-font {
    font-family: inherit;
    font-weight: bold;
    padding-bottom: 15px;
  }
  .sub-menu {
    position: fixed;
    top: 0;
    bottom: 0;
    right: 0;
    width: 66%;

    background: #fff;
    padding: 30px;
    transition: all 0.3s ease-out;

    opacity: 0;
    visibility: hidden;
    transform: translate(100%, 0);

    .sub-menu {
      min-width: 100%;
    }
    a {
      width: max-content;
    }
    header {
      display: flex;
      flex-direction: column;

      button {
        display: flex;
        justify-content: center;
        align-items: center;
        width: max-content;
        padding: 15px 15px 15px 5px;
        text-transform: capitalize;

        span {
          line-height: 1;
          margin-left: 15px;
        }
      }
    }
    ul {
      padding-left: 30px;
    }
  }

  .menu-title {
    opacity: 1;
    visibility: visible;
    display: block;
    transition: all 0.3s ease-out;

    &.active > .sub-menu {
      opacity: 1;
      visibility: visible;
      transform: translate(0, 0);
    }

    > button {
      width: 60%;
      min-width: 100%;
      text-align: left;
    }
  }

  @media (max-width: 650px) {
    > ul {
      width: 75%;
    }
  }
  @media (max-width: 450px) {
    > ul {
      margin-left: 10px;
      width: 80%;
    }
  }
`;

export default StyledMobileMenuLinks;
