<script setup lang="ts">
import { ref } from 'vue'

const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '智慧平台', path: '/platform' }
]

const features = ref([
  {
    title: '志愿者注册',
    description: '成为文艺志愿者，参与各类文艺志愿服务活动',
    icon: 'V'
  },
  {
    title: '活动报名',
    description: '浏览并报名参加各类文艺志愿服务活动',
    icon: 'A'
  },
  {
    title: '时长记录',
    description: '记录志愿服务时长，生成志愿服务证明',
    icon: 'T'
  },
  {
    title: '培训学习',
    description: '在线学习文艺志愿服务相关知识和技能',
    icon: 'L'
  }
])

const stats = ref({
  volunteers: 125680,
  activities: 3560,
  hours: 2850000,
  beneficiaries: 5200000
})
</script>

<template>
  <div class="platform-page">
    <Breadcrumb :items="breadcrumbs" />
    
    <div class="mx-auto px-4 max-w-[1200px] list-wrap">
      <div class="list" style="display: block; padding: 0;">
        <div class="content full-width" style="width: 100%; padding: 0;">
          <!-- 平台横幅 -->
          <div class="platform-banner">
            <h1 class="banner-title">中国文艺志愿者智慧平台</h1>
            <p class="banner-subtitle">文艺志愿服务数字化管理平台</p>
          </div>
          
          <!-- 统计数据 -->
          <div class="platform-stats">
            <div class="stat-item">
              <div class="stat-number">{{ stats.volunteers.toLocaleString() }}</div>
              <div class="stat-label">注册志愿者</div>
            </div>
            <div class="stat-item">
              <div class="stat-number">{{ stats.activities.toLocaleString() }}</div>
              <div class="stat-label">活动数量</div>
            </div>
            <div class="stat-item">
              <div class="stat-number">{{ (stats.hours / 10000).toFixed(0) }}万</div>
              <div class="stat-label">服务时长</div>
            </div>
            <div class="stat-item">
              <div class="stat-number">{{ (stats.beneficiaries / 10000).toFixed(0) }}万</div>
              <div class="stat-label">受益群众</div>
            </div>
          </div>
          
          <!-- 平台功能 -->
          <div class="platform-features">
            <h2 class="section-title">平台功能</h2>
            <div class="features-grid">
              <div
                v-for="(feature, index) in features"
                :key="index"
                class="feature-card"
              >
                <div class="feature-icon">
                  <span class="icon-text">{{ feature.icon }}</span>
                </div>
                <h3 class="feature-title">{{ feature.title }}</h3>
                <p class="feature-desc">{{ feature.description }}</p>
              </div>
            </div>
          </div>
          
          <!-- 登录区域 -->
          <div class="platform-login">
            <h2 class="section-title">志愿者登录</h2>
            <div class="login-form">
              <div class="form-group">
                <label>手机号</label>
                <input type="tel" placeholder="请输入手机号" />
              </div>
              <div class="form-group">
                <label>密码</label>
                <input type="password" placeholder="请输入密码" />
              </div>
              <button class="login-btn">登录</button>
              <div class="login-links">
                <a href="#">忘记密码</a>
                <a href="#">立即注册</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.platform-page {
  background: #ffffff;
}

.full-width {
  width: 100% !important;
}

.platform-banner {
  background: linear-gradient(135deg, #c31f1f 0%, #e55741 100%);
  color: white;
  text-align: center;
  padding: 60px 20px;
  border-radius: 8px;
  margin-bottom: 40px;
}

.banner-title {
  font-size: 36px;
  margin-bottom: 15px;
  font-weight: bold;
}

.banner-subtitle {
  font-size: 18px;
  opacity: 0.9;
}

.platform-stats {
  display: flex;
  justify-content: space-around;
  background: #f8f8f8;
  border-radius: 8px;
  padding: 30px 20px;
  margin-bottom: 40px;
}

.stat-item {
  text-align: center;
}

.stat-number {
  font-size: 32px;
  font-weight: bold;
  color: #c31f1f;
  margin-bottom: 8px;
}

.stat-label {
  font-size: 14px;
  color: #666;
}

.platform-features {
  margin-bottom: 40px;
  padding: 0 20px;
}

.section-title {
  font-size: 24px;
  color: #333;
  margin-bottom: 30px;
  padding-bottom: 15px;
  border-bottom: 2px solid #c31f1f;
  text-align: center;
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
}

.feature-card {
  background: #f8f8f8;
  border-radius: 8px;
  padding: 30px 20px;
  text-align: center;
  transition: all 0.3s;
}

.feature-card:hover {
  background: #fff5f5;
  transform: translateY(-5px);
  box-shadow: 0 4px 12px rgba(195, 31, 31, 0.15);
}

.feature-icon {
  width: 60px;
  height: 60px;
  background: #c31f1f;
  border-radius: 50%;
  margin: 0 auto 20px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.icon-text {
  font-size: 24px;
  color: white;
  font-weight: bold;
}

.feature-title {
  font-size: 18px;
  color: #333;
  margin-bottom: 10px;
}

.feature-desc {
  font-size: 14px;
  color: #666;
  line-height: 1.6;
}

.platform-login {
  max-width: 400px;
  margin: 0 auto 40px;
  padding: 0 20px;
}

.login-form {
  background: #f8f8f8;
  padding: 30px;
  border-radius: 8px;
}

.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  margin-bottom: 8px;
  color: #333;
  font-size: 14px;
}

.form-group input {
  width: 100%;
  padding: 12px 15px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 14px;
  transition: border-color 0.3s;
}

.form-group input:focus {
  outline: none;
  border-color: #c31f1f;
}

.login-btn {
  width: 100%;
  padding: 12px;
  background: #c31f1f;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
  transition: background 0.3s;
}

.login-btn:hover {
  background: #a01818;
}

.login-links {
  display: flex;
  justify-content: space-between;
  margin-top: 15px;
  font-size: 14px;
}

.login-links a {
  color: #666;
  text-decoration: none;
}

.login-links a:hover {
  color: #c31f1f;
}

@media (max-width: 1024px) {
  .features-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 768px) {
  .platform-stats {
    flex-wrap: wrap;
    gap: 20px;
  }
  
  .stat-item {
    width: 45%;
  }
  
  .features-grid {
    grid-template-columns: 1fr;
  }
  
  .banner-title {
    font-size: 28px;
  }
}
</style>
