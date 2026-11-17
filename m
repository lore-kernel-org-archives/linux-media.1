Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897297;
	b=wAH6eMWDCS6Pv5Hq1KrOnBzyv/DcHdJW8EkuVwlzeMM0qhm7v91Fa+vk2LFtwGRH3o05
	 QWUCDcF43zBpFBl8E8tOF1oApshzQKOkRP8+qGpjiKQfMOxR5VpC5AmvEVTj2tiZxPAKc
	 fMVRh0sf3xTghmUihT+Z4Qzbtfkcjt1WM7y2fLDT34WgwNCN1xvd3npeCCGnHJgxMWTS3
	 vKZiewKnJsEobSKQDXW+4qkjM5JI53D4XbFBxbkyIenjX//d9y66XNrnk97om/c+eySBX
	 L7E8VvUqJrZH8/PenwxhIibzVBDVRNVcXUtKcBTTqHylg/ZtgXvyLdVClT1FyXPBIrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897297;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XwndoQmiyBI9zRxb06u69wZxnWfWyjVaQ9ot0JdUD9Y=;
	b=hsSRe/Rb2LNJBsLWT5M73qCD7SO+6SQAtATQa72jCgVGKA8/zmMvT/UPqrZB2SP4rvLL
	 sVRKS5EOgfC0MGZ/G7WUKPmh6+EmPYOSqegSGhRMwqUMbdudkEKtAbkZ09UTNw46mernY
	 FYfMFg1pPwwQeIg+e9l/iovEYmPEq+XPH5ocpSoGpVrOK5l31YFbbhdnov4SSRT44M3CB
	 XlPSIKOpsJuT/HWZZMcuoa8LYyIWRCZt9MjPRYhAS+49mL1F+Z/aC/D/089bfi5HRfu6g
	 eJZh+3HstzkTXuxur/PLHsjSQKusK7GjE1rN5mlOJwW3I/OJZfO7GuH6gQv/UU3eaTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LOMHBk7e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="TwMRxwB/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1FE606A31C
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C1FE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LOMHBk7e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TwMRxwB/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2a64J2463368
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XwndoQmiyBI9zRxb06u69wZxnWfWyjVaQ9ot0JdUD9Y=; b=LOMHBk7e7rwy1KAF
	n8bJKQDMb4OMECWuPzohIRS5TOcHbRk1079hmzVdRAK7aJFy8W7OddmXRqSfb8nK
	hTP2/+b1BMoDbcvoEM2xg5aHSthF5DrwEPJPQ3hnHK1d9UeGz+2Vr3oUF+J4z7hj
	aojLdGpWbxMVxaX2NFsFm61HQhkrBa6tB92gRsnoZQH8WgzX1+RfrJYcLl0R5lAe
	b20nv8X0e3iikIdVVdeZNE9fuAsF790thZtz4xgNUaRRqBbFhgCMq1qJ48TLSsT0
	lIDlP1zMyoBOm4wCCyD1yTgKWoYeCYoNypmHYYFyGfbVC6LDVA+Ti26hM/iRav7E
	/pQrtQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgm9rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:34:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so4532451b3a.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 22:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897296; x=1795502096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwndoQmiyBI9zRxb06u69wZxnWfWyjVaQ9ot0JdUD9Y=;
        b=TwMRxwB/3M+Ov94hHkrIEKO45J9jG26IN+HPHv2XK3YYaTuOuq7b43mv0nHVL6qQEC
         dFPR4HJeVPzqGAJqiOqwyqSbt0ZlmtuCZx6QsoI0Y4XmbQ+qGYYgWhXBU1tqxWlRRed1
         dEWklNRV1HQkqToXpFZy+PI21PGOotnOHTcdgqAUVhw0+V78hByfc6X6suJN28yoh4+p
         MYm5H+KLAkjC/drYE4Gs6vfJdHDzq/A9zDTTCbFB1WShavLrAKSx651TG7XjrBLKq0EQ
         xd2KqCOyAoWnpkgTvH+Lb3QwrmAO3JOARMFjLAvjABdrUqPAIh5ae1gjZnQFQap73dCf
         /VLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897296; x=1795502096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwndoQmiyBI9zRxb06u69wZxnWfWyjVaQ9ot0JdUD9Y=;
        b=cSJV+vCKyzVNjOiPGeidV1QYxK9IWEPfNQAOouNbtG7B1eST2oGCpxCyHKHeJ919WA
         ddcU0SdB9DDjCpEbdBajkckX1tRrE+i7ubglhQUaMP0yi+dP42heFMyUbRayebv6WodY
         4c4UWAcsYgeHTunk5bfpGickfQtMVsm3uLucKI8Vno/xo06+Apd3LkOtq8Ft8GYwn7vv
         tIzIYdprPxuEUcRc3wl7F3XSDb7OU6xEbenZgA3NCKFqNT5qnl5mJrKHnmik/fY526zC
         J8DOLebtyBqTmMLaoXbFCq4LpmKau/T9rirK5XqvTK+ZoM/vI8pLjQ2Mb8kd4MrL4neV
         VHTw==
