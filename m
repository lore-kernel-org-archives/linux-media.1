Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616167;
	b=NoDiWwShCZjWbOYmMkg9Vw2/kGvIOVuclil4+8DsyyuuK3SXlZIKaHkezGTaXDMx8bwr
	 zjThDLWxaflHFsCWbs8pQCFUagMvefnPgyoTZ1Kj+KNZqXeRyUkIDtE2lsNZwNf3IzMEt
	 FcMLch5YvKPsKXtG6GPOChvs/CepVfUSq3zhRkkhKy+js+ntM0UlKgDeLg9x7ayvb2sOk
	 JJeSbZKjJHalWVXeXuQG+7aVin+c62ZahY4gNRBMUanrZ239e4H5hPEpFqk9sTdCMKTGl
	 A7kxtSaLuDphTcGd/zwY1gixW4W7Or1fHGhwLLP5vXkMzaRo9zUtU00kT77bcLVszzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=;
	b=TUuqYi+6Vou7t/pihv8jTZOoDft9liwsBdphFM9n+61ZRPr8+Jy9urb281tApR1Xhv5X
	 MPnYSiGuxcEtIoAnY7+c9sm1VMHc3WEUiKH2wdvaIldrXF1+kLJpc7vybaCCNfIO1GnDp
	 lcx5eB0fIK8cgFGXGsa64tws9Rl7fTevXbYoU/VVuvafvKv9U4FMd2D4EeX5L+Nfxilhw
	 M37otpY6H5bECh59P4G0Ce07dh4FDv9XlCSo48gU715PSqNUClhHUe9GL/7x49qokuGOM
	 9Xic75QsCtIAYdXCOIGuXayuy83tIihkanH2AcCATWN/L5x/yZ4UOGgOOq0OqbpboIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cn5HKJch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuNUEXFI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5869C60A3816
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5869C60A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cn5HKJch;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HuNUEXFI
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOe63086536
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 10:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=; b=cn5HKJchFxnD2Pb3
	abSbABmjYOkN3fOGFff63kYAWGD68+t3hx9kIbyiCSyrHtNkQAmm0RSn0VXCKdi6
	q55s+pVoDqdKMKbmX7YxIn63fcSWLZRPvFZLWtvHkLBFcPhANL7b/G4TaZhTkTuh
	Ukeu5LaJXSGGEOU7lLtnyJ4raYvxyY5fHbBg+aYEtyGFkp1OWlktO40gzKYdQQ85
	9a2WlhR0pFbYsZXth3Z57uoThPwgOdH5A2/u+zIK9jgHSZyvwqCu2tjYOuk5+hAo
	J29UO62luPIJZE/NnTzo3BHjXudEVKzQ4T+Pn+gEeGeIK8HskTmqiLpccbhHuyS0
	8cZPcw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61d36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 10:42:46 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-84fe2593525so4432186a34.3
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 02:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616166; x=1794220966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=;
        b=HuNUEXFIvM0nrdaNNLZwxSR2+KktEwiFpBnFE7jqzvqyjlgxFLAr11EtDqJiFGS62k
         K2y+GYC02cURoRbbBGWL5uolqOuY6AyQwgBRWtBuXaDYQY70vdm+mzGGjGm45gDOkavh
         ycVh77HURppRBhThcCIN3bJIEcDs68QDP53TvrR+r0k8y1vXj2p7s0CwQqKirCUD0Oe1
         FMZd6fbPKg7+B7aGJI39buzUsezfJ263RseYYqHe7jSszazHxlLa1ENtVhdFnkolxxCt
         U+TNqBt0Idl8rbh3IC0EI0gJmHGKmW+UnIB6s27LJ9fzt2hJsLZu6+3hyi4Tz6R9fjuQ
         n/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616166; x=1794220966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFSkmzhU6ZfcsWYrD7wTmAX1CjLb9zWXMvg6Mo14xU4=;
        b=TAdqjnFxDt5/7JbHQdhq6D1uJFcVs/OUjBCJP3WHwKw6xjuq8ILMco/NyGASOlPQJp
         BfkylNInsjWwVqGk5O2oWzFzoOgk5P+Yf0mK7BzaIFyHwPJdlQ1nTXXzR/G1Bhj4soWl
         a5vst0UmNhIdmI5StKa740YHNPpfNGn42WTN6yvYORcdnQLK3hSsoxM/SnXVOVrd9PAA
         zWCkN1y2sF7HRNtkkeNrpZc5iDwtraFeKA39yAZq8uyhzi4u33FVwRIgFDk9JZgLnTAa
         PMlowwX6kddnKwtqaxU0TyjU2GVTQsXY3FzADJL6+BFW8OMjLbP/zXBxf6jSuSW1EMs4
         pZpg==
X-Forwarded-Encrypted: i=1; AKwUvByzedCLAwxSaj7JBpiC17mG2qmwxBrBnN4Yl1tC7BQGkKqbfYxttpGugJPgfF9a2C90LciQW2I3/JKeqg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLapluljMHJxkwcfUTcI3aNIy56+lhTmpkRZpPTB39P9ekeUhgs
	qswNZbesIoAm81OyDbtUC6jZQyn8HeanCCUbv0l3bHTZyjYHsimqyafYpY+5RKujj5j6319A4fr
	iFDJPlUkGT2cJ4UckJE2JAofToq3fdpozWTVCdAGqRR65k8SaW/+iR26LLy1HsRRA2w==
