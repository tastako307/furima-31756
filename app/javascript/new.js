const { $ } = require("@rails/ujs");

function calc() {
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const tax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const taxCalc = Math.floor(price.value*0.1);
    const profitCalc = Math.floor(price.value*0.9);
    profit.innerHTML = `${profitCalc}`;
    tax.innerHTML = `${taxCalc}`;
  });

}
window.addEventListener("load", calc)