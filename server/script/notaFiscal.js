(()=>{
const btnGoToLogin = document.querySelector('#btnGoToLogin');
const ckbIsDelivery = document.querySelector('#ckbIsDelivery');
const labelForCkbIsDelivery = document.querySelector('#labelForCkbIsDelivery');
const addressDiv = document.querySelector('#addressDiv');

if(addressDiv)
{
    const addressInputs = addressDiv.innerHTML;

    ckbIsDelivery.addEventListener('change', ()=>{
        if(ckbIsDelivery.checked)
        {
            labelForCkbIsDelivery.innerHTML = "O pedido será entregue no seu endereço!";
            addressDiv.innerHTML = addressInputs;
        }
        else
        {
            labelForCkbIsDelivery.innerHTML = "Você escolheu buscar o pedido na sorveteria!";
            addressDiv.innerHTML = "";
        }
    });
}

if(btnGoToLogin)
{
    btnGoToLogin.addEventListener('click', (event)=>{
        event.preventDefault();
        window.location.replace('login.php');
    })
}

})()