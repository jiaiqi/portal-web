<script setup lang="ts">
const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '协会概况', path: '/about' },
  { name: '协会领导', path: '/about/leaders' }
]

const sideMenuItems = [
  { name: '协会简介', path: '/about', active: false },
  { name: '协会领导', path: '/about/leaders', active: true },
  { name: '理事会', path: '/about/council', active: false },
  { name: '协会章程', path: '/about/charter', active: false },
  { name: '会员工作条例', path: '/about/regulations', active: false }
]

// 协会领导数据
const leaders = [
  {
    title: '主席',
    members: [
      { name: '殷秀梅', position: '主席', description: '著名女高音歌唱家，国家一级演员，中国音乐家协会理事。' }
    ]
  },
  {
    title: '副主席',
    members: [
      { name: '卞留念', position: '副主席', description: '著名作曲家，国家一级作曲，北京奥运会闭幕式音乐总设计。' },
      { name: '刘全利', position: '副主席', description: '著名相声表演艺术家，国家一级演员，中国曲艺家协会理事。' },
      { name: '刘岩', position: '副主席', description: '著名舞蹈家，北京舞蹈学院教授，"刘岩文艺专项基金"发起人。' },
      { name: '刘和刚', position: '副主席', description: '著名男高音歌唱家，国家一级演员，中国音乐家协会理事。' },
      { name: '孙媛媛', position: '副主席', description: '著名女中音歌唱家，中央音乐学院教授，博士生导师。' },
      { name: '李丹阳', position: '副主席', description: '著名女高音歌唱家，国家一级演员，中国音乐家协会理事。' },
      { name: '吴碧霞', position: '副主席', description: '著名女高音歌唱家，中国音乐学院教授，博士生导师。' },
      { name: '张凯丽', position: '副主席', description: '著名影视演员，国家一级演员，中国电视艺术家协会理事。' },
      { name: '林永健', position: '副主席', description: '著名影视演员，国家一级演员，中国电视艺术家协会理事。' },
      { name: '周炜', position: '副主席', description: '著名相声表演艺术家，国家一级演员，中国曲艺家协会理事。' },
      { name: '赵保乐', position: '副主席', description: '著名主持人、演员，中国电视艺术家协会理事。' },
      { name: '姚建萍', position: '副主席', description: '著名苏绣艺术家，国家级非物质文化遗产传承人。' },
      { name: '黄豆豆', position: '副主席', description: '著名舞蹈家，上海歌舞团艺术总监，国家一级演员。' },
      { name: '龚宇', position: '副主席', description: '爱奇艺创始人、CEO，中国网络视听协会副会长。' },
      { name: '廖恳', position: '副主席', description: '中国文联文艺志愿服务中心主任，中国文艺志愿者协会副主席。' }
    ]
  }
]
</script>

<template>
  <div class="about-page">
    <Breadcrumb :items="breadcrumbs" />
    
    <div class="mx-auto px-4 max-w-[1200px] list-wrap">
      <div class="list">
        <!-- 左侧栏目导航 -->
        <div class="second-menu">
          <h1 class="menu-title">协会概况</h1>
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
          <!-- <div class="ant-tabs">
            <div class="ant-tabs-nav">
              <div class="ant-tabs-tab active">
                <div class="ant-tabs-tab-btn">协会领导</div>
              </div>
            </div>
          </div> -->
          
          <div class="page-content">
            <div class="content-body">
              <h2 class="page-title">中国文艺志愿者协会领导</h2>
              
              <div class="leaders-content">
                <div class="intro-section">
                  <p>中国文艺志愿者协会领导机构由主席、副主席组成，负责协会的重大决策和日常管理工作。</p>
                </div>
                
                <div v-for="(section, index) in leaders" :key="index" class="leader-section">
                  <h3 class="section-title">{{ section.title }}</h3>
                  <div class="leader-list">
                    <div 
                      v-for="(leader, lIndex) in section.members" 
                      :key="lIndex"
                      class="leader-card"
                    >
                      <div class="leader-avatar">
                        <div class="avatar-placeholder">
                          {{ leader.name.charAt(0) }}
                        </div>
                      </div>
                      <div class="leader-info">
                        <div class="leader-name">{{ leader.name }}</div>
                        <div class="leader-position">{{ leader.position }}</div>
                        <div class="leader-desc">{{ leader.description }}</div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
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

.page-content {
  padding: 20px 0;
}

.content-body {
  line-height: 2;
  color: #333;
}

.page-title {
  font-size: 24px;
  color: #333;
  text-align: center;
  margin-bottom: 30px;
  font-weight: bold;
}

.leaders-content {
  padding: 0 20px;
}

.intro-section {
  margin-bottom: 40px;
  padding: 20px;
  background: #f8f8f8;
  border-radius: 8px;
}

.intro-section p {
  text-indent: 2em;
}

.leader-section {
  margin-bottom: 40px;
}

.section-title {
  font-size: 20px;
  color: #c31f1f;
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 2px solid #c31f1f;
  font-weight: bold;
}

.leader-list {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.leader-card {
  display: flex;
  align-items: flex-start;
  padding: 20px;
  background: #fff;
  border: 1px solid #e8e8e8;
  border-radius: 8px;
  transition: all 0.3s ease;
}

.leader-card:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transform: translateY(-2px);
}

.leader-avatar {
  margin-right: 20px;
  flex-shrink: 0;
}

.avatar-placeholder {
  width: 100px;
  height: 100px;
  background: linear-gradient(135deg, #c31f1f 0%, #e84747 100%);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  font-size: 36px;
  font-weight: bold;
}

.leader-info {
  flex: 1;
}

.leader-name {
  font-size: 20px;
  font-weight: bold;
  color: #333;
  margin-bottom: 8px;
}

.leader-position {
  font-size: 16px;
  color: #c31f1f;
  margin-bottom: 10px;
  font-weight: 500;
}

.leader-desc {
  font-size: 14px;
  color: #666;
  line-height: 1.6;
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

@media (max-width: 768px) {
  .leader-card {
    flex-direction: column;
    align-items: center;
    text-align: center;
  }
  
  .leader-avatar {
    margin-right: 0;
    margin-bottom: 15px;
  }
  
  .avatar-placeholder {
    width: 80px;
    height: 80px;
    font-size: 28px;
  }
}
</style>
