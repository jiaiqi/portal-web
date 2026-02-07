<script setup lang="ts">
interface Props {
  items: { name: string; active?: boolean }[]
}

defineProps<Props>()
</script>

<template>
  <div class="side-menu">
    <h1 class="menu-title">
      <slot name="title">栏目导航</slot>
    </h1>
    <ul class="menu-list">
      <li
        v-for="(item, index) in items"
        :key="index"
        :class="{ active: item.active }"
      >
        {{ item.name }}
      </li>
    </ul>
    <slot />
  </div>
</template>

<style scoped>
.side-menu {
  width: 100%;
  padding: 10px;
}

.menu-title {
  font-size: 18px;
  position: relative;
  padding: 0 0 0 10px;
  margin: 0 0 20px;
  color: #333;
}

.menu-title::before {
  position: absolute;
  top: 0;
  left: 0;
  width: 4px;
  height: 100%;
  background-color: #c31f1f;
  content: "";
}

.menu-list {
  padding: 0;
  margin: 0;
}

.menu-list li {
  text-align: center;
  padding: 8px 15px;
  margin: 10px 0 0;
  background: #eee;
  cursor: pointer;
  transition: all 0.3s;
  border-radius: 2px;
}

.menu-list li:hover,
.menu-list li.active {
  background: #c31f1f;
  color: #fff;
}
</style>
