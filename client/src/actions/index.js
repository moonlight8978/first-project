export const ON_CLICK = 'ONCLICK';
export const RESET_STORE = 'RESET_STORE';

export function onClick(clicked) {
  return {
    type: ON_CLICK,
    clicked: clicked
  }
}

export function resetStore() {
  return {
    type: RESET_STORE
  }
}