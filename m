Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A1F472777
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786016662; cv=none; b=f6y2C7Dpm8XUUG+2pT0PYnJY10NlYc9ZvumwV91lWKIof4ANFKynATmw3cJN88tZlGqgZKXud1m5GZn9cQC3kRR1Qj40tBdhf6PKYe9hgIFpz0QyinA6x+9OSiaGbmOX6F7pPibvLGdGXLgvfn5hwZYZt1Clkfe5eSBi2ffEO08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786016662; c=relaxed/simple;
	bh=lTjpGa9aw9j7oo/7K2Uo54+/x9/nRwS5LnIyxeuI31I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BMbQWi5HcvRDRCpWI5IfPL4zwgta0SPcol4HRo4JcqBnh6GyY8bVzVqaO1JuowLo01IuIlnuB5TnLas9OBiOXsmcA4DgnYo8vrQmJVpa90kbkme07BjuaJJ34RU4v1ZMvoDghssBJ23uEJ98ZzvCXWm8w41MYT3LnH3Po3d8I3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eorccgjt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQWZzGXj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eorccgjt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQWZzGXj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ngTt1308986
	for <linux-media@vger.kernel.org>; Thu, 6 Aug 2026 11:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y9hkkjdmafJzS9eEzwPN0UqcbjM6LEHIzsWnMQ++U3M=; b=eorccgjtt4PszYW/
	OxFGWlkJsgqv6n9p+iXDjaJJGAEwSSZCON8IbV5exYyEgoB0+kRNftwYJtMySXbF
	0zEUR3qfa1btC/CoghHf/uz+kKv5UUqMVS5RW2QqjOiluP06R/IuiyE8hqN/YBaj
	bIP7tLnRwpcW3VvpG8WtH/xilClELnUjjvi+hAypJ85J+2sA5OpxDtV2ZCvibKjr
	F8ksiXEyuhAoCUbNKW44AlU1MJMvBH3BwOF4WMHGK5HEFIpR317lzFYaynBnpa1y
	xjfbVdDJiKTKUaosST2lexz+YiGdt/s7eNnEXHzqLxca5j2j9WkVwsChEgRTDWbO
	Pz+XAQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp729249-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 11:44:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84885a4fcabso2458894b3a.3
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 04:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786016659; x=1786621459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9hkkjdmafJzS9eEzwPN0UqcbjM6LEHIzsWnMQ++U3M=;
        b=TQWZzGXjvqvpyOJ+eTDP/RChfvHtwhWidRfdaCRadauP78wBrSDLD1ZguIKDoCG8eV
         LU3Ro60reJblbadEK6JiNoE0y/e99nZ76pJcPvp2/K0/Yve7eE8OeJa6DzvBD7GgBxNx
         lXVsC3OiciTp9+eWlC8Ano1UWhYXN5ZJBv5ixnMvXI51uyoHYit6uBXOc+jrZAQK9RmJ
         VtdOBipeYlNZ41BVTYd+yAsd0H5QtNUUXw6g9xYu5PMvoQwa3fvwS94/xBafV3xYl5+d
         VunnRNElkTOp/kaMg0KbIRM4jS9D3NW5KPg0pOCnR5/uTotmrhOL3vmK1JFUkKfZfjqR
         9xXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016659; x=1786621459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9hkkjdmafJzS9eEzwPN0UqcbjM6LEHIzsWnMQ++U3M=;
        b=qWIlbNjrQ8ljUVHfKt477IT4YmrtxYsHA+tq5u3l2+9Zk6acHPaXl2o/Kl55RmlXz2
         +SYjlJdXJyd9GhXhXfHtT0/ps6cCDUoMJA5RXZ7deq8/s/sACFxJ/wO3bkyNbeuvpBt6
         HHs5i4pbY0qfMv332mcsp0urLlpbWChfo/RUrvcv25N0yRDuFjNCoK3tPbCLPdOhTF3f
         k9zVW71C1qTar8teQExy0cDaZi6D5Mz3uDH8Rlth2uwZfSxdDSR2YLWM1vHYk76ttxcY
         ckYjgXLARwQYfpzqMonmyORMSYH82fa4sv3mqJOJcisytyKWmus3zvo2sa8VVuAmsGbO
         MQLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhbzWaYmuqL2ZfDzh4HjtjYI8oseFOKUTmjg7twtujMC9yXw2GykoGgwO5r1CjJj9cY6Ma4jEz6pc0rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrknG+2mk91Qf1m7b9OAM0547hcCWW+v1iLUlB5BJ9x4X/MgMh
	CiQ1GfLDdWC5z7HZNZtmt5ZGSkvkN2lDoNs3IiFf/crGdbRxJqRSp5ftKnJrFNEZTxAVImX2NTm
	2eZ+DIAx+p+FYM5mQ9MzcZQtNYUDkKY7ReGigKqaHDto+bElCZ9qCOrg9Ho6ppM3kS/0upbK4yQ
	==
