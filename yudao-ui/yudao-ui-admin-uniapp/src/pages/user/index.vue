<template>
  <view class="yd-page-container">
    <!-- 用户信息卡片 -->
    <view class="user-card relative bg-white">
      <view class="px-35rpx py-28rpx text-align-end">
        <view class="cp-saoyisao text-42rpx" />
      </view>
      <view class="mt-10rpx flex items-center px-32rpx" @click="handleGoProfile">
        <view class="avatar-wrapper mr-24rpx h-120rpx w-120rpx overflow-hidden rounded-full">
          <!-- <image :src="userInfo.avatar" mode="aspectFill" class="h-full w-full"/> -->
          <image src="https://picsum.photos/seed/picsum/300/300" mode="aspectFill" class="h-full w-full" />
        </view>
        <view class="flex-1">
          <view class="mb-8rpx text-40rpx text-[#323333] font-semibold">
            <!-- {{ userInfo.nickname || userInfo.username }} -->  叽里呱啦
          </view>
          <view class="text-28rpx opacity-30">
            ID: 12568984<!-- {{ userProfile ? (userProfile.dept?.name || '暂无部门') : '' }} -->
          </view>
        </view>
      </view>

      <wd-row class="mt-25rpx py-35rpx">
        <wd-col :span="8">
          <view class="text-center text-38rpx font-semibold">131</view>
          <view class="text-center text-28rpx opacity-40">{{ $t('word.follow') }}</view>
        </wd-col>
        <wd-col :span="8">
          <view class="text-center text-38rpx font-semibold">610</view>
          <view class="text-center text-28rpx opacity-40">{{ $t('word.follower') }}</view>
        </wd-col>
        <wd-col :span="8">
          <view class="text-center text-38rpx font-semibold">2048</view>
          <view class="text-center text-28rpx opacity-40">{{ $t('word.like') }}</view>
        </wd-col>
      </wd-row>
    </view>

    <wd-row class="p-30rpx">
      <wd-col :span="12" class="pr-15rpx">
        <view class="item-card flex items-center justify-between bg-white">
          <view>
            <view class="text-30rpx font-semibold">{{ $t('word.market') }}</view>
            <view class="mt-5rpx text-22rpx opacity-40">{{ $t('desc.marketDesc') }}</view>
          </view>
          <view class="cp-shangcheng11 text-60rpx text-[#f2464a]" />
        </view>
      </wd-col>
      <wd-col :span="12" class="pl-15rpx">
        <view class="item-card flex items-center justify-between bg-white">
          <view>
            <view class="text-30rpx font-semibold">{{ $t('word.learning') }}</view>
            <view class="line-clamp-1 mt-5rpx text-22rpx opacity-40">{{ $t('desc.learningDesc') }}</view>
          </view>
          <view class="cp-xuexi text-64rpx text-[#00b946]" />
        </view>
      </wd-col>
    </wd-row>

    <!-- 菜单区域 -->
    <view class="mx-30rpx">
      <wd-cell-group custom-class="menu-group" border>
        <wd-cell :title="$t('word.printHistory')" is-link>
          <template #icon>
            <view class="cp cp-shijian mr-25rpx text-38rpx" />
          </template>
        </wd-cell>
        <wd-cell :title="$t('word.browseHistory')" is-link>
          <template #icon>
            <view class="cp cp-yanjing mr-25rpx text-38rpx" />
          </template>
        </wd-cell>
        <wd-cell :title="$t('word.helpCenter')" is-link @click="handleGoFaq">
          <template #icon>
            <view class="cp cp-bangzhu mr-25rpx text-38rpx" />
          </template>
        </wd-cell>
        <wd-cell :title="$t('word.security')" is-link @click="handleGoSecurity">
          <template #icon>
            <view class="cp cp-anquan mr-25rpx text-38rpx" />
          </template>
        </wd-cell>
        <wd-cell :title="$t('word.settings')" is-link @click="handleGoSettings">
          <template #icon>
            <view class="cp cp-shezhi mr-25rpx text-38rpx" />
          </template>
        </wd-cell>
      </wd-cell-group>
    </view>
  </view>
</template>

<script lang="ts" setup>
import type { UserProfileVO } from '@/api/system/user/profile/index'
import { storeToRefs } from 'pinia'
import { onMounted, ref } from 'vue'
import { useToast } from 'wot-design-uni'
import { getUserProfile } from '@/api/system/user/profile/index'
// import { LOGIN_PAGE } from '@/router/config'
import { useUserStore } from '@/store/index'
import { useTokenStore } from '@/store/token'

definePage({
  style: {
    navigationStyle: 'custom',
  },
})

const userStore = useUserStore()
const tokenStore = useTokenStore()
const toast = useToast()
const { userInfo } = storeToRefs(userStore)
const userProfile = ref<UserProfileVO | null>(null) // 用户详细信息

/** 页面加载时获取用户信息 */
onMounted(async () => {
  userProfile.value = await getUserProfile()
  await userStore.fetchUserInfo()
})

/** 跳转到个人资料 */
function handleGoProfile() {
  uni.navigateTo({ url: '/pages-core/user/profile/index' })
}

/** 跳转到账号安全 */
function handleGoSecurity() {
  uni.navigateTo({ url: '/pages-core/user/security/index' })
}

/** 跳转到常见问题 */
function handleGoFaq() {
  uni.navigateTo({ url: '/pages-core/user/faq/index' })
}

/** 跳转到意见反馈 */
function handleGoFeedback() {
  uni.navigateTo({ url: '/pages-core/user/feedback/index' })
}

/** 跳转联系客服 */
function handleGoContact() {
  uni.navigateTo({ url: '/pages-core/user/contact/index' })
}

/** 跳转到应用设置 */
function handleGoSettings() {
  uni.navigateTo({ url: '/pages-core/user/settings/index' })
}
</script>

<style lang="scss" scoped>
// 顶部渐变背景
.header-bg {
  background: linear-gradient(135deg, #1890ff 0%, #36cfc9 100%);
}

// 用户卡片阴影
.user-card {
  box-shadow: 0 0 10rpx rgba(0, 0, 0, 0.08);
}

// 头像边框
.avatar-wrapper {
  border: 4rpx solid #f5f5f5;
  box-shadow: 0 4rpx 12rpx rgba(0, 0, 0, 0.08);
}

// 菜单组样式
:deep(.menu-group) {
  border-radius: 15rpx;
  overflow: hidden;
  box-shadow: 0 3rpx 8rpx rgba(24, 144, 255, 0.06);
  .wd-cell__wrapper {
    padding: 32rpx 0;
  }
  .wd-cell {
    padding: 0 35rpx;
  }
  .wd-cell__title {
    font-size: 30rpx;
  }
}
</style>
