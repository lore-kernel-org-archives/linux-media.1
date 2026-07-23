Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918313914E8
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784781909; cv=none; b=KrhGmulVdaexUDvCGRqsyS3e1V9GPvnoIN5oftxnIX4WhXjdXfl3K0Ukn0qNiE2M6Zh7fTt8fNQxJQ0/FrXGuhtkGpOWQn/j3j+D1fnrGauHKVvKuYazbzVXHTS0xC64x/E0U5m+CQi2aK2AFxOUvqQJrF5uTVbulpaHiI/ziBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784781909; c=relaxed/simple;
	bh=ZA3HAjflV0tkYLC6Nd8u+XrixaMrLTLfnMhVUY6WrUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oCmob2sc6UPb98U2OHarea+OmC2dr9f6f2oMEyLnzd6XYicYgGZf1flH6vzMhubZ3WdBhcRMXwOQBAfFvvYcebmdFpDt2Yes5KU95s3I55HoeEpa3Syk3fIQxB3P8Tb7eK+XnwupHqNVDwPgmWFBOEhVzigDEIEJFfnNWHvXRKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ko9yxgPn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BeC30IbP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ko9yxgPn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BeC30IbP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0XHSL2478849
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ogOnkizJDQbuq0BIHPpDBbizrKgtonMZlEbEehGvr4=; b=ko9yxgPnI2Jg62yb
	wFAMtqQT2XRL9LivtLbBLDosOgM6Pcn1K3zjQmTtCh8q4K1BIGOCxCz5rlJxgKeC
	xp5cMech2j12I/6lrKQPEgP/cBZ8SY9NBKC5fuDRpBgI18d3PG1pJiKEEODnSeVU
	kFdGyrRcu6ZWyI+sPsLdlutqwn0Ed9HR1FD+HB+FonnLZ/uV+OZUXI/mt0CSzTjA
	UZ3SVBx+BihL5atNuQpCB3etkx+cysq+jU6HzTvzHr14Yo11IN9gpTW9zGG6SPwk
	TsXfUt5X8gVVc0Q6to6YmYy1cLDHruxMyKhIdI9QXsrm++iwv5Q+1nY2tpbtCDpv
	EW9pRg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu7c3ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:44:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484ba00601so328624b3a.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 21:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781886; x=1785386686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ogOnkizJDQbuq0BIHPpDBbizrKgtonMZlEbEehGvr4=;
        b=BeC30IbP7WEbfOGJ+xX79kmqumhvpBL0S98apg+Y1W+NhlN8vM3ksCSN8jrUcYKXaL
         VkARuSC4JaFebj99Dybun9YWaaIwqQmDn5QvXzz/VDZDkJq1nSrBEjgQWJJN3q+aYM+U
         auoEjGuOPY+emERehSbF+EqDH0HIkxallg04FJVJbm0T02/zfwH3YdvgUGn1kMxO4yXF
         6vaC2v5OYJZaxwYDR2WywKveEeoo36uq2gVwf8K9f9jE6s6eYwplqs+dbQFQFQMi/na2
         IKC5c6h0DCWhA6E7Twq1PDqwamEFnQ4F1lSpTRrfL3cnZZi+WscwuypEMqpwHAke+JPx
         kOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781886; x=1785386686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ogOnkizJDQbuq0BIHPpDBbizrKgtonMZlEbEehGvr4=;
        b=RWXIbHQIGQAAJqO01kw6WTEunv0zTAPY2+4NOy+gleZ7BZVnXMQHE0YqiatPgdyrZb
         ukfI3UJ2E5LA/JPM4Yns650uHUzO5meyvTa11+wI9X9xxot7iuxqMtrEEbquAkJvjURo
         Ov1xDZPCauuTkjPdCFHYyfpPA3MOZyJog5ZyvBhb3bXBdydO2XYq5Jt+rFvvmIb1d8qk
         RtkHwcIZNNjgiuUCcyMeGZ0JaIhUcsGhaK1H2i3upDCc9BKp4BpMaW5l22+R3aDoFwNB
         IRegQJlu+2wB7+mhiwqC7hIM1hj1n+ltdg9bnyIKYd9QArWeeag+JogIaCynjdkb9Eo6
         6tHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrddAkyg+kEOFD0eshYDg0JgIM87089+B2oKTPe3UZKivlUkuUz7cCR5DfZmEoE0eZ2eDHX08cZ3umMgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOSJ4Ma6YhcDtnc0X+1xUvKUwN0WP0G4wYOTkGB27rQdAp9pJU
	nuAFlYbfYG0JtmYh1yFCmAcuFniWbqyp9l/PWhcMwKJ+p/8oUGSEVO7RCDnP/pOlxWlv2cvPr9j
	7YfD6+/HqKKlRehlGVqzg95Aiz6/5OFjiijUV3htzXiSCniWO94rp1u6JsxTIMRCVwELkgkbglQ
	==
