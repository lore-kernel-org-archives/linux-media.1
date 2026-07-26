Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64F2357D03
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045126; cv=none; b=T7drVl1fcHm5XfqbwTesN/quIMOp4syZXhAmItPmpYkLktls0Z86QQHQb4q0kIsLqTWoguCK5EIS2e+EQ6el6fnfLAE/PsSaegYI5uIrM2DfDtSaJbc53MXMWjxo2530PKUfPes4e1r6WNSxwzWb4wEFQHh9nHazKNIfnay70GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045126; c=relaxed/simple;
	bh=ON8srqd3aUgowhj67UGEbvHl9QpdnL4HJawBK/SEEvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2UWdUee88iyxVfZEsCBSBHXoL+zTr1MT8hTdFxFy0SiGJAlHbbJ1adUbTbY4SjmhZIm2iil1UK9SioGJ6EnOyxh3Gn6bnrUvYCG5Zwef6x+51ZrApQbsV/SbfWG+9fvJie7JNl7zDHWePgk7RK9U2svmbzrQtX+Ua5AZzTOztk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMMtALhG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/9xHyMt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMMtALhG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/9xHyMt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5SLs44181490
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KSqOAwb4/u/nEQFyuPvcZ0hNY/Ka6J87mP3j2Yv50Eg=; b=lMMtALhG/S5RiQcN
	rT5IJgZRLI9W2VtMn5IWhKoiPRr7bdVMwQ2aqjhkn5z6woxYmr5gi7u11X7v64Em
	GJdDV9UPy9h7esLBUqyy2c7NDJ6mfZZhTfsjmWeql8Aiaq0P5GpYBWKDRW6p34wx
	0yIdfVu9adQvge+bwfWYoZhhzn2Z8N9WKHxGgfDfb/2rwzbZTHuwhkX+h5N3twhd
	p77/yvQj3ufJgPkkyJKPqH/9OsF8cFrXwTYKMDED+q5ez7EYaPOtEUeS3RKZpmaS
	gLP+u3xGxR7TSqHcZs+EdkPGnFXBkB0wTFg3f5HYP5yTDqjJESM1wLA8QmKJXYXv
	tokdkQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm572g21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:52:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca860baea9fso3886027a12.2
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 22:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045123; x=1785649923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSqOAwb4/u/nEQFyuPvcZ0hNY/Ka6J87mP3j2Yv50Eg=;
        b=B/9xHyMtWlmCjRIr6IEJsYa96bWjHvCpjim+NOI15WpgJHgVxMwQeinGigfR3nPA8Q
         F7FvvfPDk4E4+5FgZANSrNh1Enuhg/UoYyQdenBWlylYV2jaEwhmFxji0vQxpp03/FqE
         46roJsHsu6xc+DFGfQ7Ozvnh+ITa2qrJqDuPEfa6zAwPhCdjy1f1vFfcvoFguZ/unqvK
         +EHcm0oFgW5ubV0AbEQHdUMrfGxFIgZb+ZhYFAAU4k9TjZdO7uub3k+DBxijCr2na6+8
         QJJ+IpoV9oE3ccvym2Jo2JTTcZ2Zm+dEbK8nhlkEEkcz7jLUA1aC4cqp+cgVLSghqom5
         i2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045123; x=1785649923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KSqOAwb4/u/nEQFyuPvcZ0hNY/Ka6J87mP3j2Yv50Eg=;
        b=nRaHgJLJDWHo2E6oZyLgEoCfmdkADfIFhygMbDKtAcEWxNbwzO1QvV0OC+wjPERTCf
         PLK7GvIqYWjzg3H5RtUAu4mc9d4XTyyg9hde3jPrj0wQwr/NkcBi3yDft0XRXcRQps32
         UQqx7c9iozqTS7FZ9sdOm6h6QOC9jcUbtX41X5ubMlMWv1QoCFlRgCYTaRrYMcnbcwj/
         ApBz9IR73ahK6w7cCsb2h+zlGJUwgPzF6A3F4Ap82Bc+TuOLeyiQTYiVDWF9/KKs4J7Z
         cg0XMAivUXSmGxUAqIN4ug44kdU7zbhlbn8+Z4tBg6uhonKHllyuI8WxubiBz2pwz8bf
         uMIw==
X-Forwarded-Encrypted: i=1; AHgh+RoF53YAoRypyuH5k5rxpHZYqIYEE5PcLrOmzMWNdtZfHG7WbsSjR47xb4/ewF3V6fu/W1Gl7+0Akhb2hg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+YuSEO3WDk2pBmlXVtWq0UCcQ7r/Fk2w8SaSbupe5/UkmuGLo
	RmnT+Rw0u+jUdi7mIGetTCPEIdxzOGv0krE5ALY26Y+tzS7/RC1NfwvkdHabEsI7a29JK0qZqNn
	sqpx/XIK/91fnFJaVj8aiKF7OoY7YK5j+xHqBJ9o5ezBESP0rONv2MOo6bb2Lmye2sA==
