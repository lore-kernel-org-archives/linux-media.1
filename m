Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193849;
	b=iud4pxShgDJlHFxuYfYk1C08itMIYeBx9OKeQM2WTLrafMt915O/jrqUCQOmfgIWkuzW
	 yiJIz09y3MOAqjU1WZQ7UOhHlSeWpU9ZnAYv7VFfwNjHOtvreMePmdeXNIFAnI1/08x3p
	 ofkzhsXQYrlMn5DyN4JIHBmeMEXH0zlencYzpuklUO//8pzeBz9p2R3DX2E4RaWZLkR8F
	 RdLtwlYqrWNSp9C52CvmMYRMIASqOTMtmVZ9fA2bGNS4cyki3n3gX3KPeKgusCMraLyft
	 XapR+Wf8tbo4Shflx7yJI1oJ2/M9gGLC0BzxHslQ/51+iCBOdwxmDVbPw8o9mrfSsBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rbt4946R0E2yi/41+kWXH2sO+DgKgRQCh9Dm63iCQXE=;
	b=prm36+PdQ80ZY9eVOWS4NIrQU5CBBfWudKKYRS7nnOHDP1ZXKmew80MTeLa7XUGTBR+m
	 RiClb0dbpkljK+PsCZPAI+PT7PTqnJAdzSpGQibebQFJMQ4X+eyuN9UVzamLILXMG5p92
	 5+8MH6gDWjgFzN8+RpYY84jE248cizOu+nEqyvxi8+xHfcNTpuQVxxdNPsTVqBHXInZxr
	 9byV43Em4v/ECQwZxuo0EDPeDYU1Ehpis/cqC0jWtZG/TCWB04Yl02JpfVfK/TE808tSe
	 lM5EWw+yFhpqcrUhEmiMQB7dPyq5geyXyu5P2icnnQEu2COqKEPKj8fHBCgCvYwnq1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ci5MMPFY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cmGs2ba9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E932A606A31D
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E932A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ci5MMPFY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cmGs2ba9
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe22n691855
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Rbt4946R0E2yi/41+kWXH2sO+DgKgRQCh9D
	m63iCQXE=; b=Ci5MMPFYKHMqaVF4u7lTEdJ4WP7YpssWVbheAIabi32IkQ1OgKn
	ee2bcUMGrRoxKeqBD5dL5ZXzZtKtSM0diPpp/dVRkcxSOqTriChKVTG7GPA3ojmp
	wld43gQyFBR3w1JcRcyVwz2EmOUUwQOjKXMvaRgH9lcM1nM6zszVKoqzyxzKv6SY
	oiasfxImdWlsP34EhyqZzFTcisR9l5QNc48CPqPHtFqCa4AfDgfnsbin6bkuQiZz
	dbm2YZlgC4o/pVCXINrP74qZ5w4hh9QtcagGe14RalUsgdRrPeQUE6VaXkETfGMj
	eu74Gf1dNkvywtOEjVcws2Y5iSOuA5k0FTg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be2m9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so163957185a.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193847; x=1793798647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rbt4946R0E2yi/41+kWXH2sO+DgKgRQCh9Dm63iCQXE=;
        b=cmGs2ba93wBF/pStN8AF9As8K5JYX5UazxhOfQ5oqW5qnwEGMQmHc99MBCSBX+g+x+
         Ps6vkL9eTjepr2z4sStt5rnoVF1MWW2fxZ2q8SBaipEr/AZaazWQg1eAutlOlRAWIkxj
         ocv/LaaWRilaLUtLav8tcqqia04wq2jTT0vUI0PaoKLxi/t6xCL7T9LQXd9cstRNC3Z6
         Mi6C/Si6/qIMZLpNqniHmTYATQrIYynnBUg7s4riNbFx3ekvykIhM3VP9hHscwVBJX7S
         WjouO7TxScaIVHCfoNR6bgMJW7L8viGqAeNpzWzgR8bvwtMW63+MDh8VyxFCfGCjjiYn
         tayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193847; x=1793798647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rbt4946R0E2yi/41+kWXH2sO+DgKgRQCh9Dm63iCQXE=;
        b=XldTlhCXlRy+Y5/XKcjlsg8omTeCkvW8sUWiA+G4nOwBqOJk+ip7CJJVJXczlbcWXR
         BFLV2ORTwUP43+DLtv/tH48K+JyeUZctcVxzXOqYI3xo15axIrRt6Eq7vwMxHyCtRkHI
         J6LHMi4V21jdNPFBWy1GGdx2I8ZooMQX/3oLa3V42QcW6KqJPmYgX/F+T58JltZDAeti
         aeD+ADNTtPX1wxyi/uE1IpLpyM3OsgosScqNxPe8ezAgSq1xrRgH5rXAZox4wbwVx50O
         dYD7uCCtqBLX1fQIlRr/9Yq0EuLUOZQXqsy/ZQkEK4X2omcSxy50W0mZIb3OecCV6cOM
         VCJA==
