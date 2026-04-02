<template>
  <wd-swiper
    :list="banners"
    autoplay
    :interval="5000"
    indicator-position="bottom-right"
    image-mode="aspectFill"
    :height="`${height}rpx`"
    @click="handleClick"
  />
</template>

<script lang="ts" setup>
defineOptions({
  name: 'HomeBanner',
})

const props = defineProps({
  bannerList: {
    type: Array,
    default: () => [],
  },
  height: {
    type: Number,
    default: 350,
  },
})

const banners = computed(() => {
  return props.bannerList.map(item => item.url)
})

/** 处理点击 */
function handleClick(data: object) {
  // TODO @芋艿：看看后续要不要支持跳转
  const link = props.bannerList[data.index].link
  if (link) {
    console.log('跳转链接：', link)
  } else {
    console.log('没有链接可跳转')
  }
}
</script>

<style lang="scss" scoped>
:deep(.wd-swiper__track) {
  border-radius: 0 !important;
}
</style>
