Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742070;
	b=3IQ/EqI4Lb1TFnJAY/EyURTgHVCk0Ym92S31z/RZEdo7bF+KnMKA8FI7uzAx6Wp4xlAs
	 Yg3VLLr72ZcAjgO2yVYe6dZwTI3jzSzf8Ox4elrhk7aWiZPuv3HWK7J63ZXPh+0NSH8hG
	 +kmJq1py7OJ7tmLDN+fLOlfZHGb0foD6x9PpG8RKVNVLK1uTResONApgttPH5e9TOfyMf
	 1lAGQX7vKyG4LzIj5tcxF0piCX7ZvdQIs8lz8JIiVIKeSN+T0WiAgs4rL1Hfx3la5OEaI
	 zMssDxHOOYGqJuns+V3biO20UlXSaHwv4rI0Z5msEy5UAkNhDxspVMJhu8rufoznRCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FBZe0kZye2FXhpOkWuZpIAh05njeUm5k9vLsl92K79M=;
	b=qIQ3v3oJFGTQuoBURYC3JeVvxaKAYzanYLniGhsjtnZ28XKWgnq48HTeliY8TbxF21Tb
	 xEAkf8yeN5sxGG9Jmc+BXQVwEPrZv/UcCRH+dQ21WYaNgiXkprPgYzopAsyb19+T8S0Xs
	 t48monQvMmHIb0cXT6LO/stn82Ds2pA8VbGXVTey6vjE3S++ubQ0kNtUfS7GMVPnT/rAA
	 OrWYfMkIS8fSqlx9Jonsx3MoaG041aVXpya7lKCNIAP6RQ9XSjJBNSMgfjyT6WhGIx7KH
	 hPVoQy1FkvHH70s0iPeNOj8zEAPBlO7N5b4X9j1LUi04EuTJQAo/9pqXIpwu/TuAbTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="QuEa/dm7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gkxBRe8D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C038F606A328
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 21:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C038F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QuEa/dm7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gkxBRe8D
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKmYa4033367
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 21:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FBZe0kZye2FXhpOkWuZpIAh05njeUm5k9vL
	sl92K79M=; b=QuEa/dm7P5SVoukhhECuZxEztHcz1PtGiUEOvQWJz8s8Z4B3D8i
	TjSdaLDvK1iDJrOM0wdQ4Lcx6JeL/qqYtyDdopwrX1jw5o3gBM8GrjSw48SQ/Qd/
	oaRstve1u3THBK1yfMYK3PwkRyLXzGIful4xI1MF5tfOy1IUCtnalgstYRVewUKA
	B1Ls/7ji7bFM1Pek5i2QixfjGlZpZarA8hLBFqyWWx/M9g9SayTLASRs7tuweym1
	1YoYoW4Yw8ts1faneLP7TdsvMUW2zTX5NoiwEemesekJ4xXDRawGOuRyNuEVFiK9
	mmVCl8sOR7ZuTEhntwn6VJg4MiRY03DVAmA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyphr1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 21:41:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so6158099eec.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 13:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793742068; x=1794346868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FBZe0kZye2FXhpOkWuZpIAh05njeUm5k9vLsl92K79M=;
        b=gkxBRe8DmeqYXqkqc7vm5gZ7r3mcQjlg9L5NQKfJrnodTxGeSPFy2rf09jFSGJnz4l
         vAtBeofCqLqBy9DKKUFDlHcBkld++yAopMBFhIz6gNx8BOjn4D4qWUS4Ht/5fe4NpcvY
         2wXuIgu38PUc0HbVR0yS+EReQ+0hU4Fg7/GMB334H/+FKP8lzOFzLlTb0g4kyHtJ69MP
         o99LJHZ27nMkCOSWD6myvn+2zppbWcVztBg1jzwXlUbhY9vWmOfEuj2mJ4r2sQ8nIPqw
         zP8bJ2R2jiArJj/iv5xxaqL101LeEiu6VDTbADvhQlgkFC4dAO+pu0sL5aSC0UCE65Wy
         cnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742068; x=1794346868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBZe0kZye2FXhpOkWuZpIAh05njeUm5k9vLsl92K79M=;
        b=bmgU+LMgMz+vHsQwY+qPXIqXlVJp4uOkwcN4KkSBplilwwkCOqxatgMCUaCCy5U5Po
         4iOD3o3MYcz0euNf3VyvpkvAN0WfgxEvzdViBsdyX4klyiw41fmiybfpfN0nE0ojiqSv
         ipniLYoTBTtBFIIVAXkKSWjc65smsPPiX+hUlRV1ZlpE2+pf/iFTt9+inqq2578vKVCX
         TIgsvcacAxcpzrH6PHNvyEedPHcn7JO5+o7F5/sSC0x2qMQvPqifGuHwuaUgpiN78Hsa
         ipK3L6ub3hACWzuEM2uko8dGe8RL4RMNZDu0wDkwL86Jh2ib8ukmfrzF1eWbDheWIjGy
         KLUA==
X-Forwarded-Encrypted: i=1; AKwUvBwe4pzDKwy0MSxcOxEE6MCIzqLSsJYfytWBQyf9s35kKJ68Hfw1WbgiHcavPRiIpi+dKdqm2rcBPFpJcA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cfj0Ofo7DUvaRE40uRue4t6dnNHO6hD+qLz4ASjyIXNyYWx1L
	ltD8MBnPSUe62AqVUKVzm1VncptLk8M5UDTK+rbrStckVCJP48Sm72NIdXYtKUd/Im/3Htb2qEX
	SlsuZhaU+0g1ErMn2u0++3dBprBA5xumhIesJ9DrCbCnSpnvtS363tisRdAJN5HqbLA==
