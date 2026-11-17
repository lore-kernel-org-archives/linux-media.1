Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897308;
	b=lB1fOxaNisD6YOeYTm8bx4zuvBjLYPiLrrAI+iyZqFWDc3IsHyFNYyO/9BKkYdAVtU1e
	 81uxTkOX5jSCfCXsAPRW9sRk32s/MB1baE3Zp+9iTvDcpJPmhOMKi2nLWSQkiZ2jkCGnb
	 HDI5q8OZuORA0YBb+Z9uT43MoNx7mmEt+DxvF5Y/it9G8EKrgXvK8L4UZIfr9yZ1RwI8S
	 T1ogDfsHbRFOofDfvwkFjbc3Bortad52rzkz7gvCDryFZYxuO87LiYoczJb+r7+t+Nj90
	 7bCSd647jYJhohzVDjBPt1z495+dufAQW/HBzDeqD+q+iNQTJlAdLgBpAD7a7WY9dKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kik5QMSbYah4R0SEuIqUCX21MmNHorcARzAYXRMQrUM=;
	b=xYisGuMB/8Z6woeT7mrWSEeSmU0kXcPd62TDbTLujmdvASlR8ec73WaAidBjUGukt/9A
	 Tt/B2ckrKS2tuJrWGYmPYYiEIpv/jAr/aTo1tLEsk08gBwwy7PIdXY8+DNjt9FkY4tJKt
	 dVTxXmktrdA4Qj48NlAbD+Xym1DfZI528QOpk2S1gW1oB1CO86wzL3YtXg5Lu8Kmslgxd
	 d7A9LPYHLCj2iUVz8QfZcWPPAUBdVCSVfq1T6PfFg/kWwZHh7CLIK4LiibTOlSPyG+KuN
	 PbhD/gOOJtEfAYb4R7y+fnpU1OpcwyoFV8oiAe5z87knhG8MV5Hme3qLYrmL1ICxq5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I2KWypeg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4AJjMBg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11726606A336
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11726606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I2KWypeg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4AJjMBg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aGZj1800695
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kik5QMSbYah4R0SEuIqUCX21MmNHorcARzAYXRMQrUM=; b=I2KWypegpIKX/zlI
	wA4fFaO1UuO5Wf0TGwyU1U/k4JH/x8x/N8BqZu7TA4bZbRGJuWkJE11FTTTtT83j
	npX4Q1lryah+GI3BJODIxaOlwbxqNz6Fu55bcPzeKOlm6lzdDbn+r+HkShXF3o2F
	A96RqTL5bT75/sGhXV00GOfafhXlLrLecNKRvOyK268ZIlv6d/07yVTgbyduxWHQ
	NMbn3PdZED3FrwLPb0nixfQmrx6YAZygN79yg1iUdfl+CU/qw0afsEwRAMkY3ey3
	CqT9fcFUDwDZosvRddG+a+hu/hQAoE7GzrkRvqeIJSHkrltWLiBWemtzj/OKBUOk
	j1AQkA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3f0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:35:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so2479667a12.3
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 22:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897306; x=1795502106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kik5QMSbYah4R0SEuIqUCX21MmNHorcARzAYXRMQrUM=;
        b=D4AJjMBgBB6SSobpVhX6bUzvJWyXdEWEdszmfRIE93v8YTdRTjEA1xKAEsggCXUXtY
         Q0sk2rnCXLOouNlO9L3s0QdwzI7rBF7Uj7MnGXo9Jqd0lLsdPCFvXOb4yvIvcu+FqJFu
         U1vISL+JWOcDufscFpWyhUQGR74sQhoP7i6FY45m/MwnSSUdsAZxCBFqUHpWh1QyIL2R
         Yj/KQjB6sYySBRcCTglx0rW0yoPce5ORusC8jdxZGeaDbSiSDYaO8tQAhwis+Dn2r7/G
         rsOFhAqKjcWNMpwn/WBv1/wEikP5FsfK0Mz5yOZDLSOeIB36l8cx2CQPHrVZYaT9iiM7
         q2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897306; x=1795502106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kik5QMSbYah4R0SEuIqUCX21MmNHorcARzAYXRMQrUM=;
        b=mD3OTz3/aFidoEUIHzM+ld5gqH/NvbrHttUNjlw58JyaHuHXqog4A+WKpv2s9JkiNJ
         gpWx7Y6VfIl82/x8V7KZmPdcHYBWdulP0p1lEOGtH3HRxk/9Onr5q11dvG87VI0WEnAT
         G6qfSfW37eNaHCQyHh9pCCO14fpLLPEuaDP80t3o3PFTq0nh3pafTWbhktRR/f5Hv5oZ
         Y0r2XlQgaDGhWTJodO/WzC3naiZJpkwnzgXWTfeUSGAj3mn0Wz/eSTnTS5Z00cR8l2yO
         IJ+3gbugM2ntjJSdojT9k5LdswI11Q0OseC3g1kOKoAvWYdeLZn1dtG0EoVC4fiB/WBb
         wHzQ==
