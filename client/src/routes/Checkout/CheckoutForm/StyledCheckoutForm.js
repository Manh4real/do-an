import styled from "styled-components";

const StyledCheckoutForm = styled.div`
  .select {
    padding: 10px;

    :focus {
      border-color: var(--medium-grey);
    }
  }
  .option {
    display: block;
    width: 100%;
    padding: 10px;

    font-size: 14px;

    background: #fff;

    cursor: pointer;
    outline: none;

    + .option {
      border-top: 1px solid #eee;
    }

    &.selected,
    &:hover,
    &:focus-within {
      background-color: #eeeeee80;
    }
  }
`;

export default StyledCheckoutForm;
