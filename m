Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994940;
	b=5aNm4C7vb7ocUG8s0cxcmYF9OmtVgxTUhdU/f41jADQ37eviOBCHaM1JvXUgx+zAm/B2
	 /bcWrB4mhpOOsUrIq9oGp8EetQvKzl2InB7sunGhAEmrCTdcGDPFuz5D5Hn1SiG0go/Bj
	 JS9MgN3J5NFOJHM8AEUDplAe2lCTF1PhOTxQPwYZjsUKIesszDaOta1lOrx9MeQ/8XZ4w
	 OyFRP7/vIGotvoqW0EPxedCryIx100dD8d11ELhPG+M2KoRZpBvH7DMfzWG1xnqaxxDJ/
	 7oKUsfC0bUv4oxOUFHEJe6Q90m459DgVsJf5JjsFJGRfwlpLRXfdo9EzDJdZFgcqPVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zQfoGYuMlpNQnUcQ4ehPn2hQgS8EdpBMUTzi33ES9xc=;
	b=cKWNkKAE+GaioGcq6/k9HISxJGT2MjTz6Ir5KkiR45JvQwxbaFA4ojPAZTPEye1InR5m
	 6j3JS1m9FWlxZcaiQV6nI+Zfcmz4MIPnKD+G+V2WTOSHXO12YrnNdYVurN0KaG8DRmJl9
	 q06latXRPqaMR0rzZfxjE8f+I7IVRjIelQ3KeVqrMKADXx/x/19NnXtQwxwyzCgLFzRmC
	 6TyoBpMvxb5VInxpo11icaamXVAkEabkiJ5YFwG2cP0XHV5wxsLsmF0OoO4pOOd6Vp8rW
	 ktoEf+aPOKIryr8IJa9hXu18aIzs1zwb4oKn4dsax6PzZBXynH26C+9kXwrk5MWzmVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HHhu8p53;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HBpu1MoA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864DA606A320
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 864DA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HHhu8p53;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HBpu1MoA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8X3bK3121892
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQfoGYuMlpNQnUcQ4ehPn2hQgS8EdpBMUTzi33ES9xc=; b=HHhu8p53OpsU45Ze
	WDb1GBUYM+QMjc27xIUrYs3uvY4b3syQCfU1Hez9vaxuyRahxXh2HBRGwbTUlaNp
	kxByh5ITk+qYIYeN0/jhCPw5rRWvVVXplq06S5XaxsfD/L3c7OgqW36nNRH6c4E0
	S054e59CDizCbWVpn0evsYq2uOvaXIPop9QTRMmj7dzqlTKgWvmZaJLeryDkf/4h
	209tPqnrDB+PRwHyvKdnYdih3d5UqL871NVjdlxaa/Jv9XKeGt0I0lLQybBsFfx+
	VLRWHoYPAQWR7eflx6lBnmMbVhCMAaceUpiy5xAgIQsNrHtatnZ2kqH3TO9SHZqA
	kDj6+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jaq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:42:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efa9aea3c0so10267905ad.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 01:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994937; x=1795599737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQfoGYuMlpNQnUcQ4ehPn2hQgS8EdpBMUTzi33ES9xc=;
        b=HBpu1MoA7ywDYLlI78PzR/jxD4DABYzR/HI3jF4k1brN6j+I/d+fDs/TkFk6mIg/P/
         Xlgaqg6QS5kPrPMVd9yFRUmK5pUPeS07fGKwQOjG6ofkkXtiytSAoZiJBN2O+DmpDcv0
         qrVsOzuld7r4FfEvrUi0cEE9dnDQoa55oVGTsJlThr6WJUOzcXrtiHv6fAkPFUAOy79j
         uAtnrZQGu8gwq4ElqfXUUwwNUvv8PTy0oB7yBT8oOV2pzi/XC0jEaIEw74oDSFQd/x0w
         7ThyjK2749nFbZFptNrVjYpMuclXYuvdzABzAf2u8Oxe4auGj6EKcrGlA3ortt102xVw
         c6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994937; x=1795599737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQfoGYuMlpNQnUcQ4ehPn2hQgS8EdpBMUTzi33ES9xc=;
        b=epCTNoWX8gpsZxs1yLY7Twif+v2ts0/Eejtlv2R8MaB30R1ZYM68tNBWCWGzBlI/xR
         xuqmeExGCoBRWKqIA302PnSML2Do9PVNflLY6x/+YnQbuFdV+e8bpmpUccRKrIIAp5+x
         civySjv73DhSMHGsJMepMqqLjc7G+AFki8KG6LtKk2wTC/IZAQfvhC7lyTnrPFsotFEN
         9u0RmvPiwvmeGqMhWOJOEEA0Mvow9L13K8mAJix2OEsKlI84u6d+w6gW7Jy44BSe87v7
         sKzlT9YgxAuuf+jH5J3y1HZseWq4GO7KbvqJn4SSBAuQXo1BUcgDeCv9uRROEcvfIqkN
         dcAA==
