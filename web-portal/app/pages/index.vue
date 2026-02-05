<script setup lang="ts">
const focusImages = {
  big: "https://www.wyzyz.org/claav-api/profile/upload/2025/01/27/640_20250127152953A190.jpg",
  small1:
    "https://www.wyzyz.org/claav-api/profile/upload/2024/03/26/换届_20240326194203A028.png",
  small2:
    "https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100743A007_20240103145744A044.png",
  small3:
    "https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100333A006_20240103145721A043.png",
};

const focusBanner =
  "https://www.wyzyz.org/claav-api/profile/upload/2025/12/30/mmexport1767076004004_20251230142654A441.jpg";

const newsItems = [
  {
    id: 1,
    title: "习近平致中国志愿服务联合会第三届会员代表大会的贺信",
    date: "2025-11-29 12:00",
    image:
      "https://www.wyzyz.org/claav-api/profile/upload/2025/11/29/要闻_20251129210255A439.png",
  },
  {
    id: 2,
    title:
      "习近平总书记致中国志愿服务联合会第三届会员代表大会的贺信引发热烈反响",
    date: "2025-11-29 12:00",
    image:
      "https://www.wyzyz.org/claav-api/profile/upload/2025/11/29/要闻_20251129210446A440.png",
  },
  {
    id: 3,
    title:
      "第12个中国文艺志愿者服务日｜“强基工程”——“与人民同行”新时代文明实践中国文艺志愿者小分队走进辽宁沈阳",
    date: "2025-05-27 12:00",
    image:
      "https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527095142_20250527095153A373.png",
  },
  {
    id: 4,
    title: "", // This item in HTML was just an image? "微信截图..."
    isImageParams: true,
    image:
      "https://www.wyzyz.org/claav-api/profile/upload/2024/08/30/微信截图_20240830100412_20240830100426A104.png",
  },
  {
    id: 5,
    title:
      "中央宣传思想文化工作领导小组关于认定命名第七届全国文明城市、文明村镇、文明单位和第三届全国文明家庭、文明校园的决定",
    date: "2025-05-27 12:00",
    image:
      "https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527095422_20250527095430A374.png",
  },
  {
    id: 6,
    title: "第12个中国文艺志愿者服务日｜文艺志愿者们在行动",
    date: "2025-05-27 12:00",
    image:
      "https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527094917_20250527094929A372.png",
  },
  {
    id: 7,
    title:
      "共唱团圆家 百花再出发｜“百花迎春——中国文学艺术界2025春节大联欢”报道",
    date: "2025-01-27 15:20",
    image:
      "https://www.wyzyz.org/claav-api/profile/upload/2025/01/27/微信截图_20250127152109_20250127152122A187.png",
  },
];

const rightBanners = {
  top: "https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100209A005_20240103145859A047.png",
  platform:
    "https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100840A009 (1)_20240103145523A040.png",
};

const noticeList = [
  "中国文联文艺志愿服务中心部门预算 （2025 年）",
  "第三届“时代风尚”学雷锋文艺志愿服务先进典型名单公布",
  "中国文联文艺志愿服务中心2023年度部门决算",
  "中国文联文艺志愿服务中心部门决算（2022年度）",
  "公示｜第三届宣传推选“时代风尚”学雷锋文艺志愿服务先进典型公示名单",
  "中国文联文艺志愿服务中心部门预算（2024年）",
];

const overviewLinks = ["协会简介", "组织机构", "理事会", "制度建设"];
</script>

