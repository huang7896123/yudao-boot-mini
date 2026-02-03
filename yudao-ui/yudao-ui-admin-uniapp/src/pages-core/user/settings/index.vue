<template>
  <view class="yd-page-container">
    <!-- 顶部导航栏 -->
    <wd-navbar
      title="设置"
      left-arrow
      placeholder
      safe-area-inset-top
      fixed
      @click-left="handleBack"
    />

    <!-- Logo 区域 -->
    <view class="flex flex-col items-center py-60rpx">
      <image
        class="h-150rpx w-150rpx rounded-full"
        src="/static/logo.svg"
        mode="aspectFit"
      />
      <text class="text-40rpx text-gray-800 font-medium">线光机</text>
    </view>

    <!-- 设置列表 -->
    <view class="mx-24rpx">
      <wd-cell-group custom-class="cell-group" border>
        <wd-cell title="个人资料" is-link @click="handleGoProfile"></wd-cell>
        <wd-cell
          title="当前版本"
          :value="`v${version}`"
          is-link
          @click="handleShowVersion"
        ></wd-cell>
        <wd-cell
          title="本地缓存"
          :value="storageSize"
          is-link
          @click="handleClearCache"
        ></wd-cell>
      </wd-cell-group>
    </view>

    <view class="mt-48rpx px-100rpx">
      <wd-button block type="info" @click="handleLogout">
        退出登录
      </wd-button>
    </view>

    <!-- 底部协议和版权 -->
    <view class="mt-80rpx flex flex-col items-center">
      <view class="mb-40rpx flex items-center text-26rpx">
        <text class="text-[#1890ff]" @click="handleGoAgreement">《用户协议》</text>
        <text class="text-gray-500">与</text>
        <text class="text-[#1890ff]" @click="handleGoPrivacy">《隐私协议》</text>
      </view>
      <text class="mb-10rpx text-24rpx text-gray-400">
        Copyright © 2026 iocoder.cn All Rights Reserved.
      </text>
      <text class="text-24rpx text-gray-400">
        Qubea 线光机
      </text>
    </view>
  </view>
</template>

<script lang="ts" setup>
import { onMounted, ref } from 'vue'
import { useToast } from 'wot-design-uni'
import { navigateBackPlus } from '@/utils'

definePage({
  style: {
    navigationBarTitleText: '',
    navigationStyle: 'custom',
  },
})

const toast = useToast()
const version = ref('1.0.0') // 当前版本号
const storageSize = ref('') // 本地缓存大小

/** 返回上一页 */
function handleBack() {
  navigateBackPlus('/pages/user/index')
}

/** 跳转到个人资料 */
function handleGoProfile() {
  uni.navigateTo({ url: '/pages-core/user/profile/index' })
}

/** 获取应用版本号 */
function getAppVersion() {
  // #ifdef APP-PLUS
  const appInfo = uni.getSystemInfoSync()
  version.value = appInfo.appVersion || '1.0.0'
  // #endif
}

/** 获取本地缓存大小 */
function getStorageSize() {
  const info = uni.getStorageInfoSync()
  storageSize.value = `${info.currentSize}KB`
}

/** 显示版本信息 */
function handleShowVersion() {
  toast.info(`当前版本：v${version.value}`)
}

/** 清除缓存 */
function handleClearCache() {
  uni.showModal({
    title: '提示',
    content: '确定要清除本地缓存吗？',
    success: (res) => {
      if (!res.confirm) {
        return
      }
      try {
        uni.clearStorageSync()
        getStorageSize()
        toast.success('缓存清除成功')
      } catch {
        toast.error('缓存清除失败')
      }
    },
  })
}

/** 退出登录 */
function handleLogout() {
  uni.showModal({
    title: '提示',
    content: '确定要退出登录吗？',
    success: async (res) => {
      if (!res.confirm) {
        return
      }
      await tokenStore.logout()
      toast.success('退出登录成功')
      setTimeout(() => {
        uni.reLaunch({ url: LOGIN_PAGE })
      }, 500)
    },
  })
}

/** 跳转到用户协议 */
function handleGoAgreement() {
  uni.navigateTo({ url: '/pages-core/user/settings/agreement/index' })
}

/** 跳转到隐私协议 */
function handleGoPrivacy() {
  uni.navigateTo({ url: '/pages-core/user/settings/privacy/index' })
}

/** 初始化 */
onMounted(() => {
  getStorageSize()
  getAppVersion()
})
</script>

<style lang="scss" scoped>
:deep(.cell-group) {
  border-radius: 12rpx;
  overflow: hidden;
  box-shadow: 0 3rpx 8rpx rgba(24, 144, 255, 0.06);
  .wd-cell__wrapper {
    padding: 28rpx 0;
  }
  .wd-cell{
    padding: 0 35rpx;
  }

}
</style>
