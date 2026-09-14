Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4818E42589B
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379690; cv=none; b=sHKFk4lx1g01iOe8vdMj6orV2Bv0MC4qNkLlp2QVjfY4K4lJ4WVGZxOF+qNSWE4zvt/nRepEA+xV66dPEzJn0UcW7yfMHy/2UcoUm4cli3SI+YtSRd3gF7ui6WrSz6/n55lqxAIvWMPmJjGwAmUlIEbrclVHTF+frzXt6Xz0LQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379690; c=relaxed/simple;
	bh=QU6DSxRjEWunHWAevgigWKsFS/uH9Z0u6jHXsLYx6W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SswGOt25FUeQ7GtMFO4Xl5Ebun4N8XyfmnI07kqwoNTD4AhCSwddTu+6aJmz6gHDZ3l4ECt79wiHgJtbVnvYg/xVsPw3cb4kY/11JyO/Tiey84XKgZsMJ/ZRsNJmTbmTVmBlcDwl9dEwUDeZZnlL9rz6rIJnu9M2MHFespXzFwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKqz4b8i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/6mHAFe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jKqz4b8i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/6mHAFe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nSCj3905802
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 09:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=; b=jKqz4b8iqm5r0e6n
	zBnF7q6nGdQO3zVI8h6lCJkAHEuOb/sa5WnRZy+S4qnYY+rYn1o1ofdnZNCUDvPS
	XLHTiYCazyUcoqtcNby0oxu8EQ7zfEI4GlJ+HHvsYx/keqFkv6IGCdt7IRc7I0oN
	PG7QnGRK3FjyJ2W/wO3FXWVHhC3QpOd+ubSM5FPUzG4rpmM2etRaxvT/bO+dvOoO
	ygMVKpGlA5PMQGz8BPkYRteNz1NNoWjqAqdZNmjuwDC3nXNHaq+kggaZQ9LxJPx0
	eifS5UvLw5UisaPuhiez9grtwa45xnfBhRRo9e63QNkNHsODyKQKdu7FNBzwdyWa
	gOTGeQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd61kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 09:54:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso6339898a91.3
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789379687; x=1789984487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=;
        b=H/6mHAFeA8NSKnWKSFHRNYy62QNbYhUexPTPc6jX57ekYuLj4CVv/shkjEbcZFAKFq
         w3taZnJ/3lpfZlGqPI/eSdJzyTr1bF392xNNu8xO7IpsRjGJ/kVWPXioPhxPjsLq2S4r
         j5QJD1OdNDS76nED/7Xl9zjxE2WoqoHRAqSYY3BfGmAONXgJADpNqX0l/v9/4aCL19kE
         /TPxkSFVepQ69tQCDQXwI4udNZMCC+KJzsYgJgloyJ5l0M7FW8LHwQmcXJErdgdffhqJ
         QCLE51O61c+JpyHfWvB+Px6OmoeKfi9rEB/Vmle/dNDPU3UX6mYjPtmS66+Qm6K4At8d
         eipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379687; x=1789984487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=;
        b=SaQHKqvN1LIU0JlFYt0CEREU7+gaHJKekW5UoAPkt0riDCU+RocOQizC5aWQGTZJFM
         IOGQgOFQR1+mFi0plR+oMDZTruWjVzYqrL+uI1kDYidMqTaNm/XbV2cMRWlsZJUXobp3
         7Sf2glCJrEDTVYVk2IYnuwi3ggC77/040XVJYQEW6hzm7Qig4Rp+AvUfzZJ6w9VLJEs5
         5hYoQLzf3BrZ+KE8Cj+HHn7fG4KHaxG8+UZbeg8v2MvdvE4pwI5+UiVIfsRRQvQLC8cX
         XyznUQtXNQNG05MSNpPaWU+28PQhT+uulbyI5A6ki9IMfzeWVfPjeOUhR622DihX3GjD
         BEpw==
X-Forwarded-Encrypted: i=1; AKwUvBxOwLWiX63MgMsiZUeD0DCD9QyeJ1DL6PSqfwpoWOZhHAEGSfqXAzZTroSNfnma7D+X9VEQMcJo4yx+Wg==@vger.kernel.org
X-Gm-Message-State: AFuF++kWCO8MnLp+H/Vvyu2+rbiZxFqDwIIN1LF21AlgLq+9Rgv6rYkO
	fXviFRsYZ7ixanuFoAQ2GxEuH4TSgpGUAdzb7JXQU3ABBkt+JWCIUzVF0JI1zuPXIO64H17aSEd
	HJBoHqchHKzmG8C+1HTEntYbRSKg3pcoUBZyb2rk1fF0bAQ6FGxraGf2n1kJhGZmFkQ==