X-Gm-Gg: AR+sD13TaLTDhbv0jgTPrLMNXgQewnzWUlfTGG0kFTWAR8CTPCHhLZIyzeHKabH8J8N
	Ie+MBVfgT8WeKknSkUagVfoZ6E3OSpN8eDt/mPL9nS5hBJoicNat0NMkeeUvWzes3GOQC61HHv7
	vg3DMaTX13Pv93bhBjJdXawu/ZNiK6JvnB1MsY2OZjDU/4fK5Lk/tRj872FU88NQ0V21rjWZ9fb
	f6PqvD0XObxdYCis/mfmz8BYwfDsWOcU8Sz2KqYKruoiMb76p905uFM8cRG3tj09LIBaUiOvnoU
	Ndiki3btARlWPzvDzkOh1uETkyIynSLT8Xd3D32ex3tKKN5kcl+Vhi6EMCHg0r+lQ3t4lEFbAd2
	8VgMTFfHei/8UItFyQVrmpVZAToIdr/A=
X-Received: by 2002:a05:6a00:3d12:b0:848:4080:afe8 with SMTP id d2e1a72fcca58-84e2b8c0dd8mr1961085b3a.22.1784781886132;
        Wed, 22 Jul 2026 21:44:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d12:b0:848:4080:afe8 with SMTP id d2e1a72fcca58-84e2b8c0dd8mr1961044b3a.22.1784781885645;
        Wed, 22 Jul 2026 21:44:45 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:45 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:13:59 +0530
Subject: [PATCH v6 5/6] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-camss-review-v6-5-7c46f9bbb4db@oss.qualcomm.com>
References: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ZA3HAjflV0tkYLC6Nd8u+XrixaMrLTLfnMhVUY6WrUk=;
 b=fsDQyLQdGt0+M0g6Jbs9vEsnskbJSfkprD71lfYYse3dZ+f+VAClv/FZ3qv3yVTRSJFOvqcBX
 PPOVvCxk+vRCwutJYlt3CvKpqCcDkSqCdPGCqKUdxYLx1QQR5DUO2Nn
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: SxI4N67D6CA0B33iDKrAUTxGsQaeW21p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfXy7oXwez2UNRX
 bl384UUdnPwscnDA4NRgSv+mnk98Yba4Zhpxlw19KFSuFJJfJg/lzDrJAreZbUNCXteZeG+IywI
 3qEf2oohoMXcJmcgLC00xwU2R+/Asi4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX15Vls0AFQfRq
 q1QSs6Um11RbZptMimQFNAVy29C2iVfNTuxb6s02k6En4yDlwNx8qNWqQlNsZOmc+mH2dbs41RV
 jvekvhq9WMKJ4yAqtWxnajori0mopUseJiB+NfnQnuU1zzMQxo49MGpGwSjUBqsr4mpVvPaz6fE
 77AWbBYpohGwsjBB0Kn3JJRB/SH+fKyWI2Q2iEnA4b0dTxgcM1EXuTjq7L7VO9SUfS6jDK7Jjpx
 qH9DSuonElivM/3aCzF+lvnzl9/6y5SlQi2vc1Ih3glEdulVchBF37JuwakqBhcd2Y6M20VPpye
 Y8of+RGw/SbAA1gAvH4JT2otgcCTWmpWeuUTe1IUwfkACAgdaL//eTqC0vKrimDpMnxOofOdjGa
 F+Lw8xo0C7Rlfw8l5CzQZT6XyiGhE9Hn3mS1u4Q+n1cbjoHi1pZoB36BBRFaQbA5lZ2NQjeUIWj
 SXJXstc3uVb6TSo+Lng==
X-Proofpoint-GUID: SxI4N67D6CA0B33iDKrAUTxGsQaeW21p
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a619c3f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230045

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
index e05414290d8e5692accc758bbbe472f2f959a0ce..c75e0ae736a96b047c04305bb109cacf06d06f07 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -338,6 +338,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
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

