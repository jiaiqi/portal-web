<script setup lang="ts">
const links = [
  { name: '中国文联', url: 'https://www.cflac.org.cn/' },
  { name: '中国作协', url: 'https://www.chinawriter.com.cn/' },
  { name: '中国剧协', url: 'https://www.chinatheatre.org.cn/' },
  { name: '中国影协', url: 'http://www.cfa1949.com/' },
  { name: '中国音协', url: 'https://www.chnmusic.org/' },
  { name: '中国美协', url: 'https://www.caanet.org.cn/' },
  { name: '中国曲协', url: 'http://www.zhongguoquyi.cn/' },
  { name: '中国舞协', url: 'https://www.cdanet.org/index' },
  { name: '中国民协', url: 'http://www.cflas.com.cn/mx/index.html' },
  { name: '中国摄协', url: 'https://www.cpanet.org.cn/' },
  { name: '中国书协', url: 'http://www.cca1981.org.cn/' },
  { name: '中国杂协', url: 'https://zhuanti.artnchina.com/zgzjw/zgzx/index.html' },
  { name: '中国视协', url: 'https://www.ctaa.org.cn/' },
  { name: '中国文学艺术基金会', url: 'http://www.claf.org.cn/' },
]

const bottomLinks = [
  { name: '联系咨询', url: '#' },
  { name: '投诉建议', url: '#' },
  { name: '文艺论坛', url: '#' },
  { name: '职能部门', url: '#' },
  { name: '团体会员', url: '#' },
  { name: '组织机构', url: '#' },
]
</script>

<template>
  <footer class="footer-bottom">
    <div class="bottomBox">
      <div class="footer">
        <div class="footerContent">
          <!-- 左侧链接区域 -->
          <div class="leftBox">
            <h2>链接</h2>
            <div class="links-list">
              <template v-for="(link, index) in links" :key="link.name">
                <a :href="link.url" target="_blank">{{ link.name }}</a>
                <span v-if="index < links.length - 1">|</span>
              </template>
            </div>
          </div>
          <!-- 右侧二维码区域 -->
          <div class="rightBox">
            <div class="qrcode">
              <img src="~/assets/images/qrcode.png" alt="中国文艺志愿者微信公众号">
            </div>
            <p>中国文艺志愿者微信公众号</p>
          </div>
        </div>
        
        <!-- 版权信息区域 -->
        <div class="copyright-box">
          <div class="copyright">
            <p class="visit-count">网站总访问量 : 103364</p>
            <p class="bottom-links">
              <template v-for="(link, index) in bottomLinks" :key="link.name">
                <a :href="link.url">{{ link.name }}</a>
                <span v-if="index < bottomLinks.length - 1">|</span>
              </template>
            </p>
            <p class="icp-info">
              <a id="beian" target="_blank" href="https://beian.miit.gov.cn/">
                工信部ICP备案号 京ICP备14001194号-1 京公网安备11010502025171
              </a>
              中国文艺志愿者协会 版权所有
            </p>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

<style scoped>
.footer-bottom {
  background: #c31f1f;
  color: #fff;
}

.bottomBox {
  max-width: 1200px;
  margin: 0 auto;
  padding: 30px 20px;
}

.footer {
  width: 100%;
}

.footerContent {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 30px;
}

/* 左侧链接区域 */
.leftBox {
  flex: 1;
  padding-right: 40px;
}

.leftBox h2 {
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 20px;
  color: #fff;
}

.links-list {
  display: flex;
  flex-wrap: wrap;
  gap: 8px 0;
  line-height: 2;
}

.links-list a {
  color: #fff;
  text-decoration: none;
  font-size: 14px;
  padding: 0 8px;
  transition: opacity 0.3s;
}

.links-list a:hover {
  opacity: 0.8;
  text-decoration: underline;
}

.links-list span {
  color: rgba(255, 255, 255, 0.6);
  font-size: 14px;
}

/* 右侧二维码区域 */
.rightBox {
  display: flex;
  flex-direction: column;
  align-items: center;
  flex-shrink: 0;
}

.qrcode {
  width: 120px;
  height: 120px;
  background: #fff;
  padding: 5px;
  border-radius: 4px;
  margin-bottom: 10px;
}

.qrcode img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.rightBox p {
  font-size: 12px;
  color: #fff;
  text-align: center;
}

/* 版权信息区域 */
.copyright-box {
  border-top: 1px solid rgba(255, 255, 255, 0.2);
  padding-top: 20px;
}

.copyright {
  text-align: center;
}

.visit-count {
  font-size: 14px;
  margin-bottom: 15px;
  color: #fff;
}

.bottom-links {
  font-size: 14px;
  margin-bottom: 15px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap;
  gap: 0;
}

.bottom-links a {
  color: #fff;
  text-decoration: none;
  padding: 0 15px;
  transition: opacity 0.3s;
}

.bottom-links a:hover {
  opacity: 0.8;
  text-decoration: underline;
}

.bottom-links span {
  color: rgba(255, 255, 255, 0.6);
}

.icp-info {
  font-size: 12px;
  color: #fff;
}

.icp-info a {
  color: #fff;
  text-decoration: none;
  margin-right: 10px;
}

.icp-info a:hover {
  text-decoration: underline;
}

/* 响应式适配 */
@media (max-width: 768px) {
  .footerContent {
    flex-direction: column;
    align-items: center;
  }
  
  .leftBox {
    padding-right: 0;
    margin-bottom: 30px;
    text-align: center;
  }
  
  .links-list {
    justify-content: center;
  }
  
  .bottom-links {
    flex-direction: column;
    gap: 10px;
  }
  
  .bottom-links span {
    display: none;
  }
}
</style>
