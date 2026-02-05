<script setup lang="ts">
const linksRow1 = [
  { name: "中国文联", url: "http://www.cflac.org.cn/" },
  { name: "中国作协", url: "http://www.chinawriter.com.cn/" },
  { name: "中国剧协", url: "#" },
  { name: "中国影协", url: "#" },
  { name: "中国音协", url: "#" },
  { name: "中国美协", url: "#" },
  { name: "中国曲协", url: "#" },
  { name: "中国舞协", url: "#" },
  { name: "中国民协", url: "#" },
];

const linksRow2 = [
  { name: "中国摄协", url: "#" },
  { name: "中国书协", url: "#" },
  { name: "中国杂协", url: "#" },
  { name: "中国视协", url: "#" },
  { name: "中国文学艺术基金会", url: "#" },
];

const bottomLinks = [
  { name: "联系咨询", url: "#" },
  { name: "投诉建议", url: "#" },
  { name: "文艺论坛", url: "#" },
  { name: "职能部门", url: "#" },
  { name: "团体会员", url: "#" },
  { name: "组织机构", url: "#" },
];
</script>

<template>
  <footer class="text-white bg-[#c31f1f]">
    <!-- Links Section -->
    <div class="mx-auto px-4 py-[30px] max-w-7xl lg:px-8 sm:px-6  w-[1200px]">
      <div class="flex flex-col gap-8 justify-between md:flex-row">
        <!-- Left Links -->
        <div class="flex-1">
          <h2 class="text-lg font-bold mb-6 pb-[20px]">链接</h2>
          <div class="space-y-3">
            <div class="text-sm flex flex-wrap gap-x-1 items-center">
              <template v-for="(link, index) in linksRow1" :key="link.name">
                <NuxtLink
                  :to="link.url"
                  class="px-1 transition-colors hover:text-yellow-300"
                >
                  {{ link.name }}
                </NuxtLink>
                <span v-if="index < linksRow1.length - 1" class="text-red-300"
                  >|</span
                >
              </template>
            </div>
            <div class="text-sm flex flex-wrap gap-x-1 items-center">
              <template v-for="(link, index) in linksRow2" :key="link.name">
                <NuxtLink
                  :to="link.url"
                  class="px-1 transition-colors hover:text-yellow-300"
                >
                  {{ link.name }}
                </NuxtLink>
                <span v-if="index < linksRow2.length - 1" class="text-red-300"
                  >|</span
                >
              </template>
            </div>
          </div>
        </div>

        <!-- Right QR Code -->
        <div class="flex flex-col items-center">
          <div class="mb-2 p-1 rounded-lg bg-white h-24 w-24">
            <div
              class="rounded bg-gray-100 flex h-full w-full items-center justify-center"
            >
              <!-- 简化的二维码图案 -->
              <img
                src="~/assets/images/qrcode.png"
                alt="中国文艺志愿者微信公众号"
                class="h-full w-full object-contain"
              />
            </div>
          </div>
          <p class="text-xs text-white/90 text-center">
            中国文艺志愿者微信公众号
          </p>
        </div>
      </div>
    </div>

    <!-- Bottom Section -->
    <div class="py-4 bg-[rgba(0,0,0,.1)]">
      <div class="mx-auto px-4 max-w-7xl lg:px-8 sm:px-6">
        <div class="text-xs text-white/80 text-center space-y-2">
          <p>网站总访问量：103025</p>
          <div class="flex flex-wrap gap-x-2 items-center justify-center">
            <template v-for="(link, index) in bottomLinks" :key="link.name">
              <NuxtLink
                :to="link.url"
                class="transition-colors hover:text-white"
              >
                {{ link.name }}
              </NuxtLink>
              <span v-if="index < bottomLinks.length - 1" class="text-white/50"
                >|</span
              >
            </template>
          </div>
          <p>
            工信部ICP备案号 京ICP备14001194号-1 京公网安备11010502025171
            中国文艺志愿者协会 版权所有
          </p>
        </div>
      </div>
    </div>
  </footer>
</template>
