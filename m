Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548039;
	b=QMQTPoIXeZSHvOAtTQiT537DAT5bdkWe5pHnYmFgIg8zjspfcnP61dSH3jIgO7hU1XAY
	 MB9J6OzFZpZRw47quC7+k4lKyIisT03muZA7ZEvF8kbaSOgugjnVzLPEaV+PM9jW5/7ln
	 e0pjKue2NpnGyLrJzX5bxX5C7hBkeUVV1FOAtXo+AjM0kw3eJ9DLS7joQpx2+9RZwlDF6
	 H2Z/gzYGHqvUlRxHXC9lgsNXgQX0Kbp1NMmvDWdhlr+hnP7GE0ETqwfYMqrDz4labVEQw
	 07TAso45hCTykir6VU4N5LvQfohz26rgRo1r8wrUbhR/Z2TxpPPp8x8L8M/OESkKj0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=;
	b=k89DtZUpN+ikGkrMzRcmsJ5lCa4gNcWUBsP7A/IjMN3CAE1Eao7WJ8CiY8+GpV6u6/Cw
	 G9MGgYjMKDGCmZmyjoB2aH7UTUPqq0QfPacka8h5pN4p3pbGc+Ah1QbQxquXMiSlIPm83
	 HbOvXG6xQG5oAAQMPjYhNKJwAHFUcfQedoNqIG9E184AXHsSWDBLHcIm0JRzQxv5wmYYW
	 3SfDG1OGajquLkXhJZfkQd0bIB3SyR70tYuzmwrTNWqquH+o+a7meY2IjjSIFK8DaAA/X
	 7rQDYiRcqek8CgCYU8KOuaVbUVDxphEeyNrXiq7SaikjHsZsVd74uuaLlM4KwNisieA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WuYHBI9X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DKQ1ff28;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01765606A8A9
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01765606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WuYHBI9X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DKQ1ff28
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD578aj367315
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=; b=WuYHBI9XEhpt2lnr
	2y1TMGGndgF2QjENE2BFsgN2dVwQXAkj9QrOOZl4IzsKYq51OIB6vQE5cgKQ/lls
	L7TMizGYbVTEEKE4zM45KMp0ruIvgGGgyU43b+KduJxbnYfYycVkgYD/Xh6p++A5
	SrLtLZFc3Q1GC3Elrq9D6Tn8Qrs77ARnpQimudpkMopFKll2sbwZj9A0rXKirj8T
	oDMQ7m/KtTjNG1dLk01ERfijUVAFpsbSegFvt8WngajvHHL2tuOJSq2eZYihIhJ1
	uWIrOoRsUfa7KEsIbe2eb70dakLiAKa/cUYKo4/vrwt257bvLmP9cbXelHuBkZ+7
	bUhhQg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx33mvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:33:58 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-464fb819ac5so683244fac.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 21:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548037; x=1795152837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=;
        b=DKQ1ff28cGflMdIvt4Z99O9Z3HsjcEjCAU6qjL2GPBH2Kbdxx7Z+TgiUZTcd3m3k7J
         6VJzKaWgQzl6Pd5fZgBFL4cfIwxir5XkIuy1f8clOPOMiz8/IBrcJIbt+XuGRfTsuz9K
         YYQDZUJRyGGAQ7m8jjvMPnqp1E0jz9RETq0WQ58fY8eUUAP9hgun7RCkUqaoHDR7TosV
         KHV0Ta/JqEiq6IExVFd7axGJD2zfpPcdZNJ9Y1oEngP+WnCrjWmlKmCtMdFpqAQbPaVA
         PcEJLXQvHiH1lP69PECYqzbaRcx/hkX/b3bsO2AEXeMFeA7Y3InKdCm1lndIDEAw0izF
         CYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548037; x=1795152837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=;
        b=fRi0mTQ65w9bRguJmYoa/fdKyFcugn0+Sd/z0HZGTAZSq7R4FOxRhhWX2R9/FQmP2z
         l3sr5Om2GrrdhGQQtKbOqR9eIp6Kb5e+IcAJi4hUQHsl3ovMxOtkZkjJFAvTGyzIsIHE
         4rN5PrBEv2Kv/M/g4vLBgKhvE2n4XdTJD4l9I5ykvyHmt5s9d3daze9280Ske/B/RJIk
         iblGlVnA1xrM5pBaQ20HnUn8qbX3ASe7W/2YBhWSygXdvgT9WyjJeP/0Sg7kZDLnExab
         nDpAoqeAx172xl8X13GxXEvDikceNiE3PaVxUbCqhkjgQZyJt74YcIIHhGVQhVXB24O3
         p+YQ==
