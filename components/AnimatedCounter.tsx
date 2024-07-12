'use client'
import CounterUp from "react-countup";

function AnimatedCounter({ amount }: { amount: number}) {
  return (
    <div className="w-full">
      <CounterUp 
            end={amount} 
            decimals={2}
            decimal=","
            prefix="$"
        />
    </div>
  )
}

export default AnimatedCounter
