/**
 * VIVIANE BOUTIQUE - JavaScript personnalisé
 * Version 0 - Structure initiale
 */

document.addEventListener('DOMContentLoaded', function () {

  // =========================================
  // Navigation mobile - Menu hamburger
  // =========================================
  var menuToggle = document.querySelector('.menu-toggle');
  var mainMenu = document.querySelector('.main-menu .menu-list');

  if (menuToggle && mainMenu) {
    menuToggle.addEventListener('click', function () {
      mainMenu.classList.toggle('open');
      menuToggle.classList.toggle('active');
    });
  }

  // =========================================
  // Galerie d'images produit
  // =========================================
  var thumbs = document.querySelectorAll('.product-thumbs img');
  var coverImage = document.querySelector('.product-cover img');

  thumbs.forEach(function (thumb) {
    thumb.addEventListener('click', function () {
      // Retirer la classe active de toutes les miniatures
      thumbs.forEach(function (t) {
        t.classList.remove('active');
      });

      // Ajouter la classe active à la miniature cliquée
      this.classList.add('active');

      // Mettre à jour l'image principale
      if (coverImage) {
        coverImage.src = this.getAttribute('data-image-large-src');
        coverImage.alt = this.alt;
      }
    });
  });

  // =========================================
  // Quantité produit (boutons +/-)
  // =========================================
  var btnDown = document.querySelector('.js-touchspin-down');
  var btnUp = document.querySelector('.js-touchspin-up');
  var qtyInput = document.querySelector('#quantity_wanted');

  if (btnDown && btnUp && qtyInput) {
    btnDown.addEventListener('click', function () {
      var currentVal = parseInt(qtyInput.value);
      var minVal = parseInt(qtyInput.getAttribute('min')) || 1;
      if (currentVal > minVal) {
        qtyInput.value = currentVal - 1;
      }
    });

    btnUp.addEventListener('click', function () {
      var currentVal = parseInt(qtyInput.value);
      qtyInput.value = currentVal + 1;
    });
  }

  // =========================================
  // Animation des éléments au scroll
  // =========================================
  var animatedElements = document.querySelectorAll('.animated-entrance');

  if (animatedElements.length > 0 && 'IntersectionObserver' in window) {
    var observer = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.style.opacity = '1';
          entry.target.style.transform = 'translateY(0)';
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.1 });

    animatedElements.forEach(function (el) {
      el.style.opacity = '0';
      el.style.transform = 'translateY(20px)';
      el.style.transition = 'opacity 0.6s ease-out, transform 0.6s ease-out';
      observer.observe(el);
    });
  }

  // =========================================
  // Retour en haut de page
  // =========================================
  var backToTop = document.createElement('button');
  backToTop.innerHTML = '<i class="material-icons">arrow_upward</i>';
  backToTop.className = 'back-to-top';
  backToTop.setAttribute('aria-label', 'Retour en haut de page');
  backToTop.style.cssText = 'position:fixed;bottom:20px;right:20px;width:45px;height:45px;' +
    'border-radius:50%;background:#D4366B;color:white;border:none;cursor:pointer;' +
    'display:none;z-index:999;box-shadow:0 2px 10px rgba(0,0,0,0.2);' +
    'transition:opacity 0.3s,transform 0.3s;';

  document.body.appendChild(backToTop);

  window.addEventListener('scroll', function () {
    if (window.pageYOffset > 300) {
      backToTop.style.display = 'block';
    } else {
      backToTop.style.display = 'none';
    }
  });

  backToTop.addEventListener('click', function () {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });

});
