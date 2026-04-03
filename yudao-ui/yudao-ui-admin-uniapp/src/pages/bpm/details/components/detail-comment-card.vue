<!-- 商品评论的卡片 -->
<template>
  <view class="detail-comment-card bg-white">
    <view class="card-header flex items-center justify-between pb-10rpx">
      <view class="center flex">
        <view class="line" />
        <view class="title mr-10prx ml-20rpx">评价</view>
        <view class="des">({{ state.total }})</view>
      </view>
      <view
        v-if="state.commentList.length > 0"
        class="flex items-center text-primary"
        @tap="$router.go('/pages/goods/comment/list', { id: goodsId })"
      >
        <wd-text type="primary" size="24rpx" text="查看全部" />
        <wd-icon name="arrow-right" size="28rpx" />
      </view>
    </view>
    <!-- 评论列表 -->
    <view class="card-content py-30rpx">
      <view v-for="item in state.commentList" :key="item.id" class="comment-box">
        <comment-item :item="item" />
      </view>
      <wd-status-tip v-if="state.commentList.length === 0" image="comment" tip="期待您的第一个评价～" />

      <view class="mt-30rpx flex items-center rounded-8rpx" @click="onShowComment">
        <wd-img src="https://picsum.photos/id/100/300/300" width="70rpx" height="70rpx" radius="22" mode="aspectFill" />
        <view class="ml-20rpx flex-1 rounded-8rpx bg-[#eee] p-20rpx text-24rpx text-26rpx opacity-60">请输入评论内容...</view>
      </view>
    </view>

    <wd-popup v-model="commentObj.show" position="bottom" custom-style="height: 250px;" @close="handleClose">
      <view class="p-25rpx">
        <wd-textarea v-model="commentObj.content" auto-height :maxlength="120" clearable show-word-limit />
        <view class="mb-8rpx mt-20rpx">
          <wd-upload
            :file-list="commentObj.picUrls"
            :limit="3"
            action="https://mockapi.eolink.com/zhTuw2P8c29bc981a741931bdd86eb04dc1e8fd64865cb5/upload"
            @change="handleChange"
          />
        </view>
        <wd-button style="width: 100%;">发送</wd-button>
      </view>
    </wd-popup>
  </view>
</template>

<script setup>
import { onBeforeMount, reactive } from 'vue'
import commentItem from './comment-item.vue'

const props = defineProps({
  goodsId: {
    type: [Number, String],
    default: 0,
  },
})

const state = reactive({
  commentList: [], // 评论列表，只展示最近的 3 条
  total: 0, // 总评论数
})

async function getComment(id) {
  // const { data } = await CommentApi.getCommentPage(id, 1, 3, 0);
  state.commentList = [{
    id: 1,
    userNickname: '用户123',
    userAvatar: 'https://img.yzcdn.cn/vant/cat.jpeg',
    content: '这个模型太棒了！非常适合我的项目需求，强烈推荐！',
    scores: 5,
    picUrls: [
      'https://img.yzcdn.cn/vant/cat.jpeg',
      'https://picsum.photos/id/100/300/300',
    ],
    replyTime: '2024-06-01 12:00:00',
    replyContent: '感谢您的评价！我们会继续努力提供更好的模型和服务！',
  }] // data.list;
  state.total = 1 // data.total;
}

onBeforeMount(() => {
  getComment(props.goodsId)
})

const commentObj = ref({
  show: false,
  content: '',
  picUrls: [],
})
function onShowComment() {
  commentObj.value.show = true
}
function handleClose() {
  commentObj.value.show = false
}

function handleChange({ fileList }) {
  commentObj.value.picUrls = fileList.map(file => file.url)
}
</script>

<style lang="scss" scoped>
.detail-comment-card {
  padding: 30rpx 30rpx 0;
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
      line-height: normal;
    }

    .des {
      font-size: 24rpx;
      color: #999;
    }

    .more-btn {
      font-size: 24rpx;
      color: var(--ui-BG-Main);
      line-height: normal;
    }

    .cicon-forward {
      font-size: 24rpx;
      line-height: normal;
      color: var(--ui-BG-Main);
      margin-top: 4rpx;
    }
  }
}
.comment-box {
  border-bottom: 2rpx solid #eeeeee;
  &:last-child {
    border: none;
  }
}
</style>
