<script setup lang="ts">
const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '协会概况', path: '/about' }
]

const sideMenuItems = [
  { name: '协会简介', path: '/about', active: true },
  { name: '协会领导', path: '/about/leaders', active: false },
  { name: '理事会', path: '/about/council', active: false },
  { name: '协会章程', path: '/about/charter', active: false },
  { name: '会员工作条例', path: '/about/regulations', active: false }
]
</script>

<template>
  <div class="about-page">
    <Breadcrumb :items="breadcrumbs" />
    
    <div class="mx-auto px-4 max-w-[1200px] list-wrap">
      <div class="list">
        <!-- 左侧栏目导航 -->
        <div class="second-menu">
          <h1 class="menu-title">栏目导航</h1>
          <ul class="menu-list">
            <li
              v-for="(item, index) in sideMenuItems"
              :key="index"
              :class="{ active: item.active }"
            >
              <NuxtLink :to="item.path" class="menu-link">{{ item.name }}</NuxtLink>
            </li>
          </ul>
        </div>
        
        <!-- 右侧内容区域 -->
        <div class="content">
          <div class="ant-tabs">
            <div class="ant-tabs-nav">
              <div class="ant-tabs-tab active">
                <div class="ant-tabs-tab-btn">协会简介</div>
              </div>
            </div>
          </div>
          
          <div class="association-intro">
            <div class="intro-content">
              <p class="indent">
                中国文艺志愿者协会（China Literary and Art Volunteers' Association，CLAVA），2013年5月23日在北京成立，现任主席是殷秀梅。中国文艺志愿者协会是在中国文联党组领导下，由文艺志愿者、文艺志愿服务组织以及关心支持文艺志愿服务事业的单位或组织自愿组成，按照章程开展活动的全国性、联合性、非营利性社会组织。
              </p>
              
              <p>
                协会宗旨：高举中国特色社会主义伟大旗帜，以马克思列宁主义、毛泽东思想、邓小平理论、"三个代表"重要思想、科学发展观、习近平新时代中国特色社会主义思想为指导，坚持党的基本路线、基本方略，坚持以人民为中心的工作导向，弘扬"奉献、友爱、互助、进步"的志愿精神，践行"爱国、为民、崇德、尚艺"的文艺界核心价值观，团结凝聚文艺志愿者，致力于文艺志愿服务，推动社会主义文艺繁荣发展，为实现中华民族伟大复兴的中国梦贡献力量。
              </p>
              
              <h3>业务范围</h3>
              
              <p>
                （一）组织开展文艺志愿服务活动；<br/>
                （二）开展文艺志愿者培训工作；<br/>
                （三）开展文艺志愿服务理论研究；<br/>
                （四）开展文艺志愿服务国际交流与合作；<br/>
                （五）表彰奖励文艺志愿服务先进典型；<br/>
                （六）开展文艺志愿服务项目合作与交流；<br/>
                （七）编辑出版文艺志愿服务相关资料；<br/>
                （八）建设文艺志愿服务网络平台；<br/>
                （九）开展符合本会宗旨的其他活动。
              </p>
              
              <h3>联系我们</h3>
              
              <p>
                地址：北京市朝阳区北沙滩1号院32号楼<br/>
                电话：010-59759000<br/>
                邮编：100083<br/>
                邮箱：wyzyz@china.com
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.about-page {
  background: #ffffff;
}

.association-intro {
  padding: 20px 0;
}

.intro-content {
  line-height: 2;
  color: #333;
}

.intro-content p {
  margin-bottom: 20px;
  text-indent: 2em;
}

.intro-content h3 {
  font-size: 18px;
  color: #333;
  margin: 30px 0 20px;
  padding-left: 10px;
  border-left: 4px solid #c31f1f;
}

.indent {
  text-indent: 2em;
}

.menu-link {
  display: block;
  width: 100%;
  height: 100%;
  color: inherit;
  text-decoration: none;
}

.menu-list li:hover .menu-link,
.menu-list li.active .menu-link {
  color: #fff;
}
</style>