X-Forwarded-Encrypted: i=1; AL+hErFcB+xn+DMn+A3SQ5+qRx70pdBZLNTUQ8uQXTbObbhCOqDzbEfRJhaWUhNoNKkR2z3UkMurpUXSxXeefg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+XgQceeddbOVJ6chijIx0jScaGhB1QAVypy+RJEAxZpy9MTm3Y
	/VlJiixt2+l2hDGJG/GgSsVS4rcaMlw9JLTI6+3UBq+rvBQWF1wWqfE0jnsJ7kDje/ndZIONFhu
	NZUxDnyLAMjw9hKDSqQEyJQM2BsF+0OAO3lTopkdvkvZc8gz4/JK5RWcOYSFDRASEAw==
X-Gm-Gg: AZFdTZeGwE985oa8N3YFKqgswJXExjo44t34a+PdrTv1dE04py/TX1Dq3mYeDIewsTw
	eZz5VuFKbwqo2KJwY6P9lg2F9dUl1XqYFHpM7MMVTUAIpIUR3DiywENCnykYkGjkcXY3T5Ebad1
	NGKGrQ5m874WaVOH18Uya1msHOt4V1kfH4/yMyg/ZCpBQoWvURVuDQHwFQsAAZwwcL0KbmCqqno
	3iwweEUzlH9T9kkLNkAPcTgYwCSFJU4ehCX0fXUIfbc02aHcmLF8eDjSi2b78A443wfGG4QxItQ
	xhLdiINUbZkf3TzaSHGBs7EKY229PnzhfpA7Q/YBKFqpbaT7v4T0ZvtJq0F+NJCiXuIQHQLIDx6
	nXeII8lDJWCH6UDpeyW2UBb/kLVJdgiu0VLfPL7czoXGlE6jzW4xAWoYjzJ/7cocgSrCVKNygAe
	ez8mJhmoDKvePsH72bt6A3hew3OlScwYMD6aTK3mIsu6Blh1EU
X-Received: by 2002:a17:903:1103:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2eff75237cdmr22721325ad.29.1794994937199;
        Wed, 18 Nov 2026 01:42:17 -0800 (PST)
X-Received: by 2002:a17:903:1103:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2eff75237cdmr22721065ad.29.1794994936701;
        Wed, 18 Nov 2026 01:42:16 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:42:16 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:41:46 +0800
Subject: [PATCH v3 7/8] arm64: dts: qcom: hawi: add iris video codec node
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
Message-Id: <20261118-add_iris_for_hawi-v3-7-51786f6d4057@oss.qualcomm.com>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=5591;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=/5TBRph59pKfD2h5WA8MEaXGCzAw8RfNm6eiz9WCDqs=;
 b=5Q6Csze5qHNPJCLZINFtw3XjUN5Q9Rvvgz2IuWkxC0KU9OOy8LaWTPuRIwZ7tJjYJhF/K6nNS
 CUowujj1AmAB6bg7gSRE+15l2SHNKXzPxVP+3frwmTEnAwGnmbhVKxJ
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: n17s1XPIXoEttyfPqBFVrZhNYBa2_q0G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX6Lp8+2031bf5
 OAkQvCy07riSzAHGdgI3kCJZ8CJm1oSh1/eFVnuKcqyBoK/r9kDWw+5GXJc9iS/f4Ttvk9kho/Q
 OvI25KbQr2wXbvO4cmeWVEeDWDH4Pw0=
