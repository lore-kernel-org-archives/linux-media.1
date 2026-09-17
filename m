Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F784DE72A
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645309; cv=none; b=lgCf9CggDeXFqVSLdRosgJoXsDPU2v5UoXvxlr91BUcnhfia3ZgRWtD/WJuhKceLcHch5JMMovAgqeKB7TgsQxJH9TdLe80nnGrgDVtoQ01OJgnl+OyyfiOiKQAEswxqK6Q1RPqViXQ4SVdvcsjTyu0Z/hQm8csGuSqRpxiG52I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645309; c=relaxed/simple;
	bh=deDrLmDsf9SZKV214Q2Dy7H3xnrrBmFZbNNq+U+2qqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hON9ape5qDNRaG7z40ZHfaxbZveuj289tluZ+AQgK1/nd+7jcbGqttn6XBDkUpZJa7RiM6okLJOajLH4YuuQnogw+FhJmnmaFwAFondGuDR21k9/tPDCcunUCnLjN6HAfKHgFel4cX/TWHt5rS0Bh3/NPUKQ916ZAWPPH4Z3Cp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kke8hL1H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ei4Jz5ND; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kke8hL1H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ei4Jz5ND"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9aNGd1699720
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnDUVOhAh+Fh8cO7Y7RD4qrNzVPEPq0KcDsh/Yij7Qk=; b=kke8hL1HDeTyIIqe
	YN6BTnVZ/bq/oSG/d2T3Nrvn0xSW8fFuHhMcPw8UZUJH896o4HiG842qfQ+qOMn/
	gj+4i9jfV/D+H/yzNn+qGNWE7fJyB+Bv/4oM8qbmkJ2At+x/O2sa3VdPU4GjP1SY
	p8S8Dli5cGMS/8NU3Fu0zN1jUa70hQcaDCoOARVTTPjkpV5pmJI1Kga89LakxPT8
	GOqb4oZWO07CMTmzC0laS9zq4QFfMwcZb+pCzBPdTaENxfMSbP9W2L271OHnPQ2d
	yb+ImgXKq+w0Wi8UJGcXeWf2w0LBDOVkCZj9ZDSw81dSKeISA0tRnVfeoIzmGG93
	sBHz6g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxaycb48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:41:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc44d708055so1357279a12.0
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 04:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645302; x=1790250102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnDUVOhAh+Fh8cO7Y7RD4qrNzVPEPq0KcDsh/Yij7Qk=;
        b=Ei4Jz5NDcF1REFGvq4Efh0VjQ7sp7jaIZIkH7cXMkVrQsme9mNXoNOsqJruqUk2uYM
         Hqyi9lbI/07fLVRTZCH03NUxCFWPgv3grfQ0WoNdiYAxMwu6uv959S1C6q3tHPEUBT3U
         aABT/0esZuBHBZdTMiGQhSNZhSESv4UB+qpXxj5cnCg43IsqPr90yZJVLL9K/mC+MLpk
         31TY1xQcFihevF3dXBu3BwSqtIOG0RDD61il9G8CQldI0HbZF9bbK13pvWD272+rbOL0
         kmf+M728fc87rvej0XNX3WG5/mfT84VBfktxscypPEncrfyBoVmGSKNGapvTwGgT9mmJ
         1GNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645302; x=1790250102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnDUVOhAh+Fh8cO7Y7RD4qrNzVPEPq0KcDsh/Yij7Qk=;
        b=ygZSarDGn6xSmiKQoAm5XiwGwW7OBIeyM/wQTZyl3FpcMdQECcXgS/SD1iM+vX8Qbo
         xG7Qx7oWj6wPtF8QBHmXUtKRVY2tho2Whka4V3pYMeT3G42Z4Mm/BJgfni5F38jCazyK
         QoD2NdZ/4ShR3MoMw28QIDa4GRga06GNpML6cZAz4IaS0PTKfPtJZI5VGBzm6yrAh2Ri
         GXH8g0u3VTwhuXzVtHAjWXl0PDFW9ZFN0nMlDx3dInzAHT2Vb5m10bdoNVBo6K9OX1K+
         otnbaAQMS9s2OwV41nTlA1y+mWbfA/m3PVHLQpW7rn2ZkUf3JXPEyJJV9vXDhAmzCxCn
         CrQg==
