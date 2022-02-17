import { useEffect, useState } from "react"
import kondisi from "../lib/kondisi"
import soal from "../lib/soal"
import SimpleComponent from 'simple-jsx-example'
import {SimpleSwitch} from 'simple-jsx-example'
import { Condition, Soal } from "samplebook"

const DF = [
  'S01', 'S02', 'S03', 'S04', 'S05', 'S06', 'S07', 'S08', 'S09', 'S10', 'S11', 'S12', 'S13', 'S14', 'S15', 'S16', 'S17', 'S18', 'S19', 'S20', 'S21', 'S22', 'S23', 'S24', 'S25', 'S26', 'S27', 'S28', 'S29', 'S30', 'S31', 'S32', 'S33', 'S34', 'S35', 'S36', 'S37', 'S38', 'S39', 'S40', 'S41', 'S42', 'S43', 'S44', 'S45'
]

export default function Page() {
  const [kon, setKon] = useState(1)
  const [seq, setSeq] = useState(0)
  
  function next(e) {
    setSeq(seq == 44 ? 0 : seq +1)
  }
  
  return (
    <div style={{ padding:'1rem', maxWidth:'900px', margin:'0 auto' }}>
      <h1 onClick={next}>Test Page {seq + 1}</h1>
      <button onClick={next}
      >Next</button>
      <br/>
      <br/>
      <p>SOAL</p>
      <Soal seq={DF[seq]} />
    </div>
  )
}