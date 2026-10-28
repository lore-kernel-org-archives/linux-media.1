Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200901;
	b=F2fBZ0IcPyDiXak7By1rt5m/XTsn6p+dMDnh3IRvMfWDT4b8VZotjsK2he1r5qDcJCdh
	 lPOf8PYWz11ebn70CdIv1u0fF9AXurg/rWWIJbwFeV1DOHSO9toE+o2TWgHRbS7wEwooi
	 O1jCOCw7Ge/GfAavIoGEh1fkpqiNN4zjhSiSPIfKjoiYPVoMsXocHvt+qWUyWUbbJ2EM5
	 PRytceh5miZw8EF1QU3YyqlCORN5bRSCx1BABKlAxP1+JpvMilDkxJJCxPV0YIqcUhyhZ
	 u96sGHqZ9g7XLBNAAH5bszRqKw43ebJHt1ZmmoBvOv3rUteG8PdG6SzU0sgdg+JYu5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
	b=movZlX+P6YsBRMMaf3or0g7uI3eGrOxLMquDv+ur1OI5fzoWceYqRKuejGj4EE51tJYR
	 azo95QOt3dA2ioklK+mVFvBS5GGZZpMHm3aBFfzbcmFICekgIVmmwhDVa+xVaJN0LEAmt
	 dMoSgvM0P6jueDK1I4bX/fKeyonc0tzwgAmkNYPN+8ElbwJ/elojQmAC3jnoM0J1m0Jfu
	 gcYlVkthpi5goJ1wmmGmh2UBGyXEB/0JFj0yXg9NQi4sOCwlarIdEYhgc2dlFQSbQr3aB
	 cAYS+8Nvtg6jVFWZBKVcdF2cRmg4mTnW9U8297XqwKVWNKyE6Dss6/VH+zHkJ+gj6fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFAcekdb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G84Nf6Nt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782D860A2635
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 782D860A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pFAcekdb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G84Nf6Nt
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA4KB600071
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=; b=pFAcekdbJO0/E/fi
	vzeG2CEw5DMHakRWk+rWkpUZPeNOYmRoT4IyvxAu+bz/iKOlC8g2Mt9NXP/a3QPm
	Kw6iNpJcpn6s9v6bx8AgRSpg3DCEV35BZ2bfFvNWvWxVTojBnypLPMZqpuZ1bCw6
	4ZrJhU3ljGCzKXqFLmDrrjou3b+W9B6iEs2GblD5dfkohGVgccRKxxRZS5aOxF1W
	t2IAPbGfHwfON5rPh7+9uowdz1R7kDe5aCLeV2bn4KqvMzzZOFpWFKPE4l6cGl0H
	8wpOaVcrA7uwxdK3wD3MMCQb2haXXXRBxWZGvQZYBFgLND7AtS3egPQrt78CMLkx
	Ew5MvQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f9356w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:40 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-677c4ca22c5so1946046d50.3
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200900; x=1793805700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
        b=G84Nf6NtbdA45kxgMAm8IVhXsB5VzwpSQOoKiucaFA62K22HGZeAHUOiW2Ppj+YKuJ
         I3GTg5G4tYv9xT9vIFVjzcze4uIRF+QsXjiYiav62WBIpWI7ZCGKepJAqLbYwfcLesu+
         x8E0C1BnHO4GX3p3XHzFBtXQEvMzyU6gf54l5p5NqUmp5cCCGNsgcYQgEIAI9zr5KBXS
         orcr6Z/w4ik/8bMRfLOZAY9NSMVHupFb9mJAiamwkFhH1FGedzxpPcVx0n2Z9yNOIZMh
         msl9Mg3jgKkz2Xk52olFL2KCQqkp3NB741fsXKcZMOauD66SgfTT8Uoh8irmAt61wboH
         WAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200900; x=1793805700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
        b=zFZzHanWD0qWLCdBS0jYd5HCNHHB1U0vcA6dpzerIB/dZYbBLkhZvIBL33e5nJALg1
         DBEFVDtLOteIYSO913C7zcziLJ0fbw+ljAc3VVJcZGv28zGSmjkYc5ERUiAcF3LZI7of
         IuBMm8jwNmnlpimQS8vCjx/emNcfiQJ2rbB7/qlu04ivoEUxoK8Rlv5jE48+TwhcIYLu
         +7sOM/lk+9WahSPM4zP9MbSIwxI67z/UOqNejKLuG2jeUfnpefdO345sfR8GT+Wxjv5m
         kCvzxGTfTOK+f3qRjCqFdActkzRvTXXV4Ytg7f8OLQw6P9smprH/mMbijLOYtn1gY4zl
         320g==
