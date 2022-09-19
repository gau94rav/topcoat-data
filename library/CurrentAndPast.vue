<template>
    <div class="displayFlex" >
        <span class="currentNumber">{{ format(current) }}{{ unit }}</span>
          {{ format(past) }}{{ unit }}
          <TrendArrow :firstNumber="current" :secondNumber="past" class="trendIcon" />
    </div>
</template>

<script>
export default {
  name: "CurrentAndPast",
  props: {
    current: {
      type: Number,
      required: true,
    },
    past: {
      type: Number,
      required: true,
    },
    unit: {
      type: String,
      default: ''
    }
  },
  data: () => ({}),
  computed:{
      difference(){
          return this.current - this.past
      },
  },
  methods: {
    format(num){
        if(isNaN(num)) return ''
        return Math.round(num).toLocaleString();
    },
  }
};
</script>

<style scoped>
    .displayFlex{
        display: flex;
    }
    
    .currentNumber{
      font-weight:bold; 
      padding-right: 10px;
    }

    .trendIcon{
      padding-left: 7px;
    }
</style>