X-Forwarded-Encrypted: i=1; AL+hErEpEDbWFBOFhEFCfWnsFH77cGuc1IgTMTo57S+WlESvSoooFxRZsyTafEGo3LEYbMC048O3NGdiLoPqCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/UsdQoQnGO8C0jNplZBidWJ94iRXHOKYd0fZQMdFskrBUW0CZk
	XEL4qohDXyuH7zCiGs1+6jg5O3fCgR3vNQNnm8WTQLSoStq1dTISsNay5gd9p++HDg66Pa3jrt3
	7HNuSK8Yoz+ZP/0S83JKQgNNSnr/V9SUi2c3WkeUaM/3G2q5jSSUHVVCqSNlQSNVF/Q==
X-Gm-Gg: AYBFou1d8q1ldOdPTwc16aUM2BWulhRRDI5ei6VUx1FjTQDdZ3TMr2BtpqG423XRmkD
	otgyNRgA0polTd8odiFk4bxSejSk2BuuHTPUVaR68V0dLnRLLRMtLIECbDvQmhr2gsQjyH7fOks
	eLhLvABsTRqyI7f2qnSzTCIOpqZEGPNcNaa2iK3bKQnZlm0NGmUrzjZKLunKsmVHq9nqSM9Phr2
	blS5CuMqTAVCECGpHrsxTD3olzRzGiKayBgOPufjjKowkR/LgEJelRTCvCqOEr5MP2TPA1PwCa0
	eJDLVDD/i0hF9PjMrDTofVyzX7sKQhi4n6P/6i4usIBvhfnB1c6429DLnU6ibqV4wRc33WEGZGT
	99d1e4UMK1R9cUzCl2hsKAkGuPraPvJtibCXxCB87HqtUgtOsX79IridZE2ALEp7Z44Jl/xOR+b
	U3UxfRBRJuQZU8+FKll/RUkWkrwPjKOMh+s+Mk+g5fZckrYOQt
X-Received: by 2002:a05:6a21:890e:b0:3e2:9b5:b16e with SMTP id adf61e73a8af0-3f7a4dbfbd5mr10059120637.7.1794897295548;
        Mon, 16 Nov 2026 22:34:55 -0800 (PST)
X-Received: by 2002:a05:6a21:890e:b0:3e2:9b5:b16e with SMTP id adf61e73a8af0-3f7a4dbfbd5mr10059094637.7.1794897295084;
        Mon, 16 Nov 2026 22:34:55 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:54 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:32 +0800
Subject: [PATCH v3 3/5] arm64: dts: qcom: eliza: Add iris video codec node
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
Message-Id: <20261117-add_iris_for_eliza-v3-3-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
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
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=3615;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=H2WyrQUjBIxQE9PFzbM0iJiYdP9I4yz6a6tR6KJWNlw=;
 b=WEsL9cfN3XVN32V9jITGuv7FUn60HptwEolsSw61oAxsmqbs0wyx7rIEhrwpBC4p4S/h+KPwQ
 Opjps6kBc67DK9l3qQMa6mGg/ow5WOmVVEKjk5PdV+IDJmzE9mofPlt
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfXybHpXgxd3+ar
 n1G7gJ5s3ljcavy93EHb8rmjic/xF53uSsSaciI3hsgjL75ssk4AqWAKfrLCeDD+EsrVLmGBHee
 pkW7iQgNBLe1CfImFcLm0u+DqzeAj4E=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afbf590 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lXaTmLNGT-RzeeOE_7oA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: RjNoxrcfkfDGSoyf8WnyilnQO3Zn-eHb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX7Nxrb4HALa/f
 Ql6LibY8F+2626+chqZtPELjtOkC3TKfr8ZKtSFbBSGp7lWO9J1pqEf8v5LLk/RSxcdwd8qYprW
 5CMwyzvwAD4ikci3lLsCr6oOFglN8ej3E8XBQaE1Q+uXNfSTQnywFI5qYkf4pYxWwoERPFN9L42
 vrvVDEVa8Fx3Onwo41a+db2eeXlcVjVmR5w+Dxe8pnXLk8emUXkSLN+F4AOduclqHq3JFDADUTG
 1ZP5Ms1IHt3gFGidoF4SBCaOIkrA8wIZldTXJOb/Ej3sZlqs+N/tFGr7lCtJtgGv+AbVT4KFztB
 Ih7kKAULnrOZlcpvTEzd6PP1bbxOswt6srNJoxuSzbnsabvRiM68Bx4W2+sDePKvgqligxEIAqB
 b7TVcccSPCcowIG1PnCuLdQah0V84PN+nTEJf5JGwDv41+UrUya1KUjjO7HAvvCkFVqqz2Au0Aw
 noyvP9/QPz8H0dfTkmA==
X-Proofpoint-GUID: RjNoxrcfkfDGSoyf8WnyilnQO3Zn-eHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170025

Describe the Iris video codec hardware found in the Eliza SoC. The iris
node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
support.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 98 +++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a125ef386c025fe6ecdbf4d17a785d1532ba09e..0c13d3f9b6c178687911947c890d4c4d5318e2ad 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3429,6 +3429,104 @@ gpucc: clock-controller@3d90000 {
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

