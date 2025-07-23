<template>
  <section class="relative py-20 lg:py-32 overflow-hidden">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="text-center mb-16">
        <h1 class="text-4xl sm:text-5xl lg:text-6xl font-bold text-white mb-6 animate-fade-in">
          Shorten URLs with
          <span class="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-emerald-400">
            Style & Speed
          </span>
        </h1>
        <p class="text-lg sm:text-xl text-white/80 max-w-2xl mx-auto mb-8 animate-slide-up">
          Transform your long URLs into beautiful, short links that are easy to share and remember. 
          Fast, secure, and absolutely free! 🚀
        </p>
      </div>

      <div class="max-w-lg mx-auto animate-slide-up">
        <UrlShortenerForm />
      </div>
    </div>

  
    <div class="absolute top-20 left-10 w-72 h-72 bg-purple-500/20 rounded-full blur-3xl animate-pulse"></div>
    <div class="absolute bottom-20 right-10 w-96 h-96 bg-pink-500/20 rounded-full blur-3xl animate-pulse delay-1000"></div>
  </section>
</template>

<script setup>

</script>