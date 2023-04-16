import styled from "styled-components";

const StyledBottomMenu = styled.div`
  .drop-down-menu {
    width: 100%;
    transform-origin: top center;
    background: var(--white);
    display: flex;
    justify-content: center;
    transition: all 0.3s ease-out;

    a {
      color: var(--darker-grey);
      width: 100%;

      :hover {
        color: var(--pri-black);
      }
    }
    h3 {
      margin-bottom: 10px;
      color: #222;
      font-weight: 400;
      user-select: none;
    }
    > div {
      width: calc(60% / 3);
      padding: 30px 10px;
      opacity: 0;
      transform: translateY(-5px);
    }
    &.drop-down-bottom {
      position: relative;
      top: 0;
      left: 0;
      visibility: visible;
      padding: 0;
      margin: auto;
      z-index: 1;
      overflow-y: hidden;
    }
    > div {
      opacity: 1;
      transform: none;
    }
    .hidden {
      opacity: 0;
      visibility: hidden;
      max-height: 0;
      transition: all 0.5s ease-out;
    }
    :hover .hidden {
      transition-delay: 0.5s;
      opacity: 1;
      visibility: visible;
      max-height: 50em;
    }
  }
  .ddbt-container {
    padding: 60px 0;
    background: var(--white);
    overflow-y: hidden;
  }

  @media (max-width: 650px) {
    .drop-down-menu.drop-down-bottom {
      flex-direction: column;

      > div {
        padding: 0;
        overflow: hidden;
        min-width: max-content;
      }
      ul {
        opacity: 0;
        height: 0;
        max-height: 0;
        transition: all 0.3s ease-out;

        &.onMobile--expanded,
        .hidden {
          opacity: 1;
          visibility: visible;
          max-height: 700px;
          height: 100%;
        }
      }
    }
  }
`;

export default StyledBottomMenu;
