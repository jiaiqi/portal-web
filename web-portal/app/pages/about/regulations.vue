<script setup lang="ts">
const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '协会概况', path: '/about' },
  { name: '会员工作条例', path: '/about/regulations' }
]

const sideMenuItems = [
  { name: '协会简介', path: '/about', active: false },
  { name: '协会领导', path: '/about/leaders', active: false },
  { name: '理事会', path: '/about/council', active: false },
  { name: '协会章程', path: '/about/charter', active: false },
  { name: '会员工作条例', path: '/about/regulations', active: true }
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
                <div class="ant-tabs-tab-btn">会员工作条例</div>
              </div>
            </div>
          </div>
          
          <div class="page-content">
            <div class="content-body">
              <h2 class="page-title">中国文艺志愿者协会会员工作条例</h2>
              
              <div class="regulations-content">
                <h3>第一章 总则</h3>
                
                <p><strong>第一条</strong> 为加强中国文艺志愿者协会（以下简称"本会"）会员工作，规范会员管理，保障会员合法权益，根据《中国文艺志愿者协会章程》，制定本条例。</p>
                
                <p><strong>第二条</strong> 本条例适用于本会个人会员和单位会员的管理工作。</p>
                
                <p><strong>第三条</strong> 本会会员工作遵循以下原则：</p>
                <p>（一）坚持正确政治方向，弘扬社会主义核心价值观；</p>
                <p>（二）坚持文艺为人民服务、为社会主义服务；</p>
                <p>（三）坚持自愿参与、义务奉献、无偿服务；</p>
                <p>（四）坚持民主管理、规范运作、健康发展。</p>
                
                <h3>第二章 会员入会</h3>
                
                <p><strong>第四条</strong> 申请加入本会的个人会员应当具备以下条件：</p>
                <p>（一）拥护中国共产党的领导，热爱社会主义祖国；</p>
                <p>（二）遵守国家法律法规，遵守社会公德；</p>
                <p>（三）拥护本会章程，自愿加入本会；</p>
                <p>（四）热心文艺志愿服务事业，具有一定的文艺专长或服务技能；</p>
                <p>（五）自愿从事文艺志愿服务，每年参加文艺志愿服务活动时间不少于20小时。</p>
                
                <p><strong>第五条</strong> 申请加入本会的单位会员应当具备以下条件：</p>
                <p>（一）拥护中国共产党的领导，遵守国家法律法规；</p>
                <p>（二）拥护本会章程，自愿加入本会；</p>
                <p>（三）具有独立法人资格或经有关部门批准成立的文艺志愿服务组织；</p>
                <p>（四）有组织开展文艺志愿服务活动的意愿和能力；</p>
                <p>（五）在本行业、本地区具有一定影响力。</p>
                
                <p><strong>第六条</strong> 会员入会程序：</p>
                <p>（一）提交入会申请书；</p>
                <p>（二）个人会员需提交身份证明、文艺专长证明或服务技能证明；</p>
                <p>（三）单位会员需提交法人登记证书或批准成立文件复印件；</p>
                <p>（四）经理事会或授权机构审核批准；</p>
                <p>（五）缴纳会费（单位会员）；</p>
                <p>（六）颁发会员证。</p>
                
                <h3>第三章 会员权利与义务</h3>
                
                <p><strong>第七条</strong> 会员享有下列权利：</p>
                <p>（一）选举权、被选举权和表决权；</p>
                <p>（二）参加本会组织的各类活动；</p>
                <p>（三）获得本会提供的培训、交流等服务；</p>
                <p>（四）对本会工作提出批评、建议和进行监督；</p>
                <p>（五）优先获得本会提供的相关信息和资料；</p>
                <p>（六）入会自愿、退会自由。</p>
                
                <p><strong>第八条</strong> 会员履行下列义务：</p>
                <p>（一）遵守本会章程和各项规章制度；</p>
                <p>（二）执行本会决议，完成本会交办的工作；</p>
                <p>（三）积极参加文艺志愿服务活动；</p>
                <p>（四）维护本会合法权益和声誉；</p>
                <p>（五）按规定缴纳会费（单位会员）；</p>
                <p>（六）向本会反映情况，提供有关资料。</p>
                
                <h3>第四章 会员管理</h3>
                
                <p><strong>第九条</strong> 本会建立会员档案管理制度，对会员信息进行登记、更新和管理。</p>
                
                <p><strong>第十条</strong> 本会实行会员年度注册制度。会员应当在每年规定时间内进行注册，逾期未注册且未说明理由的，视为自动退会。</p>
                
                <p><strong>第十一条</strong> 会员退会应当书面通知本会，并交回会员证。</p>
                
                <p><strong>第十二条</strong> 会员有下列情形之一的，经理事会或授权机构研究决定，可予以除名：</p>
                <p>（一）严重违反本会章程或本条例；</p>
                <p>（二）严重损害本会声誉或利益；</p>
                <p>（三）被依法追究刑事责任；</p>
                <p>（四）连续两年不参加本会活动或不履行会员义务。</p>
                
                <h3>第五章 奖励与表彰</h3>
                
                <p><strong>第十三条</strong> 本会对在文艺志愿服务工作中做出突出贡献的会员，给予表彰和奖励。</p>
                
                <p><strong>第十四条</strong> 表彰和奖励形式包括：</p>
                <p>（一）通报表扬；</p>
                <p>（二）授予荣誉称号；</p>
                <p>（三）颁发荣誉证书或奖章；</p>
                <p>（四）推荐参加更高级别表彰。</p>
                
                <h3>第六章 附则</h3>
                
                <p><strong>第十五条</strong> 本条例由本会理事会负责解释。</p>
                
                <p><strong>第十六条</strong> 本条例自发布之日起施行。</p>
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

.regulations-content h3 {
  font-size: 18px;
  color: #333;
  margin: 30px 0 20px;
  padding-left: 10px;
  border-left: 4px solid #c31f1f;
  font-weight: bold;
}

.regulations-content p {
  margin-bottom: 15px;
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
