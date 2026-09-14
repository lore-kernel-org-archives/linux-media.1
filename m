Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C88E46D08B
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 13:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390848; cv=none; b=kViiX1f9GR/4CpjSuJ+zF3HiV48qo4/qjdfG3Y5MJ3A5dFcqTc3UCLeLjK8tl23zoo2jfQPpDU6GsAgAIH/AWkSeEBwpv/J9o1X4ItmolYXQmmy3qXifNuZ/1XA55nbptkG192xNHS1q9cyE8vCwdLraje6mYzcCmHLkZN5D9+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390848; c=relaxed/simple;
	bh=DaDbHNeN4t5mWpqn5BX3VVxBvhsm7lc6Nt27ZTL5VaE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hc8L8ixMeyusFKEoFd6NW7OiwREnwCTHlskuiFmMzWXOVL38Zgcq7GxUzMLxt4/TlWhVS0/x4JhlLHs/KPVPQi4schFiwsvNZvbTBYOEs9uTgFcgxraLIpBs+1XTBytK+s8BgU2zZ/i/iSduSqvxrC8zc+l9FnGs7ORD9NuCT+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3yUxiee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WrOqZMx3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3yUxiee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WrOqZMx3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0k4q512759
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 13:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rUKMc6/2Tr33/R/vteANGl
	I/EES5zZPlIHe9498n0fg=; b=F3yUxieeZHjIoUz8+FxUO6hLbyn9Nw6FDZ0LOJ
	OHj1nPYYHY+BCYrjw9Ps6p52X/O1DEmwV8YMkSaFoSuOWvlq+fXgIadc41gQ/tGD
	ajBDRp5LiOh0HYZkpCpaZKauh65h0TDfidDZO9A2DAXJmnM1IdhO7nYUxQw4qDhC
	Kc1IWTU3439kt1thJPhcj6QJBe6HLABpsi8lRVYwf9sEc3+kdKI5Vs0olV8xrFaG
	G7sHvre/yg6jLl6rYSYuxY1mRHzRLLPkJLCgOIjhkmTLd87MMzDfdft4bB6ulYYQ
	Af4JzFSGbBNlvw2clZ3cf2dqi6xF5ZTCDz2uUPRUHmgPTJcw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtg3wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 13:00:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d9336581a2so64151745ad.3
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 06:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390842; x=1789995642; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rUKMc6/2Tr33/R/vteANGlI/EES5zZPlIHe9498n0fg=;
        b=WrOqZMx39IaQRyhtx2JNQxj9ASsnWBs4E446tnPLko6XUsDKI3TxILfDsj17OohgKz
         cs6GpG54ySfH1fPXWNOfyrncmA8hd1xi52EH2vTJJvMNHBdWTW4+CnqBW+ywsY5Y6YRs
         OF5u31ZzPgtGYuUTWvweo+hmrrt4xPzmzWtD3C7FpOjoecOQiTclYGp39QsIt5ef9ozm
         jWuCtGWsVtDZ+xlJKXTpFAheb2wZVBmO8NZsyA/Jad8ILBaCWxUK2yIk3r5KE2/vFHoT
         tC1JNDnCcNrczGYNpU96VXJvswm7bzqWVsCeHTwIB5cZP/HaR+wUSyZ1aIEVdPFnxjSS
         SkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390842; x=1789995642;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rUKMc6/2Tr33/R/vteANGlI/EES5zZPlIHe9498n0fg=;
        b=bq+3lxgRRw9pO9EszpgVJn6n1/XDoGTg3XMKfHcIFeFBiWHpBR07a28xeLFIuhaEvm
         KEUzf77VOT1na65aLSjmHYNrWcWV6D9+bTmzydByyAaN+SBGsfgalbgf8QcWeNpPMiMT
         p7mJ1BX9grv7L2X8U297QPVTt+oFHzcPGlvJR7MZb+JWDDlFmglWX9CgyGhtf/GU5NTs
         YjpoG1DrwjM5+PLdRd8fxG0kRAKQON0sAq68m+qBtkB9ozO51Djoiiye8oN36OJo31Sf
         RGYozKSC9/IoYN0RcMIdbLhzgKfgxbDHIQYvt7wBNjcisLbBjbhtduovhbskxvj0xCIL
         loQw==