X-Forwarded-Encrypted: i=1; AKwUvBwIj2Hg3a45p23xrBXAPcsbM9aSx/9WLzwbe+RdPY8hVIOtygxTog5IF2oY14sjlu+9BtnLlXCu6N7ZqA==@vger.kernel.org
X-Gm-Message-State: AFuF++nSpBNWKu+QGf++PK5PLQAqPPS18lygQKS0zAU+GHmEX1lkT6uJ
	CY8aITy9ec6e1DXAYYlI2LD3OUWrvD0RoIQFMf7/Rl7g9XDs6bFUJWheSi+oDall5ruFm9ZEhPa
	I66PVyN0cxkODTCEJE9zA1nQtgJzY0XGAwTL6FW8DOFPxUjAS967WqZyHMNNHkt15MQ==
X-Gm-Gg: AYBFou1eg2fXCcb8OAwyiJtzLQ1PFknb5LbUHKFl0iEiglsfSFTqrGkZRCMiUPhxpmP
	aRhtdODOBiAdkZJWTL3ezE7QO6aDessnMx0T+RtUbhuY8IL46mrhGndy6H+sy8oQu/vx6QL7l/1
	WspKEYipNjql+ZHz2hfwsgk/WEV9LLKqJLMuVJ8vmVbpLAlZQDw+IoerKt8yeHejL+S1XiS91E1
	FKzkzN/ZayR0VLKBPS4Uq9KkqBe2qRGj8Vur8/yl1kIJWfEXAjmDlPnpXcAGhqJgI03sfwXwFnG
	fSZkGF+0PzYmwpPseyvA7sAHCHtO5CtwGcl2zp/mEc0FWVO1Lp/FnzDPoi4prWGXobag/Grditc
	O7zycovsU+37ANmOrXKBEk7V1+uc6YQ==
X-Received: by 2002:a05:6a21:6803:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd5f4041a7mr16587013637.2.1789645302533;
        Thu, 17 Sep 2026 04:41:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:6803:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3dd5f4041a7mr16586942637.2.1789645302138;
        Thu, 17 Sep 2026 04:41:42 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:41 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:03 +0530
Subject: [PATCH v8 4/5] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay for Shikra
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=deDrLmDsf9SZKV214Q2Dy7H3xnrrBmFZbNNq+U+2qqI=;
 b=l+CQ164s9sQZp+Tip/2k2mocjBE/YCW9c2lggvgmmMQYTCn/WM6Vp66nBBaq3mOhAPt/+Zy2O
 D6zXkJbxEmHBPCXfOLSPJ6QtGTxeaiy+UuAR4X8tkW4WzeTnAlVgRDR
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX/3MNKH3Qz7kU
 bQ5D5hE3X97beAXrM74rpHAYOlREp8GhKVLEZSgEC17BnCW/B5PAPVqDs+GtwveCiQgba6RYt7p
 8oBslE40nkzviy8sK154IbvOdwe7Lz8ipYlCnfauEEZ/HapMfCUL7VwpILRsUCjyGpaaDUoLczM
 Ia+u2wtKXttAWBEZuDM2sz/c3RvG4QCDlSh8UgpWzaq+C1wVYpQ4Y36VLYPmEK+w7TJ75mEUvXP
 REkZ6cM8r843C2d4N8B9s04qPRqBKQpWtg7ydTIIg1wBFfaFmRpMbG8tVA9xnsfqH1Nv7O5HL7L
 x5o4BjNhwkGOixFnOiicwpFwpWRJYggOQekeQ6rIjA8piBrCyKvscTo4AVHI3pb75OClTEB+8XL
 CQbmSAYloFP1H02SFzUlCTdPDwAFepGN0/ANiDQhGCjs2oI6Z6HWeNgUD6/KH3gBtcLnn24VWeH
 ibnxQ1etDn+Yob1McJw==
X-Proofpoint-GUID: atE5a8PJbnCUIKzD25uV1qgoImRGi7Wn
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aabd1f7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: atE5a8PJbnCUIKzD25uV1qgoImRGi7Wn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfXwxlzHhg+HJ0M
 41u7t2/EiAsF7zRAQ/n/fFvTA3X2Dz8oJocD30diRVSRKKQoDXP5zd2fE3DIxhK++I46OlR8nVi
 3ZQpIYQf43nP5j1OEvJuqPwmo1Q+5XI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170162

Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
and identical camera supply rails. The only difference between them
is the integrated modem on CQM, which does not affect camera hardware.

Add a shared overlay for optional IMX577 integration via CSIPHY1,
used by both CQM and CQS EVK boards.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso | 79 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d6547fb18edf0a99f4384d8cb073ec03b6785941..02f340aaa2ca542d0d175ff965198b29ac48772f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -360,6 +360,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+
+shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..3a481d972cd27a2a324d96d8f47c161e11ea54f3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
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
+	vdd-csiphy-1p2-supply = <&pm4125_l5>;
+	vdd-csiphy-1p8-supply = <&pm4125_l13>;
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
+		dovdd-supply = <&pm4125_l15>;
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