X-Forwarded-Encrypted: i=1; AKwUvBzv0oFYJbmxEAiFy0gJu5hUpwLTM/tuXmYFq6MMcxWEwM/VofuUPGtkbqEycZU51XWNthdJb6seEGrV+w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKbs9h5AxDo50rvE8rBpCc36+BfxWlN+JxtPoKKtbkoNsghgj08
	zzgKHn9s/2eKkBQ2ZdeU3Xo1PZAZsdaQKr4Ep91GWfesggGKn8Ef1cCgG07COQcV1cezaxFEgPr
	7fcjEza98Mv7rzFZUk+/yrmxT6S9FwFP5VDOWh3wqeXg5G5vK260MRSTFp9mTP/l7kw==
X-Gm-Gg: AYBFou3diN3tfZpzTcL6fh4MV9UJniMRO2r3kYGqJYh/Qt6hpKTbrFFs5AKzOBe0PYQ
	Or+IHWPpU9l57Pr7X8/kazvtiNTAFxbDYXdkjAMIV949gSi/QUKedDY41o0x8Wkbfo6/hECRGEY
	joKlQxVld3Pw4cIRtOrF56sCONs+SC+KWnmPBDbjCby3knlFKTaIeRsrhiJ1Dug7y21Bn17k8C+
	shfqv1rAUq1qFrGXJx0jx+1aVX1rTErkwWDPFCxL2eP0W+639+PtstPgST4q/kxeJUNsrRFZmZ5
	81SISGPvj2Kuci2Pq/DJdEmPf1JoqMuKDTIP1FJ4ZDHJRUrb5OMiETOsG0MFLcdgsf6zMXJCxM6
	lqYUspYM/meOx0eeR2kYw1v+s0Pcbp4iCax74jW7+GvlM8sHSRyk/eF/87qasZfPy7gVZoF3GBt
	aJmtiDr10VvBaQjbZjPV0lOVeNbDo/3pTEkDEv/AK8slukbjuL7dkuYNsekoxE
X-Received: by 2002:a53:c78c:0:b0:672:a678:da59 with SMTP id 956f58d0204a3-67a7bf245d2mr1555983d50.108.1793200898903;
        Wed, 28 Oct 2026 08:21:38 -0700 (PDT)
X-Received: by 2002:a53:c78c:0:b0:672:a678:da59 with SMTP id 956f58d0204a3-67a7bf245d2mr1555956d50.108.1793200898271;
        Wed, 28 Oct 2026 08:21:38 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:37 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:49 -0700
Subject: [PATCH v23 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
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
Message-Id: <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae21304 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZJyx6tJpJz6uHbTMGDIA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX7qHFY0m3cctx
 rguOBMQXpO/tMsiz1YYJHu8n024YbcWA2VPdt2j7WJHaDH99i9BPPbMHpR+tJkpDejflzqu7Rn3
 El7gw0Ck+puHoINj0cjaX6Ofs8jiXqM=
X-Proofpoint-GUID: On9vw5bYC535CpP9rfEnuK7at47swACb
X-Proofpoint-ORIG-GUID: On9vw5bYC535CpP9rfEnuK7at47swACb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX4dZSKkFuh3gF
 hCZwjNCVylWlk0OJyJF+iz7BoQuoS2R8Vwb7FcpRC+h8iRD4tNwFppiwlBKKUZk1/ShJ4ToPmK8
 Ss8OerYUJSy2Yk/GqncOlr/d1Zb7MQ2TZ1ixDLAL/9rCQdMFVh83kpdIhXciryzsFdpegSGA8X0
 WMLeeLU1JHTTsHo1DKrei0zBTZ9a7O4J+wxTjvoVu8zlRn9H6KYiywEjmb+p3oy/jXh7lkP3tqG
 +yW5nxzPrsJVrAD1Dm3c+wIPNBMpBiAyUiMtauTmNvtqbJwdKzo1YZxPxruXHN/E1T7zcU3/TjY
 J067m83grBtjzlWI5toN2atf7PTAb7rALn2JR+9z9LU3YdNJMrvZ08XWxExy70+JKCLN8Bw6FLQ
 YGNDovv6+IpsD+pGOu37H/OMh8DHhRjVjoMzX4ZLg9ozmez9xGl2+LLtx3ROx5gHfMs6sbj9rtU
 cip+NC2qE+smBamRmSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.

The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
lane mode on a rework camera module.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

