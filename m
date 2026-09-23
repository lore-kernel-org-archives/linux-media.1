Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90053D5C05
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 04:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139518; cv=none; b=bop7eeoXoYRBaGrVGMH3mTl9UsU67WiAkgp48t7dWFQV9VPto6NPaCoPJoegRxSxSBu8B5pvJvrUEye8ZIPjF1sQ5B+tc4ixnRLMbn/IJ3Uskf84cPsETklFCJ5oQKIzj8flq54mEgX6Q2i0lwM4W4KMs8cegKdyLkeeThYFi1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139518; c=relaxed/simple;
	bh=Ypq6Dg2eVufbD0MjECY4yykbq5Ag7/VlnHbUB0+5woo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W8HjDf9oxixWTLcI7JOBy1k5vWKJq4nCu6PxOtwUOXqks3JwFAJkxNKTcRYyraCQQij5jh4lOehx4jhMxpo7RMoZ9G83sLoYZdfOkORb7aOJ0vy8BIczWyNpNz/LCWIycnuP6wChF0d8DvhzZa5Fzep1YkhtVQMfdvGzTL5UizI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDfm6N9L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ByLGRl5S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDfm6N9L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ByLGRl5S"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3qxtT2389916
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 04:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ALesk1DpfGIEfjQUFR4dRWvtQCbr1M6t9o6IkKBqb7k=; b=hDfm6N9LGUkWs1rc
	ziVwnB6GrscRv4S59/jPdpkqTgsuGJtBSozxi2VPs74e/8OVHmpScSRkTlk4zfAk
	W4wpcD9wUEKiSkmx1uSfthMxEWaqSNW7WCmDdF8YjYuf20isoDw6qQ8Ff4daplYR
	nPOWnGmaxCqcFJpgt/ygygzUXpdNdktosjFSxVGa/1L8QldG0wQjmExGoBEbThrd
	iZEb5zUGVH4x2CuIE/WlL/Aq9MSj4H1k7zoUP3u7FqSpUxr65X734kv+QDTHOS1u
	e+bzLfgxu7Tj8f7cO/vr/wUvoGZRDNQDRrlRW8Qz+THF0JosY9AWkhwLVwsLzjjX
	hs9nCg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n06hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 04:58:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-334f782d1abso1673073eec.0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 21:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139508; x=1790744308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALesk1DpfGIEfjQUFR4dRWvtQCbr1M6t9o6IkKBqb7k=;
        b=ByLGRl5SyLazQBLWxFWKqaDC+xxRFiphK267C5p3upZNvh2oQL44hFk9mO2DH+gGuc
         Ze9s6n+XGzvCr1oCcBvw2b/nwIsTBg8R/vrvoJpiPxOOplEFRPJfk1KQnkYTXzFS8nFH
         GvzpV5r13/dUZoiOwWS/zuTRfHj0QbPyhSkqZ8z4J+SNlNS6iB3nFYkfp83YFms79Hf7
         fUhq/jenqi1gNdg2Ak/hIML+9l3t+ccHhhzHT711FzBlcIaj/y2WDT0aLiNJK4PcONps
         PmbxuTjv40OzDvF65fUNL7POMJZwB+6IXaqSLopp/gcJZcylYFAihEYYlBxdCBn3fmUa
         NNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139508; x=1790744308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALesk1DpfGIEfjQUFR4dRWvtQCbr1M6t9o6IkKBqb7k=;
        b=Nt09wbdC7kmqgAP+WxmTD1J6jo5hxl2CjYcHGZZxO8+DDqtpMuNR1OdcimQC2TQFZG
         3+cY5sERdYQ3xlFYTdWLJcdHQIWV9ARIUDSIn3ehorp/2kHtU2LMD2EweA7DsVfe+/Mz
         oNFCdy95sWCjqq/VosrfpUL5myAnOU/2b9UwUnJKNclVOXVchV9w1DPHq9l/E9brGHXC
         x0KjBibdOjKMkglXHDqcWewJw3PSk0Bod9I1RYVmvlIztqyu56NaM04le91A4by29rcS
         Ck/5GjAXo+nlA0PzGTqkeMoT6yg9nuoTS8zMEvMMWnzpFU9i9d1Sm5yIMzr4uncO0iZ3
         7vQw==
X-Forwarded-Encrypted: i=1; AKwUvBxU+A3wQMMAee3nY1NtwRRi0VSU8gi8h/DhfULqEd+M6RbC8973R6/8Vu84UtDU0YWNYcULx9JFuEjupg==@vger.kernel.org
X-Gm-Message-State: AFuF++lAYbjL5Kjq/J17r2Pjeu0G8gYE80CCJDiE/PGOT6jWNNNtKB4w
	5/iql7Er1/GnoDlrk3tWwlg162Wub2LaGauHbF0k7O8FtWZRsGEESWVQbnLslr+27Dw0f1akSvB
	LBbwOYTui6UxF1Kam7eEkTY+mGaRuWU+5HU7cKT4cVPx0Z1ubMlPgre75L40YyOc5Nw==
