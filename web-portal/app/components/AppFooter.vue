<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useStatistics } from '../composables/useStatistics'

const { getTotalVisits } = useStatistics()

interface LinkItem {
  linkName: string
  linkUrl: string
}

interface SiteConfig {
  siteIcp?: string
  sitePolice?: string
  siteCopyright?: string
  siteContact?: string
  siteComplaint?: string
  siteForum?: string
  siteDepartment?: string
  siteMember?: string
  siteOrganization?: string
  qrcodeUrl?: string
}

interface ApiResponse<T> {
  data: T
}

// 默认友情链接
const defaultLinks: LinkItem[] = [
  { linkName: '中国文联', linkUrl: 'https://www.cflac.org.cn/' },
  { linkName: '中国作协', linkUrl: 'https://www.chinawriter.com.cn/' },
  { linkName: '中国剧协', linkUrl: 'https://www.chinatheatre.org.cn/' },
  { linkName: '中国影协', linkUrl: 'http://www.cfa1949.com/' },
  { linkName: '中国音协', linkUrl: 'https://www.chnmusic.org/' },
  { linkName: '中国美协', linkUrl: 'https://www.caanet.org.cn/' },
  { linkName: '中国曲协', linkUrl: 'http://www.zhongguoquyi.cn/' },
  { linkName: '中国舞协', linkUrl: 'https://www.cdanet.org/index' },
  { linkName: '中国民协', linkUrl: 'http://www.cflas.com.cn/mx/index.html' },
  { linkName: '中国摄协', linkUrl: 'https://www.cpanet.org.cn/' },
  { linkName: '中国书协', linkUrl: 'http://www.cca1981.org.cn/' },
  { linkName: '中国杂协', linkUrl: 'https://zhuanti.artnchina.com/zgzjw/zgzx/index.html' },
  { linkName: '中国视协', linkUrl: 'https://www.ctaa.org.cn/' },
  { linkName: '中国文学艺术基金会', linkUrl: 'http://www.claf.org.cn/' },
]

// 友情链接数据
const links = ref<LinkItem[]>([...defaultLinks])

// 默认配置
const defaultConfig: SiteConfig = {
  siteIcp: '京ICP备14001194号-1',
  sitePolice: '京公网安备11010502025171',
  siteCopyright: '中国文艺志愿者协会 版权所有',
  siteContact: '联系咨询',
  siteComplaint: '投诉建议',
  siteForum: '文艺论坛',
  siteDepartment: '职能部门',
  siteMember: '团体会员',
  siteOrganization: '组织机构',
  qrcodeUrl: 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20231017112056A013_20240103101656A013_20240103145652A042.png'
}

// 响应式配置数据
const config = ref<SiteConfig>({ ...defaultConfig })
const api = useApi()

// 总访问量
const totalVisits = ref(0)

onMounted(async () => {
  try {
    // 从后台获取友情链接
    const linksRes = await api.get<ApiResponse<LinkItem[]>>('/cms/link/all').catch(() => null)
    if (linksRes?.data && Array.isArray(linksRes.data) && linksRes.data.length > 0) {
      links.value = linksRes.data
    } else if (Array.isArray(linksRes)) {
      links.value = linksRes
    }


    // 从后台获取网站配置
    const response = await api.get<ApiResponse<SiteConfig>>('/cms/site-config/all').catch(() => null)
    if (response?.data) {
      config.value = {
        siteIcp: response.data.site_icp || defaultConfig.siteIcp,
        sitePolice: response.data.site_police || defaultConfig.sitePolice,
        siteCopyright: response.data.site_copyright || defaultConfig.siteCopyright,
        siteContact: response.data.site_contact || defaultConfig.siteContact,
        siteComplaint: response.data.site_complaint || defaultConfig.siteComplaint,
        siteForum: response.data.site_forum || defaultConfig.siteForum,
        siteDepartment: response.data.site_department || defaultConfig.siteDepartment,
        siteMember: response.data.site_member || defaultConfig.siteMember,
        siteOrganization: response.data.site_organization || defaultConfig.siteOrganization,
        qrcodeUrl: response.data.site_qrcode || defaultConfig.qrcodeUrl
      }
    }

    // 获取总访问量
    totalVisits.value = await getTotalVisits()
  } catch (err) {
    console.error('获取网站配置失败:', err)
    // 使用默认配置
  }
})
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
              <template v-for="(link, index) in links" :key="link.linkName">
                <a :href="link.linkUrl" target="_blank">{{ link.linkName }}</a>
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
            <p class="visit-count">网站总访问量 : {{ totalVisits }}</p>
            <p class="bottom-links">
              <a href="#">{{ config.siteContact }}</a>
              <span>|</span>
              <a href="#">{{ config.siteComplaint }}</a>
              <span>|</span>
              <a href="#">{{ config.siteForum }}</a>
              <span>|</span>
              <a href="#">{{ config.siteDepartment }}</a>
              <span>|</span>
              <a href="#">{{ config.siteMember }}</a>
              <span>|</span>
              <a href="#">{{ config.siteOrganization }}</a>
            </p>
            <p class="icp-info">
              <a id="beian" target="_blank" href="https://beian.miit.gov.cn/">
                工信部ICP备案号 {{ config.siteIcp }} {{ config.sitePolice }}
              </a>
              {{ config.siteCopyright }}
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
