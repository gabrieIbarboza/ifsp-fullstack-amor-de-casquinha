const btnAddEnd=document.querySelector("#btnAddEnd");
const formuEnd=document.querySelector("#formuAddEnd");

btnAddEnd.addEventListener("click", ()=>{
    formuEnd.classList.add("exibir");
    btnAddEnd.style.display="none";
}); 