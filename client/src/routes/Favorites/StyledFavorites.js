import styled from "styled-components";

const StyledFavorite = styled.div`
  background: #fff;
  min-height: calc(792px - 200px);

  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 30px;
  padding: 30px 15px 150px 15px;

  .favorites-edit {
    display: flex;
    padding: 5px;
    align-items: center;
    justify-content: flex-end;
    height: max-content;

    button {
      padding: 10px 30px;
      border: 1.5px solid var(--bg-grey);
      border-radius: 20px;
      width: 120px;
      font-weight: 500;

      + button {
        margin-left: 15px;
      }

      &.editing {
        background: #111;
        color: #fff;
      }
    }
  }
  .favorite-item {
    width: 100%;
    padding-bottom: 30px;
    position: relative;

    display: flex;
    flex-direction: column;

    .flex-spbw {
      padding: 15px 0;
      align-items: initial;
    }

    .select-size-btn {
      padding: 8px 20px;
      border: 1px solid var(--bg-grey);
      border-radius: 30px;

      width: max-content;
    }
  }
  .favorite-info {
    flex: 1;
  }
  .favorite-item__image {
    position: relative;
  }
  .favorite-item__image img {
    width: 100%;
    min-width: min(492px, 25vw);
    background: var(--bg-grey);
  }
  .favorite-item__type {
    padding: 5px 0;
  }
  .favorite-item__fav-button {
    width: 45px;
    aspect-ratio: 1;
    border-radius: 50%;
    background: #fff;
    position: absolute;
    top: 15px;
    right: 15px;
    cursor: pointer;
  }
  .favorite-button-ctn {
    position: absolute;
    inset: 0;
    background: #0001;

    &.checked {
      background: transparent;
    }
  }

  @media (max-width: 1000px) {
    & {
      grid-template-columns: repeat(2, 1fr);
    }
  }
  @media (max-width: 450px) {
    & {
      grid-template-columns: repeat(1, 1fr);
    }
    .favorites-edit button {
      padding: 5px 20px;
      width: 80px;
    }
  }
`;

export default StyledFavorite;
