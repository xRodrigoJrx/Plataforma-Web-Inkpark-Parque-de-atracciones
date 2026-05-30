// main.js — IncaPark (seguro para Thymeleaf + HTML estático)
document.addEventListener("DOMContentLoaded", () => {
  /* ========= Marca link activo en navbar (rutas y .html) ========= */
  (() => {
    const links = document.querySelectorAll(".navbar .nav-link");
    if (!links.length) return;

    const raw = location.pathname.replace(/\/+$/, "");
    const path = raw === "" || raw === "/" ? "inicio" : raw;

    links.forEach(a => {
      const href = a.getAttribute("href") || a.getAttribute("th:href") || "";
      let dest = href.trim();

      if (dest === "/" || dest === "/inicio") dest = "inicio";

      dest = dest.replace(location.origin, "").split("?")[0].split("#")[0];
      dest = dest.replace(/^\/+/, "");
      dest = dest.replace(/\.html$/i, "");
      if (dest === "") dest = "inicio";

      let current = path.replace(/^\/+/, "").replace(/\.html$/i, "");
      if (current === "") current = "inicio";
      if (current === "tickets") current = "ticket";

      if (dest === current) {
        a.classList.add("nav-current", "active");
        a.setAttribute("aria-current", "page");
      }
    });
  })();

  /* ========= Navbar: transparente -> sólida al hacer scroll ========= */
  (() => {
    const nav = document.querySelector(".navbar");
    if (!nav) return;

    const setState = () => {
      if (window.scrollY > 8) {
        nav.classList.remove("nav-transparent");
        nav.classList.add("nav-solid");
      } else {
        nav.classList.add("nav-transparent");
        nav.classList.remove("nav-solid");
      }
    };

    setState();
    window.addEventListener("scroll", setState, { passive: true });
  })();

  /* ========= Scroll suave para anchors ========= */
  document.addEventListener("click", (e) => {
    const a = e.target.closest('a[href^="#"]');
    if (!a) return;

    const id = a.getAttribute("href").slice(1);
    const el = document.getElementById(id);

    if (el) {
      e.preventDefault();
      el.scrollIntoView({ behavior: "smooth", block: "start" });
    }
  });

  /* ========= Scroll Reveal con IntersectionObserver ========= */
  (() => {
    const els = document.querySelectorAll(".reveal");
    if (!els.length) return;

    if (!("IntersectionObserver" in window)) {
      els.forEach(el => el.classList.add("revealed"));
      return;
    }

    const io = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add("revealed");
          io.unobserve(entry.target);
        }
      });
    }, { threshold: 0.15 });

    els.forEach(el => io.observe(el));
  })();

  /* ========= Hero slider ========= */
  (() => {
    const media = document.querySelector(".hero-media");
    if (!media) return;

    const imgs = Array.from(media.querySelectorAll("img"));
    if (imgs.length <= 1) return;

    media.style.position = "relative";

    imgs.forEach((img, i) => {
      img.style.position = "absolute";
      img.style.inset = "0";
      img.style.width = "100%";
      img.style.height = "100%";
      img.style.objectFit = "cover";
      img.style.opacity = i === 0 ? "1" : "0";
      img.style.transition = "opacity 1.1s ease-in-out";
    });

    let idx = 0;

    setInterval(() => {
      const current = imgs[idx];
      idx = (idx + 1) % imgs.length;
      const next = imgs[idx];

      current.style.opacity = "0";
      next.style.opacity = "1";
    }, 8000);
  })();

  /* ========= Validación Bootstrap ========= */
  (() => {
    const forms = document.querySelectorAll(".needs-validation");
    if (!forms.length) return;

    Array.prototype.slice.call(forms).forEach((form) => {
      form.addEventListener("submit", (event) => {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }

        form.classList.add("was-validated");
      }, false);
    });
  })();

  /* ========= Normalizar email en formularios ========= */
  (() => {
    const emailInputs = document.querySelectorAll('input[type="email"]');
    if (!emailInputs.length) return;

    emailInputs.forEach((input) => {
      input.addEventListener("blur", () => {
        input.value = input.value.trim().toLowerCase();
      });
    });
  })();

  /* ========= Toggle contraseña ========= */
  document.addEventListener("click", (e) => {
    const btn = e.target.closest(".password-toggle, [data-password-toggle]");
    if (!btn) return;

    const targetId = btn.dataset.target || btn.getAttribute("aria-controls");
    const input = targetId ? document.getElementById(targetId) : null;

    if (!input || !(input instanceof HTMLInputElement)) return;

    const mostrarContrasena = input.type === "password";

    input.type = mostrarContrasena ? "text" : "password";

    const label = mostrarContrasena
      ? "Ocultar contraseña"
      : "Mostrar contraseña";

    btn.setAttribute("aria-label", label);
    btn.setAttribute("aria-pressed", String(mostrarContrasena));
    btn.setAttribute("title", label);

    const icon = btn.querySelector("i");

    if (icon) {
      icon.classList.toggle("fa-eye", !mostrarContrasena);
      icon.classList.toggle("fa-eye-slash", mostrarContrasena);
    }

    const hiddenText = btn.querySelector(".visually-hidden");

    if (hiddenText) {
      hiddenText.textContent = label;
    }

    input.focus({ preventScroll: true });
  });

  /* ========= Animación sutil para tarjetas al pasar mouse ========= */
  (() => {
    const cards = document.querySelectorAll(".card");
    if (!cards.length) return;

    cards.forEach(card => {
      const originalTransform = card.style.transform;
      const originalBoxShadow = card.style.boxShadow;

      card.style.transition = "transform 0.3s ease, box-shadow 0.3s ease";

      card.addEventListener("mouseenter", () => {
        card.style.transform = "translateY(-6px)";
        card.style.boxShadow = "0 10px 20px rgba(0,0,0,0.1)";
      });

      card.addEventListener("mouseleave", () => {
        card.style.transform = originalTransform;
        card.style.boxShadow = originalBoxShadow;
      });
    });
  })();
});