X-Forwarded-Encrypted: i=1; AL+hErGuFWcmSSak1FBhFpG8ArKCaEPlwLKBZucg/jwolVN572/NWKxg0bkN8V4OKc35kevSSBbnB6/Au8W6jQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9KfPPAw1aKG0BLImHUKFzsN/0oktV2WR75J/U/EdC7gEQMbJy3
	6HtRrG1rJ27PJS44qsp486GRXqtbB46mrSHfAMKJcdselCWB+EdeLLK0040Eign5eITLz9mzz93
	+1erwNrVCKgOeRW7kltolzlh6pdQeSNs82luSCp/s9LPBKmFuB4R4oNLNa0fa+98GkA==
X-Gm-Gg: AYBFou0F5scgAO+FP0NZrpyn/boqKcwn30VD/O09Bxx3qhZRvhdMJdMvxb4U2weRLbK
	OiXvx+solL5vznbzuvtXFfeUviDIlaUXujtmkDZad28IghiWSLGk0w3jZsrB1QfEcTLG+JukYO2
	Vq6uYK56WgfzX6+FfwS641Z2hwh2KD8C9LMbIbgYXBwo0bpfAk8EIYk1MJD98GNVrnnP2Rs5U89
	jR7HQlNyJ70+flpBpRNvd5tB1dYH4s0HxnfDtLJfi/PnQxZX9BxnjYvvsHQT3OL+CWiv9IcUMJA
	aPrNtD9DFezu2nps+BzCUf89I2pMcoDCQn3R4RAg65aBUO9rUedIIwuwsJSEZfzgYOvRNI4yQG6
	W0xXToeQPTBmiMqt2bh9rfzFr3oPZodOrHXWb/rEC5EezPQQKubk0gicakMziRqYHwhZVDlPfkG
	lvMEDG7Bw6TJzhcmMv8PLDStV9Ttx+2isUOniizSVBzUHe+T/H
X-Received: by 2002:a05:6a20:9149:b0:3fa:cfec:227d with SMTP id adf61e73a8af0-3facfec31a0mr6338094637.57.1794897305686;
        Mon, 16 Nov 2026 22:35:05 -0800 (PST)
X-Received: by 2002:a05:6a20:9149:b0:3fa:cfec:227d with SMTP id adf61e73a8af0-3facfec31a0mr6338065637.57.1794897305193;
        Mon, 16 Nov 2026 22:35:05 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:35:04 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:34 +0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: eliza-evk: Enable iris video
 codec
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-add_iris_for_eliza-v3-5-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=834;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=ghIyBjSSA206L5G45TbC9GZYxrWFbBzZFE2qCT1QgA4=;
 b=tXqNmKvAQiAY3laS0Mr4X1rW77yW1NwKCGBoUtiDeM4e0ryc+Z92bIRvJc3uOa/NYOZeFQIi1
 xRT9/DQkbXvAtcGSmlsVcaKcg2UqZXU84lCxESmMjmWKZQxsjGibyS8
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: _dN1b7D-0hzjLN_ZACnk1U16mm-EBnrK
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afbf59a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8ycGgHVmDalfDplNnMAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: _dN1b7D-0hzjLN_ZACnk1U16mm-EBnrK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX4TvCPJM7mJs7
 sd038LzuD+oVkUhfbqPlXO8hDzqChWV91bPMQRc/0CklbEBOQeepCKKgCPHnyr4tYsx2wk7dXJt
 DW1/lgEsRpl46Vq/AAR5UL4HbeydTkU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX9TFDTNDu6yWI
 21BWkJReAuAJu6cIm9i/abt9c58F+thUY/Q6ikisYzzt6tgli+7kfk6rNRilNvGvPbJn56eRt/u
 D3Jy5FzUxph15Hd5rivsoLsdDJ3HzfBBDS2bN8Dqc7Gjm29XrhOijlRGybjayGTl+mvLRGurcZu
 RzesZJJ/zVPnDFTUjbGdU1bHzsw5IGfO6veUTwUY0lso1MUVJVo85li3lIIWEl23dCDfutBu2wH
 cofpzpJsctRCpf9cBSvZfh7K4zW9kSslau9xFi0eDKXOM7HFYpuIQhv3qqXWZYjorba/dUku7Oh
 Op++rLoMVa/BbExxw5MwR3LPvCRwRfnJaJtVyfB/x78hTLT5gGDWtvbhr4caSCmKDPk8m1jkOzc
 s3HYY3EUYPv9ZOKVidBKoWjQNE4hZxqmf/ApI8KbtRvWwziI6cPGmR+GI82uYCwHDuqu2562e0t
 hSZtclkl+bB9b8ROw7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170025

The Eliza EVK includes the Iris video codec, but the device tree leaves
the node disabled. Mark it as okay so the video codec driver can probe
on this board.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 02e58a4bc91d455278f2ae9a3da60b02448e4fdf..b8e8c67c70b0318a7d24da8ec4031267605c0200 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -209,6 +209,10 @@ gpio_expander1: gpio@3c {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
 		    <&dmic45_default>, <&dmic67_default>;

-- 
2.43.0

