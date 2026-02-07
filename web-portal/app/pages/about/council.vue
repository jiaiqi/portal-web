<script setup lang="ts">
const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '协会概况', path: '/about' },
  { name: '理事会', path: '/about/council' }
]

const sideMenuItems = [
  { name: '协会简介', path: '/about', active: false },
  { name: '协会领导', path: '/about/leaders', active: false },
  { name: '理事会', path: '/about/council', active: true },
  { name: '协会章程', path: '/about/charter', active: false },
  { name: '会员工作条例', path: '/about/regulations', active: false }
]

// 理事会成员数据
const councilMembers = [
  {
    title: '主席',
    members: [
      { name: '殷秀梅', position: '主席' }
    ]
  },
  {
    title: '副主席',
    members: [
      { name: '卞留念', position: '副主席' },
      { name: '刘全利', position: '副主席' },
      { name: '刘岩', position: '副主席' },
      { name: '刘和刚', position: '副主席' },
      { name: '孙媛媛', position: '副主席' },
      { name: '李丹阳', position: '副主席' },
      { name: '吴碧霞', position: '副主席' },
      { name: '张凯丽', position: '副主席' },
      { name: '林永健', position: '副主席' },
      { name: '周炜', position: '副主席' },
      { name: '赵保乐', position: '副主席' },
      { name: '姚建萍', position: '副主席' },
      { name: '黄豆豆', position: '副主席' },
      { name: '龚宇', position: '副主席' },
      { name: '廖恳', position: '副主席' }
    ]
  },
  {
    title: '理事',
    members: [
      { name: '于海', position: '理事' },
      { name: '万山红', position: '理事' },
      { name: '马羚', position: '理事' },
      { name: '王二妮', position: '理事' },
      { name: '王宏伟', position: '理事' },
      { name: '王丽达', position: '理事' },
      { name: '王洪波', position: '理事' },
      { name: '王铁刚', position: '理事' },
      { name: '王莉', position: '理事' },
      { name: '王喆', position: '理事' },
      { name: '王黎光', position: '理事' },
      { name: '方锦龙', position: '理事' },
      { name: '邓在军', position: '理事' },
      { name: '卢奇', position: '理事' },
      { name: '田青', position: '理事' },
      { name: '冯双白', position: '理事' },
      { name: '冯巩', position: '理事' },
      { name: '冯远征', position: '理事' },
      { name: '吕薇', position: '理事' },
      { name: '朱世慧', position: '理事' },
      { name: '朱迅', position: '理事' },
      { name: '任鲁豫', position: '理事' },
      { name: '刘之冰', position: '理事' },
      { name: '刘劲', position: '理事' },
      { name: '刘芳菲', position: '理事' },
      { name: '刘和刚', position: '理事' },
      { name: '刘岩', position: '理事' },
      { name: '刘全利', position: '理事' },
      { name: '刘谦', position: '理事' },
      { name: '刘斌', position: '理事' },
      { name: '刘滨', position: '理事' }
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
                <div class="ant-tabs-tab-btn">理事会</div>
              </div>
            </div>
          </div>
          
          <div class="page-content">
            <div class="content-body">
              <h2 class="page-title">中国文艺志愿者协会理事会</h2>
              
              <div class="council-content">
                <div class="intro-section">
                  <p>中国文艺志愿者协会理事会是会员代表大会的执行机构，在闭会期间领导本会开展日常工作，对会员代表大会负责。</p>
                  <p>理事会由主席、副主席、理事组成，每届任期五年。</p>
                </div>
                
                <div v-for="(section, index) in councilMembers" :key="index" class="member-section">
                  <h3 class="section-title">{{ section.title }}</h3>
                  <div class="member-grid">
                    <div 
                      v-for="(member, mIndex) in section.members" 
                      :key="mIndex"
                      class="member-card"
                    >
                      <div class="member-avatar">
                        <div class="avatar-placeholder">
                          {{ member.name.charAt(0) }}
                        </div>
                      </div>
                      <div class="member-info">
                        <div class="member-name">{{ member.name }}</div>
                        <div class="member-position">{{ member.position }}</div>
                      </div>
                    </div>
                  </div>
                </div>
                
                <div class="note-section">
                  <p>注：以上名单按姓氏笔画排序</p>
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

.council-content {
  padding: 0 20px;
}

.intro-section {
  margin-bottom: 40px;
  padding: 20px;
  background: #f8f8f8;
  border-radius: 8px;
}

.intro-section p {
  margin-bottom: 10px;
  text-indent: 2em;
}

.member-section {
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

.member-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
  gap: 20px;
}

.member-card {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
  background: #fff;
  border: 1px solid #e8e8e8;
  border-radius: 8px;
  transition: all 0.3s ease;
}

.member-card:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transform: translateY(-2px);
}

.member-avatar {
  margin-bottom: 12px;
}

.avatar-placeholder {
  width: 80px;
  height: 80px;
  background: linear-gradient(135deg, #c31f1f 0%, #e84747 100%);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  font-size: 28px;
  font-weight: bold;
}

.member-info {
  text-align: center;
}

.member-name {
  font-size: 16px;
  font-weight: bold;
  color: #333;
  margin-bottom: 4px;
}

.member-position {
  font-size: 14px;
  color: #666;
}

.note-section {
  margin-top: 40px;
  padding-top: 20px;
  border-top: 1px solid #e8e8e8;
  text-align: center;
  color: #999;
  font-size: 14px;
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
  .member-grid {
    grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
    gap: 15px;
  }
  
  .member-card {
    padding: 15px;
  }
  
  .avatar-placeholder {
    width: 60px;
    height: 60px;
    font-size: 22px;
  }
}
</style>
