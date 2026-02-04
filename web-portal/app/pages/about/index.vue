<script setup lang="ts">
const menuItems = [
  { name: '协会概况', path: '/about' },
  { name: '协会章程', path: '/about/charter' },
  { name: '协会领导', path: '/about/leaders' },
  { name: '理事会', path: '/about/council' },
  { name: '会员工作条例', path: '/about/regulations' },
]
</script>

<template>
  <div>
    <Breadcrumb :items="[{ name: '协会概况', path: '/about' }, { name: '列表页' }]" />

    <div class="mx-auto px-4 py-8 max-w-7xl lg:px-8 sm:px-6">
      <div class="flex gap-8">
        <!-- Side Menu -->
        <SideMenu
          title="协会概况"
          base-path="/about"
          :menu-items="menuItems"
        />

        <!-- Content -->
        <div class="p-8 rounded-lg bg-white flex-1">
          <h1 class="text-xl text-gray-900 font-bold mb-6 text-center">
            中国文艺志愿者协会基本情况介绍
          </h1>
          <div class="text-sm text-gray-700 leading-relaxed max-w-none prose prose-gray">
            <p class="mb-4 text-justify">
              中国文艺志愿者协会（China Literary and Art Volunteers' Association，CLAVA）是由文艺志愿者、文艺志愿服务组织以及关心支持文艺志愿服务事业的单位和个人自愿组成的全国性、联合性、非营利性社会组织，于2013年5月23日在北京成立，是中国文学艺术界联合会的团体会员。
            </p>
            <p class="mb-4 text-justify">
              宗旨是：高举中国特色社会主义伟大旗帜，坚持以马克思列宁主义、毛泽东思想、邓小平理论、"三个代表"重要思想、科学发展观、习近平新时代中国特色社会主义思想为指导，贯彻落实习近平总书记关于文艺工作的重要论述，深入学习领会党的二十大精神，遵循党的文艺理论和路线方针政策，担负起新的文化使命，坚持把马克思主义基本原理同中国具体实际相结合、同中华优秀传统文化相结合，增强"四个意识"，坚定"四个自信"，做到"两个维护"，牢记"国之大者"，按照"五位一体"总体布局和"四个全面"战略布局，坚持社会主义先进文化前进方向，坚持文艺为人民服务、为社会主义服务的方向和百花齐放、百家争鸣的方针，发挥"两个优势"，认真履行团结引导、联络协调、服务管理、自律维权的基本职能，坚持创造性转化、创新性发展，坚持送文化、种文化、传精神，继承弘扬中华优秀传统文化，自觉培育和践行社会主义核心价值观，弘扬"奉献、友爱、互助、进步"志愿精神，深入开展新时代文明实践等文艺志愿服务，在新的历史起点上继续推动文化繁荣，建设中华民族现代文明，为建设社会主义文化强国、增强实现中华民族伟大复兴的精神力量而努力奋斗。
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
