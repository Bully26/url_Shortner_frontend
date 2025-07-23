<template>
  <section class="py-16 lg:py-24">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="text-center mb-16">
        <h2 class="text-3xl lg:text-4xl font-bold text-white mb-4">
          Why Choose Our URL Shortener?
        </h2>
        <p class="text-lg text-white/80 max-w-2xl mx-auto">
          Experience the perfect blend of speed, security, and simplicity
        </p>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <FeatureCard
          v-for="feature in features"
          :key="feature.id"
          :title="feature.title"
          :description="feature.description"
          :icon="feature.icon"
          :color="feature.color"
        />
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue'

const features = ref([
  {
    id: 1,
    title: 'Lightning Fast',
    description: 'Shorten URLs instantly with our optimized technology',
    icon: 'lightning',
    color: 'bg-cyan-500'
  },
  {
    id: 2,
    title: 'Secure & Safe',
    description: 'Your URLs are protected with enterprise-grade security',
    icon: 'shield',
    color: 'bg-blue-500'
  },

  {
    id: 5,
    title: 'Mobile Friendly',
    description: 'Perfect experience on all devices and screen sizes',
    icon: 'mobile',
    color: 'bg-cyan-500'
  },
  {
    id: 6,
    title: 'Free Forever',
    description: 'No hidden costs, no limits - completely free to use',
    icon: 'heart',
    color: 'bg-pink-500'
  }
])
</script>