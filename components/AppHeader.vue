<template>
  <header class="relative z-10 bg-white/10 backdrop-blur-sm border-b border-white/20">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex items-center justify-center h-16">
      
        <div class="flex items-center space-x-2">
          <div class="w-8 h-8 bg-white rounded-lg flex items-center justify-center">
            
              <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"/>
            </svg>
          </div>
          <span class="text-white font-bold text-xl">QuickLink</span>
        </div>
      </div>
    </div>
  </header>
</template>

<script setup>
import { ref } from 'vue'


const showMobileMenu = ref(false)

const toggleMobileMenu = () => {
  showMobileMenu.value = !showMobileMenu.value
}
  </script>
  