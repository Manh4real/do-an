import styled from "styled-components";

const StyledPFCarousel = styled.div`
  position: relative;

  :hover {
    .b-carousel__slide-btn {
      button {
        span {
          opacity: 0.4;
        }
      }
    }
  }

  .b-carousel__slide-btn {
    position: absolute;
    top: 50%;

    &.left {
      left: 50px;
    }
    &.right {
      right: 50px;
    }
    button {
      padding: 20px;
      background: transparent;
      opacity: 1;
      visibility: visible;

      &[disabled] {
        display: none;
      }
      :focus span {
        outline: 2px solid blue;
      }
      :focus span,
      :hover span {
        opacity: 1 !important;
      }

      span {
        background: var(--white);
        opacity: 0;
        width: 45px;
        aspect-ratio: 1;
        transition: all 0.2s ease-out;
      }
    }
  }
  .b-carousel {
    gap: 22px;
    scroll-padding: 0 40px;

    ::-webkit-scrollbar {
      height: 4px;
    }
    ::-webkit-scrollbar-track {
      background: var(--lighter-grey);
    }
    ::-webkit-scrollbar-thumb {
      background: var(--grey);
      opacity: 1;
      visibility: visible;
    }
  }
  .b-carousel__item {
    padding-bottom: 80px;

    img {
      width: 465px;
      aspect-ratio: 1;
      object-fit: contain;
    }
  }
  .b-carousel__item-image {
    img {
      min-width: 200px;
      max-width: 450px;
    }
  }
`;

export default StyledPFCarousel;