X-Gm-Message-State: AFuF++kwYNJNyIR+auigf1kTXlrCOCu9VfdDqO3PtbMRsElAVrzMpYi0
	KlnslqmA2H1SojiJCkeuyJaDqQAkvsz9UjqLPh6pLXJvHFSFCQTQZFku389QXxG/roisfrYPJAq
	8YBSBFKbbVCwc4hoMurw+K3qG4uF3Uiwqsqae+LJWFJ+hnsIuoHVKLmq3h0U3Ydddsg==
X-Gm-Gg: AYBFou1WK/c9YPCr3Q4gKIT0zucWaJ6Z6sQKKBPWErHyE+3dcHQXZDo+C944ZZpHw0Q
	03NaPJb9vJerVUvwbtx8j2aGVRQYqk9WNN4TcL0bok1E0Jntf30rB8vjErasRpM6QD+0NjTrmgo
	p+M5zUELT1dph6llNxs0hL7IC9fgBLngdXf7ysv3wStYZcutXdSn8jGEPBAIg5g1RfPft9mUlm6
	5YfiKI65OmUOxXANhUDrEKF5iuV0Fbz+unwAg3Z1phdcbW0fj/a9cc6NjVEzjjFcTgK+SgSsUoQ
	PbykqXvtTyqrUF/IieJgq+PGrKe/kKVLMFV9EBFk6h+5nXYqhtTDwT2m6BC1XyS5OM2g2m9h+PZ
	0yzEddh6Cr8++TOlm36NBoUSgsIJtgJXc6DJSR5Q3hFqTTzYGljNOfcJugbmZuhEtrcVMAB7Faq
	Q=
X-Received: by 2002:a17:903:1b50:b0:2db:8ae7:a5d2 with SMTP id d9443c01a7336-2dd6c5f39camr55507125ad.9.1789390841510;
        Mon, 14 Sep 2026 06:00:41 -0700 (PDT)
X-Received: by 2002:a17:903:1b50:b0:2db:8ae7:a5d2 with SMTP id d9443c01a7336-2dd6c5f39camr55503085ad.9.1789390839726;
        Mon, 14 Sep 2026 06:00:39 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb6861sm47434965ad.36.2026.09.14.06.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:00:39 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH 0/5] media: iris: add support for maili platform
Date: Mon, 14 Sep 2026 21:00:23 +0800
Message-Id: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOfvp2oC/z2O3YrCMBCFX6XkeiOTNCSmV77HImHSZtyB/mhiy
 4L47qYK3hz4Bs435yFKypyK6JqHyGnjwstcQf00ov/D+ZIkD5WFBm3BKyNxGAJnLoGWHCbkkSX
 Z5LRrKUZoRS1ecyL+f0t/zx/O6bZW9/1zFBFLkv0yTXzvGntURpM/WiIwUUcHsVVDBCCnfCTrg
 axBj7t6SqXge1TXfCdt1zVwle25Yaizh5Hni9yMBOmjB2fQtb1Rp6WUw23FcX99qCHOz+cLb69
 PUwMBAAA=
