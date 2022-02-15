import { useEffect, useState } from "react"
import { 
  objectify, 
  getTestSequence,
  randomGroupKeys,
} from "gmate"
import connect from "../lib/database"
import Soal from "../components/soal"


export default function Gmate( props ) {
  const soal = props.soal
  const sekuen = props.sekuen
  
  const [seq, setSeq] = useState(0)
  const [soalAktif, setSoalAktif] = useState(soal[sekuen[0]])
  
  return (
    <div style={{ padding: '1rem', maxWidth: '900px', margin: '0 auto' }}>
      <h1>GMATE</h1>
      {/* Check */}
      <p>Urutan {sekuen.length} soal = { sekuen.join(' ') }</p>
      {/* Check */}
      <pre>{JSON.stringify(soalAktif, null, 2)}</pre>
      {/* <pre>{JSON.stringify(props.soalByKey, null, 2)}</pre> */}
      <Soal soal={soalAktif} />
    </div>
  )
}

export const getServerSideProps = async () => {
  const db = await connect()
  const rs = await db.all('SELECT * FROM soal')
  console.log(rs);
  const leaderRs = await db.get('SELECT leader from meta')
  const leaders = leaderRs.leader.split(' ')
  console.log(leaders);
  
  const soalByKey = objectify(rs)
  // console.log(soalByKey);
  const sekuen = getTestSequence(rs, leaders)
  console.log(sekuen);
  
  return {
    props: {
      soal: soalByKey,
      sekuen
    }
  }
}

// function groupByKey(array, keyName='ref', targetName='seq') {
//   let grouping = {}
//   for (let item of array) {
//     if (grouping[item[keyName]] === undefined) grouping[item[keyName]] = []
//     grouping[item[keyName]].push(item[targetName])
//   }
//   return grouping
// }

// function objectify(array, keyName = "seq") {
//   let obj = {}
//   for (let item of array) obj[item[keyName]] = item
//   return obj
// }

// function getLeaderKey(leaders) {
//   return leaders[Math.floor(Math.random() * leaders.length)]
// }

// function randomGroupKeys(group, leaders) {
//   const groupKeys = Object.keys(group)
//   const leadKey = leaders[Math.floor(Math.random() * leaders.length)]
//   const leadIndex = groupKeys.indexOf(leadKey)
//   groupKeys.splice(leadIndex, 1)
//   groupKeys.sort(() => Math.random() - 0.5)
//   groupKeys.unshift(leadKey)
//   return groupKeys
// }

// function getTestSequence(book, leaders) {
//   const grouping = groupByKey(book)
//   console.log('grouping', grouping);
//   const randomKeys = randomGroupKeys(grouping, leaders)
//   console.log(randomKeys);
//   let sequence = []
//   for (let k of randomKeys) {
//     console.log(k);
//     sequence.push(...grouping[k])
//   }
//   return sequence
// }