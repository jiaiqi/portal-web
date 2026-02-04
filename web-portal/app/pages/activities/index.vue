<script setup lang="ts">
const activities = [
  {
    id: 1,
    title: '百花迎春——中国文学艺术界春节大联欢',
    date: '2024年春节期间',
    description: '由中国文联主办、中国文艺志愿者协会承办的春节大联欢活动，汇聚各艺术门类优秀文艺工作者，为全国观众送上新春祝福。',
    image: 'https://picsum.photos/400/300?random=10',
  },
  {
    id: 2,
    title: '文艺进万家 健康你我他',
    date: '全年持续开展',
    description: '新时代文明实践文艺志愿服务项目，组织文艺志愿者深入基层开展慰问演出、文艺培训等活动。',
    image: 'https://picsum.photos/400/300?random=11',
  },
  {
    id: 3,
    title: '送欢乐下基层',
    date: '全年持续开展',
    description: '组织文艺工作者深入革命老区、民族地区、边疆地区、贫困地区开展慰问演出，丰富基层群众精神文化生活。',
    image: 'https://picsum.photos/400/300?random=12',
  },
  {
    id: 4,
    title: '我们的中国梦——文化进万家',
    date: '元旦春节期间',
    description: '组织文艺小分队深入基层开展形式多样、内容丰富的文化惠民活动，营造欢乐祥和的节日氛围。',
    image: 'https://picsum.photos/400/300?random=13',
  },
  {
    id: 5,
    title: '到人民中去',
    date: '5月23日前后',
    description: '纪念毛泽东同志《在延安文艺座谈会上的讲话》发表，组织文艺工作者深入生活、扎根人民。',
    image: 'https://picsum.photos/400/300?random=14',
  },
  {
    id: 6,
    title: '时代风尚',
    date: '2023年度',
    description: '学雷锋文艺志愿服务先进典型宣传推选活动，表彰在文艺志愿服务中表现突出的个人和组织。',
    image: 'https://picsum.photos/400/300?random=15',
  },
]
</script>

<template>
  <div>
    <Breadcrumb :items="[{ name: '品牌活动', path: '/activities' }, { name: '列表页' }]" />

    <div class="mx-auto px-4 py-8 max-w-7xl lg:px-8 sm:px-6">
      <div class="gap-6 grid grid-cols-1 lg:grid-cols-3 md:grid-cols-2">
        <div
          v-for="activity in activities"
          :key="activity.id"
          class="rounded-lg bg-white shadow-sm transition-shadow overflow-hidden hover:shadow-md"
        >
          <div class="h-48 overflow-hidden">
            <img :src="activity.image" :alt="activity.title" class="h-full w-full transition-transform duration-300 object-cover hover:scale-105">
          </div>
          <div class="p-4">
            <h3 class="text-gray-800 font-bold mb-2 line-clamp-2">
              {{ activity.title }}
            </h3>
            <p class="text-sm text-gray-500 mb-3">
              {{ activity.date }}
            </p>
            <p class="text-sm text-gray-600 line-clamp-2">
              {{ activity.description }}
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
