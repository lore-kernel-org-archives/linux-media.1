Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021854;
	b=QKsxLhVXsRfCm1LDKxxqIMvfgpT7Sr1NrD/IxIql4R4hHdZu0uSOHtT1AmfnXf35jKPp
	 iI5Df+OnIYNeiUA/kqqAI/GmLH9IuS+KHiGejATqYI9m46tcB5soZxzhc9jiOXLjTvGRl
	 V6E+Jnr2n2DoJao9TfpR/O990OkZqHthEaUk6He7SqEzHPAb0rQX1DnmDxLZqCbkjRRBV
	 wtpZ51tM+4ik72QqlgdhxTvJbV+D3BX9+pb47ue8tpAqH2OMN8iynTELaWLF+5hIBuBbM
	 nQlOR2PRu5oAwsjjPjWlmXWgiEYm3nnghvBYV2/59Wcyp2czWVTDJj6FVmvsVQizFTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HDyPThA9uqqvFCvUuilv+d/PDd4i8q3LtOLUfFd7EYA=;
	b=MwlIBxQPpzUcGMvL5mLqjZAX6/r+IwgjiCIbfNDGVzfujkil4MMul7rbFNQlOZh2Gf42
	 AmdRa8HvXciTxoxU9A3/W2CC309HaiBIMBp4Sk+3qP1j4ra9OL1QFGqbKuMINQtzardvo
	 6+HepQjhxI0Uaon1ME98/1UdgyP+dAwv5eB3nZuWKzU/Li21TEtxH3cjUd6L9Hlb2/s+2
	 8vIW/JIUYQ48q88I0V4BLP9nrk7lRQkgboQEHJtI2GYCMbvISJuBcHOYhHNbQEIIRztz9
	 4DIO8dKsTUTPrxg1P3GircDtttzDpbLeM173TYeiTseHBsV5G25A0x5co/hoCY8cyvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jCEA33ep;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvGjii8Y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B192606A336
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B192606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jCEA33ep;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvGjii8Y
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtNXC3050893
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HDyPThA9uqqvFCvUuilv+d/PDd4i8q3LtOL
	UfFd7EYA=; b=jCEA33eph8C6GeyxTjW787UxjW8BtrMTensOHj1yG5ceKgBMCGS
	ZPpw3MjOHMtSnOFnp6IHnqptD8ZVavPnX+smq9N/X6Rk3LiexzJMZArcbBnHypOr
	PlHbpE4ufK93Has30agt1jzzslumKSOG/66mqPkcdAsBLxuEbf4QtRUhh53+A0pW
	+49Hk4BvgXtR0Lkug9XkXuLAJr7M41DzN8CcVjnshSjflD2NQnJcOOGGgBEemoOE
	Q5wmdIWEAWgqr8aCZ1Ie0nKNXYx8sJr41Sxh/hq6833KFcM3yt2Nzz0OOqyNLuNA
	w7jF19922KPHDpcEDjqGCF0jTr0mOUv1bjQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvddacax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso746957085a.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021851; x=1793626651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDyPThA9uqqvFCvUuilv+d/PDd4i8q3LtOLUfFd7EYA=;
        b=GvGjii8Yio4KNcqF33yBw7i1Y2SVjva2THzZFWKNpe7y6ZD0h9N+hzUDElOj7R20Iw
         C/W2pQCioGmSnYN9bY5QE7PZBt9xZDh25I2xiOh2z1Lm8l6ySuzcOF2boCuTvHhfu6nO
         CjbMAu/+Bn/ncMJvGFQ12TjkZSvB3D9E+T3PFn9j59WyfK1Ku7mg1ZGM8Lc+DVZCJx0e
         2aSQFZPPKH5mH1wh1aEpjdaUgfc4kQKlmoYR/F5jti3lC31I5s1w1DSgrqDpWbaH6SIz
         UYaZdwc1DMuzIJZU473he+VVTgfzmHjBK4VxgwvOdnpZfEpYNlGxQ1MgiozR/uYLYunR
         4Z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021851; x=1793626651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDyPThA9uqqvFCvUuilv+d/PDd4i8q3LtOLUfFd7EYA=;
        b=o549Iy59f9JV1F54S/k9UJcCyqViGXThTwypkEAYFAXFQe9Nu/aR2FakvlS4NVBhkG
         bkqu50XfDPtSdyX6rzTtulF/e/TMFAWGlMbe1n4qij8VtH3NaW9WNa2uq8FtdpbdVZRA
         viL/kRpZQ49PoURYXvcwJi2MuBOjuWrYQ8W+8WSx5B0wMAAM/S+28Kwl32kusJTOi/zu
         elfqFqGPmM/cHS9owwaM2A6P4HqqPxPqh7OCjcQPkXV2E+27yOy52YsxrrbJkx3VTNLk
         3MfOS8aZbw46vNX94+bKQfsa5GglCmUWNhxzuhZ3fmb+Ot/TXoY0jOjOaSh1/CNcXMY8
         gdVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUdBLaxwLSqha+klpNXBqllC8gzSMVuoSUYzsiKpxq+lXcU9LpjZbyKY9LDdat5cTSQ2SkISjIRwycYw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKXZQZyFGTez+1aqdFcwC7d0DHD1TCTHM/dNUfq8qRWyC1J1skY
	wKHbRpOVzJokp9g53R3Dck1mOrabFSBvKGdyw6EEt8x/Q7hnp3MgzC36hjtR6RaAd/vk7vxGGk3
	iXM1uczx+LoFVybp791sWajA+InCx1PQbZgCwMwJgf7v5bCeL2iuvmDDa1jhcHZJDwQ==
