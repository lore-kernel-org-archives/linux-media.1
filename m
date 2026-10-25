Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898262;
	b=hxgyJ5dKLFK+9eLAfkjOC2t2zFHmfHXu2ZrIhyiXx9MZ4N/4Xq8ol4zfn0I+z3Cctayt
	 KFxzBw43LBDjumd2FLNxWfucaLAbwdBkk/lK7x4PYCeiOQHH/C1vS/Q9uJKZc7Dy5Y8xP
	 oVL02ACFv9jBUm1KijSjWr4QY1PBXbrDpP25mc8Jm3Hq7Ty8UckQJaexeymzABEoHBFjT
	 7C/DABrHLyC8DGlZb+gGqyrGpD7M/frNLaErsD9GzLeTz5CLuhDkH8mxw2In21Ta5DU3Q
	 w+LH4RFZoWIU/uEwnjaTQR4i/LD3GfXSEKQTHIUG03LBh1xiPlKtO4yCujsdq9ePf+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
	b=qIHJ0hMD1Amym7abt0r3GNl6mlnZHW/2yADrGYx2mHSla6dwUqxfggAJV7klvQ1rQm/f
	 5LMWSJmUjPOEesDVBjH+J7t9TCyO2dJvnZ7Shjq2KEDFqamTcLHKnUAam/yWknWVAy2Be
	 ZyXda/d8WIhsz7evKmda3tmh6NnI7u6zzmf3OVG0O6TAivDCdm/Xat7XskfW6vsG9kByb
	 TUXmjBXJSUse6mvkJ8tOR/tv2XVcWCJIKN2+SY1mMPS7Q+ro6x+qaoZOGNWCAwrLb4M5X
	 ssdmpEHIezQKvq3v9tNSCzARgEBRWon4Fy/P2j1QFjk0vPL/ZCNuk8gvgnM9YEqTgvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gqf5Wgt7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BLghFkbn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863C9606B517
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 863C9606B517
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gqf5Wgt7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BLghFkbn
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P17IM11587973
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=; b=Gqf5Wgt7FLstbzJC
	lki7X6yL4yu9ukVAl6Y42L6ZfGb0Gw41DEKwlOe5obCT/uvG2fWHSAzSAZN/AFZr
	Zj+F8+1fLxasf9qPF3OUAndrVjl90mQx6ivyFaoBQbPWEYNNca5NQrKMhSPWk4vQ
	xSFuhzu0vR2Z/gIJlL9RuGstdEbVusKLN7nw8NxLIUymaqgQDBTepNNhZe5VNjf7
	DRhVpI3ZzLy+BV8wQKiWj8rFfLIzBstTk1yI2nPckvarCnPf/a/VkDGuDCQGPMgI
	38qx4l7cNZi9K77XL0uCaARoF5KoTh9AqSoIm/OaflfyJ1kPTFi1rZcB2tzizg3x
	4+rzGw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnuka5dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so9408830eec.0
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 20:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898260; x=1793503060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
        b=BLghFkbn5hI0lL/YdwEGP/qC5FE+4IkAk29jj2DWTcl0EI+SyEz06i3LJTAWdflSzP
         NjdYfiQuEzOxqUf0bsICopeZajM3FySO2Wi7wcJKSMjswq32ML6y+haUUhI3aiKy+7aT
         UCl6tihGMgb3L081h++Js7kWFbzYlfEcImaC2qhhiBplZfmr8c9xx7lf7WLIJVrkmlSo
         yZttia/B6Y2yQIyhItQCKO6uWgoSVaz9xo+h7yHydmQry4+vnAFL9jtk2OB+PwKfbuNJ
         6GeOOSuCImQogngBtjqntsfq0wLGQC12GL6ChQ2iYTQiAu7XF04H1m1957wFnAloVvr4
         CVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898260; x=1793503060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4y4vPJgEmDpbRegYbIU8W9VPxzKIFsK6cvaBySnJ4cQ=;
        b=BozO+YLRxl/yhfoeeIaSOr+UkRzJ/Jf0FannMQiVbvOt655BQMpuHMSZ/OIQOLp56p
         sECl+iuMnxv87hoekmBHyC8FocUdNzsO1YLUiyPbMTopQ1zW9GvD3tx+WVptnSZ+4B+V
         4Hw/2Pyz0eZft6TwZhdFRezELb6KozrshPeIMn7F1PcWxpUi0i1sQH7j2EQ3Iq8LbEGy
         fFhSt9WyogEUOkvfmsfLp3ZdOoiuax0/gd6WKrRkEAdGM6ZcgAgeb5+9DU3axs3WZQ1r
         3hJe9tkKs/nSlinYnVrTU50lhxZZXURCkPPh8n2TiQUXybbUK7Ncx6FEozaBjm+j4s22
         Ep/g==
