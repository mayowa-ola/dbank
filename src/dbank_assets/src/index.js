import {dbank} from "../../declarations/dbank"

window.addEventListener("load", async function() {
  const currentAmount = await dbank.checkBalance();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
  // console.log("window loaded")
});

document.querySelector("form").addEventListener("submit", async function(event){
  event.preventDefault();

  const button = event.target.querySelector("#submit-btn")

  const inputAmount = document.getElementById("input-amount").value;
  const outputAmount = document.getElementById("withdrawal-amount").value;

  button.setAttribute("disabled", true)

  if(inputAmount.length != 0){
    await dbank.topUp(parseFloat(inputAmount))
  }
  if(outputAmount.length != 0){
    await dbank.withdraw(parseFloat(outputAmount))
  }

    await dbank.compound();

  const currentAmount = await dbank.checkBalance();

  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;

  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = ""
  button.removeAttribute("disabled")
})