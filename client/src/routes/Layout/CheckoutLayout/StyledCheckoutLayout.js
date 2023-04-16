import styled from "styled-components";

const StyledCheckoutLayout = styled.section`
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 50vh;
  flex-direction: column;
  width: 100%;

  > div {
    width: 100%;
  }

  .checkout__header {
    padding-inline: 15px;
    border-bottom: 1px solid var(--bg-grey);

    a {
      color: #7e7e7e;
    }
  }
  .checkout__bag-ctn {
    width: 32px;
    aspect-ratio: 1;
  }
  .checkout__content {
    height: calc(100% - 200px);
  }
  .checkout__footer {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 30px;

    padding: 30px;
    background: #111;
    position: relative;

    a {
      color: #7e7e7e;

      :hover {
        color: #fff;
      }
    }
    .footer__guides-nav {
      bottom: 60px;
    }
  }

  @media (max-width: 720px) {
    .checkout__footer {
      grid-template-columns: repeat(2, 1fr);
    }
    .bottom-menu .flex-end {
      justify-content: flex-start;
    }
  }
  @media (max-width: 450px) {
  }
`;

export default StyledCheckoutLayout;