X-Forwarded-Encrypted: i=1; AKwUvBwR0GXWEv/iEbTUajt+epg8/LlSOsUySCNS9OSe7VoRShM4pFBuLZWUwCoh3suXBhzEXcLhYb9XaE4Lzw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIq6L8H/dgFQN+DHSNRzzRV0DecCgFzeFx/IVOyxrSGlR5XbDIz
	FhSxp/1IqlQsa8uHqns9iYla0LBEvbLO7ElRwkZ/yKU9VLWG4YHsqNOtNj6KIvirV0+XFRQsgCl
	4GWmTDhUvJdRphY777mVXUD+lQwlI2F/K6VVaQ0yg13uq3B+Z/E5CNYSLZOTYCSG9tA==
X-Gm-Gg: AYBFou0XpU986vrhNVm98FnDUNLK4JdPdqSclt8p0Cbeth5Dckgqe9PPTBZf+xiRgPA
	HJwNWXpNADtP9R/HNRsCXaRXWVRrFX5wBU/lguk3tfq602wgZn/7URaPyKoSBMxOD/OWozE/rGk
	xk1eywe53VZUuV1QfhpQg9QiYwdqwnb/oyqT+J92Vm7z2DrobLxQtO3/iNx3nFpLurzpd1+StEx
	RQl74QHBHqt+dH6dRLzNokkZI14Vo4vVcwmeS7Zkkl5RWSk4pCiEY4la5XiFjrWQDk0Gdpplbeb
	XclQF98tPiYLSl0o/25nC6MzelvOCQfyUhTTGMAzNHFthIVCfvFfgEKe2kGwE1NDUNnbQZupNpU
	if8VZ8PvFAIaFVhNvyWjpGrgPmv6RVWPo55/t1KPOM3wVIO5wX8gihtlmnnrBVspicJKA1+BtlQ
	==
X-Received: by 2002:a05:620a:4009:b0:93f:115:7338 with SMTP id af79cd13be357-94408d15e9cmr322518185a.54.1793193846971;
        Wed, 28 Oct 2026 06:24:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4009:b0:93f:115:7338 with SMTP id af79cd13be357-94408d15e9cmr322514185a.54.1793193846425;
        Wed, 28 Oct 2026 06:24:06 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:04 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] media: qcom: camss: share VFE clock sources by the highest rate
Date: Wed, 28 Oct 2026 15:23:57 +0200
Message-Id: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: OfJtwBXmdfTbQKpGYosqCiqFNi3GkPOS
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1f777 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=_tAXh3pcZ4U8UltSem4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfXwXB/aPhgYGm1
 yXBUife0+kVcC+P5D34d3olsBRxN8tJHnhxJUbwMEeHp39TQxq4qDD1Hkl7tReMwmTW9xmn58DO
 w83LMGtx7GY3uWHVlKrQrhnQ79TTLFQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX8lheRbooysxw
 ZLcDpJ5ZXFBGwBlMjHw/QevVnYqry2i0L52qBtTd6ZP+JP6qNSSfQhh/dY0XaoCyyGIGpXsOTUg
 BFWU+ohqlwzxlzmC99svJ+5P2iFonL3H7oOkh0jqT6kP1eUhFWjH05XlkcSQNYrYdhdCmfMuQWS
 iZ6JTCHXIxU/goAEMuhS1UK4U8UrWK2mM2pShAgLBaMjQmk+ilCrx4ZhbFSiimRlwCcuv9NDyaT
 1cqovravyxW5rBTJ0HeYonLXw+jVK8asJ8Yq+x8O5x+il279xqhPodCuyHCVTxJ4sakAD4aD6qS
 5HkYHYKZFWrlRMW+9TjbcXEUkQ5yz5nYR57NKHiFZglOZ/opjQ9vBK6BBDxHjkPnLIM26EpQ5ov
 87o9g25e02iveyVnCF7wAvfdh0ia5KP7n2caicXeRZCIfkWb8lpP+/72TqgFopohoPoSz49RbjO
 HjFHO4DLCe1eu9eWvaQ==
X-Proofpoint-GUID: OfJtwBXmdfTbQKpGYosqCiqFNi3GkPOS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280053

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
- Patch 2 keeps failing when the pixel rate exceeds the VFE core
  clock, and clamps the other VFE clocks to their highest listed rate,
  as the VFE clock rate tables need not have the same number of
  levels.
- Patch 3 stops the CSID from setting the VFE core clock rates.
- Patch 4 sets the VFE clock rates as minimums with
  clk_set_rate_range(), so that a shared clock runs at the highest
  minimum of its running VFEs. This applies to all SoCs.
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

Also tested on the Lemans EVK (SA8775P) with imx577 and the CAMSS TPG,
on single and concurrent test pattern plus sensor RDI captures on all
seven IFEs: all streams complete and no shared clock is lowered under
a running IFE.

Changes in v4:
- Keep -EINVAL for the VFE core clock and clamp only the other VFE
  clocks, without a warning (Bryan O'Donoghue, Loic Poulain)
- Use clk_set_rate_range() on all SoCs and drop the vfe_clock_ranges
  flag (Loic Poulain, Bryan O'Donoghue)
- Add Suggested-by to patch 4 (Bryan O'Donoghue)
- Drop Reviewed-by from patch 2 due to changes

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

 drivers/media/platform/qcom/camss/camss-vfe.c | 182 +++++++++++-------
 drivers/media/platform/qcom/camss/camss.c     |  44 ++---
 2 files changed, 136 insertions(+), 90 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.34.1

