import styled from "styled-components";

const StyledCart = styled.div`
  background: #fff;
  min-height: calc(792px - 200px);

  display: grid;
  grid-template-columns: repeat(5, 1fr);
  gap: 22px;

  padding: 40px 0 30px 0;
  padding-inline: 15px;

  h4 {
    font-weight: 500;
  }
  .content {
    height: 100%;

    .empty-bag-mes {
      text-align: center;
      padding-top: 100px;
      font-size: 18px;
      color: #757575;
    }
  }
  .bag__products-info {
    grid-column: 2 / span 2;
  }
  .bag__product-info {
    display: flex;
    flex-direction: column;
    gap: 30px;
    box-shadow: var(--block-shadow);
    padding: 25px 0;
    flex-wrap: wrap;

    .upper {
      justify-content: flex-start;
    }
    .flex-start {
      gap: 30px;
      align-items: flex-start;
    }
    .flex-spbw {
      align-items: flex-start;
      gap: 30px;

      > .flex-start {
        flex-wrap: wrap;
      }
    }

    .bag__pd-image {
      width: 150px;
      height: 150px;

      img {
        width: 100%;
      }
    }

    .bag__pd-content {
      flex: 1;

      flex-direction: column;

      .bag__buttons {
        display: flex;
        padding: 10px;
        gap: 15px;
      }
    }

    .bag__select {
      display: flex;
      flex-wrap: nowrap;

      label {
        padding: 0;
        text-transform: capitalize;
      }
      select {
        border: none;
      }
    }
    .bag__pd-price {
      font-size: 18px;
    }
  }

  .bag__summary {
    min-width: max-content;

    .bag__summary-row {
      padding: 10px 0;
      line-height: 1;
      background: #fff;
      position: relative;
      z-index: 1;

      .title {
        text-transform: capitalize;
      }
    }

    .bag__summary-btns {
      padding: 20px 0;

      button[disabled] {
        pointer-events: none;
        opacity: 0.7;
      }
    }

    .paypal-btn {
      button:hover {
        background: #fff !important;
      }
    }

    .bag__promote-code {
      flex-direction: column;
    }
    .bag__promote-code-input {
      height: 0;
      opacity: 0;
      visibility: hidden;
      transition: all 0.2s linear;
      padding: 15px 0;
      position: relative;

      flex-wrap: nowrap;

      &.showed {
        height: 100px;
        opacity: 1;
        visibility: visible;
      }
      input {
        padding: 10px;
        width: 150px;
        border-radius: 10px;
        border: 1px solid #111;
      }
      button {
        margin-left: 10px;
        border-radius: 15px;
        padding: 10px 24px;
        box-shadow: var(--grey-shadow);
        font-size: 15px;

        &[disabled] {
          color: #8d8d8d;
        }
      }
    }
  }
  .bag__favorites {
    padding-top: 50px;
    width: 100%;
    grid-column: 2 / span 3;

    .bag__favorite-items {
      --gap: 15px;
      gap: var(--gap);
      flex-wrap: wrap;
      min-height: 100px;
      position: relative;
      width: 100%;

      .spinner {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
      }
    }
    .item {
      flex: 1;
      max-width: calc(50% - var(--gap) / 2);
      padding: 25px 0;
      box-shadow: var(--block-shadow);

      height: 300px;

      &.flex-start {
        align-items: flex-start;
        gap: 30px;
      }
      .info {
        height: 100%;

        display: flex;
        flex-direction: column;
      }
      .image {
        display: inline-flex;
      }
      .addToBag-btn {
        border-radius: 20px;
        padding: 8px 24px;
        line-height: 1.6;
        margin-top: auto;
        width: max-content;
        box-shadow: var(--grey-shadow);

        :hover {
          box-shadow: var(--hovered-grey-shadow);
        }
      }
      .select-size-btn {
        margin-top: 20px;
      }
      img {
        width: 150px;
        height: 150px;
        object-fit: cover;
      }
    }
    .view-more-btn {
      margin-top: 25px;
    }
    .view-all {
      margin-left: 10px;
    }
  }
  .bag__footer {
    padding: 50px;
  }

  @media (max-width: 1120px) {
    .bag__products-info {
      grid-column: 1 / span 3;
    }
    .bag__summary {
      grid-column: span 2;

      padding-top: 30px;

      .bag__summary-btns {
        button {
          max-width: 500px;
        }
      }
    }
    .bag__favorites {
      grid-column: span 5;
    }
    .bag__favorites,
    .bag__products-info,
    .bag__summary {
      padding-inline: 30px;
    }
  }
  @media (max-width: 850px) {
    & {
      grid-template-columns: repeat(4, 1fr);
      gap: 22px 0;
    }
    .bag__products-info.grid-col-span-2,
    .bag__summary,
    .bag__favorites {
      grid-column: 1 / -1;
      padding: 30px;
    }
  }
  @media (max-width: 450px) {
    .bag__product-info .flex-start {
      gap: 0;
    }
    .bag__products-info.grid-col-span-2,
    .bag__summary,
    .bag__favorites {
      padding: 0;
    }
    .bag__footer {
      padding: 15px;

      .sl-btns {
        display: none;
      }
      .carousel-title {
        padding-bottom: 15px;
      }
      .pd-cover {
        display: flex;
        width: min-content;
      }
      .pd-cover img {
        width: 200px;
        margin-bottom: 10px;
      }
    }
  }
`;

export default StyledCart;
