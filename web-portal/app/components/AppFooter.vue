<script setup lang="ts">
const linksRow1 = [
  { name: "中国文联", url: "https://www.cflac.org.cn/" },
  { name: "中国作协", url: "https://www.chinawriter.com.cn/" },
  { name: "中国剧协", url: "https://www.chinatheatre.org.cn/" },
  { name: "中国影协", url: "http://www.cfa1949.com/" },
  { name: "中国音协", url: "https://www.chnmusic.org/" },
  { name: "中国美协", url: "https://www.caanet.org.cn/" },
  { name: "中国曲协", url: "http://www.zhongguoquyi.cn/" },
  { name: "中国舞协", url: "https://www.cdanet.org/index" },
  { name: "中国民协", url: "http://www.cflas.com.cn/mx/index.html" },
  { name: "中国摄协", url: "https://www.cpanet.org.cn/" },
  { name: "中国书协", url: "http://www.cca1981.org.cn/" },
  { name: "中国杂协", url: "https://zhuanti.artnchina.com/zgzjw/zgzx/index.html" },
  { name: "中国视协", url: "https://www.ctaa.org.cn/" },
  { name: "中国文联", url: "http://www.claf.org.cn/" },
]

const bottomLinks = [
  { name: "联系咨询", url: "#" },
  { name: "投诉建议", url: "#" },
  { name: "文艺论坛", url: "#" },
  { name: "职能部门", url: "#" },
  { name: "团体会员", url: "#" },
  { name: "组织机构", url: "#" },
]
</script>

<template>
  <footer class="bg-[#c31f1f] text-white">
    <div class="mx-auto px-4 py-8 max-w-[1200px]">
      <div class="flex flex-wrap gap-x-1 gap-y-2 text-sm justify-center mb-6">
        <span class="mr-2 font-bold">链接</span>
        <template v-for="(link, index) in linksRow1" :key="link.name">
          <a :href="link.url" target="_blank" class="hover:text-yellow-300 transition-colors px-1">
            {{ link.name }}
          </a>
          <span v-if="index < linksRow1.length - 1" class="text-red-300">|</span>
        </template>
      </div>
      
      <div class="text-center text-xs space-y-3">
        <div class="flex flex-wrap gap-x-2 items-center justify-center">
          <template v-for="(link, index) in bottomLinks" :key="link.name">
            <a :href="link.url" class="hover:text-white transition-colors">
              {{ link.name }}
            </a>
            <span v-if="index < bottomLinks.length - 1" class="text-white/50">|</span>
          </template>
        </div>
        <p>
          工信部ICP备案号 京ICP备14001194号-1 京公网安备11010502025171 中国文艺志愿者协会 版权所有
        </p>
      </div>
    </div>
  </footer>
</template>
