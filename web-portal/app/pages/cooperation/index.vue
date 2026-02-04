<template>
  <div>
    <Breadcrumb :items="[{ name: '全国联动', path: '/cooperation' }, { name: '列表页' }]" />

    <div class="mx-auto px-4 py-8 max-w-7xl lg:px-8 sm:px-6">
      <div class="p-8 bg-white">
        <h1 class="text-2xl text-gray-900 font-bold mb-6">
          全国联动
        </h1>
        <div class="text-gray-700 leading-relaxed max-w-none prose prose-gray">
          <p class="mb-4">
            中国文艺志愿者协会积极推动全国文艺志愿服务工作联动发展，与各团体会员、各级文联组织建立联动机制，形成上下贯通、左右联动的文艺志愿服务工作格局。
          </p>
          <h2 class="text-xl text-gray-900 font-bold mb-4 mt-8">
            联动机制
          </h2>
          <ul class="mb-6 list-disc list-inside space-y-2">
            <li>建立全国文艺志愿服务工作联席会议制度</li>
            <li>搭建全国文艺志愿服务信息共享平台</li>
            <li>组织全国性文艺志愿服务主题活动</li>
            <li>开展文艺志愿服务工作培训和交流</li>
          </ul>
          <h2 class="text-xl text-gray-900 font-bold mb-4 mt-8">
            联动活动
          </h2>
          <div class="gap-4 grid grid-cols-1 md:grid-cols-2">
            <div class="p-4 border rounded-lg">
              <h3 class="text-gray-800 font-bold mb-2">
                "到人民中去"全国联动
              </h3>
              <p class="text-sm text-gray-600">
                每年5月23日前后，全国各地同步开展"到人民中去"文艺志愿服务活动
              </p>
            </div>
            <div class="p-4 border rounded-lg">
              <h3 class="text-gray-800 font-bold mb-2">
                "送欢乐下基层"全国联动
              </h3>
              <p class="text-sm text-gray-600">
                元旦春节期间，全国各地同步开展"送欢乐下基层"慰问演出活动
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
