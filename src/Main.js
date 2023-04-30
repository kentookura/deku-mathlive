import { renderMathInElement } from "mathlive";

export function renderMathInElement_(element) {
  return  () => renderMathInElement(element)
}