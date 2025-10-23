---
title: Thematic Analysis
layout: page
permalink: /themes.html
---

{% include feature/nav-menu.html sections="Introduction;Military Reconstruction Act;African American Suffrage;Southern Lost Cause Mentality" %}

## Introduction

This collection highlights fifteen newspaper issues from the Vicksburg Daily Times organized around three major themes of the Reconstruction Era. Each theme represents a critical aspect of the political, social, and cultural transformation of the post-Civil War South. These themes emerged from close reading of the newspaper during the pivotal year of 1867, providing primary source evidence of contemporary perspectives during Reconstruction.

---

## Military Reconstruction Act (1867)

One of the most common items listed in the Vicksburg Daily Times newspapers as a cause for grievance is the Military Reconstruction Act of 1867 (Military Bill). This was the first of the Reconstruction Acts being passed through Congress after the Civil War, and required the southern states to write new constitutions and for the citizens of those states - including African Americans - to vote on the new constitution. Additionally, southern states were required to ratify the Fourteenth Amendment to the American Constitution into law. 

The Vicksburg Daily Times Newspapers highlight the negative southern response to the passing of this bill through many editorials, news reports and reprinted speeches in its effort to elucidate and persuade public opinion against this bill. The volumes curated in this website reveal a consistent narrative against the reintegration of southern states into the Union and also fear of the African American vote. 

**Explore the newspapers:**

<a href="{{ '/browse.html#Military Reconstruction Act' | relative_url }}" class="btn btn-primary btn-lg mb-3">View Military Reconstruction Act Issues</a>

<style>
  .preview-carousel-wrapper {
    position: relative;
    overflow: hidden;
    padding: 20px 0 80px 0; /* Extra padding at bottom for caption */
  }
  .preview-carousel {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    position: relative;
    min-height: 550px;
    transition: transform 0.6s ease-in-out;
  }
  .preview-carousel .carousel-item-wrapper {
    display: flex;
    align-items: center;
    gap: 10px;
    width: 100%;
    position: absolute;
    transition: transform 0.6s ease-in-out, opacity 0.6s ease-in-out;
  }
  .preview-carousel .carousel-item-wrapper.slide-left {
    transform: translateX(-100%);
    opacity: 0;
  }
  .preview-carousel .carousel-item-wrapper.slide-center {
    transform: translateX(0);
    opacity: 1;
  }
  .preview-carousel .carousel-item-wrapper.slide-right {
    transform: translateX(100%);
    opacity: 0;
  }
  .preview-carousel .side-image {
    flex: 0 0 25%;
    opacity: 0.4;
    cursor: pointer;
  }
  .preview-carousel .side-image:hover {
    opacity: 0.6;
  }
  .preview-carousel .side-image img {
    max-height: 400px;
    width: 100%;
    object-fit: contain;
  }
  .preview-carousel .center-image {
    flex: 0 0 50%;
    z-index: 2;
  }
  .preview-carousel .center-image img {
    max-height: 500px;
    width: 100%;
    object-fit: contain;
    cursor: pointer;
    box-shadow: 0 4px 8px rgba(0,0,0,0.3);
  }
  .preview-carousel-caption {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: rgba(0, 0, 0, 0.75);
    color: white;
    padding: 15px;
    text-align: center;
    border-radius: 0.25rem;
    transition: opacity 0.3s ease-in-out;
  }
  .carousel-nav-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: rgba(0, 0, 0, 0.5);
    border: none;
    color: white;
    width: 3rem;
    height: 3rem;
    border-radius: 50%;
    cursor: pointer;
    z-index: 10;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.5rem;
  }
  .carousel-nav-btn:hover {
    background-color: rgba(0, 0, 0, 0.8);
  }
  .carousel-nav-btn.prev {
    left: 10px;
  }
  .carousel-nav-btn.next {
    right: 10px;
  }
</style>