X-Gm-Gg: AYBFou3PlKBED7SvSqlMYykzYd/3iFCzecjXoF4gJ2EzjcJiFX1z/soTSpMYlAO4+eA
	WKisP2NuuWkAu/Afa7m1HRJdHKc4gF6C7wldDVwbv2dmbQYvLZnjVLbcvMxxAh67r1+2Q7dpwtS
	uX8VSuxbFVpfOTOJB3ByPav2b7Oojf4o7xUmVXUHN1YokfinXOxu+l8SacMWyl8L+5dx98kFuZi
	Sl3PwhsEWsM7RDckRM/nwMDz7VHEwyC/GfiEDTCaiklH9dZhoQqsBLOBIwlC4y6TapuRONONhYR
	skjufkntg3Mocp8S8QcU25BPvpxFRqHpNmu2cepnMlgNP67PLnGW6n1SJWvTDZMVv5UtqeMJsqB
	a4AkaM/8kXKn6OdWz/6C0B1pf
X-Received: by 2002:a05:620a:4543:b0:93f:21db:851a with SMTP id af79cd13be357-940ef9f050fmr926294285a.40.1793021851062;
        Mon, 26 Oct 2026 06:37:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4543:b0:93f:21db:851a with SMTP id af79cd13be357-940ef9f050fmr926288885a.40.1793021850507;
        Mon, 26 Oct 2026 06:37:30 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:29 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] media: qcom: camss: share VFE clock sources on SM8250
Date: Mon, 26 Oct 2026 15:37:20 +0200
Message-Id: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mgHh1IJcU5zYZhn58rzl1BvmwzIDnEpS
X-Proofpoint-GUID: mgHh1IJcU5zYZhn58rzl1BvmwzIDnEpS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfXxV8op2OxOkyE
 20pTQqGY7GPU3raZofy2vJL/AiCiOlCYva2qPMBs/W2UILm6BVEguBOUoHNQAtedDrE7DC+qfbk
 1EsdGMdYMlhTKuR9P907PkArAQ8PE6LedWehaL0EeGUyRMv1csnGgXDHjt5y8wsQSnIIYm9tHZX
 NaNhBh21rP54vAbmDLQ4HU9Gel/VcHLG+eEiv12HsLxXjyiuFUjLtCERePURPoUIMqEjtfntYuj
 ZDxBF+i1QMlfALGbtS3V6eH+Yb8AwxC0UTfJmtjLOCxutWX6zKUB1U52DHaBZGXsf/O6Sj9iTeF
 JCINtBCJbVVFX6huqr4cUwOvT10MG4n/o8LtpJ7p5JBdjnHTrm9eacpf/mgCOnrRqpAvsgFFPm/
 917f8KypA5G+jr/6GONszqVBWdoTLRSk/+G78ZaijIHaxZELVetYLVULXZgNWWs39OSpsqhAfc3
 aPmO0BVyimOEkqkqDEg==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf579b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=H30tMkuWy4VXr8aHEoAA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX/L7xa6WjAwez
 TrbG3bG7x6c9f4M3jiEGCc0fJ7dB538PebROlte2t37yIjLM7qacuQGFoMaa0C4ikvwFiZUyAQt
 WAyyHE2l+jmJDc0feGe1GBCsvLmc5cc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260054