X-Forwarded-Encrypted: i=1; AKwUvByO9NCkvmZ0hmOSDWj7uK1Yvqy4F9Wn8oyDPN48ys5o291ZT60LFBpHJ9aGVvMa5zFI5eV3CyKVusR5fQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIE4RMj9+NN/xQTyA38jjchlN5HJg7NWiKgTpQEvdv/eUkdC7u+
	E+WMLUGzPuC5IoVSYfpqsEle50xCMFQ1ubsJEYxJbMU2TiKhZC4omB+ICHuzNuvPm7knahFhNgz
	pmIgM+Gg+0xYyWXVcAOQgKRltc8LBf2mEpB/Qbi4U+mUz9jFdN+cIpCyLcI7XgIFkcw==
X-Gm-Gg: AYBFou1Q5l7eCqweZ5KrvGpMbZW4VyFPwaFMkzBpjZtHwVsePYhnX6FAS0II82gDgGp
	kJU+RBIyyrqwRe6BmPohsGPV1ar7a/qIik+8pLUqcEA7QwUCMxR4kdk+IBhbUR2NhCnKDlA8dJ8
	HjEfMO37cyzDGwl/m9+VP8zPQQ/7u/EjczuOv+BlYR0Pf930ZRqJ3xI3VMLhq2eMu1uJiY4t9du
	uWwgbDXDKT5ChFOAQubpbSLrUKlQxPFoQF9jYb6MwMxAGJ/USiX32OMrN8snFKwaer2ApXpV4zs
	D81oFwyeT/R0IYJ86YF4HhX62U5JVNy5L6q6B9tl4U7vjkXI0SvcIgqk/3+Ri1XC1M5vuMhbZrc
	1QhewpqT40kzAavuFj4CrZO6CSEhL6XQaHOxyn3WZnxMnY6uVAvnvUZNQ9Cx76+0ADVh7mQOTdf
	KkI3DNHnWAWw==
X-Received: by 2002:a05:7301:4615:b0:369:2505:380 with SMTP id 5a478bee46e88-369e84e80d5mr5202321eec.24.1792898260084;
        Sat, 24 Oct 2026 20:17:40 -0700 (PDT)
X-Received: by 2002:a05:7301:4615:b0:369:2505:380 with SMTP id 5a478bee46e88-369e84e80d5mr5202289eec.24.1792898259504;
        Sat, 24 Oct 2026 20:17:39 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:39 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:33 -0700
Subject: [PATCH v22 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
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
Message-Id: <20261024-kaanapali-camss-v22-14-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Z8Z5j3RA c=1 sm=1 tr=0 ts=6add74d4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZJyx6tJpJz6uHbTMGDIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qs5djs5ADZAZXUpozChu3dJIEHdcK9Zs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX+xEDMLifnIyL
 C5S39v/0jhOb2w2utcAC3sJ98d98TUZwAydndkIFxvX1ozBWZ0sp9hX3tHasoXzJQsrgP1Yd/p8
 wp3mMivfntkNkdTTHvuC81EIvj9Aq1Py/ZAthQyz9giYA64AQNc7NRgGZV+PltvG1FaMG4+bq0t
 tqYBxWBjzh9UrYq9nzEEVt1+vDlXTlQl4/AfJmqL95ToiknnUtd9VM9d3VRvr3VTePSibij2KFJ
 2bxwKyhXP6UAyvmdIsY6hycQEsIr8SemxEhTn7xIIQ+EStbOaCM3jR+wGHjP2nnIYs3BvOlhIAK
 7ul+59ZLfnjpSFRnc6YMgo7Jmbeiie7ivm37hqLep+v9ee6tZL2U7P5dtz1XKqrRL5fS3bc7JHN
 tzDxPr+UJhqLknQao9/4yK7rlYaMaMWa13U2QzTZ2w9Y9smeqp+YB3WgK0OGgGjWmWpPj2dP6Ju
 W0AlC3aEiIH/AJeqWUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX3/MqFwYiST6j
 lEBp2HtNnaYXVDaxBsUCD5dpQK6hMhxIQXa2WnIffz26tRVRTBLGtKnajdFyr7EhlrfehUmzeyT
 LUEV0SVL8R+RCGE0ZzCkjPCiJZ4bBn0=
X-Proofpoint-GUID: qs5djs5ADZAZXUpozChu3dJIEHdcK9Zs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

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

