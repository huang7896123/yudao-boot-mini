<!-- 商品评论项 -->
<template>
  <view class="">
    <!-- 用户评论 -->
    <view class="user flex items-center mb-14rpx">
      <view class="mr-20rpx flex">
        <image class="avatar" :src="item.userAvatar"></image>
      </view>
      <view class="nickname mr-20rpx">{{ item.userNickname }}</view>
      <view class="items-center mb-12rpx">
        <wd-rate v-model="item.scores" readonly size="24rpx" />
      </view>
    </view>
    <view class="content"> {{ item.content }} </view>
    <view class="mt-24rpx" v-if="item.picUrls?.length">
      <scroll-view class="scroll-box" scroll-x scroll-anchoring>
        <view class="flex">
          <view v-for="(picUrl, index) in item.picUrls" :key="index" class="mr-10rpx">
            <wd-img
              class="content-img"
              :enable-preview="true"
              :src="picUrl"
              :height="120"
              :width="120"
              mode="aspectFill"
            />
          </view>
        </view>
      </scroll-view>
    </view>
    <!-- 商家回复 -->
    <view class="mt-20rpx reply-box" v-if="item.replyTime">
      <view class="reply-title">商家回复：</view>
      <view class="reply-content">{{ item.replyContent }}</view>
    </view>
  </view>
</template>

<script setup>
const props = defineProps({
  item: {
    type: Object,
    default() {},
  },
});
</script>

<style lang="scss" scoped>
.avatar {
  width: 52rpx;
  height: 52rpx;
  border-radius: 50%;
}

.nickname {
  font-size: 26rpx;
  font-weight: 500;
  color: #999999;
}

.content {
  width: 636rpx;
  font-size: 26rpx;
  font-weight: 400;
  color: #333333;
}

.reply-box {
  position: relative;
  background: #f8f8f8;
  border-radius: 8rpx;
  padding: 16rpx;
}

.reply-title {
  position: absolute;
  left: 16rpx;
  top: 16rpx;
  font-weight: 400;
  font-size: 26rpx;
  line-height: 40rpx;
  color: #333333;
}

.reply-content {
  text-indent: 128rpx;
  font-weight: 400;
  font-size: 26rpx;
  line-height: 40rpx;
  color: #333333;
}
</style>
