Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9683F39E8
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 04:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139490; cv=none; b=qs5OBazevh3l/0xmse123lk81onuNFUqifLI9tID34v9upZEBdR9/8vU4fk7/U0daikwjZGPLzvMk5z0YshMM/IaQOADktW/vnzP0h4h9fnsE42RxtS/ksxNROS+xHJIq0p8U9QpRHbRvbvQQrmHZ3iue5qwslB1zLb/Pwa6zAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139490; c=relaxed/simple;
	bh=9xs6L5gfHSY6RV096mPtEk3wrh94zC1XZp1H1XF/ohU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i6qvpXSiTOhAOxX8TJfWcPW/a1CU1hqQ8f0LelbrniuB9xDhXhwjYFvSb55lxqzABYyFiY5C4iqpHQJADfmO96DB7X1XLpPhBJdeS09G5Of9bhoReu3XmYS5v4rzX0DSCq4oEkBQcWjlkOzKvywXm72cdwdlDQ7LruWyxVxLCoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kkixp3dd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8Iwj4Bb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kkixp3dd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8Iwj4Bb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3io0l1425993
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 04:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZwzH/kmKq82Si6b4z1xfCq5OCxq2lvwBX5Dwr7r3gc=; b=Kkixp3ddWNnEuA5W
	Lc5FOZx7+iY4PnBXqXwxiImtPgsNhU60R51BS+NlqmkBZe++zOttyfqQcQ/42qaW
	GMJRbd9rMaT+z89S5K1mWETmtULKYe1fEJZWi/eSaP1YUrZbunI1BZkg50eTkKtS
	VLrDoYiHzQoO5KtzAylQvqlDPV39v9pbb9Jm1hnGFFpq10sZnaCzY0OsK0GJG+3j
	RJPjeC6m51N0ozLQ7xfc7JeZLrI9T7KO6k16pkQTV8M7sS8KQuQNUuKJAIU+DPIF
	Zkgg2bKfVZZ3fITa1bsVDnBjuCQ+3W3Z1Y8wOZAcnMz9zu/SQYDm14QIerQgOgiQ
	WgNtNQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c27tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 04:58:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-331b2ec616fso2058469eec.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 21:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139479; x=1790744279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZwzH/kmKq82Si6b4z1xfCq5OCxq2lvwBX5Dwr7r3gc=;
        b=c8Iwj4Bbiy6DOH0LjHb8oodlZHMtBRXIU2uFhfWSTTyK/wvvts9lHX6qfs9wCzLDhw
         E96PyaRCjy7gBDnX2yq1SrahIPyRWb3CqC/qHE5SGU5yipV2IMc0+QVyFCvwuz0wZ9Lw
         7UrIcmFnqkyQLvyUQiaSl/SlQx2aFcyc+xkH4gG2JVzouZ9axugDfO12LI8WHOAiyUWv
         1TA/jC1MU83kUlMq9Y8FBzpI/bApl/DqZTJC+pWTLHsN2Dm6zIFPeZstdtEJWyD+P0WO
         J4K903R02M0LdFixMdq8z4yzBssLo5EADL8l3nFD33Zv2b1piukqRGQ3snt1bSwl8fZD
         uSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139479; x=1790744279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZwzH/kmKq82Si6b4z1xfCq5OCxq2lvwBX5Dwr7r3gc=;
        b=PuHP9xMCQ48psbFglc9YMRfclXiW/1KSoWDhC+rQBI+0wMU2qhzvp3wsHWHUqe4Omr
         mR+xYjk20YJxfXUMThR7CCcy0bvuYAofmgGd8dYRBk9PsdSLeNo+OFU2tGxqMTRH4HmA
         +2vR8g5Hx0qr1NmOBgdpCpa/aTxVg9jjyJ6KzyFVrKcXHd2cWgvm0n0pGwFYfb+gW/2E
         u+yivO9h1nYtFeOQ7hsWsm/BRNpcPVmBrxcmlVMtZr4uWbM6B0zh5XNt0xmwbYr11kWl
         p8UkRqd6w4TZWIgrWyUGYIu/P5g3sdFO9AfggIK+EAFnJ3qYmWFr1Y2NP6dipir2DFsa
         rlJg==
X-Forwarded-Encrypted: i=1; AKwUvByfIZjV8UA2mVBh9yH4CDCo3bArUtQxai/pqQ5ixyJgui6UkcaRgeubaDakvxa6n/8v/uwJYSQkZ6FhkQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nIw/CSFSs57cLBhZbEAQ0vNgm6kRewqN4O+BC+5bQE/fyobHt2
	3N28b5FfTZtTYzcikhC7mY/YMgPVtlWY/WKpGtlXgYlHBl880EBcTr2FiaKzwc7VOfzNU60Q19O
	VKhqSpJsodOg1G9awrw/oo7ivLse0wqaL5453kFApmLa+0njC/Q1oUOtsS0ML2/8ZEg==