X-Gm-Gg: AR+sD12rKUBm+cKs3H5GNA1l951pR9hlZ6DlezA3JS0y5gnLZLbR+iQ077DoIPQ40pa
	yBtHCdutrhgedJg9F5t/dy9BlUUBG9IgghLE3n0lSXSCFz08rwQcm26Q5t4z+c1RF1cWbbr2mx8
	lYYEyJI5WYVJa7I8Mq+zyMKV+YjDXlQ04VOgUhiQ7UMRjTzY2CQxCEvOcAZc0gvqAvRobNG57xx
	2S88RYjDmJ454jL9IJ+dxHeuEs7hSXbQhC1FyzTg/ju69QUB7BOeA5JtBy7r+/Dynn0jGWjWhov
	gdUoKOM1r8yTrsOEIJZPGjow/3g+tRqvil+rR6tkgC05C6rw0BOt2H20mE3WW0HsaEDVrRGlE9q
	m9RUguE1jmqe6qGmpNUsu+yA8cCOY5Nc=
X-Received: by 2002:a05:6a00:2d9a:b0:848:70dd:f5a9 with SMTP id d2e1a72fcca58-84f4fee2fd9mr848436b3a.38.1786016658563;
        Thu, 06 Aug 2026 04:44:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9a:b0:848:70dd:f5a9 with SMTP id d2e1a72fcca58-84f4fee2fd9mr848375b3a.38.1786016658134;
        Thu, 06 Aug 2026 04:44:18 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b75dcsm1234756b3a.34.2026.08.06.04.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:44:17 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 17:13:30 +0530
Subject: [PATCH v7 5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-shikra-camss-review-v7-5-c7360fd6a5ac@oss.qualcomm.com>
References: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
In-Reply-To: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786016613; l=3663;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=lTjpGa9aw9j7oo/7K2Uo54+/x9/nRwS5LnIyxeuI31I=;
 b=M4WZ5wbtQEHHIBZRtFCPejEyXMqucWUSJqw8OGFzbZFuJ1wAOVw4NW2PLkZDh0Q+S0XDKXuwH
 8YUrXBLKavFDW2oGQN+ahKIUWwUU4mEfa77Y5RNoHXBkqHyud4LxdGb
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: mC7d_0Bw1jZFclZY29m4ne7eGcpSwutC
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a747393 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX1xEt/qB/pMQY
 BHE1TBLGwnr9OpcmqAlCaYBWmeahqzfXUR5S6GV2DMlPmoxW0Fay9Qbp08d3s2ubl+mvnr8kfzR
 ESJtkOeF+QRydvWHbZoUGt753nCbR6hIc0cpeb+9hTpTfy19/8K2sKhpl1brOKuU8BGc+kcRUUe
 H0X3eQX8s9WLSTn8/VrFG5aBaz49IYMb+ZCZNJGT+N4wPnkToroacTAApMHetc4vOXH+61SYhh1
 p19HjYpufbHzW3zb4f2UrwGtlN2exERQ7kqWoWelk/uRPK1yR506lJezxS+adP1Tvu+rZ2Hqc0s
 /wTuV17bQb8rHkEJwXpyqgrJIcTFLonc189VS6wrOjhRC6hWEqCp9JgeecJ0x3GqTB7XQXDRScI
 pNDZO80e3WNXDVqUC4SJYLpC23Lcw/I9C+5ArW6vPzRG7EwA9K62ouLGRDIvrD1yFBMr+9Cbsr0
 TG79eJeBwEtpVtHip/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX4J54zNq70tu2
 4l7lf8GSi1IXVCJgoEqoCkDLy1HO7Ln5RZhjNR4Yg/VsdtIxh0v++2grrELyokJQ5eUjzthcGKe
 H6N2iA1e9/oYM/O3PW6egL5q8i+Cg2c=
X-Proofpoint-GUID: mC7d_0Bw1jZFclZY29m4ne7eGcpSwutC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060092

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 79 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 03ed24afad5795b49848a2548c0facdc9f3e7115..5884ff14ad4552249b029d4aad569ccde5768647 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -342,9 +342,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..d8c968a918c67cdebc0e7c6fc14ef820c97ecb75
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm8150_l11>;
+	vdd-csiphy-1p8-supply = <&pm8150_l12>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		/*
+		 * avdd and dvdd are supplied by on-board regulators on the
+		 * IMX577 module from the connector's 3.3 V rail; they are
+		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
+		 * level-shifter that translates CCI I2C and reset lines
+		 * between the SoC and the connector.
+		 */
+		dovdd-supply = <&pm8150_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1

