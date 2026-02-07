<script setup lang="ts">
import Breadcrumb from './Breadcrumb.vue'
import SideMenu from './SideMenu.vue'

interface Props {
  breadcrumbs?: { name: string; path?: string }[]
  sideMenuItems?: { name: string; active?: boolean }[]
  sideMenuTitle?: string
}

defineProps<Props>()
</script>

<template>
  <div class="page-container">
    <Breadcrumb v-if="breadcrumbs" :items="breadcrumbs" />
    
    <div class="mx-auto px-4 max-w-[1200px] list-wrap">
      <div class="list">
        <div v-if="sideMenuItems" class="second-menu">
          <h1 class="menu-title">
            <slot name="sideTitle">{{ sideMenuTitle || '栏目导航' }}</slot>
          </h1>
          <ul class="menu-list">
            <li
              v-for="(item, index) in sideMenuItems"
              :key="index"
              :class="{ active: item.active }"
            >
              {{ item.name }}
            </li>
          </ul>
          <slot name="sideMenu" />
        </div>
        
        <div class="content">
          <slot />
        </div>
      </div>
    </div>
    
    <slot name="bottom" />
  </div>
</template>

<style scoped>
.page-container {
  background: #ffffff;
  min-height: calc(100vh - 200px);
}

.list-wrap {
  margin: 20px auto 50px;
}

.list {
  background: #ffffff;
  box-shadow: 0 1px 20px rgba(0, 0, 0, 0.1);
  padding: 0 30px;
  margin: 20px 0 0;
  display: flex;
}

.second-menu {
  width: 20%;
  padding: 10px;
  margin: 20px 0 0;
}

.second-menu h1 {
  font-size: 18px;
  position: relative;
  padding: 0 0 0 10px;
  margin: 0 0 20px;
  color: #333;
}

.second-menu h1::before {
  position: absolute;
  top: 0;
  left: 0;
  width: 4px;
  height: 100%;
  background-color: #c31f1f;
  content: "";
}

.second-menu ul {
  padding: 0;
  margin: 0;
}

.second-menu ul li {
  text-align: center;
  padding: 8px 15px;
  margin: 10px 0 0;
  background: #eee;
  cursor: pointer;
  transition: all 0.3s;
  border-radius: 2px;
}

.second-menu ul li:hover,
.second-menu ul li.active {
  background: #c31f1f;
  color: #fff;
}

.content {
  width: 80%;
  padding: 30px;
  white-space: pre-wrap;
  flex: 1;
  overflow: hidden;
}

.content :deep(img) {
  max-width: 100%;
  width: auto;
}

@media screen and (max-width: 1024px) {
  .list {
    flex-direction: column;
  }
  
  .second-menu,
  .content {
    width: 100%;
  }
}
</style>
