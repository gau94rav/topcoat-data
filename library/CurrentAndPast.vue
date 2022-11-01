<template>
    <div class="displayFlex" >
        <span class="currentNumber">
            <span v-if="current && current !=='0'">
                {{ format(current) }}{{ unit }}
            </span>
            <span v-else>
                {{zeroDisplay}}
            </span>
        </span>
        <span class="pastNumber">
            <span v-if="past && past !=='0'">
                {{ format(past) }}{{ unit }}
            </span>
            <span v-else>
                {{zeroDisplay}}
            </span>
        </span>
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
    },
    zeroDisplay: {
      type: String,
      default: '0'
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

    .pastNumber{
        color: black;
    }
</style>