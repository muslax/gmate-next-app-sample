import { objectify, getTestSequence } from "gmate"
import connect from "../lib/database"


export default function Gmate( props ) {
  const soal = props.soal
  
  return (
    <div>
      <h1>GMATE</h1>
      {/* Check */}
      <p>{soal.length}</p>
      {/* Check */}
      <pre>{JSON.stringify(props.soal, null, 2)}</pre>
      {/* <pre>{JSON.stringify(props.soalByKey, null, 2)}</pre> */}
    </div>
  )
}

export const getServerSideProps = async () => {
  const db = await connect()
  const rs = await db.all('SELECT * FROM soal')
  // console.log(rs);
  
  // const soalByKey = objectify(rs)
  // console.log(soalByKey);
  
  return {
    props: {
      soal: rs,
      soalByKey
    }
  }
}