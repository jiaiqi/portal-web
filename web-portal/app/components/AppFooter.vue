<script setup lang="ts">
const linksRow1 = [
  { name: '中国文联', url: 'http://www.cflac.org.cn/' },
  { name: '中国作协', url: 'http://www.chinawriter.com.cn/' },
  { name: '中国剧协', url: '#' },
  { name: '中国影协', url: '#' },
  { name: '中国音协', url: '#' },
  { name: '中国美协', url: '#' },
  { name: '中国曲协', url: '#' },
  { name: '中国舞协', url: '#' },
  { name: '中国民协', url: '#' },
]

const linksRow2 = [
  { name: '中国摄协', url: '#' },
  { name: '中国书协', url: '#' },
  { name: '中国杂协', url: '#' },
  { name: '中国视协', url: '#' },
  { name: '中国文学艺术基金会', url: '#' },
]

const bottomLinks = [
  { name: '联系咨询', url: '#' },
  { name: '投诉建议', url: '#' },
  { name: '文艺论坛', url: '#' },
  { name: '职能部门', url: '#' },
  { name: '团体会员', url: '#' },
  { name: '组织机构', url: '#' },
]
</script>

<template>
  <footer class="text-white bg-[#c41e3a]">
    <!-- Links Section -->
    <div class="mx-auto px-4 py-8 max-w-7xl lg:px-8 sm:px-6">
      <div class="flex flex-col gap-8 justify-between lg:flex-row">
        <!-- Left Links -->
        <div class="flex-1">
          <h3 class="text-lg font-bold mb-4">
            链接
          </h3>
          <div class="space-y-3">
            <div class="text-sm flex flex-wrap gap-x-1 items-center">
              <template v-for="(link, index) in linksRow1" :key="link.name">
                <NuxtLink :to="link.url" class="px-1 transition-colors hover:text-yellow-300">
                  {{ link.name }}
                </NuxtLink>
                <span v-if="index < linksRow1.length - 1" class="text-red-300">|</span>
              </template>
            </div>
            <div class="text-sm flex flex-wrap gap-x-1 items-center">
              <template v-for="(link, index) in linksRow2" :key="link.name">
                <NuxtLink :to="link.url" class="px-1 transition-colors hover:text-yellow-300">
                  {{ link.name }}
                </NuxtLink>
                <span v-if="index < linksRow2.length - 1" class="text-red-300">|</span>
              </template>
            </div>
          </div>
        </div>

        <!-- Right QR Code -->
        <div class="flex flex-col items-center">
          <div class="mb-2 p-1 rounded-lg bg-white h-24 w-24">
            <div class="rounded bg-gray-100 flex h-full w-full items-center justify-center">
              <!-- 简化的二维码图案 -->
              <svg viewBox="0 0 100 100" class="h-20 w-20">
                <rect x="10" y="10" width="25" height="25" fill="#333" />
                <rect x="65" y="10" width="25" height="25" fill="#333" />
                <rect x="10" y="65" width="25" height="25" fill="#333" />
                <rect x="15" y="15" width="15" height="15" fill="white" />
                <rect x="70" y="15" width="15" height="15" fill="white" />
                <rect x="15" y="70" width="15" height="15" fill="white" />
                <rect x="18" y="18" width="9" height="9" fill="#333" />
                <rect x="73" y="18" width="9" height="9" fill="#333" />
                <rect x="18" y="73" width="9" height="9" fill="#333" />
                <!-- 中间的图案 -->
                <rect x="40" y="10" width="5" height="5" fill="#333" />
                <rect x="50" y="10" width="5" height="5" fill="#333" />
                <rect x="40" y="20" width="5" height="5" fill="#333" />
                <rect x="45" y="25" width="5" height="5" fill="#333" />
                <rect x="55" y="20" width="5" height="5" fill="#333" />
                <rect x="10" y="40" width="5" height="5" fill="#333" />
                <rect x="20" y="45" width="5" height="5" fill="#333" />
                <rect x="10" y="50" width="5" height="5" fill="#333" />
                <rect x="25" y="50" width="5" height="5" fill="#333" />
                <rect x="40" y="40" width="20" height="20" fill="#333" />
                <rect x="45" y="45" width="10" height="10" fill="white" />
                <rect x="48" y="48" width="4" height="4" fill="#333" />
                <rect x="65" y="40" width="5" height="5" fill="#333" />
                <rect x="75" y="45" width="5" height="5" fill="#333" />
                <rect x="85" y="40" width="5" height="5" fill="#333" />
                <rect x="80" y="50" width="5" height="5" fill="#333" />
                <rect x="40" y="65" width="5" height="5" fill="#333" />
                <rect x="50" y="70" width="5" height="5" fill="#333" />
                <rect x="45" y="80" width="5" height="5" fill="#333" />
                <rect x="55" y="85" width="5" height="5" fill="#333" />
                <rect x="65" y="65" width="25" height="25" fill="#333" />
                <rect x="70" y="70" width="15" height="15" fill="white" />
                <rect x="73" y="73" width="9" height="9" fill="#333" />
              </svg>
            </div>
          </div>
          <p class="text-xs text-white/90 text-center">
            中国文艺志愿者微信公众号
          </p>
        </div>
      </div>
    </div>

    <!-- Bottom Section -->
    <div class="py-4 bg-[#a01830]">
      <div class="mx-auto px-4 max-w-7xl lg:px-8 sm:px-6">
        <div class="text-xs text-white/80 text-center space-y-2">
          <p>网站总访问量：103025</p>
          <div class="flex flex-wrap gap-x-2 items-center justify-center">
            <template v-for="(link, index) in bottomLinks" :key="link.name">
              <NuxtLink :to="link.url" class="transition-colors hover:text-white">
                {{ link.name }}
              </NuxtLink>
              <span v-if="index < bottomLinks.length - 1" class="text-white/50">|</span>
            </template>
          </div>
          <p>工信部ICP备案号 京ICP备14001194号-1 京公网安备11010502025171 中国文艺志愿者协会 版权所有</p>
        </div>
      </div>
    </div>
  </footer>
</template>
