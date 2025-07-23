<template>
  <div class="min-h-screen bg-gradient-primary">
    <AppHeader />
    <main>
      <HeroSection />
      <StatsSection />
      <FeaturesSection />
      <CtaSection />
    </main>
    <AppFooter />
  </div>
</template>

<script setup>
useHead({
  title: 'QuickLink - Shorten URLs with Style & Speed',
  meta: [
    {
      name: 'description',
      content: 'Transform your long URLs into beautiful, short links that are easy to share and remember. Fast, secure, and absolutely free!'
    },
    {
      name: 'keywords',
      content: 'URL shortener, link shortener, short links, free URL shortener, QuickLink'
    },
    {
      property: 'og:title',
      content: 'QuickLink - Shorten URLs with Style & Speed'
    },
    {
      property: 'og:description',
      content: 'Transform your long URLs into beautiful, short links that are easy to share and remember. Fast, secure, and absolutely free!'
    },
    {
      property: 'og:type',
      content: 'website'
    }
  ]
})
</script>