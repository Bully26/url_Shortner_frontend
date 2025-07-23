<template>
  <section class="py-16 lg:py-24">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="text-center mb-12">
        <h2 class="text-3xl lg:text-4xl font-bold text-white mb-4">
          Trusted by Thousands
        </h2>
        <p class="text-lg text-white/80 max-w-2xl mx-auto">
          Join our growing community of satisfied users
        </p>
      </div>

      <div class="grid grid-cols-2 lg:grid-cols-4 gap-6">
        <StatCard
          v-for="stat in stats"
          :key="stat.id"
          :value="stat.value"
          :label="stat.label"
          :color="stat.color"
          :icon="stat.icon"
        />
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue'

const stats = ref([
  {
    id: 1,
    value: '200+',
    label: 'URLs Shortened',
    color: 'bg-blue-500',
    icon: 'link'
  },
  {
    id: 2,
    value: '500+',
    label: 'Happy Users',
    color: 'bg-pink-500',
    icon: 'users'
  },
  {
    id: 3,
    value: '99.9%',
    label: 'Uptime',
    color: 'bg-cyan-500',
    icon: 'shield'
  },
  {
    id: 4,
    value: '< 1s',
    label: 'Avg Response Time',
    color: 'bg-emerald-500',
    icon: 'clock'
  }
])
</script>