On SM8250 several VFE clocks are fed by one clock source: the AREG
clocks of the two full VFEs share the fast AHB source, the two VFE Lite
share one core clock, and all four VFEs share the camera NoC AXI clock.
Each VFE sets such a clock to its own rate, so the last VFE to power on
wins and can lower the rate under a VFE that is still running. The CSID
also sets the VFE core clocks to their lowest level when it powers on
after the VFE, and nothing sets the camera NoC AXI rate, so the camera
NoC runs from XO and two concurrent streams stall.

Two examples on RB5 (QRB5165):

- VFE0 streams the CSID test pattern and VFE1 then starts an imx577
  stream. Nothing sets the camera NoC AXI rate, so the camera NoC stays
  at XO (19.2 MHz) and one of the two streams stalls. With the series
  the VFEs set it to 300 or 400 MHz and both streams complete.

- VFE Lite 0 streams the CSID test pattern at 480 MHz and VFE Lite 1
  then starts an imx577 stream that needs 400 MHz. The two share one
  core clock, so VFE Lite 1 lowers it to 400 MHz under the running VFE
  Lite 0. With the series the clock stays at 480 MHz until VFE Lite 0
  stops.

This series lets the VFE own its clock rates:

- Patch 1 moves the minimum rate computation out of the VFE clock
  loops, with no functional change.
- Patch 2 clamps each VFE clock to its highest listed rate instead of
  failing, as the VFE clock rate tables need not have the same number
  of levels.
- Patch 3 stops the CSID from setting the VFE core clock rates.
- Patch 4 sets the VFE clock rates as minimums with
  clk_set_rate_range(), so that a shared clock runs at the highest
  minimum of its running VFEs. It is enabled per SoC, so far only on
  SM8250.
- Patch 5 lets the VFE set the AREG clock at a fixed 400 MHz.
- Patch 6 drops the unused camera NoC AXI RCG from the VFE clocks and
  lets the VFE set the camera NoC AXI rate.

The camera NoC AXI clock is also used by drivers outside CAMSS, and how
to aggregate their requests with the CAMSS one is still being discussed
on the CAMNOC interconnect series. Patch 6 only covers the CAMSS VFEs
and fixes the concurrent stall today.

Tested on RB5 (QRB5165) with imx577 and ov9282 sensors and the CSID test
pattern generator, on single, concurrent test pattern plus sensor, and
concurrent dual sensor RDI captures on all four VFEs: all streams
complete, no shared clock is lowered under a running VFE, and the
camera NoC AXI clock runs at 300 or 400 MHz while streaming.

Changes in v3:
- Replace the CAMSS clock domains with clk_set_rate_range() and fold
  the rate ranges into patch 4 (Bryan O'Donoghue)
- Fix the VFE AREG clock at 400 MHz (Bryan O'Donoghue)
- Collect Reviewed-by tags

Changes in v2:
- Split the minimum rate computation out of the clock loops into its
  own patch (Loic Poulain)
- Add the Fixes tag to the CSID patch (Bryan O'Donoghue)
- Split the clock grouping from the AREG clock change and add an
  example to the grouping commit message (Bryan O'Donoghue)
- Rename the per-clock entries of a clock domain from user to vote
  (Bryan O'Donoghue)

Atanas Filipov (6):
  media: qcom: camss: factor out the VFE minimum clock rate
  media: qcom: camss: clamp VFE clock rates to the highest level
  media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
  media: qcom: camss: share VFE clock sources by the highest rate
  media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
  media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE

 drivers/media/platform/qcom/camss/camss-vfe.c | 172 ++++++++++--------
 drivers/media/platform/qcom/camss/camss.c     |  45 +++--
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 3 files changed, 122 insertions(+), 96 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.34.1

