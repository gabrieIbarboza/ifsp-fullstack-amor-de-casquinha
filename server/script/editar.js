(()=>{
const edit=document.querySelector("#edit");
const formu2=document.getElementById("formulario");
const dados=document.getElementById("dados");

edit.addEventListener("click", ()=>{
    formu2.classList.add("exibir");
    edit.style.display="none";
    dados.style.display="none";
})
})()