X-Change-ID: 20260914-add_iris_for_maili-f6e7273fbb03
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789390835; l=2734;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=DaDbHNeN4t5mWpqn5BX3VVxBvhsm7lc6Nt27ZTL5VaE=;
 b=u9fIpoIP3v1abLl9QILMeZ7mILZ1WJZ7S9e0g3wKvuR7Hc8QWC/F5cjOeKyOw5M9ADvDSBrF6
 wwNC0Tzb+F3AqcFKRppcor5+efbDpSKMA7uGYcOChUfeBcNhvfrn1Y3
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7effa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N-TFuj4FxbnEaaYKstYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX8rHxuZK5HWS/
 T9Ra2uY++Wnvp4eXEkrvqqDsHw2mKV+aamjXSBnJIK20rYPQBBT2gCfS2XhjMTVW4qiB5hG90yU
 a2Mn7keFPF+bNFqs5fhw7ySk9smhEuCh1FyDj4WE90Ir9x/vue53jdFrO8Qpavxl92EzZKDB/nz
 Tf0rKzSrj3qpLaYKMERbKnBSVOeugsz6WecDR5c7PEAGXsRCSMA35hJ0ynE86hMEEi2YkY62xn7
 fIxEq4bSQl9Yh4o5bP9y3CFhRK5EzHRSclg0fqMfc3I0Y36ZrPfnhrTADbNRKNRE/uNNHgjFtrm
 Cdh4GXcHy5TYKTpyuDF8cYOJ5KM5vDxlriYt2K5O2ZxFGWvqM07ELzlkBPszq25IUmKAoLaRFBK
 yVFQ5BoB/MO6oU4pO3D/9a1lnh6e2QLw4XYFctLllS4+RX2Ba+HLH/5gXVZ6LtTjNR9EJsVONAj
 2RgfATd5ouLZ2O+zQhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX7kn1zC8dCXlo
 By6pZ3rzMjJzbqJJI/qC5IWxTTurXf254Jd7Hzryb5/OeBWUq14ZAYX0gqFIZP4jVgHDjhurvpb
 n3MQ7RuRNSyfWAVkrX9s/rJVC6PUJ4I=
X-Proofpoint-ORIG-GUID: Z9E26GUXQMM2V8a38i2Hs9pudk6OVp5E
X-Proofpoint-GUID: Z9E26GUXQMM2V8a38i2Hs9pudk6OVp5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140186

This series enables the Iris video codec on Maili, allowing Maili to
use hardware‑accelerated video encoding and decoding.

Compared to the Iris3 generation, this block has
- separate power domains for stream and pixel processing hardware blocks
  (bse and vpp).
- different clocks and reset lines.

fluster result:
H.264:
Ran 76/135 tests successfully

H.265:
Ran 138/147 tests successfully

VP9:
Ran 235/305 tests successfully

Dependency:
https://lore.kernel.org/linux-media/20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com/

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Wangao Wang (5):
      dt-bindings: media: venus,common: Extend clocks and power domains
      dt-bindings: media: qcom,maili-iris: Add maili video codec binding
      media: iris: add AV1 decode buffer size support for vpu4x
      media: iris: fix VPU4x encoder line buffer size calculations
      media: iris: add maili platform data

 .../devicetree/bindings/media/qcom,maili-iris.yaml | 235 +++++++++++++++++++++
 .../bindings/media/qcom,venus-common.yaml          |  13 +-
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   4 +
 .../media/platform/qcom/iris/iris_platform_maili.h |  40 ++++
 .../media/platform/qcom/iris/iris_platform_vpu4x.c |  86 ++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  44 +++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   1 +
 9 files changed, 414 insertions(+), 14 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-add_iris_for_maili-f6e7273fbb03
prerequisite-message-id: 20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com
prerequisite-patch-id: e1330b5a848460d14cd6574877fcf607d269d9a1
prerequisite-patch-id: 20d099e89443a097b9ec5b297f0129d9874ca54b
prerequisite-patch-id: 2a36ab03d78d8e9c19c900e203b05739a9fd1123
prerequisite-patch-id: 9e326a273e052af2b63300dd20f2fd6cc78dd5ac
prerequisite-patch-id: bb9ca73889bfca249029efb854fb1634a4360b5c
prerequisite-patch-id: 9e71460e2d5f1e4e2993819f4d9fa27c076946f1
prerequisite-patch-id: a2b127d41c7133ea30721a72eca01333334844f7
prerequisite-patch-id: e34741f76b6919db19236ead27c966b789736e66
prerequisite-patch-id: 359d24229ad496633892e70b1cf88c2d88dfad24
prerequisite-patch-id: 6e2e9069cb620143aa305b7b29b8b1982dd0648b
prerequisite-patch-id: 3e5fe6ef2271be5263a4bf7ffbd77b0996037b27
prerequisite-patch-id: e051524017c9f39f8593fb9d2e982e6a4c39fb35
prerequisite-patch-id: 1b4863f7a7f3a8390c825d76805e8e99de97a2a7

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

