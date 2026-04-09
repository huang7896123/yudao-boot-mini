<template>
  <view class="detail-content-card bg-white py-30rpx">
    <view class="card-header mb-15rpx ml-30rpx flex items-center">
      <view class="line" />
      <view class="title ml-20rpx">详情</view>
    </view>
    <view class="card-content px-30rpx">
      <rich-text :nodes="content" />
    </view>
    <view class="px-30rpx pt-15rpx">
      <wd-tag v-for="data in 10" :key="data" color="#666" bg-color="#f3f3f3" round class="mr-10rpx mt-10rpx">标签</wd-tag>
    </view>
  </view>
</template>

<script setup>
const props = defineProps({
  content: {
    type: String,
    default: '',
  },
})
</script>

<script>
export default { name: 'DetailContentCard' }
</script>

<style lang="scss" scoped>
.detail-content-card {
  .card-header {
    .line {
      width: 6rpx;
      height: 30rpx;
      background: #2e7bff;
      border-radius: 3rpx;
    }

    .title {
      font-size: 30rpx;
      font-weight: bold;
    }

    .des {
      font-size: 24rpx;
      color: #999;
    }

    .more-btn {
      font-size: 24rpx;
      color: var(--ui-BG-Main);
    }
  }
}

:deep() {
  image {
    display: block;
  }
}
</style>
