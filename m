Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834833;
	b=e2uHX/EzJYKNS4iBH1miEiD28FhzLNsQ2bYye9/Yyrmg2SzSnU0WM3FVg38IweuTeWce
	 Qaoj1mm3MNJCCP/aIQOAugPmCDf90MJuMtiI1h48LaHbwYM0i/hyjCUorOUEtKsDwc77r
	 G8NUwzr85rXqPwpP1q7+LCviKxJyerFpD9TnJUHkL5S7m/mu/Y9iJ6zaynaZVmftxZ+BW
	 VgITeF4bBrwx6u4+r7uCK2AoPxtJcYgpEgED9yClMr9X1cFTJxV961WoOUdbvT0jJoEdP
	 w8G3YsN+d4eLr9Kx+jHUMPsnbWNPUPnzGIh9vcVSX1aIApscPnzqiBKKHYiQSdQAGEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uEG4u2CQ/9TFubC4sZQG5u8ciiNwJ/m/8ij1aKFIvPc=;
	b=nrRkyg/UDFIlsj/1FXS7OOSQ2C1Q5cEEwq66WSceY7OOaNPrLEPJgFbnk18C8uSqP5dO
	 Oo8zepr+lpo1YMByVgljNOAs7LN86WA9xdh//SeeQvw7nGse1Yc3s57o7w4YHVWQRY5w8
	 rz2SidQ7nl9e5LggCj5RbirAuehzSeJUWcyX1ysmRjSWVSj+Te9DjWKaSGU+iE6OqUYXS
	 XevMkgLdqe5tEvmmfCxQEde3D6SKeaJ75Qg93u/bxOWZxzeAJEc3K5uPQZl/TgHGIxnmT
	 DaUhfvyqqutZoP2w0Isz910dc+hsbGDBoMmmTWRDIthm2NksSNiM3ahklAIf0KQNR7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JvUqOVOu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1Kmasu0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560FA606A320
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 09:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560FA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JvUqOVOu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1Kmasu0
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8oTJm2217627
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 09:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uEG4u2CQ/9TFubC4sZQG5u8ciiNwJ/m/8ij
	1aKFIvPc=; b=JvUqOVOu/49jZEeWR1P07NNxL71LuO9fN3xAUlAdO4W2RL42UkL
	o8wQ1XSlTR6xs3K0KJk5NahJHJ6AzgyYulK99Ga8GTt0TQagQtoFGjZUAYtdDPHh
	C0by9lvDKN+j/7nB/1Ep7Yud78Uw7Jf8q6pLmgeRb4WZAL3hSx7qgnpxMw/VK35U
	UuRKBuiXGwNjhybLhmv3Jk80Imxc9g9ff8dNpTNbKAYIt2s9dvLqtgl57kLtdU2K
	Djtwq294uhMCmjqh9bLnYjTYJtw/e6pa353KEE+EEoZUJuZ0oh49qwa4OtlRu3y8
	AvDmUPgKdaLTjnPSOnurg7i2AfJhBwYeLgw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgry77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 09:40:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5383d650f2dso6964581cf.0
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792834830; x=1793439630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEG4u2CQ/9TFubC4sZQG5u8ciiNwJ/m/8ij1aKFIvPc=;
        b=d1Kmasu0XvWAaC0vPtyBnUMIKMfdBwQIzRMdj/dk58X4ZJVZjgvepjF14Io+do2+LQ
         SGsPlKtZ4JtdgTSsNnb9fqbqu9sDoZz6G+MP1RO5GnR+hUCDUGEnGGy0JRVCwBZz/CxZ
         JMq65Tm1CJdZFCsQ0rhsUtT/vtrgELT742vj+ZgbTo7bO/9zCTzy/8Le/0GWev8nKYMJ
         0TFsxoTrt1sBtNgUwkxbZlKdbGKbZUhc32XwNWNkfn9bWEArocp42DTtniMblgZ73sVL
         q7HU5pmtldugGHw2Q5zafhf/+9I14JvPShRTdbpKjXfts3cfNgS0s2yDSO+8Emurf8iV
         2kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792834830; x=1793439630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEG4u2CQ/9TFubC4sZQG5u8ciiNwJ/m/8ij1aKFIvPc=;
        b=L1Ap4FaQpaGL4Q4tAvYqlnbpLpGNgmxbRdqNGWoeangbqPcshg3cFh23eh0IESjxMI
         99TJ9YUzHzxtzrMZDaLImeW/ySdL+l1nYUeOfLm5bpUhQPJYWbPthokdfWk84Q/WWlT1
         rou5o1zX7DqHLh7ua4pk1rTK5KjJ/yrXMWtHam14+Q5sAQwvIUyuADlyASJ5PQ30Kjfa
         YT6ErjONNtPJGQSQUv/CzogGMulfUdTznwN8AWmEFtOfzlwmVNmPvlo6gQUyrHlxNi9d
         reFUYSpICvlpHR9KW5mfBogxKUJclyb/cnMbQgC95CX9UUe+Pi7SShvqlV9lYhylK1VM
         CbFw==
