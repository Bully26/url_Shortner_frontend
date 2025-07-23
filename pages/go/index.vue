<template>
  <div class="min-h-screen bg-gradient-to-br from-purple-400 via-purple-500 to-indigo-600 flex items-center justify-center p-4">
    <div class="max-w-md w-full">
      
      <div class="bg-white rounded-2xl shadow-2xl p-8 text-center fade-in-up">
    
        <div class="flex items-center justify-center mb-6">
          <div class="w-8 h-8 bg-gradient-to-r from-purple-500 to-indigo-600 rounded-lg flex items-center justify-center mr-3">
            <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.102m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1"></path>
            </svg>
          </div>
          <span class="text-xl font-bold text-gray-800">QuickLink</span>
        </div>

   
        <div class="w-20 h-20 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-6">
          <svg class="w-10 h-10 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.732 16.5c-.77.833.192 2.5 1.732 2.5z"></path>
          </svg>
        </div>

     >
        <h1 class="text-3xl font-bold text-gray-800 mb-4">Oops! Link Not Found</h1>
        <p class="text-gray-600 mb-6 leading-relaxed">
          The short URL you're looking for doesn't exist or may have been removed. 
          Don't worry, we can help you create a new one!
        </p>

       
        <div class="space-y-3">
          <NuxtLink 
            to="/"
            class="block w-full bg-gradient-to-r from-purple-500 to-indigo-600 text-white font-semibold py-3 px-6 rounded-xl hover:from-purple-600 hover:to-indigo-700 transform hover:scale-105 transition-all duration-200 shadow-lg"
          >
            Create New Short URL
          </NuxtLink>
          
          <button 
            @click="goBack"
            class="w-full bg-gray-100 text-gray-700 font-semibold py-3 px-6 rounded-xl hover:bg-gray-200 transition-all duration-200"
          >
            Go Back
          </button>
        </div>
      </div>

    

   
    </div>
  </div>
</template>

<script setup>
import { navigateTo } from 'nuxt/app'


const goBack = () => {
  navigateTo('/');
}


useSeoMeta({
  title: 'Link Not Found - QuickLink',
  description: 'The short URL you are looking for does not exist.',
})
</script>

<style scoped>

@media (max-width: 640px) {
  .max-w-md {
    max-width: 90vw;
  }
}

/* Custom animations */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.fade-in-up {
  animation: fadeInUp 0.6s ease-out;
}

.fade-in-up-delay {
  animation: fadeInUp 0.6s ease-out 0.2s both;
}
</style>