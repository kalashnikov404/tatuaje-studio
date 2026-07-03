<template>
  <div class="home">
    <AppNav />
    <HeroSection />
    <GallerySection />
    <ArtistsSection />
    <BookingSection />
    <ReviewsSection />
    <LocationSection />
    <ContactSection />
    <AppFooter />
  </div>
</template>

<script setup>
import AppNav from '../components/layout/AppNav.vue'
import AppFooter from '../components/layout/AppFooter.vue'
import HeroSection from '../components/sections/HeroSection.vue'
import GallerySection from '../components/sections/GallerySection.vue'
import ArtistsSection from '../components/sections/ArtistsSection.vue'
import BookingSection from '../components/sections/BookingSection.vue'
import ReviewsSection from '../components/sections/ReviewsSection.vue'
import LocationSection from '../components/sections/LocationSection.vue'
import ContactSection from '../components/sections/ContactSection.vue'
</script>

<style scoped>
.home { background: var(--void); }
</style>