X-Forwarded-Encrypted: i=1; AKwUvBwkXuW8OCqzJNaGdDcEn2IJ7GQYxjW7lSla3y/wc022c0axb+ajKlhMezcuGUrhbm9pd9tyiCt/S40lbQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIR2BaTX0hFV1cJkE+i82IfGftFi3e2oKgeIYeMPDstmKAp39xl
	PadPK2LSveI7f0ghbKTmQjK64KhAy/yKCaQvS+TgkvBo9r6vJZgtuHAmC16lK1s0KjGX0oW2PkR
	4QheVGxY/A7//x+XnkVXzFC87sI5PgfKLoBQ34klcI3XeqKotQulT2mrpCUWfMnrDrw==
X-Gm-Gg: AYBFou3KWOeasgC0PbAIEowKim6ECOmJJKft5Bz2kDUdddz0BuhtWNTtF3RYk6kp2Yr
	s8Vbd79hOBEQ9ijEui0mWpO5vHDmhQTm65jaDLQym0AVh99Wmbh2eeAsAfGgdFC3Zsl43ojKRfs
	Zftw9X5D9ZddYly8BtopMLupGY4ycNC7jz6/3KC9Kr5MPiN01xZVkgnx4MSCntes92tw0TwRd9T
	njKiuDiKamPlCPERuD/qj9KWCGjBxPXZ88m6DN9huWpepRdPR30hGR8G/+LxC64EkzxVtDyMyqb
	TYAp5PuxoZjHXVtVq3T2nvv2UMtV1xj/RSbraz6QchtSZVpJTkJHVl0/Jb8P1n6eeZQ3OQvtDaN
	SUD12100flLbqlP/eMs8QQeTw
X-Received: by 2002:a05:622a:4e88:b0:535:a5fb:645d with SMTP id d75a77b69052e-5383b6b7b1cmr15587441cf.72.1792834830384;
        Sat, 24 Oct 2026 02:40:30 -0700 (PDT)
X-Received: by 2002:a05:622a:4e88:b0:535:a5fb:645d with SMTP id d75a77b69052e-5383b6b7b1cmr15587221cf.72.1792834829901;
        Sat, 24 Oct 2026 02:40:29 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm2857166f8f.13.2026.10.24.02.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:40:28 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] media: qcom: camss: share VFE clock sources on SM8250
Date: Sat, 24 Oct 2026 12:40:21 +0300
Message-Id: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX6ALPA1d6tN9N
 U6441UPWbcii/9P3hWNzW+E30QuK/dTQrFF+bGVH3mrHlYggw05QAnwCz1g5daqk0XfpHpvt3u9
 snmKYL56DAY5/XrowuxtuskVnXZ2TL0=