<div class="preview-carousel-wrapper">
  <div id="militaryBillCarousel" class="preview-carousel">
    <!-- Will be populated by JavaScript -->
  </div>
  <button class="carousel-nav-btn prev" onclick="prevSlide()">‹</button>
  <button class="carousel-nav-btn next" onclick="nextSlide()">›</button>
  <div id="carouselCaption" class="preview-carousel-caption"></div>
</div>

<script>
const carouselImages = [
  {
    src: "{{ '/assets/img/ReconstructionAct1867.jpg' | relative_url }}",
    alt: "Reconstruction Act of 1867 document",
    caption: "Reconstruction Act of 1867, National Archives, RG 11, General Records of the U.S. Government",
    modal: "#imageModal1"
  },
  {
    src: "{{ '/assets/img/themes/militaryBill/terribleLaw_VDT222.png' | relative_url }}",
    alt: "Vicksburg Daily Times article about the Military Bill",
    caption: "VDT Editorial on the 'Terrible Law'",
    modal: "#imageModal2"
  },
  {
    src: "{{ '/assets/img/themes/militaryBill/dividedMilitaryDistrictsno210.png' | relative_url }}",
    alt: "Vicksburg Daily Times article about military districts",
    caption: "Divided States of the South",
    modal: "#imageModal3"
  }
];

let currentIndex = 0;
let isTransitioning = false;

function createSlideHTML(prevIndex, currentIdx, nextIndex) {
  return `
    <div class="side-image" onclick="prevSlide()">
      <img src="${carouselImages[prevIndex].src}" alt="${carouselImages[prevIndex].alt}">
    </div>
    <div class="center-image" data-bs-toggle="modal" data-bs-target="${carouselImages[currentIdx].modal}">
      <img src="${carouselImages[currentIdx].src}" alt="${carouselImages[currentIdx].alt}">
    </div>
    <div class="side-image" onclick="nextSlide()">
      <img src="${carouselImages[nextIndex].src}" alt="${carouselImages[nextIndex].alt}">
    </div>
  `;
}

function updateCarousel(direction = 'none') {
  const carousel = document.getElementById('militaryBillCarousel');
  const caption = document.getElementById('carouselCaption');
  const totalImages = carouselImages.length;

  const prevIndex = (currentIndex - 1 + totalImages) % totalImages;
  const nextIndex = (currentIndex + 1) % totalImages;

  if (direction === 'none') {
    // Initial load
    carousel.innerHTML = `<div class="carousel-item-wrapper slide-center">${createSlideHTML(prevIndex, currentIndex, nextIndex)}</div>`;
    caption.innerHTML = `<p class="mb-0 small">${carouselImages[currentIndex].caption}</p>`;
  } else {
    // Create old and new wrapper
    const oldWrapper = carousel.querySelector('.carousel-item-wrapper');
    const newWrapper = document.createElement('div');
    newWrapper.className = 'carousel-item-wrapper';
    newWrapper.innerHTML = createSlideHTML(prevIndex, currentIndex, nextIndex);

    // Position new wrapper based on direction
    if (direction === 'next') {
      newWrapper.classList.add('slide-right');
      carousel.appendChild(newWrapper);

      // Trigger slide animation
      setTimeout(() => {
        oldWrapper.classList.remove('slide-center');
        oldWrapper.classList.add('slide-left');
        newWrapper.classList.remove('slide-right');
        newWrapper.classList.add('slide-center');
      }, 10);
    } else {
      newWrapper.classList.add('slide-left');
      carousel.appendChild(newWrapper);

      // Trigger slide animation
      setTimeout(() => {
        oldWrapper.classList.remove('slide-center');
        oldWrapper.classList.add('slide-right');
        newWrapper.classList.remove('slide-left');
        newWrapper.classList.add('slide-center');
      }, 10);
    }

    // Update caption with fade
    caption.style.opacity = '0';
    setTimeout(() => {
      caption.innerHTML = `<p class="mb-0 small">${carouselImages[currentIndex].caption}</p>`;
      caption.style.opacity = '1';
    }, 300);

    // Remove old wrapper after transition
    setTimeout(() => {
      oldWrapper.remove();
      isTransitioning = false;
    }, 650);
  }
}