X-Gm-Gg: AR+sD10j9KtLKLwQUsPeXG55Pp/ixbAll9iKKWR+mjR7vQB8AAszmfkZbkRg8JaklBI
	x6U7TZ0rJVCqf91pXZOyWe1ZRFOMHQvEQVuYxCkuJfFdoKsb0ayXNBWDh4h+4Ckd1RlSW2qZeBt
	3AnTJZYrhZpZm+CXpp6ZTUSg5IDTBMTBAMqvvn9ywcLIe4BBMt04UaZ0z+Z1BTrj8XjApDxxYCs
	s2eeJT7qx0sz6UwB3CXHbvBWY1uc9C7a/xrA4DiO6xMFPAlY91Mx34gs8z76ajVGf3d5Ya86Yb4
	Y2BSt3pIU8R0WwMZgZlKmZaxXblgvd0TSOu8lbj8jrJmrFoGJlIJ8hnLELg9GmUF5Qq481BLCu5
	nqzLVPrVMuyGlgd0nO4tsrOTMrFJeec3byA==
X-Received: by 2002:a05:6a20:1605:b0:3c0:9c1b:d0b5 with SMTP id adf61e73a8af0-3c67e02704cmr4106586637.64.1785045122683;
        Sat, 25 Jul 2026 22:52:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:1605:b0:3c0:9c1b:d0b5 with SMTP id adf61e73a8af0-3c67e02704cmr4106550637.64.1785045122205;
        Sat, 25 Jul 2026 22:52:02 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:52:01 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:43 +0530
Subject: [PATCH v10 13/14] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-13-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045024; l=4683;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ON8srqd3aUgowhj67UGEbvHl9QpdnL4HJawBK/SEEvE=;
 b=6Rqw3lz4PWJFC9yYr4KT8o59dlDL482bmFfYG/TgIWXXX/w0DmRLnn229Akstw47/jpW6SlZZ
 MoSULRG3RV7D5nGNI5nlfMtq7PjFrpNoUSEvcTglOqDheQ2CwdSLvp0
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfX8yabwiF3Sb2f
 3QL8QkTP74xDGW4CJdLBzPKzA+0e3Y+nXirK8HnOgF2VQe6TNkbVu3dn2htpVD6yWbd6R7TVyGE
 yR1R94ZYQME3Eb6cCswgbdVIkRlnCzs=
X-Proofpoint-GUID: 9yOYY_NT0mpaKuAmfkxwOC32S6bZeZ3o
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a65a083 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cZ5fV4nVeeMGK4x61nkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 9yOYY_NT0mpaKuAmfkxwOC32S6bZeZ3o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfX3mA1pM0DIwjL
 YoX8gV1mK9IOuUuVmkqxxFGVlBLZqx8KpJq5uEACMQiNzahVKeDZFRnSETXqZF/1AEOdo84FDsJ
 QOdEbMeY5v8KF+HhUE5kP49XsbmhDauJXQ+F8JZTJ4G8mk4zNgq7e3Ul0hoFi5RASKsT7PuFVYy
 cCmBOlUNRynH65uBWd/ra2YkBkFHHu73Lx/bamNtqgOveK3kdioSj7JOZqP+uPMwoDQtvswdTtz
 l0A0E7G8pXt0d5Tz/GE0HVYpaB1bGPp7bnWH+jHIxkdc/KHDjcnSFpc9ioJQVCHIx+HW//z+YFM
 bUz5hHk39ACtFX1NUeXjb1tTqa5i/ZSXVWZX6NJrsCc4iiw3feIk+492HUw9QPPPX7cm5/Lbfnu
 rucfxjyALbOgBYulkqYcSHtRVB5M4pP8wl6qWiKkjkpI1XC5OPQ4mepf1GfGvxSTSnngxPDTtLj
 xby0Ky9Hl7hXn6/IVWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260055

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 123 +++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f32af66a3f1c..f3a01a2a1f22 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -695,6 +695,10 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -5314,6 +5318,125 @@ mdss_dp3_out: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "core_iface",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec0_iface",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec1_iface",
+				      "vcodec1_core",
+				      "vcodec1_core_freerun";
+
+			dma-coherent;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS1_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vcodec1";
+
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "core_bus",
+				      "vcodec0_bus",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec1_bus",
+				      "vcodec1_core";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			status = "disabled";
+
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>,
+					 <&apps_smmu 0x1944 0x0>,
+					 <&apps_smmu 0x19e0 0x0>;
+				memory-region = <&iris_resv>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1943 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-655000000 {
+					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;

-- 
2.34.1

