<script setup lang="ts">
const articleTitle = '四个100 | 2015—2022年度由中国文联推荐并荣获全国学雷锋志愿服务"四个100"先进典型名单'
</script>

<template>
  <div>
    <Breadcrumb :items="[{ name: '表彰激励', path: '/awards' }, { name: '列表页', path: '/awards' }, { name: '详情' }]" />

    <div class="mx-auto px-4 py-8 max-w-7xl lg:px-8 sm:px-6">
      <ArticleDetail :title="articleTitle">
        <div class="text-gray-700 leading-relaxed space-y-6">
          <h2 class="text-xl text-gray-900 font-bold">
            2015年度
          </h2>
          <div class="space-y-4">
            <div>
              <h3 class="text-gray-800 font-bold mb-2">
                最美志愿者 (5名)
              </h3>
              <ul class="text-sm list-disc list-inside space-y-1">
                <li>黄豆豆 中国舞协副主席</li>
                <li>刘全利 中国杂协副主席</li>
                <li>李丹阳 中国文艺志愿者协会理事</li>
                <li>吕薇 中国文艺志愿者协会理事</li>
                <li>刘和刚 中国文艺志愿者协会理事</li>
              </ul>
            </div>
            <div>
              <h3 class="text-gray-800 font-bold mb-2">
                最佳志愿服务组织 (7个)
              </h3>
              <ul class="text-sm list-disc list-inside space-y-1">
                <li>中国文联文艺志愿服务团</li>
                <li>中国剧协梅花奖艺术团</li>
                <li>中国影协百花奖艺术团</li>
                <li>中国音协金钟奖艺术团</li>
                <li>中国曲协牡丹奖艺术团</li>
                <li>中国舞协荷花奖艺术团</li>
                <li>中国民协山花奖艺术团</li>
              </ul>
            </div>
          </div>

          <h2 class="text-xl text-gray-900 font-bold mt-8">
            2016年度
          </h2>
          <div class="space-y-4">
            <div>
              <h3 class="text-gray-800 font-bold mb-2">
                最美志愿者 (6名)
              </h3>
              <ul class="text-sm list-disc list-inside space-y-1">
                <li>张保和 中国曲协副主席</li>
                <li>李菁 中国曲协理事</li>
                <li>何加林 中国美协理事</li>
                <li>张红春 中国书协理事</li>
                <li>王蓉蓉 中国剧协理事</li>
                <li>吴正丹 中国杂协理事</li>
              </ul>
            </div>
          </div>

          <h2 class="text-xl text-gray-900 font-bold mt-8">
            2017年度
          </h2>
          <div class="space-y-4">
            <div>
              <h3 class="text-gray-800 font-bold mb-2">
                最美志愿者 (6名)
              </h3>
              <ul class="text-sm list-disc list-inside space-y-1">
                <li>朱迅 中国视协理事</li>
                <li>王二妮 中国音协理事</li>
                <li>乌兰图雅 中国文艺志愿者协会理事</li>
                <li>平安 中国文艺志愿者协会理事</li>
                <li>降央卓玛 中国文艺志愿者协会理事</li>
                <li>丁柳元 中国文艺志愿者协会理事</li>
              </ul>
            </div>
          </div>
        </div>
      </ArticleDetail>
    </div>
  </div>
</template>
