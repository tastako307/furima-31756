const { $ } = require("@rails/ujs");

function calc() {
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const tax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const taxCalc = price.value*0.9;
    const profitCalc = price.value*0.1;
    profit.innerHTML = `${profitCalc}`;
    tax.innerHTML = `${taxCalc}`;
  });

}
window.addEventListener("load", calc)