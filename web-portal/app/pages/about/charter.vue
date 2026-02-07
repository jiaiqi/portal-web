<script setup lang="ts">
const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '协会概况', path: '/about' },
  { name: '协会章程', path: '/about/charter' }
]

const sideMenuItems = [
  { name: '协会简介', path: '/about', active: false },
  { name: '协会领导', path: '/about/leaders', active: false },
  { name: '理事会', path: '/about/council', active: false },
  { name: '协会章程', path: '/about/charter', active: true },
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
                <div class="ant-tabs-tab-btn">协会章程</div>
              </div>
            </div>
          </div>
          
          <div class="page-content">
            <div class="content-body">
              <h2 class="page-title">中国文艺志愿者协会章程</h2>
              
              <div class="charter-content">
                <h3>第一章 总则</h3>
                
                <p><strong>第一条</strong> 中国文艺志愿者协会（英文名称：China Literary and Art Volunteers' Association，缩写：CLAVA）是由文艺志愿者、文艺志愿服务组织以及关心支持文艺志愿服务事业的单位或组织自愿组成，按照章程开展活动的全国性、联合性、非营利性社会组织。</p>
                
                <p><strong>第二条</strong> 本会的宗旨是：高举中国特色社会主义伟大旗帜，以马克思列宁主义、毛泽东思想、邓小平理论、"三个代表"重要思想、科学发展观、习近平新时代中国特色社会主义思想为指导，坚持党的基本路线、基本方略，坚持以人民为中心的工作导向，弘扬"奉献、友爱、互助、进步"的志愿精神，践行"爱国、为民、崇德、尚艺"的文艺界核心价值观，团结凝聚文艺志愿者，致力于文艺志愿服务，推动社会主义文艺繁荣发展，为实现中华民族伟大复兴的中国梦贡献力量。</p>
                
                <p><strong>第三条</strong> 本会遵守宪法、法律、法规和国家政策，践行社会主义核心价值观，遵守社会道德风尚，坚持文艺为人民服务、为社会主义服务的方向和百花齐放、百家争鸣的方针，坚持创造性转化、创新性发展，培育和践行社会主义核心价值观。</p>
                
                <p><strong>第四条</strong> 本会接受业务主管单位中国文学艺术界联合会和社团登记管理机关民政部的业务指导和监督管理。</p>
                
                <p><strong>第五条</strong> 本会住所设在北京市。</p>
                
                <h3>第二章 业务范围</h3>
                
                <p><strong>第六条</strong> 本会的业务范围：</p>
                <p>（一）组织开展文艺志愿服务活动；</p>
                <p>（二）开展文艺志愿者培训工作；</p>
                <p>（三）开展文艺志愿服务理论研究；</p>
                <p>（四）开展文艺志愿服务国际交流与合作；</p>
                <p>（五）表彰奖励文艺志愿服务先进典型；</p>
                <p>（六）开展文艺志愿服务项目合作与交流；</p>
                <p>（七）编辑出版文艺志愿服务相关资料；</p>
                <p>（八）建设文艺志愿服务网络平台；</p>
                <p>（九）开展符合本会宗旨的其他活动。</p>
                
                <h3>第三章 会员</h3>
                
                <p><strong>第七条</strong> 本会会员分为个人会员和单位会员。</p>
                
                <p><strong>第八条</strong> 申请加入本会的会员，必须具备下列条件：</p>
                <p>（一）拥护本会章程；</p>
                <p>（二）有加入本会的意愿；</p>
                <p>（三）在本会的业务领域内具有一定的影响；</p>
                <p>（四）热心文艺志愿服务事业。</p>
                
                <p><strong>第九条</strong> 会员入会的程序：</p>
                <p>（一）提交入会申请书；</p>
                <p>（二）经理事会或常务理事会讨论通过；</p>
                <p>（三）由理事会或理事会授权的机构发给会员证。</p>
                
                <p><strong>第十条</strong> 会员享有下列权利：</p>
                <p>（一）本会的选举权、被选举权和表决权；</p>
                <p>（二）参加本会的活动；</p>
                <p>（三）获得本会服务的优先权；</p>
                <p>（四）对本会工作的批评建议权和监督权；</p>
                <p>（五）入会自愿、退会自由。</p>
                
                <p><strong>第十一条</strong> 会员履行下列义务：</p>
                <p>（一）遵守本会章程，执行本会决议；</p>
                <p>（二）维护本会合法权益；</p>
                <p>（三）完成本会交办的工作；</p>
                <p>（四）按规定交纳会费；</p>
                <p>（五）向本会反映情况，提供有关资料。</p>
                
                <h3>第四章 组织机构和负责人产生、罢免</h3>
                
                <p><strong>第十二条</strong> 本会的最高权力机构是会员代表大会。会员代表大会的职权是：</p>
                <p>（一）制定和修改章程；</p>
                <p>（二）选举和罢免理事；</p>
                <p>（三）审议理事会的工作报告和财务报告；</p>
                <p>（四）制定和修改会费标准；</p>
                <p>（五）决定终止事宜；</p>
                <p>（六）决定其他重大事宜。</p>
                
                <p><strong>第十三条</strong> 会员代表大会须有2/3以上的会员代表出席方能召开，其决议须经到会会员代表半数以上表决通过方能生效。</p>
                
                <p><strong>第十四条</strong> 会员代表大会每届5年。因特殊情况需提前或延期换届的，须由理事会表决通过，报业务主管单位审查并经社团登记管理机关批准同意。但延期换届最长不超过1年。</p>
                
                <p><strong>第十五条</strong> 理事会是会员代表大会的执行机构，在闭会期间领导本会开展日常工作，对会员代表大会负责。</p>
                
                <h3>第五章 资产管理、使用原则</h3>
                
                <p><strong>第十六条</strong> 本会经费来源：</p>
                <p>（一）会费；</p>
                <p>（二）捐赠；</p>
                <p>（三）政府资助；</p>
                <p>（四）在核准的业务范围内开展活动和提供服务的收入；</p>
                <p>（五）利息；</p>
                <p>（六）其他合法收入。</p>
                
                <h3>第六章 章程的修改程序</h3>
                
                <p><strong>第十七条</strong> 对本会章程的修改，须经理事会表决通过后报会员代表大会审议。</p>
                
                <p><strong>第十八条</strong> 本会修改的章程，须在会员代表大会通过后15日内，经业务主管单位审查同意，并报社团登记管理机关核准后生效。</p>
                
                <h3>第七章 终止程序及终止后的财产处理</h3>
                
                <p><strong>第十九条</strong> 本会完成宗旨或自行解散或由于分立、合并等原因需要注销的，由理事会或常务理事会提出终止动议。</p>
                
                <p><strong>第二十条</strong> 本会终止动议须经会员代表大会表决通过，并报业务主管单位审查同意。</p>
                
                <p><strong>第二十一条</strong> 本会终止前，须在业务主管单位及有关机关指导下成立清算组织，清理债权债务，处理善后事宜。清算期间，不开展清算以外的活动。</p>
                
                <p><strong>第二十二条</strong> 本会经社团登记管理机关办理注销登记手续后即为终止。</p>
                
                <p><strong>第二十三条</strong> 本会终止后的剩余财产，在业务主管单位和社团登记管理机关的监督下，按照国家有关规定，用于发展与本会宗旨相关的事业。</p>
                
                <h3>第八章 附则</h3>
                
                <p><strong>第二十四条</strong> 本章程经2013年5月23日第一次会员代表大会表决通过。</p>
                
                <p><strong>第二十五条</strong> 本章程的解释权属本会理事会。</p>
                
                <p><strong>第二十六条</strong> 本章程自社团登记管理机关核准之日起生效。</p>
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

.charter-content h3 {
  font-size: 18px;
  color: #333;
  margin: 30px 0 20px;
  padding-left: 10px;
  border-left: 4px solid #c31f1f;
  font-weight: bold;
}

.charter-content p {
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
