<template>
  <div class="card p-6 text-center group hover:scale-105 transition-transform duration-300">
    <div class="w-16 h-16 mx-auto mb-4 rounded-full flex items-center justify-center" :class="color">
      <component :is="iconComponent" class="w-8 h-8 text-white" />
    </div>
    <div class="text-3xl font-bold text-gray-800 mb-2">{{ value }}</div>
    <div class="text-gray-600 font-medium">{{ label }}</div>
  </div>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  value: String,
  label: String,
  color: String,
  icon: String
})

const iconComponent = computed(() => {
  const icons = {
    link: () => h('svg', { 
      fill: 'none', 
      stroke: 'currentColor', 
      viewBox: '0 0 24 24',
      class: 'w-8 h-8'
    }, [
      h('path', { 
        'stroke-linecap': 'round', 
        'stroke-linejoin': 'round', 
        'stroke-width': '2', 
        d: 'M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.1m0 0l4-4a4 4 0 105.656-5.656l-1.1 1.102m-2.828 2.828l4 4'
      })
    ]),
    users: () => h('svg', { 
      fill: 'none', 
      stroke: 'currentColor', 
      viewBox: '0 0 24 24',
      class: 'w-8 h-8'
    }, [
      h('path', { 
        'stroke-linecap': 'round', 
        'stroke-linejoin': 'round', 
        'stroke-width': '2', 
        d: 'M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z'
      })
    ]),
    shield: () => h('svg', { 
      fill: 'none', 
      stroke: 'currentColor', 
      viewBox: '0 0 24 24',
      class: 'w-8 h-8'
    }, [
      h('path', { 
        'stroke-linecap': 'round', 
        'stroke-linejoin': 'round', 
        'stroke-width': '2', 
        d: 'M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z'
      })
    ]),
    clock: () => h('svg', { 
      fill: 'none', 
      stroke: 'currentColor', 
      viewBox: '0 0 24 24',
      class: 'w-8 h-8'
    }, [
      h('path', { 
        'stroke-linecap': 'round', 
        'stroke-linejoin': 'round', 
        'stroke-width': '2', 
        d: 'M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z'
      })
    ])
  }
  
  return icons[props.icon] || icons.link
})
</script>