X-Forwarded-Encrypted: i=1; AL+hErGINDcMhrDleGDdYra/boBOJ/5epl1ejqtr2UPPOlLcJwcbnus+Xvph4MLRl1IeGgAXj3MBDhFZHbk/EQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8WhagYpo0z8JpBMKmW37XU9RzXE3FXoywqu3pUcEj8zmehJjep
	i4HCONqELKzpzjKBd5OMQyWiKKOo5K0O6XDWPQhXsPpt1xrfCgA82pniAD93AEE23f9MqYqkSZp
	dq36D734x4PM4rplu/4aLoxSTdVRfzr1SqZbeW4pfymaxXsLSXaYzp4AWbEQ5BX5ApA==
X-Gm-Gg: AYBFou1btGRTsucNkmZELmNF/FitHXEDvZepkld9EDYVxc7L8Kg4WxXoCrzIEwmHigG
	X5YLgcWp4iAPrsLr8ZLMLtSJfo9SvS/rRPTfgnz8SWLhCsmyIhp0zcDK9zGkEzwIIASEYA0telP
	9FkGMo4sUZv08IHhw2CPWp5Gf7chTOEBTEjRxg2tsrpmriX1grz7hUGUUj6B6OoCkBnsvhq5wSC
	qn69X4d1vjMoHdJbwxslFIeNv5vDc/pNOGCFTF7mfs4kAsEWZB5Vr42JByNFMOa7GanTvUYEVU4
	MNHa0Y/MQXJtXU20ic/T9/Bd9QOWmjZKjugxEb3P5MOIT/bYbCc97Pvt7kcimzutuyLqX2ZiGwa
	zjQ3ijXYYByjQ0tLee2FvCqw5sI29AHzUmukSjJkbMNa/DoLrOAx3b3WzhP0uGkHnj++QMEsgts
	bWlxOdUSVhsIoYYbnLjTZ4MnKvMva/t+lXu8tv+T13gbKq3z0fAMBXoODxvcLf
X-Received: by 2002:a05:6870:9d97:b0:48f:e0e5:a1ee with SMTP id 586e51a60fabf-4afdf7ce18bmr1641965fac.51.1794548037276;
        Thu, 12 Nov 2026 21:33:57 -0800 (PST)
X-Received: by 2002:a05:6870:9d97:b0:48f:e0e5:a1ee with SMTP id 586e51a60fabf-4afdf7ce18bmr1641959fac.51.1794548036800;
        Thu, 12 Nov 2026 21:33:56 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:33:56 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:34 -0800
Subject: [PATCH v25 02/15] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
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
Message-Id: <20261112-kaanapali-camss-v25-2-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af6a146 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX6oCIqr2Vwole
 abWTwtTYpJCOlaSqxdlhbGg9Mr3NWTDPQzI+NZZDhSpVijN401yhNz/OthIamCZ1dUwLZFKCyxr
 1az9deumh6w9vguYcqcRexbWtgTCokMtSPj/Nzvjm0C8Xr8UnyLg9b9FX8BRiftbUGrrlgqLQbB
 NGja2wZn7E1/bsZjemYiWTAUAeuQ4/+DRw/TtAhcLUpXAXBefWK8hQ0rmxr1OaJihJZ7deCi/J8
 mYDjzscgxz9bR05eyTn6sMHaljTAOc9AxmNRMsSPUuagOxwu2+/JeZ/nHetnYDrk/vPly7MUysC
 1H8NEHoUSn3cts70/w1viYAPRGaHuZhTF9TDKSSKI9XD8AV/xXoYDUjjofcSKCz2IzuESrzrQsu
 XQjNyJB9FKGoRKkvWxtPj2gaFzwaxiQCs0tW8xy+gnoNJavIJmiV5jy/p2AtGBRgZQdSVJRQ6YY
 N1GV6RTHUYsNrQ2t3fg==
X-Proofpoint-ORIG-GUID: xJbxILvobnKU1Qz_N9TEcoccaNHr-yRn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfXz3rk8wWknJKr
 YUOuPgXFWi+lk5iJ8Y+1Nkw1tlmg3dCV6+71tfvtVqUxSfbQ/wlgAR5F16zA6PIBKBYMTlFarzb
 sPs4j/6C4Tfb3mNt6OUl1OtXmnrOPmk=
X-Proofpoint-GUID: xJbxILvobnKU1Qz_N9TEcoccaNHr-yRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++++++-----
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..8cd331cfb4b3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -19,7 +19,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
 
@@ -176,19 +177,23 @@ static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 12));
 	csi2phy->hw_version = tmp;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 13));
 	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 14));
 	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 15));
 	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
 
 	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
@@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 		.init_seq = lane_regs_x1e80100,
 		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
 		.common_regs_offset = 0x1000,
+		.common_status_offset = 0xb0,
 	},
 	.supply_names = (const char **)x1e_supplies,
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..d6366f809e51 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
 	const struct mipi_csi2phy_lane_regs *init_seq;
 	const int lane_array_size;
 	const u32 common_regs_offset;
+	const u32 common_status_offset;
 };
 
 struct mipi_csi2_genpd {

-- 
2.34.1

