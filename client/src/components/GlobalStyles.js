import styled from "styled-components";

const GlobalStyles = styled.div`
  width: 100%;
  max-width: calc(1519px + 17px);
  margin-inline: auto;

  .btn {
    text-align: center;
  }
  .big-button {
    padding: 18px 24px;
    margin-bottom: 12px;
    border-radius: 30px;
  }
  .big-medium-button {
    padding: 10px 18px;
    background: #111;
    color: #fff;
  }
  .medium-button {
    padding: 10px 18px;
    border-radius: 30px;
  }
  .grey-border {
    box-shadow: rgb(229, 229, 229) 0px 1px 0px 0px inset,
      rgb(229, 229, 229) -1px 0px 0px 0px inset,
      rgb(229, 229, 229) 0px -1px 0px 0px inset,
      rgb(229, 229, 229) 1px 0px 0px 0px inset;
  }
  .black-border {
    box-shadow: rgb(0, 0, 0) 0px 1px 0px 0px inset,
      rgb(0, 0, 0) -1px 0px 0px 0px inset, rgb(0, 0, 0) 0px -1px 0px 0px inset,
      rgb(0, 0, 0) 1px 0px 0px 0px inset;
  }
  .blue-border {
    box-shadow: #005aa7 0px 1px 0px 0px inset, #005aa7 -1px 0px 0px 0px inset,
      #005aa7 0px -1px 0px 0px inset, #005aa7 1px 0px 0px 0px inset;
  }
  .cta {
    background: #111;
    color: #fff;
  }
  .disabled {
    opacity: 0.5;
    pointer-events: none !important;
  }
  .bd-rd-50p {
    border-radius: 50%;
  }
  .grey-bg {
    box-shadow: rgb(229, 229, 229) 0px 1px 0px 0px inset,
      rgb(229, 229, 229) -1px 0px 0px 0px inset,
      rgb(229, 229, 229) 0px -1px 0px 0px inset,
      rgb(229, 229, 229) 1px 0px 0px 0px inset;
    background: #f5f5f5;
  }
  .grid-col-span-1 {
    grid-column: span 1;
  }
  .grid-col-span-2 {
    grid-column: span 2;
  }
  .grid-col-span-3 {
    grid-column: span 3;
  }
  .grid-col-span-4 {
    grid-column: span 4;
  }
  .grid-col-span-5 {
    grid-column: span 5;
  }
  .grid-col-span-all {
    grid-column: 1 / -1;
  }
  .inline-block {
    display: inline-block;
  }
  .d-hidden {
    display: none;
    visibility: hidden;
    opacity: 0;
    width: 0;
    height: 0;
    margin: 0;
    padding: 0;
  }
  .xsmall-font {
    font-size: 10px;
  }
  .small-font {
    font-size: 12px;
    color: inherit;
  }
  .regular-font {
    font-size: 16px;
  }
  .bigger-font {
    font-size: 18px;
  }
  .medium-font {
    font-size: 20px;
  }
  .font-14 {
    font-size: 14px;
  }
  .font-24 {
    font-size: 24px;
  }
  .large-font {
    font-size: 25px;
  }
  .larger-font {
    font-size: 32px;
  }
  .max-font {
    font-size: 72px;
  }

  .green-font {
    color: #47b03e !important;
  }
  .black-font {
    color: #333;
  }
  .grey-font {
    color: #757575;
  }
  .grey-font *,
  .grey-font::before,
  .grey-font::after {
    color: #757575;
  }
  .grey-font::before,
  .grey-font::after {
    border-color: #757575;
  }
  .red-font {
    color: #d43f21;
  }
  .white-font {
    color: #fff;
  }
  .orange-font {
    color: var(--pri-orange);
  }
  .blue-font {
    color: blue;
  }
  .bold-font {
    font-family: "Anton", sans-serif;
    font-weight: 400;
    letter-spacing: 0.5px;
  }
  .fw-medium {
    font-family: var(--font-text-medium);
    font-weight: 400;
  }
  .bold {
    font-weight: bold;
  }
  .uppercase-text {
    text-transform: uppercase;
  }
  .capitalized-text {
    text-transform: capitalize;
  }
  .text-underline {
    text-decoration: underline;
  }
  .normal-text {
    text-transform: initial;
  }
  .text-center {
    text-align: center;
  }
  .text-left {
    text-align: left;
  }
  .text-right {
    text-align: right;
  }
  .text-ellipsis {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;

    display: block;
  }
  .text-ellipsis-2 {
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 2; /* number of lines to show */
    line-clamp: 2;
    -webkit-box-orient: vertical;
  }
  .bordered-top-bottom {
    padding: 16px 0 12px 0;
    margin: 12px 0;
    border-top: 1px solid #e5e5e5;
    border-bottom: 1px solid #e5e5e5;
  }
  .rounded {
    border-radius: 4px;
  }
  .flex {
    display: flex;
    gap: 10px;
  }
  .flex-column {
    display: flex;
    gap: 10px;
    flex-direction: column;
  }
  .flex-row-reversed {
    flex-direction: row-reverse;
  }
  .flex-column-nogap {
    display: flex;
    flex-direction: column;
  }
  .flex-1 {
    flex: 1;
  }
  .flex-wrap {
    flex-wrap: wrap;
  }
  .flex-spbw {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 10px;
  }
  .flex-start {
    display: flex;
    align-items: center;
    gap: 10px;
  }
  .items-start {
    align-items: start;
  }
  .flex-center {
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .flex-inline-center {
    display: inline-flex;
    justify-content: center;
    align-items: center;
  }
  .flex-end {
    display: flex;
    justify-content: flex-end;
    align-items: center;
  }
  .flex-column {
    flex-direction: column;
  }
  .gap-3 {
    gap: 3px;
  }
  .gap-5 {
    gap: 5px;
  }
  .gap-15 {
    gap: 15px;
  }
  .gap-25 {
    gap: 15px;
  }
  .inline-block {
    display: inline-block;
  }
  .flex-1 {
    flex: 1;
  }
  .w-40px {
    width: 40px;
  }
  .h-40px {
    height: 40px;
  }
  .w-100 {
    width: 100%;
  }
  .w-100vw {
    width: 100vw;
  }
  .w-max {
    width: max-content;
  }
  .h-100vh {
    height: 100vh;
  }
  .underlined {
    position: relative;
    line-height: 1.6;
    cursor: pointer;
  }
  .underlined::after {
    content: "";
    position: absolute;
    left: 0;
    bottom: -2px;
    border-bottom: 1px solid currentColor;
    width: 100%;
  }
  .hover-w-fade:hover,
  .hover-w-fade:hover::after,
  .hover-w-fade:hover::before {
    opacity: 0.8;
  }

  .hover-w-hl-udl:hover::after {
    border-bottom-width: 2px;
  }
  .mt-auto {
    margin-top: auto;
  }
  .mt-10 {
    margin-top: 10px;
  }
  .mt-15 {
    margin-top: 15px;
  }
  .mt-25 {
    margin-top: 25px;
  }
  .mt-50 {
    margin-top: 50px;
  }
  .mb-10 {
    margin-bottom: 10px;
  }
  .mb-25 {
    margin-bottom: 25px;
  }
  .mb-30 {
    margin-bottom: 30px;
  }
  .mb-50 {
    margin-bottom: 50px;
  }
  .ml-5 {
    margin-left: 5px;
  }
  .ml-10 {
    margin-left: 10px;
  }
  .ml-20 {
    margin-left: 20px;
  }
  .ml-50 {
    margin-left: 50px;
  }
  .ml-auto {
    margin-left: auto;
  }
  .pl-20 {
    padding-left: 20px;
  }
  .pb-20 {
    padding-bottom: 20px;
  }
  .p-10 {
    padding: 10px !important;
  }
  .p-15 {
    padding: 15px !important;
  }
  .p-3 {
    padding: 3px;
  }
  .px-5 {
    padding-inline: 5px;
  }
  .px-20 {
    padding-inline: 20px !important;
  }
  .px-30 {
    padding-inline: 30px !important;
  }
  .px-50 {
    padding-inline: 50px !important;
  }
  .py-15 {
    padding-block: 15px !important;
  }
  .overflow-hidden {
    overflow: hidden;
  }
  .position-absolute {
    position: absolute;
  }
  .position-relative {
    position: relative;
  }
  .position-relative .hidden {
    visibility: hidden;
    opacity: 0;
  }
  .position-relative:hover .hidden {
    visibility: visible;
    opacity: 1;
  }
  .pointer-events-none {
    pointer-events: none;
  }
  .disabled {
    opacity: 0.5;
  }

  @media (max-width: 1200px) {
    .xsmall-font {
      font-size: 8px;
    }
    .small-font {
      font-size: 10px;
    }
    .regular-font {
      font-size: 14px;
    }
    .medium-font {
      font-size: 18px;
    }
    .bigger-font {
      font-size: 16px;
    }
    .large-font {
      font-size: 23px;
    }
    .max-font {
      font-size: 50px;
    }
    .font-14 {
      font-size: 12px;
    }
    .font-24 {
      font-size: 22px;
    }
  }
  @media (max-width: 450px) {
    .xsmall-font {
      font-size: 7px;
    }
    .small-font {
      font-size: 9px;
    }
    .regular-font {
      font-size: 13px;
    }
    .medium-font {
      font-size: 16px;
    }
    .bigger-font {
      font-size: 15px;
    }
    .large-font {
      font-size: 21px;
    }
    .max-font {
      font-size: 45px;
    }
    .font-14 {
      font-size: 13px;
    }
    .font-24 {
      font-size: 21px;
      line-height: inherit;
    }

    .logo-icon {
      width: 45px;
    }

    .mobile--hide {
      display: none !important;
    }
  }
`;

export default GlobalStyles;
