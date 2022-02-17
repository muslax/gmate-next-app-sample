export default function Soal({ soal }) {
  const pilihan = [
    // soal.a, soal.b, soal.c, soal.d, soal.e
    { p: 'a', text: soal.a },
    { p: 'b', text: soal.b },
    { p: 'c', text: soal.c },
    { p: 'd', text: soal.d },
    { p: 'e', text: soal.e },
  ]
  
  return (
    <div>
      <div className="soal"  
        dangerouslySetInnerHTML={{ __html: soal.konten }}
        style={{ lineHeight: 1.6, margin: '0' }}
      />
      <ul style={{ listStyleType: 'upper-alpha' }}>
        {pilihan.sort(() => Math.random() - 0.5).map(p => <li key={p.seq}>{p.text}</li>)}
      </ul>
      <style jsx>{`
        .soal {
          background-color: #dedede;
          padding: .3rem 1rem;
        }
        .soal * {
          margin: 0;
        }
      `}</style>
    </div>
  )
}