function prevSlide() {
  if (isTransitioning) return;
  isTransitioning = true;
  currentIndex = (currentIndex - 1 + carouselImages.length) % carouselImages.length;
  updateCarousel('prev');
}

function nextSlide() {
  if (isTransitioning) return;
  isTransitioning = true;
  currentIndex = (currentIndex + 1) % carouselImages.length;
  updateCarousel('next');
}

// Initialize carousel
updateCarousel();
</script>

<!-- Modals for full-size image preview -->
<div class="modal fade" id="imageModal1" tabindex="-1" aria-labelledby="imageModal1Label" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="imageModal1Label">Reconstruction Act of 1867</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
        <img src="{{ '/assets/img/ReconstructionAct1867.jpg' | relative_url }}" class="img-fluid" alt="Reconstruction Act of 1867 document">
        <p class="mt-3">National Archives, RG 11, General Records of the U.S. Government</p>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="imageModal2" tabindex="-1" aria-labelledby="imageModal2Label" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="imageModal2Label">VDT Editorial on the 'Terrible Law'</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
        <img src="{{ '/assets/img/themes/militaryBill/terribleLaw_VDT222.png' | relative_url }}" class="img-fluid" alt="Vicksburg Daily Times article about the Military Bill">
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="imageModal3" tabindex="-1" aria-labelledby="imageModal3Label" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="imageModal3Label">States of the South Under the Military Bill</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
        <img src="{{ '/assets/img/themes/militaryBill/dividedMilitaryDistrictsno210.png' | relative_url }}" class="img-fluid" alt="Vicksburg Daily Times article about military districts">
      </div>
    </div>
  </div>
</div>

---

## African American Suffrage


One of the most common grievances throughout the Vicksburg Daily Times regarded the federal government’s push for nationwide African American suffrage. In the post-Civil War American South, the emancipation of the formerly enslaved was not viewed as progress but instead seen as a punishment given by the victorious North to destroy the South’s white-dominated social and political structure. 

Through many scathing editorials, news reports, and reprinted speeches, the Vicksburg Daily Times echoes the sentiment of suffrage as punishment in its efforts to shape the public opinion against this radical Republican policy. The articles curated in this website reveal a constant overarching narrative that questioned the integration of Black men and women into society and spread fear of the end of traditional Southern values. As you explore these articles, you will see how the Vicksburg Daily Times used its platform to strongly oppose suffrage, framing it as one of the worst injustices committed against the white citizens of the defeated South.


**Explore the newspapers:**

<a href="{{ '/browse.html#African American Suffrage' | relative_url }}" class="btn btn-primary btn-lg mb-3">View African American Suffrage Issues</a>

---

## Southern Lost Cause Mentality


One recurring theme in the Vicksburg Daily Times is the Southern Lost Cause Mentality. Originating from Edward Pollard’s 1866 book titled “The Lost Cause: A New Southern History of the War of the Confederates,” the term “lost cause” refers to the Southern belief that the Confederacy’s cause was not centered on slavery and was heroic in its ideals. Proponents of the “lost cause” mentality chose to revere these ideals in the Post-War era and emphasize the federal government’s oppression of the Southern states. 

This is evident in the outrage commonly depicted in articles and opinion pieces of the Vicksburg Daily Times over the military occupation of the South, and the treatment of former Confederate military members and the restriction of their rights, particularly their rights to hold public office.


**Explore the newspapers:**

<a href="{{ '/browse.html#Southern Lost Cause Mentality' | relative_url }}" class="btn btn-primary btn-lg mb-3">View Lost Cause Mentality Issues</a>

---

## Research Notes

Each of the three themes is represented by five carefully selected newspaper issues from the Vicksburg Daily Times. The selection criteria focused on issues containing significant coverage of each respective theme, ensuring that researchers can find substantial primary source material related to their area of interest. The thematic organization allows for both broad exploration of Reconstruction-era topics and focused investigation of specific historical narratives.
