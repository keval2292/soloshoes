let menuicn = document.querySelector(".menuicn");
let nav = document.querySelector(".navcontainer");

menuicn.addEventListener("click", () => {
    nav.classList.toggle("navclose");
});

let userBox = document.querySelector('.user-box');

document.querySelector('#user-btn').onclick = () => {
    userBox.classList.toggle('active');
    navbar.classList.remove('active');
};
