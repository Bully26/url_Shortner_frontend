<template>
  <div class="card p-8 group hover:scale-105 transition-all duration-300">
    <div class="w-16 h-16 mx-auto mb-6 rounded-full flex items-center justify-center" :class="color">
      <component :is="iconComponent" class="w-8 h-8 text-white" />
    </div>
    <h3 class="text-xl font-bold text-gray-800 mb-3 text-center">{{ title }}</h3>
    <p class="text-gray-600 text-center leading-relaxed">{{ description }}</p>
  </div>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  title: String,
  description: String,
  icon: String,
  color: String
})

const iconComponent = computed(() => {
  const icons = {
    lightning: () => h('svg', { 
      fill: 'currentColor', 
      viewBox: '0 0 20 20',
      class: 'w-8 h-8'
    }, [
      h('path', { 
        'fill-rule': 'evenodd',
        d: 'M11.3 1.046A1 1 0 0112 2v5h4a1 1 0 01.82 1.573l-7 10A1 1 0 018 18v-5H4a1 1 0 01-.82-1.573l7-10a1 1 0 011.12-.38z',
        'clip-rule': 'evenodd'
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
    chart: () => h('svg', { 
      fill: 'none', 
      stroke: 'currentColor', 
      viewBox: '0 0 24 24',
      class: 'w-8 h-8'
    }, [
      h('path', { 
        'stroke-linecap': 'round', 
        'stroke-linejoin': 'round', 
        'stroke-width': '2', 
        d: 'M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z'
      })
    ]),
    globe: () => h('svg', { 
      fill: 'none', 
      stroke: 'currentColor', 
      viewBox: '0 0 24 24',
      class: 'w-8 h-8'
    }, [
      h('path', { 
        'stroke-linecap': 'round', 
        'stroke-linejoin': 'round', 
        'stroke-width': '2', 
        d: 'M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 104 0 2 2 0 012-2h1.064M15 20.488V18a2 2 0 012-2h3.064M21 12a9 9 0 11-18 0 9 9 0 0118 0z'
      })
    ]),
    mobile: () => h('svg', { 
      fill: 'none', 
      stroke: 'currentColor', 
      viewBox: '0 0 24 24',
      class: 'w-8 h-8'
    }, [
      h('path', { 
        'stroke-linecap': 'round', 
        'stroke-linejoin': 'round', 
        'stroke-width': '2', 
        d: 'M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z'
      })
    ]),
    heart: () => h('svg', { 
      fill: 'currentColor', 
      viewBox: '0 0 20 20',
      class: 'w-8 h-8'
    }, [
      h('path', { 
        'fill-rule': 'evenodd',
        d: 'M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z',
        'clip-rule': 'evenodd'
      })
    ])
  }
  
  return icons[props.icon] || icons.lightning
})
</script>