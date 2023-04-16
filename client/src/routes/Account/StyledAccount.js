import styled from "styled-components";

const StyledAccount = styled.div`
  background: #fff;
  min-height: calc(792px - 200px);
  padding: 50px;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;

  .profile__container {
    display: flex;
    gap: 30px;
    flex-direction: column;
    max-width: 100%;

    .title {
      padding: 18px 0;
    }
    .profile__header {
      height: 100px;

      .profile__user-image {
        width: 96px;
        aspect-ratio: 1;
        border: 1px solid var(--bg-grey);
        margin-right: 5px;

        img {
          object-fit: cover;
          height: 100%;
        }
      }
      .profile__user-fullName {
        text-transform: capitalize;
      }
    }

    .profile__favorite-carousel {
    }
  }

  .profile__carousel {
    display: grid;
    grid-auto-flow: column;
    grid-auto-columns: max-content;
    max-width: 100%;

    gap: 12px;
    overflow-x: auto;

    scroll-snap-type: x mandatory;
    scroll-behavior: smooth;

    .profile__carousel-item {
      scroll-snap-align: end;
    }
    .profile__carousel-title {
      margin-top: 8px;
    }
    button {
      opacity: 1;
      visibility: visible;

      &[disabled] {
        opacity: 0;
        visibility: hidden;
      }
    }
    ::-webkit-scrollbar {
      height: 8px;
    }
    ::-webkit-scrollbar-thumb {
      border-radius: 30px;
      background: grey;
      opacity: 0;
      visibility: hidden;
    }
    ::-webkit-scrollbar-track {
      background: transparent;
    }
    :hover {
      ::-webkit-scrollbar-thumb {
        opacity: 1;
        visibility: visible;
      }
    }
  }

  @media (max-width: 820px) {
    & {
      padding: 20px;
    }
    .b-carousel__item-image {
      img {
        width: 320px;
      }
    }
  }
  @media (max-width: 450px) {
    .profile__container .profile__header {
      align-items: start;
    }
    .profile__user-fullName {
      font-size: 24px;
    }
  }
`;

export default StyledAccount;