X-Gm-Gg: AYBFou0tWH1Z3tJxfFmY5qyUI8/zCCEiQyaLrkQcqew0aZxdi+Hki74g6ytx2Zy3OR0
	ee+oayk3cCnNoLeTpybqlTFGTd2oQLrxsrGcyrD3qE3LOLjrXXVdIFqveqxk9K2g+FURpV8Q+4r
	XdxGYDfFv+0dJ31TJLUycK1jvO4hIXanqBMSm0ETpk7p+FZtZho+R9fWSZg0yy0X/pmhFhDYqah
	XUB+Rje8d+h5zW4W/tY1AtkS7KI3usWGRmpAp2H05QFKSx772Yb6KRqiatuu9Eoe1PW9/bwWanz
	lfjjE63/tapOO+ZUzgdlSwuLVJUEM96uyAoFQnRxoUc6pqwTmladLn+AAkbzYDXElRQihlIqSYE
	z/xqFuKQ/pSUUbXlVeSYfqntOPJRKEmHPPcxG7jta
X-Received: by 2002:a05:7022:6984:b0:142:d676:146a with SMTP id a92af1059eb24-144f90a43camr2679277c88.9.1790139508231;
        Tue, 22 Sep 2026 21:58:28 -0700 (PDT)
X-Received: by 2002:a05:7022:6984:b0:142:d676:146a with SMTP id a92af1059eb24-144f90a43camr2679224c88.9.1790139507627;
        Tue, 22 Sep 2026 21:58:27 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:58:27 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:27:32 +0530
Subject: [PATCH v9 5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay for Shikra
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-shikra-camss-review-v9-5-09f5fbea1309@oss.qualcomm.com>
References: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
In-Reply-To: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=3645;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=Ypq6Dg2eVufbD0MjECY4yykbq5Ag7/VlnHbUB0+5woo=;
 b=NHlaTzoTtEfC1dvSh+miiBbhXHuphwoVF4uPUO8q58vHBJp51O0iu6shpajiOpelJgb4yzArI
 LrrGc+pOAF5DyR1VjslbZJT7r3bfTurAcwVbswgTofksQnDIzfAK/ar
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX7HYar2BV47jb
 /ImWo0QCEEq7OrMHNQyaXKK/mQvdQaxf0cZ5pUwPtSDBFRwiGBvwAwD9yPKPeeFEsX2BQtBv9Xi
 gGJa9eQV8dHs5Vis5KsPKHzH6shZN7A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfXzmsCGChfaIth
 zybT84LMu/2z48mp1tmDCibaqKWXD6KdDciFz98SJcFu33ZCmGMGx1O20N46x9LDJEQtAU4CSBU
 dtDNWfxRtsCa6d7+Z9KlrYTvMt6Rezo1JXvOHhpb+F/9MU85Y04l6t5BUObMEEURzsLZS/jeHyA
 ahdFaecXesQLvRAip3pBLTmVp/VdMiZD0x6H2L6EAinZBaotOdM3ntrcun7xWerwrd6kZaBD8v2
 cQXgz6TNhN0/Ya7mTWID66WAIBA6oCuD44sWYTw4hjI5I5JPqj6F4/GA0A8BpcHSA0vtbAfFQOO
 g6jeotq1xnrkbJyGpyfLNVI5sO4s+HQxH2GwLRcSCHKIF2/B6mI9y7fojT1UBvKFtXrK26LTBhq
 gHUHLM17H1UJxleIQT1VG6B7JsL60D9erNaJxY1MZ7emgtYVZxLIoJRRINeJ2Bt1/nRYsuu5/9S
 GYeE+gC1QxvB2ARAnyA==
X-Proofpoint-ORIG-GUID: Gbx1J28RQz4rPSWoHCaXvMfCd53m1a15
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab35c75 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Gbx1J28RQz4rPSWoHCaXvMfCd53m1a15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 72 ++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index c049c3b0637f306c242eb42bc3cc11a333ae012f..15068e8dcbf451c1c3f10e3754d1ea430c20b030 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -366,9 +366,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
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
index 0000000000000000000000000000000000000000..e10fb33996e8e8a01e72a23d4e6b59f4ebbd9b1a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,72 @@
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
+};
+
+&camss_csiphy1_port {
+	camss_csiphy1_inep: endpoint {
+		data-lanes = <0 1 2 3>;
+		remote-endpoint = <&imx577_ep1>;
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
+				remote-endpoint = <&camss_csiphy1_inep>;
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

