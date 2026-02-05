<script setup lang="ts">
const route = useRoute();
const isMenuOpen = ref(false);

const navItems = [
  { name: "首页", path: "/" },
  { name: "协会概况", path: "/about" },
  { name: "要闻动态", path: "/news" },
  { name: "党建工作", path: "/party" },
  { name: "品牌活动", path: "/activities" },
  { name: "表彰激励", path: "/awards" },
  { name: "公告公示", path: "/announcements" },
  { name: "专题", path: "/topics" },
  { name: "全国联动", path: "/cooperation" },
  { name: "智慧平台", path: "/platform" },
];

function isActive(path: string) {
  if (path === "/") {
    return route.path === "/";
  }
  return route.path.startsWith(path);
}

function toggleMenu() {
  isMenuOpen.value = !isMenuOpen.value;
}

// Close menu when route changes
watch(
  () => route.path,
  () => {
    isMenuOpen.value = false;
  },
);
</script>

<template>
  <header class="w-full relative z-50">
    <!-- Top Logo Section -->
    <div class="bg-white relative z-50 h-[115px]">
      <div class="mx-auto px-4 max-w-7xl lg:px-8 sm:px-6">
        <div class="py-4 flex items-center justify-between">
          <!-- Logo -->
          <div class="flex gap-4 items-center">
            <!-- 中国文艺志愿者协会 LOGO - 彩色花瓣图案 -->
            <div class="flex-shrink-0 h-12 w-12 sm:h-16 sm:w-16 md:h-20 md:w-20">
              <img
                src="~/assets/images/logo.png"
                alt="中国文艺志愿者协会"
                class="h-full w-full object-contain"
              />
            </div>
            <div class="flex flex-col">
              <h1
                class="text-xl sm:text-2xl md:text-3xl text-gray-900 tracking-wider font-bold"
              >
                武汉市江夏区文艺志愿者协会
              </h1>
              <p
                class="text-xs sm:text-sm text-gray-500 tracking-widest mt-1 hidden sm:block uppercase"
              >
                Wuhan Jiangxia District Arts Volunteer Association
              </p>
              <p
                class="text-[10px] sm:text-xs text-gray-400 mt-0.5 hidden sm:block"
              >
                江夏区社工部 江夏区文学艺术界联合会主管 江夏区文艺志愿者协会主办 普生创艺园 海移教育 协办
              </p>
            </div>
          </div>

          <!-- Hamburger Menu Button -->
          <button
            class="lg:hidden p-2 text-gray-600 hover:text-[#c41e3a]"
            @click="toggleMenu"
            aria-label="Menu"
          >
            <div class="i-carbon-menu text-2xl" v-if="!isMenuOpen" />
            <div class="i-carbon-close text-2xl" v-else />
          </button>
        </div>
      </div>
    </div>

    <!-- Navigation Bar - Desktop -->
    <nav class="bg-[#cc0000] hidden lg:block border-b border-gray-100">
      <div class="mx-auto px-4 max-w-7xl lg:px-8 sm:px-6">
        <div class="flex h-[65px] items-center">
          <div class="flex items-center w-full justify-between">
            <div class="flex items-center">
              <NuxtLink
                v-for="item in navItems"
                :key="item.path"
                :to="item.path"
                class="group text-base text-white px-4 xl:px-6 py-3 transition-all duration-200 "
              >
                <span class="relative">
                  {{ item.name }}
                  <span
                    class="absolute -bottom-3 left-0 w-full h-[2px] bg-white transition-transform duration-300 ease-in-out origin-center scale-x-0 group-hover:scale-x-100"
                    :class="{ 'scale-x-100': isActive(item.path) }"
                  />
                </span>
              </NuxtLink>
            </div>
          </div>
        </div>
      </div>
    </nav>

    <!-- Mobile Navigation Drawer -->
    <div
      class="lg:hidden absolute top-full left-0 w-full bg-white shadow-lg overflow-hidden transition-all duration-300 ease-in-out"
      :class="isMenuOpen ? 'max-h-[500px] opacity-100' : 'max-h-0 opacity-0'"
    >
      <div class="py-2 flex flex-col">
        <NuxtLink
          v-for="item in navItems"
          :key="item.path"
          :to="item.path"
          class="px-6 py-3 text-gray-700 hover:bg-gray-50 hover:text-[#c41e3a] border-b border-gray-100 last:border-0"
          :class="{
            'text-[#c41e3a] bg-red-50 font-medium': isActive(item.path),
          }"
        >
          {{ item.name }}
        </NuxtLink>
      </div>
    </div>

    <!-- Backdrop -->
    <div
      v-if="isMenuOpen"
      class="lg:hidden fixed inset-0 bg-black/50 z-40 top-[var(--header-height)]"
      @click="isMenuOpen = false"
    />
  </header>
</template>
