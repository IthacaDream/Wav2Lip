#!/bin/bash

declare -a jobs

wget 'https://iiitaphyd-my.sharepoint.com/personal/radrabha_m_research_iiit_ac_in/_layouts/15/download.aspx?share=EdjI7bZlgApMqsVoEUUXpLsBxqXbn5z8VTmoxp55YNDcIA' -O './checkpoints/wav2lip_gan.pth' &
jobs[0]=$!
wget 'https://iiitaphyd-my.sharepoint.com/:u:/g/personal/radrabha_m_research_iiit_ac_in/Eb3LEzbfuKlJiR600lQWRxgBIY27JZg80f7V9jtMfbNDaQ?e=TBFBVW' -O './checkpoints/wav2lip.pth' &
jobs[1]=$!
wget 'https://www.adrianbulat.com/downloads/python-fan/s3fd-619a316812.pth' -O './face_detection/detection/sfd/s3fd.pth' &
jobs[2]=$!

for job in "${jobs[@]}"
do
    echo wait $job
    wait $job
done

echo "all done"