X-Proofpoint-GUID: jbpyJuUKZ74XSs_6MgaXL5a9KBvhqnZ_
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6adc7d0f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=dmj4VTlxVhTCmNQHaQYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX5xnidAVEB3ir
 IdtWNp7ocs13WpGHN0ZsO6CAr7geI1RUYRbqZ3ZzR2doQEQfWEYrJk68uSpF70atdxBNmvHBFpr
 Cna7C3+S5kHbLLXBHrHw3vOeqgNEIKJWAmR5+IcvZ21+vucpdsviCb7IENnJ8P/3dgSDf6aI/qU
 GdqDw2aplUb9HR/Tz7Ln6dc1QNf/ctkiHJWx2rrR0cIz/tWNpQqLm9XzRNT1qBEaAQAVPwcJnBS
 J2nzwOHhR193qzFmWFiJFft0CiQOp3vRrPLGbM8Zmn6eX9Fqc9z+xAcGTfmgL+93GDtoRTMBeLk
 3x36sYYEUHQXyQBxlSKOD/dn2Rg663mlmD7nb4pbxDaJ1JpiHDjcTuFWMeP1rvt4CzdloMV0ogq
 4sbeYBQ3kfyYkQSdwFeR52eh07c+MIAp+81n02WlyLoE7MMRkWXztvJbtxgax775r2fb+FbApoL
 k9VektYgpS7swJRb2sQ==
X-Proofpoint-ORIG-GUID: jbpyJuUKZ74XSs_6MgaXL5a9KBvhqnZ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240038

On SM8250 several VFE clocks are fed by one clock source: the AREG
clocks of the two full VFEs share the fast AHB source, the two VFE Lite
share one core clock source, and all four VFEs share the camera NoC AXI
source. Each VFE sets such a source to its own rate, so the last VFE to
power on wins and can lower the rate under a VFE that is still running.
The CSID also sets the VFE core clocks to their lowest level when it
powers on after the VFE, and nothing sets the camera NoC AXI rate, so
the camera NoC runs from XO and two concurrent streams stall.

Two examples on RB5 (QRB5165):

- VFE0 streams the CSID test pattern and VFE1 then starts an imx577
  stream. Nothing sets the camera NoC AXI rate, so the camera NoC stays
  at XO (19.2 MHz) and one of the two streams stalls. With the series
  the VFEs set it to 300 or 400 MHz and both streams complete.

- VFE Lite 0 streams the CSID test pattern at 480 MHz and VFE Lite 1
  then starts an imx577 stream that needs 400 MHz. The two share one
  core clock source, so VFE Lite 1 lowers it to 400 MHz under the
  running VFE Lite 0. With the series the source stays at 480 MHz until
  VFE Lite 0 stops.

This series lets the VFE own its clock rates and aggregates the shared
sources within CAMSS:

- Patch 1 moves the minimum rate computation out of the VFE clock
  loops, with no functional change.
- Patch 2 clamps each VFE clock to its highest listed rate instead of
  failing, as the VFE clock rate tables need not have the same number
  of levels.
- Patch 3 stops the CSID from setting the VFE core clock rates.
- Patch 4 groups the VFE clocks by clock source, so that a shared
  source runs at the highest rate requested by the running VFEs. It is
  enabled per SoC, so far only on SM8250.
- Patch 5 lets the VFE set the AREG clock rate.
- Patch 6 drops the unused camera NoC AXI RCG from the VFE clocks and
  lets the VFE set the camera NoC AXI rate.

The camera NoC AXI clock is also used by drivers outside CAMSS, and how
to aggregate their requests with the CAMSS one is still being discussed
on the CAMNOC interconnect series. Patch 6 does not depend on that
choice: it only aggregates the CAMSS VFEs, which share one source, and
fixes the concurrent stall today. Once the shared camera NoC clock is
represented, the VFE will request its rate through that interface
instead of setting the clock directly.

Tested on RB5 (QRB5165) with imx577 and ov9282 sensors and the CSID test
pattern generator, on single, concurrent test pattern plus sensor, and
concurrent dual sensor RDI captures on all four VFEs: all streams
complete, the shared sources stay at the highest requested rate while
another VFE runs, dedicated clocks drop to XO on power off, and the
camera NoC AXI clock runs at 300 or 400 MHz while streaming, without
the concurrent capture stalls seen before the series.

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

 drivers/media/platform/qcom/camss/camss-vfe.c | 138 ++++++-----
 drivers/media/platform/qcom/camss/camss.c     | 215 ++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h     |  13 ++
 3 files changed, 272 insertions(+), 94 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.34.1

