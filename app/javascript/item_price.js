function price( ){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", (e) => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue * 0.9)
  })
}

window.addEventListener('load', price)