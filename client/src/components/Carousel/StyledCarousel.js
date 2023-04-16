import styled from "styled-components";

const StyledCarousel = styled.div`
  width: 100%;
  .carousel-title {
    display: flex;
    justify-content: space-between;
    align-items: center;

    .sl-btns {
      display: flex;

      button {
        margin-left: 5px;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        border: none;
        background: var(--bg-grey);

        :focus {
          outline: 2px solid #275dc5;
        }
        :hover {
          background: #757575aa;
        }
      }
      .disabled-sw-button {
        pointer-events: none;

        * {
          color: #ccc;
        }
      }
    }
  }
  .pd-cover img {
    width: 465px;
    aspect-ratio: 1;
    object-fit: contain;
  }
  .pd-title {
    text-align: left;
    color: #111;
    font-size: 24px;
    line-height: 3;
  }
  .pd-title-i {
    font-size: 16px;
    line-height: 1.4;
    height: 125px;
    padding-right: 15px;
  }
  .pd-name {
    color: #111;

    .price {
      float: right;
    }
  }
  .pd-type {
    color: #757575;
  }
  .carousel {
    width: 100%;
    padding-bottom: 20px;
    display: grid;
    grid-auto-flow: column;
    grid-auto-columns: max-content;

    overflow-x: auto;
    scroll-snap-type: x mandatory;
    scroll-padding: 0 52px;
    gap: 0 10px;
    scroll-behavior: smooth;

    ol {
      list-style: none;
    }

    ::-webkit-scrollbar {
      height: 10px;
    }
    ::-webkit-scrollbar-thumb {
      border-radius: 30px;
      background: grey;
      opacity: 0;
      visibility: hidden;
    }
    :hover::-webkit-scrollbar-thumb {
      opacity: 1;
      visibility: visible;
    }
    ::-webkit-scrollbar-track {
      background: transparent;
    }
    .product-container {
      scroll-snap-align: start;
    }
  }

  @media (max-width: 720px) {
    .carousel {
      padding-bottom: 0;
    }
    .pd-title-i {
      height: 50px;
    }
  }
  @media (max-width: 450px) {
    .product-container .pd-cover img {
      width: 250px;
      height: 250px;
    }
    .carousel-title {
      .sl-btns {
        display: none;
      }
    }
  }
`;

export default StyledCarousel;