X-Gm-Gg: AYBFou0qNHhmdrluJHRNzUfMn4P6FDlwiRvRBPTPGySLshx6drnUYCKZXXAxm7IrQ8C
	Aq7xpzRWm7RxvBBNh+jydy1+N8jjccEgmV292B4H/h6qTWMpr+gKV/SrgIuS3R7+RLbc+u7nFoe
	4HOKf7Hi/QtjV7GTDi7m92KI/yBtpn4MfcLsyk4hBvumcWrdm+1j3juOn2IqhaFu4CaTc1Znpm/
	EjJkldOlctVHxPcxqwzsq0lAuU5BAOLn+IXZ/nRKKK4oSy4oqRSnKIXm1ePCozaA6S4Gd9e9wun
	vbXkFv4xxAaohRV1GqxdaB10dRTU47prfhbJSaU9NRytHe8G72Auz0Swo8rdc6ipLpO51AR8AiX
	oB7K01/zkFzqPUsQ8x4y9qV/lfdxqlcSNFAygwX6PH1A6PVVge9V35O+0i0mEll9iUyqf5v8bCQ
	2ON1Td3Zhrjriveq2Y3gU/dmVqnAk=
X-Received: by 2002:a05:701b:2302:b0:1ae:e7c4:9a15 with SMTP id a92af1059eb24-1aee7c49a44mr14830795c88.3.1793742067513;
        Tue, 03 Nov 2026 13:41:07 -0800 (PST)
X-Received: by 2002:a05:701b:2302:b0:1ae:e7c4:9a15 with SMTP id a92af1059eb24-1aee7c49a44mr14830738c88.3.1793742066789;
        Tue, 03 Nov 2026 13:41:06 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm1537440c88.8.2026.11.03.13.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:41:06 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] phy: qcom-mipi-csi2: Add D-PHY support for sa8775p, qcs8300 and sc7280
Date: Tue,  3 Nov 2026 13:41:00 -0800
Message-Id: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX1Jvu4MPTHwtk
 BLcCwdAoeF3KpdYennu+ZkXseWFHL5Rt8sldzq8hTOzXd4+G+n8XcVaMRMqO2MO89g4VYEnHpNZ
 cHj6fZwQpafzzI5dW7l9BV8SUZcv+1I=
X-Proofpoint-ORIG-GUID: TpkCfkAJ7pzSvA0N3kzy4GVEy3Ac3kVi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfXwfo9gsUp00Nm
 m6Lgze51DItTlFzyIotkBXRu5yWM5voGX1KrUzeZ7XaSeLNKv9VY/XyWOIR8gMa/XtTxebvS3pm
 Z4H5Hxon2Ek378seUXFLOCynI17ClbhylAxGaOjV1w17EVNepLaAVDbFLiZgoUQXeyAXh/WzdtG
 Vaao8lOLnbCjGuy8f/lggM+EyWsITtxo5XZxU0/bw929Ok0bGDY49YqLwfoPPQKnnGZjLnb2dlN
 QpbBz1s5v5hbtgdRYUs7gVEpMPVi5MXEDfc3ve+aeI8fZmI7VDAzYqqPSn9tM4aDhe4vuH++92g
 v6e4kOJjpf1yTHGPsJ05ajj6iODzOBWlObrfRtppbzFjcFaKOKzDTIBEOZ/2ReKx79Ec1776kzp
 MeG72I7ELpDEtqSmOZT1CqptkVN9mmB7b5FK8aCQsrlCUfx1H+OGH4Qe3cv8nIrq/aE4/5e2XLF
 h2Guy7u8eQ7yaT/Ydsw==
X-Proofpoint-GUID: TpkCfkAJ7pzSvA0N3kzy4GVEy3Ac3kVi
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea54f4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=d2CT3yyNdH9avgRve_MA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030086

This series extends the generic Qualcomm MIPI CSI2 PHY driver
(drivers/phy/qualcomm/phy-qcom-mipi-csi2-*) with three additional
CSIPHY variants: SA8775P, QCS8300 and SC7280. The driver currently
only supports x1e80100; these SoCs let CAMSS consume the CSIPHY through
the common PHY framework instead of the CSIPHY logic embedded in the
legacy in-tree CAMSS driver.

QCS8300 shares the same CSIPHY D-PHY hardware as SA8775P, so it does
not need its own of_device_id entry: the qcom,csi2-phy.yaml binding
declares "qcom,sa8775p-csi2-phy" as QCS8300's fallback compatible, and
QCS8300 CSIPHY nodes bind through patch 4's existing
"qcom,sa8775p-csi2-phy" match entry.

Tested on sa8775p, qcs8300 and sc7280.

Anusha Arun Nandi (5):
  dt-bindings: phy: qcom: Add common qcom,csi2-phy
  phy: qcom-mipi-csi2: Make timer and OPP clock names configurable
  phy: qcom-mipi-csi2: Make OPP table optional
  phy: qcom-mipi-csi2: Add sa8775p D-PHY support
  phy: qcom-mipi-csi2: Add sc7280 D-PHY provider

 .../bindings/phy/qcom,csi2-phy.yaml           | 176 +++++++++++++
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 233 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |  76 +++---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   5 +
 4 files changed, 455 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
--
Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