X-Proofpoint-ORIG-GUID: n17s1XPIXoEttyfPqBFVrZhNYBa2_q0G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfXwmW4TWCdJepg
 ga+NkzUXt6ACXkyFyrgG1nO+XNwnH8NtKsGuT7fXBAoE2uEg4A2b3oJXk2tO58kFTfO7PGupHQE
 7sG2kHHRf6F/Hro5tQGGFQOed326u2i+rG+6mLuN3olhnopjmPKOtBMRfaiVnOUR8xMRFrltz98
 wCfglZMzHWjwUBLrtUqQVK9lJK6HRvy7v8WQCgPTBf/8O92Y2KjfTZ7aE//+O9B8ltXQ+EKrZA3
 TqxRvXKjk6pK0M7TET3gh9QR8kJZsIRaKDuf6iodGDYw6G19PBdqlI5Inyc6B0xAbzoyEpLOC4j
 Vj85GwdO8Jj6NCNYk8J9owOiTSIya6j2H8QHAE78MQLG4UJYswkGiVRvO1ayIrQIqhREtwq1inJ
 /Fv7WXUZ5eMWSVKmUxd/UlxqPU72O/QHggPJjc5QP+pt6hZ8ZFFxpNYUXrmrnu+tBI86X8z20bW
 pn0o62t5t5NniefTzZQ==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd72fa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qJL271BKxqclmSQN1U8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

Add the iris video codec device node for the hawi SoC, describing the
register space, interrupt, nine power domains (including the
VPU5x-specific mm-int and cx-int domains), thirteen clocks, two
interconnect paths for CPU config and video memory bandwidth, IOMMU
mappings, and the operating point table covering 150 MHz through 1000 MHz.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 155 +++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 77d704fa6cf74a1471a8cd25102f777aeae32000..eb64d60b6fdd88381758ad5ff5b97fb5ab5d9dde 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3427,6 +3427,161 @@ ice: crypto@1d88000 {
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
+		iris: video-codec@2000000 {
+			compatible = "qcom,hawi-iris";
+			reg = <0x0 0x02000000 0x0 0xf0000>;
+
+			interrupts = <GIC_ESPI 238 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS0_VPP0_GDSC>,
+					<&videocc VIDEO_CC_MVS0_VPP1_GDSC>,
+					<&videocc VIDEO_CC_MVS0A_GDSC>,
+					<&videocc VIDEO_CC_MM_INT_GDSC>,
+					<&videocc VIDEO_CC_AXI0_CX_INT_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vpp0",
+					     "vpp1",
+					     "apv",
+					     "mm-int",
+					     "cx-int";
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_DEBUG_CLK>,
+				 <&videocc VIDEO_CC_CX_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP0_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP1_CLK>,
+				 <&videocc VIDEO_CC_MVS0_VPP0_VPP1_GATING_CLK>,
+				 <&videocc VIDEO_CC_MVS0A_CLK>,
+				 <&videocc VIDEO_CC_MVS0B_CLK>;
+			clock-names = "iface",
+				      "ifacec",
+				      "core",
+				      "core_freerun",
+				      "core_ctl_freerun",
+				      "core_debug",
+				      "cx_iface",
+				      "vcodec0_core",
+				      "vcodec_vpp0",
+				      "vcodec_vpp1",
+				      "vcodec_vpp0_vpp1_gating",
+				      "vcodec_apv",
+				      "vcodec_bse";
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_IRIS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CTL_FREERUN_CLK_ARES>;
+			reset-names = "bus0",
+				      "core";
+
+			dma-coherent;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xffc00000>;
+
+			status = "disabled";
+
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1540 0x0000>,
+					 <&apps_smmu 0x1620 0x0000>,
+					 <&apps_smmu 0x1544 0x0000>;
+				iommu-ranges = <0x32000000 0xcdc00000>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x1543 0x0000>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000 150000000
+							    150000000 225000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d2>,
+							<&rpmhpd_opp_low_svs_d2>;
+				};
+
+				opp-285000000 {
+					opp-hz = /bits/ 64 <285000000 240000000
+							    240000000 360000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs_d0>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000
+							    338000000 507000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-420000000 {
+					opp-hz = /bits/ 64 <420000000 420000000
+							    420000000 630000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000
+							    444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-560000000 {
+					opp-hz = /bits/ 64 <560000000 533000000
+							    533000000 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-630000000 {
+					opp-hz = /bits/ 64 <630000000 630000000
+							    630000000 1104000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000 710000000
+							    710000000 1260000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+
+				opp-1000000000 {
+					opp-hz = /bits/ 64 <1000000000 710000000
+							    850000000 1260000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo_l3>;
+				};
+			};
+		};
+
 		videocc: clock-controller@20f0000 {
 			compatible = "qcom,hawi-videocc";
 			reg = <0x0 0x020f0000 0x0 0x10000>;

-- 
2.43.0

