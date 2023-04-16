import styled from "styled-components";

const StyledMBCarousel = styled.div`
  .mb-carousel {
    scroll-padding: 0 20px;
  }
  .profile__carousel-title {
    margin-top: 8px;
  }
  .mb-carousel__item {
    padding-bottom: 50px;
  }
  .container {
    position: relative;
    padding-left: 20px;
  }
  .mb-benefits__slide-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    z-index: 2;

    &.left {
      left: 20px;
    }
    &.right {
      right: 20px;
    }
    button {
      background: var(--bg-grey);
      width: 48px;
      aspect-ratio: 1;
      border-radius: 50%;

      opacity: 1;
      visibility: visible;

      &[disabled] {
        display: none;
        opacity: 0;
        visibility: hidden;
      }
      :hover {
        background: #ccc;
      }
    }
  }

  @media (max-width: 450px) {
    .container {
      padding-left: 0;
    }
  }
`;

export default StyledMBCarousel;
