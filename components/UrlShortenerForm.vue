<template>
  <div class="card p-8">
    <div class="text-center mb-6">
      <div class="w-16 h-16 bg-gradient-primary rounded-full flex items-center justify-center mx-auto mb-4">
        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
            d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.1m0 0l4-4a4 4 0 105.656-5.656l-1.1 1.102m-2.828 2.828l4 4" />
        </svg>
      </div>
      <h3 class="text-2xl font-bold text-gray-800 mb-2">Shorten Your URL</h3>
      <p class="text-gray-600">Transform long URLs into short, shareable links in seconds! ✨</p>
    </div>

    <form @submit.prevent="shortenUrl" class="space-y-4">
      <div class="relative">
        <input v-model="longUrl" type="url" placeholder="Paste your long URL here..." class="input-field pr-12"
          :class="{ 'border-red-500': urlError }" required />
        <button type="button" class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
          @click="clearUrl">
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>

      <p v-if="urlError" class="text-red-500 text-sm">{{ urlError }}</p>

      <button type="submit" :disabled="loading || !longUrl" class="w-full btn-primary relative overflow-hidden group"
        :class="{ 'opacity-50 cursor-not-allowed': loading || !longUrl }">
        <span v-if="!loading" class="flex items-center justify-center">
          <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.1m0 0l4-4a4 4 0 105.656-5.656l-1.1 1.102m-2.828 2.828l4 4" />
          </svg>
          Shorten URL
          <svg class="w-5 h-5 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.1m0 0l4-4a4 4 0 105.656-5.656l-1.1 1.102m-2.828 2.828l4 4" />
          </svg>
        </span>
        <span v-else class="flex items-center justify-center">
          <svg class="w-5 h-5 mr-2 animate-spin" fill="none" viewBox="0 0 24 24">
            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
            <path class="opacity-75" fill="currentColor"
              d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z">
            </path>
          </svg>
          Processing...
        </span>
      </button>
    </form>

    <div v-if="shortUrl" class="mt-6 p-4 bg-emerald-50 border border-emerald-200 rounded-lg animate-fade-in">
      <div class="flex items-center mb-3">
        <svg class="w-5 h-5 text-emerald-600 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
        </svg>
        <span class="text-emerald-800 font-medium">Your shortened URL is ready!</span>
      </div>
      <div class="flex items-center space-x-2 p-3 bg-white rounded-lg border">
        <span class="text-gray-700 flex-1 font-mono text-sm">{{ shortUrl }}</span>
        <button @click="copyToClipboard"
          class="flex items-center space-x-1 text-blue-600 hover:text-blue-800 transition-colors">
          <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z" />
          </svg>
          <span class="text-sm">Copy</span>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRoute } from 'nuxt/app'
import { ref } from 'vue'
const longUrl = ref('')
const shortUrl = ref('')
const urlError = ref('')
const loading = ref(false)
const route = useRoute();

const clearUrl = () => {
  longUrl.value = ''
  shortUrl.value = ''
  urlError.value = ''
}

async function sleep(ms) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

const shortenUrl = async () => {
  urlError.value = ''
  shortUrl.value = ''

  if (!longUrl.value) {
    urlError.value = 'Please enter a URL'
    return
  }

  try {
    new URL(longUrl.value)
  } catch {
    urlError.value = 'Please enter a valid URL'
    return
  }

  loading.value = true

  try {
    const resp = await $fetch("http://localhost:3000/add", {
      method: 'POST',
      body:
      {
        url: longUrl.value
      }
    })

    const id = resp.id
    let attempts = 3
    let found = false
   

    while (attempts-- > 0) {
      await sleep(1000)
      try {
        const srec = await $fetch("http://localhost:3000/check",
          {
            method: 'POST',
            body:
            {
              id,
              url: longUrl.value
            }
          })

        const data = srec
        if (data.state === 'pending') continue

        if (data.state === 'completed') {
          const fullUrl = window.location.origin
          shortUrl.value = fullUrl+"/go/"+data.surl
          found = true
          break
        }
      } catch (err) {
        console.log("Retry failed:", err)
      }
    }

    if (!found) {
      urlError.value = 'Failed to retrieve shortened URL. Please try again.'
    }
  } catch (err) {
    console.error('Initial request failed:', err)
    urlError.value = 'Something went wrong. Please try again.'
  } finally {
    loading.value = false
  }
}


const copyToClipboard = async () => {
  try {
    await navigator.clipboard.writeText(shortUrl.value)
    // You could add a toast notification here
  } catch (err) {
    console.error('Failed to copy: ', err)
  }
}
</script>