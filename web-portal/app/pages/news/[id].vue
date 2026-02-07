<script setup lang="ts">
import { useRoute } from 'vue-router'

const route = useRoute()
const articleId = route.params.id

const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '要闻动态', path: '/news' },
  { name: '文章详情' },
]

const article = ref({
  id: articleId,
  title: '中国文联、中国文艺志愿者协会深入学习宣传贯彻党的二十届三中全会精神',
  date: '2024-07-22 10:20',
  source: '中国文艺志愿者协会',
  views: 1258,
  content: `
    <p>7月15日至18日，党的二十届三中全会在北京举行。全会审议通过了《中共中央关于进一步全面深化改革、推进中国式现代化的决定》。中国文联、中国文艺志愿者协会迅速组织学习，深刻领会全会精神。</p>
    
    <p>中国文联党组高度重视，第一时间召开党组会议传达学习全会精神，研究部署贯彻落实工作。会议强调，要深入学习贯彻习近平总书记关于全面深化改革的重要论述，把思想和行动统一到党中央决策部署上来。</p>
    
    <p>中国文艺志愿者协会号召广大文艺志愿者，要深入学习宣传贯彻党的二十届三中全会精神，坚持以人民为中心的创作导向，深入生活、扎根人民，创作出更多无愧于时代的优秀作品。</p>
    
    <p>各地文艺志愿服务组织纷纷响应，通过多种形式开展学习宣传活动，推动全会精神在文艺界落地生根。</p>
  `
})

const relatedArticles = ref([
  {
    id: 2,
    title: '中国文艺志愿者协会工作年中推进会强调：在新征程上推动文艺志愿服务高质量发展',
    date: '2024-07-15'
  },
  {
    id: 3,
    title: '"与人民同行——新时代文明实践文艺志愿服务走进四川广安"活动举行',
    date: '2024-07-10'
  },
  {
    id: 4,
    title: '纪念毛泽东同志《在延安文艺座谈会上的讲话》发表82周年座谈会在京召开',
    date: '2024-05-23'
  }
])
</script>

<template>
  <div class="article-detail-page">
    <Breadcrumb :items="breadcrumbs" />
    
    <div class="mx-auto px-4 max-w-[1200px] list-wrap">
      <div class="list">
        <div class="content full-width">
          <article class="article-content">
            <header class="article-header">
              <h1 class="article-title">{{ article.title }}</h1>
              <div class="article-meta">
                <span class="meta-item">
                  <i class="i-carbon-calendar" />
                  {{ article.date }}
                </span>
                <span class="meta-item">
                  <i class="i-carbon-source-reference" />
                  来源：{{ article.source }}
                </span>
                <span class="meta-item">
                  <i class="i-carbon-view" />
                  {{ article.views }}次浏览
                </span>
              </div>
            </header>
            
            <div class="article-body" v-html="article.content" />
            
            <footer class="article-footer">
              <div class="share-section">
                <span class="share-label">分享到：</span>
                <div class="share-buttons">
                  <button class="share-btn wechat">
                    <i class="i-carbon-logo-wechat" />
                  </button>
                  <button class="share-btn weibo">
                    <i class="i-carbon-logo-weibo" />
                  </button>
                  <button class="share-btn qq">
                    <i class="i-carbon-logo-qq" />
                  </button>
                </div>
              </div>
            </footer>
          </article>
          
          <aside class="related-articles">
            <h3 class="related-title">相关文章</h3>
            <ul class="related-list">
              <li
                v-for="item in relatedArticles"
                :key="item.id"
                class="related-item"
              >
                <NuxtLink :to="`/news/${item.id}`" class="related-link">
                  {{ item.title }}
                </NuxtLink>
                <span class="related-date">{{ item.date }}</span>
              </li>
            </ul>
          </aside>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.article-detail-page {
  background: #ffffff;
  min-height: calc(100vh - 200px);
}

.list {
  background: #ffffff;
  box-shadow: 0 1px 20px rgba(0, 0, 0, 0.1);
  padding: 0 30px;
  margin: 20px 0 50px;
}

.content {
  padding: 40px;
}

.full-width {
  width: 100% !important;
}

.article-content {
  max-width: 800px;
  margin: 0 auto;
}

.article-header {
  text-align: center;
  padding-bottom: 30px;
  border-bottom: 1px solid #eee;
  margin-bottom: 30px;
}

.article-title {
  font-size: 28px;
  font-weight: bold;
  color: #333;
  line-height: 1.4;
  margin-bottom: 20px;
}

.article-meta {
  display: flex;
  justify-content: center;
  gap: 30px;
  color: #999;
  font-size: 14px;
}

.meta-item {
  display: flex;
  align-items: center;
  gap: 5px;
}

.article-body {
  font-size: 16px;
  line-height: 1.8;
  color: #333;
}

.article-body :deep(p) {
  margin-bottom: 20px;
  text-indent: 2em;
}

.article-footer {
  margin-top: 40px;
  padding-top: 30px;
  border-top: 1px solid #eee;
}

.share-section {
  display: flex;
  align-items: center;
  gap: 15px;
}

.share-label {
  color: #666;
  font-size: 14px;
}

.share-buttons {
  display: flex;
  gap: 10px;
}

.share-btn {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  border: none;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 18px;
  color: white;
  transition: opacity 0.3s;
}

.share-btn:hover {
  opacity: 0.8;
}

.share-btn.wechat {
  background: #07c160;
}

.share-btn.weibo {
  background: #e6162d;
}

.share-btn.qq {
  background: #12b7f5;
}

.related-articles {
  margin-top: 50px;
  padding-top: 30px;
  border-top: 2px solid #c31f1f;
}

.related-title {
  font-size: 18px;
  color: #333;
  margin-bottom: 20px;
  padding-left: 10px;
  border-left: 4px solid #c31f1f;
}

.related-list {
  list-style: none;
  padding: 0;
}

.related-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px 0;
  border-bottom: 1px dashed #eee;
}

.related-link {
  color: #333;
  text-decoration: none;
  font-size: 15px;
  flex: 1;
  margin-right: 20px;
  transition: color 0.3s;
}

.related-link:hover {
  color: #c31f1f;
}

.related-date {
  color: #999;
  font-size: 13px;
  white-space: nowrap;
}

@media (max-width: 768px) {
  .content {
    padding: 20px;
  }
  
  .article-title {
    font-size: 22px;
  }
  
  .article-meta {
    flex-wrap: wrap;
    gap: 15px;
  }
  
  .related-item {
    flex-direction: column;
    align-items: flex-start;
    gap: 5px;
  }
}
</style>
