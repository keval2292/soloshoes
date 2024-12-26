let userBox = document.querySelector('.user-box');

document.querySelector('#user-btn').onclick = () => {
    userBox.classList.toggle('active');
    navbar.classList.remove('active');
};

let navbar = document.querySelector('.navbar');


let slides = document.querySelectorAll('.home .slides-container .slide');
let index = 0;

function next() {
    slides[index].classList.remove('active');
    index = (index + 1) % slides.length;
    slides[index].classList.add('active');
};

function prev() {
    slides[index].classList.remove('active');
    index = (index - 1 + slides.length) % slides.length;
    slides[index].classList.add('active');
};


var swiper = new Swiper(".featured-slider", {
    loop: true,
    centeredSlides: true,
    spaceBetween: 20,
    autoplay: {
        delay: 9500,
        disableOnInteraction: false,
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev'
    },
    breakpoints: {
        0: {
            slidesPerView: 1
        },
        450: {
            slidesPerView: 2
        },
        768: {
            slidesPerView: 3
        },
        1200: {
            slidesPerView: 4
        }
    }
});