X-Gm-Gg: AYBFou1sABTocPbThS/MWtwhEQ6VltkIYGqQLWMSeKNMS0IvgBUfJcHYofuxO3k80IN
	17FwNhXyr9AAdGql6QVzYB+ycuDLPb0qRDU5xFpQCEW/qDMEVzoqMqN3cer4EEzDG8nqheDzt99
	hIbFNYOoaPgidn4yWeiraxkUvq7qzX05pPYgEojR2S1yde+NIWuZwoTs4BS7gy0okA6PiHWTP2+
	7iJ6YeZ/rVOy6iI/fljyUh0ByBeyOa4qfQ8++dUXkovqz7pFjdv0BQPuBQqN6I1tGqDVsqx5knz
	o0mLR8dIV/ijzT1a75Yfyr8Pn4MgHLrxivno+4QV2SZdZ2551hyg7cqDssxlcPbC3Lq7rgqgR6N
	NOS/wCMmKoQxNbvCv+QzPCmcIBF17y4x2AG8i9NMmZxeh+7TQFltCn3gOOC3u3/H+MpVi0Y42X/
	0UHNjmh57gER0Ssq6JVrCOpYeBteSGVxchYUnFc8Wwyixc5njl+7VvH3SZ35w=
X-Received: by 2002:a05:6808:244d:b0:532:4867:8916 with SMTP id 5614622812f47-5640d9277famr6043852b6e.4.1793616165658;
        Mon, 02 Nov 2026 02:42:45 -0800 (PST)
X-Received: by 2002:a05:6808:244d:b0:532:4867:8916 with SMTP id 5614622812f47-5640d9277famr6043848b6e.4.1793616165250;
        Mon, 02 Nov 2026 02:42:45 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:44 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:23 -0800
Subject: [PATCH v24 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
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
Message-Id: <20261102-kaanapali-camss-v24-15-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: 5JcTn-bwwBVY5Nv04wFqebhzSXInHV3m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX3TgzPjlFny5j
 28CoZQD0V0tCim2Wh65smqttbLpD26HecGz6JUNORuVAkEw66BMNeGTVHgE8Q7P88qfd1mdqsxO
 ciurbiervWkJYuNLRvJdnQ3sjK2v2Cc=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae86926 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=azXR8Rw6a_W_3m1MFLIA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXyLdhrlbpvwY9
 Ifnp+xliLJSW5ZhkiiVjti3xoVG1bYUng99TMV5F0ZYPqnqp3fA524ZZUCKTm4FzFQ96/lAC6ZS
 Tnt1IQ/rsuk6tpl4cXLjN0vCuTvy0ZIBdAknm0jOnNqymEa7yfx5OFhRQDx9BU5HK1Ic1rJak8d
 9R2E6Fa5E1BT2dhBONcpRhR27KEGRo5bWrOok+tg/1o0nMJAs122IN19JaSQtz7mlwlEkxTEgxs
 6SDXaasdrWW6j+ogArTMyx/RlVDIWf3eJUEcO81XZdo/ivIKtym+2cg6ACFh/nCMb1ZIOYBtTTY
 2DpXwnIJ7L84AdY7M3AsvMXcXrAmy9x515JYQEpjFA8/KYy77zHU8wwCgVtd1lbd5AKc2KWqu0g
 IrKTYEA4jjYYdRSXl08rWqBaBQiG5c3ZTr9ofSm3A0gP6CAuG+EuqhMig2SWzk+dRKPgtKipXw+
 Xfi7bTYRSS7DQW2jAnA==
X-Proofpoint-GUID: 5JcTn-bwwBVY5Nv04wFqebhzSXInHV3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020042

Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.

The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
lane mode on a rework camera module.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  7 ++
 3 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..84b244d43e9e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -48,6 +48,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtbo
+
+kaanapali-mtp-camera-s5kjn5-dtbs	:= kaanapali-mtp.dtb kaanapali-mtp-camera-s5kjn5.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp-camera-s5kjn5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
new file mode 100644
index 000000000000..d0e39855e0e6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy2_in_port {
+	camss_csiphy2_inep: endpoint {
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&csiphy2_out_ep>;
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@10 {
+		compatible = "samsung,s5kjn5";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_mclk2_default &cam_reset2_default>;
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		vddio-supply = <&vreg_l4n_1p8>;
+		vddd-supply = <&vreg_l1m_1p0>;
+		vdda-supply = <&vreg_l4m_2p2>;
+		vddio1p2-supply = <&vreg_l2n_1p2>;
+		afvdd-supply = <&vreg_l7m_2p8>;
+
+		port {
+			s5kjn5_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <1248000000>;
+				remote-endpoint = <&csiphy2_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy2 {
+	vdda-0p9-supply = <&vreg_l3d_0p8>;
+	vdda-1p2-supply = <&vreg_l1d_1p2>;
+
+	status = "okay";
+};
+
+&csiphy2_in_port {
+	csiphy2_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&s5kjn5_out_ep>;
+	};
+};
+
+&csiphy2_out_port {
+	csiphy2_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy2_inep>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab..c70cd39bcb75 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1243,6 +1243,13 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 4>; /* CXM UART */
 
+	cam_reset2_default: cam-reset2-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wlan_en: wlan-en-state {
 		pins = "gpio16";
 		function = "gpio";

-- 
2.34.1