X-Gm-Gg: AYBFou2cnZK7g6qo2farGiY7TllX6HjDPeE3DsbOSV1AfyPouj6ppZKz0t1x4YLsUaV
	SEG7kjHkh3XhuKpz9xC1e47WD/ZMESnk+LYf5kME6P2Jh5p2QUk0hkAz2QsLScPxmZDLNHeEj0a
	X6ZWNRBaEODopB68RIi/7cbDXLNmpOlIm2U0BcNonM7+KeJpSLWzHNZj2m+YbqzefkzYNu21HaE
	dVs8SLpXbeNzrRDL/ElGDR74GWhRwIT0FGhozmu3M8Z+1VjMMtyQRXJCPYGT4aVB/nhFu8C7a6M
	1Tb7jWwdcTThJqKFim3Cr+cYuHjJDm4/YKt/5MBXvrVzgxWdJFRCWeXrwCgnmbql6PTw4nCtIb2
	rxUioCKRPQUQ1pN3gFRuChVajBMI6jcM4HazT1Lqbm4lxI7HspYywEOE3s8ttGfj6tFtxzmbvZT
	Y=
X-Received: by 2002:a17:90a:d2cf:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39dec1426bamr4651580a91.22.1789379686847;
        Mon, 14 Sep 2026 02:54:46 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cf:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39dec1426bamr4651497a91.22.1789379686334;
        Mon, 14 Sep 2026 02:54:46 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm20664313a91.1.2026.09.14.02.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:54:45 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:54:25 +0800
Subject: [PATCH 3/4] arm64: dts: qcom: eliza: Add iris video codec node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_eliza-v1-3-e8ccd9b8cf7a@oss.qualcomm.com>
References: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789379665; l=3494;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=QU6DSxRjEWunHWAevgigWKsFS/uH9Z0u6jHXsLYx6W4=;
 b=zBLhplctgCAcoOe7FRxCtyfBa/oyBjq6g9Z0IYe5L9MtrLmJaNd9qDct74OJnaUKtQIPvIUGt
 uJ7riScJQHMD67yjPn3qcLObw/T0iQbh1O1ZlbZsl4aMUtuPM02TzF+
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7c467 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=lXaTmLNGT-RzeeOE_7oA:9 a=eQaGosDBtpkPWATo:21
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfXzp2244Cimtw1
 C4z9MRYL1/aEIQUi/zKmwH7sw22i0k4Q1bNAQLyYmM84AgBgPzvdZCOmudoiPTD6kbqz13fAcDx
 N0Kph7vOeK5D3dGlbxcTore29QBhmamvQQJcznALuoQYHnhEXZarvY+KRYAYPrHjkX4M5T/PJw8
 2dvg1MaXeMxRTfReiNeXeZiv9PAFPjnfr6wQHsO3tYa2+Qz6w+gJdVcoKW1WLPxPaFPOJjEjeoA
 2nS6lck47Tk5iviITGUXozUcW8E098nnkSuT/Q4xgc8isZ/BR8tm6OlyJEhUMRpzi+a7fUyeh2c
 Hul1rLTHbYKc2TpVtrUNLvcwXv2dz6G16oCyM8a1kyC6bYZ4LKlChU/YZEa4XrI8hAZkZ0y4oz/
 4UZYJCgSkQOV2XWuhQyyV1GCaAihX1pd9wh/6xbM0DBT77lVJC6CMeLSkvAMSW6WgZXXRkJt3g2
 jksA5N2peeFwRCaI3Bg==
X-Proofpoint-ORIG-GUID: 43iyLeAPEyV39IxiuRcrRLMVNjZmtfB3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfX+9kXVY/X6oTD
 jKQ9L0su4wQfvwZHPMrYzLbnXnv+KXpKqFoINBLpcOYpafSj4XaMw69Vl/aFU/5I3TJstnQ7mKc
 y5zhIDDSj/+uokeneWKnhkb1FyuvnZU=
X-Proofpoint-GUID: 43iyLeAPEyV39IxiuRcrRLMVNjZmtfB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140141

Describe the Iris video codec hardware found in the Eliza SoC. The iris
node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
support.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 98 +++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd075893304a9ab7bbde84eee5547491..5ebd2aa0a520a7c3e08eaff03e3220469cb64f23 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3357,6 +3357,104 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,eliza-iris";
+			reg = <0 0xaa00000 0 0xf0000>;
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_XO_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus",
+				      "xo",
+				      "core";
+
+			dma-coherent;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
+			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-192000000 {
+					opp-hz = /bits/ 64 <192000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-533333333 {
+					opp-hz = /bits/ 64 <533333333>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,eliza-videocc";
 			reg = <0x0 0xaaf0000 0x0 0x10000>;

-- 
2.43.0