<template>
  <div class="bg-white min-h-screen font-sans">
    <div class="mx-auto px-4 py-8 max-w-7xl lg:px-8 sm:px-6">
      <div class="flex flex-col lg:flex-row gap-6">
        <!-- Left Column -->
        <div class="flex-1 w-full lg:w-[860px] lg:flex-shrink-0">
          <!-- Focus Area -->
          <div class="flex flex-col sm:flex-row gap-4 mb-6 h-auto sm:h-[370px]">
            <!-- Big Image -->
            <div class="flex-1 relative h-[250px] sm:h-full">
              <img :src="focusImages.big" class="w-full h-full object-cover" />
            </div>
            <!-- Small Images Column -->
            <div
              class="flex flex-row sm:flex-col gap-4 w-full sm:w-[180px] h-[110px] sm:h-full overflow-x-auto sm:overflow-visible"
            >
              <div class="w-[180px] h-[110px] flex-shrink-0">
                <img
                  :src="focusImages.small1"
                  class="w-full h-full object-cover"
                />
              </div>
              <div class="w-[180px] h-[110px] flex-shrink-0">
                <img
                  :src="focusImages.small2"
                  class="w-full h-full object-cover"
                />
              </div>
              <div class="w-[180px] h-[110px] flex-shrink-0">
                <img
                  :src="focusImages.small3"
                  class="w-full h-full object-cover"
                />
              </div>
            </div>
          </div>

          <!-- Focus Mini Banner -->
          <div class="mb-8">
            <img :src="focusBanner" class="w-full h-[95px] object-cover" />
          </div>

          <!-- Tabs -->
          <div
            class="border-b border-gray-200 mb-6 flex justify-between items-end"
          >
            <div class="flex">
              <div
                class="px-6 py-3 text-lg font-bold text-[#c41e3a] border-b-2 border-[#c41e3a]"
              >
                要闻
              </div>
              <div
                class="px-6 py-3 text-lg font-medium text-gray-600 hover:text-[#c41e3a] cursor-pointer"
              >
                资讯
              </div>
            </div>
            <a href="#" class="text-sm text-gray-500 mb-3 hover:text-[#c41e3a]"
              >更多>></a
            >
          </div>

          <!-- News List -->
          <div class="space-y-6">
            <div
              v-for="item in newsItems"
              :key="item.id"
              class="flex gap-4 pb-6 border-b border-gray-100 last:border-0"
            >
              <template v-if="item.isImageParams">
                <div class="w-full">
                  <img
                    :src="item.image"
                    class="w-full h-[95px] object-contain"
                  />
                </div>
              </template>
              <template v-else>
                <div class="w-[180px] h-[110px] flex-shrink-0">
                  <img :src="item.image" class="w-full h-full object-cover" />
                </div>
                <div class="flex-1 flex flex-col justify-between py-1">
                  <h3
                    class="text-base font-bold text-gray-800 leading-snug hover:text-[#c41e3a] cursor-pointer"
                  >
                    {{ item.title }}
                  </h3>
                  <p class="text-xs text-gray-400 text-right">
                    {{ item.date }}
                  </p>
                </div>
              </template>
            </div>
          </div>
        </div>

        <!-- Right Column -->
        <div class="w-full lg:w-[320px] lg:flex-shrink-0 space-y-8">
          <!-- Link Box -->
          <div>
            <img :src="rightBanners.top" class="w-full h-auto object-cover" />
          </div>

          <!-- Hots / Notices -->
          <div>
            <div
              class="border-b border-gray-200 mb-4 flex justify-between items-end"
            >
              <div
                class="px-2 py-2 text-base font-bold text-[#c41e3a] border-b-2 border-[#c41e3a]"
              >
                公告/公示
              </div>
              <a
                href="#"
                class="text-xs text-gray-500 mb-2 hover:text-[#c41e3a]"
                >更多>></a
              >
            </div>
            <ul class="space-y-3">
              <li
                v-for="(notice, index) in noticeList"
                :key="index"
                class="flex items-start gap-2 text-sm text-gray-700 hover:text-[#c41e3a] cursor-pointer"
              >
                <span class="font-bold text-gray-400 mt-[2px]">·</span>
                <span class="line-clamp-1 flex-1">{{ notice }}</span>
              </li>
            </ul>
          </div>

          <!-- Association Overview -->
          <div class="bg-gray-50 p-4 rounded-sm">
            <h2 class="text-lg font-bold text-[#c41e3a] mb-3">协会概况</h2>
            <div
              class="text-sm text-gray-600 leading-relaxed mb-4 text-justify"
            >
              <p class="indent-8">
                中国文艺志愿者协会（China Literary and Art Volunteers'
                Association，CLAVA），2013年5月23日在北京成立，现任主席是殷秀梅。中国文艺志愿者协会是在中国文联党组领导下...
              </p>
            </div>
            <div
              class="flex flex-wrap gap-2 text-sm text-gray-500 justify-center mb-4"
            >
              <template v-for="(link, i) in overviewLinks" :key="link">
                <a href="#" class="hover:text-[#c41e3a]">{{ link }}</a>
                <span v-if="i < overviewLinks.length - 1">|</span>
              </template>
            </div>
            <div class="text-center">
              <button
                class="text-white px-6 py-1.5 rounded text-sm transition-colors"
                style="background: linear-gradient(262deg, #e55741, #cc0000)"
              >
                logo下载
              </button>
            </div>
          </div>

          <!-- Platform Banner -->
          <div>
            <img
              :src="rightBanners.platform"
              class="w-full h-[100px] object-cover"
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.focus-img-box {
  transition: all 0.3s ease;
}
.focus-img-box:hover {
  opacity: 0.9;
}
</style>
