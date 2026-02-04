<template>
  <div>
    <Breadcrumb :items="[{ name: '智慧平台', path: '/platform' }, { name: '列表页' }]" />

    <div class="mx-auto px-4 py-8 max-w-7xl lg:px-8 sm:px-6">
      <div class="p-8 bg-white">
        <h1 class="text-2xl text-gray-900 font-bold mb-6">
          智慧平台
        </h1>
        <div class="gap-6 grid grid-cols-1 lg:grid-cols-3 md:grid-cols-2">
          <div class="p-6 border rounded-lg transition-shadow hover:shadow-md">
            <div class="mb-4 rounded-lg bg-red-100 flex h-12 w-12 items-center justify-center">
              <div class="i-carbon-user text-red-700 h-6 w-6" />
            </div>
            <h3 class="text-gray-800 font-bold mb-2">
              会员管理系统
            </h3>
            <p class="text-sm text-gray-600">
              文艺志愿者注册、管理、服务记录查询
            </p>
          </div>
          <div class="p-6 border rounded-lg transition-shadow hover:shadow-md">
            <div class="mb-4 rounded-lg bg-red-100 flex h-12 w-12 items-center justify-center">
              <div class="i-carbon-calendar text-red-700 h-6 w-6" />
            </div>
            <h3 class="text-gray-800 font-bold mb-2">
              活动管理系统
            </h3>
            <p class="text-sm text-gray-600">
              文艺志愿服务活动发布、报名、管理
            </p>
          </div>
          <div class="p-6 border rounded-lg transition-shadow hover:shadow-md">
            <div class="mb-4 rounded-lg bg-red-100 flex h-12 w-12 items-center justify-center">
              <div class="i-carbon-document text-red-700 h-6 w-6" />
            </div>
            <h3 class="text-gray-800 font-bold mb-2">
              资料库
            </h3>
            <p class="text-sm text-gray-600">
              文艺志愿服务资料、培训教材下载
            </p>
          </div>
          <div class="p-6 border rounded-lg transition-shadow hover:shadow-md">
            <div class="mb-4 rounded-lg bg-red-100 flex h-12 w-12 items-center justify-center">
              <div class="i-carbon-video text-red-700 h-6 w-6" />
            </div>
            <h3 class="text-gray-800 font-bold mb-2">
              在线培训
            </h3>
            <p class="text-sm text-gray-600">
              文艺志愿服务在线培训课程
            </p>
          </div>
          <div class="p-6 border rounded-lg transition-shadow hover:shadow-md">
            <div class="mb-4 rounded-lg bg-red-100 flex h-12 w-12 items-center justify-center">
              <div class="i-carbon-chart-bar text-red-700 h-6 w-6" />
            </div>
            <h3 class="text-gray-800 font-bold mb-2">
              数据统计
            </h3>
            <p class="text-sm text-gray-600">
              文艺志愿服务数据统计分析
            </p>
          </div>
          <div class="p-6 border rounded-lg transition-shadow hover:shadow-md">
            <div class="mb-4 rounded-lg bg-red-100 flex h-12 w-12 items-center justify-center">
              <div class="i-carbon-mobile text-red-700 h-6 w-6" />
            </div>
            <h3 class="text-gray-800 font-bold mb-2">
              移动端应用
            </h3>
            <p class="text-sm text-gray-600">
              文艺志愿者APP，随时随地参与服务
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