X-Gm-Gg: AYBFou0fLQtinPrU7x5XrUQXEE8PHTB7j8aBxK6W1pkWzotK1lXpym/hP8ZCy2IuKO/
	EBCeLmAWl5eh+uwV8C9Q/XtplgiswN3jqIfbdsk6TFa1w0uNLhHvFUXqtbvptqRKUN4xcFFQm+v
	jAap4buFWyJpk52o3aYM9AsJ6ciNuYJ0cAUk2q8wtthsseJu4PWx4KzFLhnAU7rtRnevhwzTHj0
	9pihzfJ7/gD92slbSkRnRBbx8pqrCDQLi4IaOQqMqnsYXgjRd0tBwP/ALdMAHYi47oBfMyVLWkW
	aO4W7/Mu9dYZtUel4XvMLjHOXhT9UGEHW8+j+QDP5gBAzliDDyr6usgFmsUm8pk39K3C+utYDrc
	+TFimQIsFCLptNptnzOPQSIrldS3ZORy0aF95aAUl
X-Received: by 2002:a05:7300:e9dc:10b0:33c:fd92:a7c0 with SMTP id 5a478bee46e88-33e8e3b02f1mr1606961eec.39.1790139479264;
        Tue, 22 Sep 2026 21:57:59 -0700 (PDT)
X-Received: by 2002:a05:7300:e9dc:10b0:33c:fd92:a7c0 with SMTP id 5a478bee46e88-33e8e3b02f1mr1606927eec.39.1790139478690;
        Tue, 22 Sep 2026 21:57:58 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:57:58 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:27:29 +0530
Subject: [PATCH v9 2/5] arm64: dts: qcom: shikra: Add CCI definitions for
 Shikra
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-shikra-camss-review-v9-2-09f5fbea1309@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=2875;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=9xs6L5gfHSY6RV096mPtEk3wrh94zC1XZp1H1XF/ohU=;
 b=smun2pIGogLH/CJD0TSq3e3BYkkj5MIp1ViERJnL9Tmq5aniQKV6AO1lx9QdXs5lfGep6ktpl
 C8uYzB6x3vKC5/RhqrG8XKAK9a24+7/QU4HP5EefYVHW/PlfOPs650h
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: GMIV0dEWqfJEMJ44UqdLjIGmKcm9fOoz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX3bjwlMQ2wVGn
 l4MCzuycNnHBiNHCPvshlP9Ef6L3+ZeF/Bw08F+irGLw4ahlzf62mfhCo9XCT/TsT7TuMxGiXOP
 mdlTDnx+U/E9oc6ewd/j49Mq3TOcEr4=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab35c58 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZbC1Des45MQyGPwI-hwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GMIV0dEWqfJEMJ44UqdLjIGmKcm9fOoz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfXzqDz/nB1CbAL
 LbMpEXVA848dExvAVTZK7niuW2jmt2PXUgX6k/EN2UQC+F+6Mv9Yz/KYNvicwTbQ0ac+nUTISeW
 R5gjFi4lGOsewKMkJG/m61pn1tSKNyuUmWZmd6rjCq5VgdVT7xSN/Y9ZZ00FTbY6X74vTsOhQDY
 y8O9ZXsmQ9RMGsR6MKYifmWKRlA9W7+tvYm33XTjMed3vd+4TToIPurJDcRWqshAfZAnPIqkR+u
 KI8VLkV5Y45armZsygaOO7TDcOAZHfFVWgcXOndXZnsgGHUtbmFR0yW9VN5216dDkGyKnhIgQp9
 HWC1bPO92xe4wR4uFkcSXop1l1jK39lWRlO5jYCGVVol2MfPPZPCUOi3gnPup5AdwlwLpr0xVzL
 UqiXK7dNcBykzXZuO+PCOMos0o3xDOWJujYxtYCsVeeFQ9Z/v/7nFqZc2gjk/SBUFK190D7LWWJ
 a0HfZK3+Th/nAO97nxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 469023a22818962abb394f3ac02752f816efc839..ed73603c3dd81d92d84c91b57e33154a6fe5b470 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -892,6 +892,38 @@ qup_uart9_default: qup-uart9-default-state {
 				bias-disable;
 			};
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -2077,6 +2109,43 @@ camss_csiphy1_port: port@1 {
 			};
 		};
 
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

