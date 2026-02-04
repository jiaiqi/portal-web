<script setup lang="ts">
interface Slide {
  title: string
  image: string
  link: string
}

const props = defineProps<{
  slides: Slide[]
}>()

const currentIndex = ref(0)
let intervalId: ReturnType<typeof setInterval> | null = null

function nextSlide() {
  currentIndex.value = (currentIndex.value + 1) % props.slides.length
}

function prevSlide() {
  currentIndex.value = (currentIndex.value - 1 + props.slides.length) % props.slides.length
}

function goToSlide(index: number) {
  currentIndex.value = index
}

function startAutoPlay() {
  intervalId = setInterval(nextSlide, 5000)
}

function stopAutoPlay() {
  if (intervalId) {
    clearInterval(intervalId)
    intervalId = null
  }
}

onMounted(() => {
  startAutoPlay()
})

onUnmounted(() => {
  stopAutoPlay()
})
</script>

<template>
  <div class="rounded-lg h-80 w-full relative overflow-hidden">
    <div
      class="flex h-full transition-transform duration-500 ease-in-out"
      :style="{ transform: `translateX(-${currentIndex * 100}%)` }"
    >
      <div
        v-for="(slide, index) in slides"
        :key="index"
        class="flex-shrink-0 h-full w-full relative"
      >
        <img :src="slide.image" :alt="slide.title" class="h-full w-full object-cover">
        <div class="p-6 bottom-0 left-0 right-0 absolute from-black/70 to-transparent bg-gradient-to-t">
          <h3 class="text-xl text-white font-bold">
            {{ slide.title }}
          </h3>
        </div>
      </div>
    </div>

    <!-- Dots -->
    <div class="flex bottom-4 right-4 absolute space-x-2">
      <button
        v-for="(_, index) in slides"
        :key="index"
        class="rounded-full h-2 w-2 transition-colors"
        :class="currentIndex === index ? 'bg-white' : 'bg-white/50'"
        @click="goToSlide(index)"
      />
    </div>

    <!-- Arrows -->
    <button
      class="text-white rounded-full bg-black/30 flex h-10 w-10 transition-colors items-center left-4 top-1/2 justify-center absolute hover:bg-black/50 -translate-y-1/2"
      @click="prevSlide"
    >
      <div class="i-carbon-chevron-left h-6 w-6" />
    </button>
    <button
      class="text-white rounded-full bg-black/30 flex h-10 w-10 transition-colors items-center right-4 top-1/2 justify-center absolute hover:bg-black/50 -translate-y-1/2"
      @click="nextSlide"
    >
      <div class="i-carbon-chevron-right h-6 w-6" />
    </button>
  </div>
</template>
