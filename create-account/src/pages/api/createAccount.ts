import type { NextApiRequest, NextApiResponse } from 'next'
import soap from 'soap'

type Data = {
    name: string
}

export default function handler(
    req: NextApiRequest,
    res: NextApiResponse<Data>
) {
    // @TODO: Fix the client
    soap.createClientAsync()

    res.status(200).json({ name: 'John Doe' })
}
