Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1E1511208
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862167; cv=none; b=XVr3rjWVhKpvl9da76jgfQ3Url6Z0wBaGDdN4Wx3Cv+G+GFLtA001lW7YuKsuixr7nvDYqZBtHgXC6IIohgAiJujDHNXMJ5H7WvZii/hpNQWk6SAVogh7PRrfOWTJ30L+M+hesf1kX8UoiL4w2sEz8tGlOkDvkULNR45Rv3zYzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862167; c=relaxed/simple;
	bh=C/fpMGINKsMmABBVFoNhv/IhMHRGM5vtAbgsZlLdGIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNACuvDB1wznBnVg0XI9UuEwK+xadanm+LCR/yZzNSip2lWiRMPVQLdyPv5pmyrK+Ddb4Wq0yL5sSYACh+pIy9+LLQH7ndpcNg5B7hepS1WSpeRU+Q0wrizqsmIwzubkS/i7gwOnvXnwTO7xWxceIJ8WCmTnzSEBvtduvjewF4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArZDygJM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUbpgjaK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArZDygJM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUbpgjaK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CdMn92176984
	for <linux-media@vger.kernel.org>; Thu, 1 Oct 2026 13:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYoTp0uQd0TNgYhrOfpmraHIltoseMpztokrD0lMoa8=; b=ArZDygJMZD3ZyY6z
	Z+M7W7S4VCZOnWDWuKuKBNXRPUdlfZHh0ofzf22O2WZTspbutqOjmEGsTki2OYeO
	KT8Jhlm2aAiQiYDNCRI1jQH3i1l9VYDaBKsJHOhZtA3vCpBNbyG1OSq+S7u2mBob
	mlhHV/dGWXJmhs1HisL4MSM9fJCogwuxWB340BbttpxmMxij7VhGUM/MXpQ6+29b
	MymhgUvnJRqsYdRimjFnW99PCwDCMCP0edzumDg0p+OCpGMGk3lgmfY0HwXHh8ka
	yYuSSJTn6VBXrs4mcGKQi8b9uVpLPZvZ+ooH5XRY1X6UBn0ZsyRFxIPW5H2/tic9
	Fc4tJQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nt41n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 13:42:33 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-142f4306744so8092696c88.1
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790862152; x=1791466952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYoTp0uQd0TNgYhrOfpmraHIltoseMpztokrD0lMoa8=;
        b=cUbpgjaKrMm15eCto2ssBOF7eDa06jnRWjZkFnWE0AehqlcpjL0inMM6MbiTMocFp0
         krGjimn7SxYAk3pjNV+Kwsic2iOZETCubIvVDTL1nl2cQIqFGOLXR0hafsXSZP2LqLR0
         gH7zpLd2BmbHWqaML2Evwz1Cidlle54nio/R7qXAbzPzS/H2yjYeUASuQqKWfQET3FDi
         5a1T+4eng4oh1Yz6jIKD7cIwqwWP6Hu6VCnlg/BQfyBv3fJMyhE2CU7afgpAM28kcPpZ
         bdho0ovaNWDFyJZJeicLR4fvZbg9R3AILbgXI6KV6Nfk4k1bdZ0V8D/aG1mfacosup+n
         WUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862152; x=1791466952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYoTp0uQd0TNgYhrOfpmraHIltoseMpztokrD0lMoa8=;
        b=EtaBTFVoxwDSOC8etebGSB195YOxrs6OeBKs0j5urWMiUy6JJN0BUsw2rpW6d4/dtz
         7h7S+3x3450yyrrmHfwLom6xWO9+DNIVPdQ0wkfwTu6xSKGdfYrJnh6qglvJqdHatZ2I
         rEvQGbXQIl80kcCW00VyBjEruTqNxrM9q1tnbiM2VlQSVKL1x0jJqpQr1CFHrR3kVto7
         v8wlvHinxzvQ4cFTuHQqPC4z/YSYdIz2niLXbhlmH+S4Pn4dCOpRtYE+uS2jtQ3gipVe
         TjhQ5I1gKQ0XqW8jW4YG5oqd1vQN1cM0PqykwxbqHroa2orztM0Y/Eq+LqkEhgD6gs7n
         FXjg==
X-Forwarded-Encrypted: i=1; AKwUvBzqrr/FKCdZEeQvnW4QCVygIN6yDidJ3B3SawpNZDkzA/deP731CVqLc701fiAF7/BpbTO/QBpqVb5D7g==@vger.kernel.org
X-Gm-Message-State: AFuF++n1oHmJBBvJMCuimjxejfdB6WV6J8z/2paEvcN7bZ/uCyiVn6/j
	Pp864GHj6+LI+INJwV9NZJuo7nZc41oEuxfjEfxyuCQQk7BgLHwXgfYV5lhQjaqLWRVCXmcSzd7
	3BDauZKE2DveMo6qRNwv2oFDl3o2/duMyn/Xs5ITRoFFbbXaYQ1smduE1ovTxi3D+aw==
X-Gm-Gg: AYBFou3dvXNcgWFscKCL7MqewaneWUyz9IVsJxmDl3DimW8uSf+0Q98/KG+YwQu/G6r
	Wfx78m6xiedS5QZMsaMVCsNG5yYR5dJYFIXdkuKXsufSEU1VnK0LOwi+CcNBvMYLcLS7ZLFDhET
	gsoiBk2IOqn7XqbrkpC4bShlGJa+HYLo3XmQ3VFtGoSeuN78AmAtYy6B/R83o+RBNvzR1cdRUI8
	lG8x+0FA9dQ5+oRxCIQZnHO/5INopgTSR7koTVQvTkgeosR7SwFyHdRZUyi78sqBuzgE58AZDIu
	9QnJIJdEQ1+hBJTFpmQLbyVU39SbXpEFBotHeU1/zyFJ3eHrwhqD4cX5IjzeRML/pNlqzv5xnuG
	IhLTuyH4t9DujgXGXWListeJCOHPqK2hAlog=
X-Received: by 2002:a05:7022:e1b:b0:14e:906f:9c8e with SMTP id a92af1059eb24-14e906f9dc4mr1998960c88.20.1790862150090;
        Thu, 01 Oct 2026 06:42:30 -0700 (PDT)
X-Received: by 2002:a05:7022:e1b:b0:14e:906f:9c8e with SMTP id a92af1059eb24-14e906f9dc4mr1998727c88.20.1790862148313;
        Thu, 01 Oct 2026 06:42:28 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df34a8385sm6668906c88.6.2026.10.01.06.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:42:27 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 19:11:56 +0530
Subject: [PATCH v6 1/2] arm64: dts: qcom: shikra: Add Iris video codec node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-shikra_vpu-v6-1-37143dc1bb9d@oss.qualcomm.com>
References: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
In-Reply-To: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790862135; l=2930;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=C/fpMGINKsMmABBVFoNhv/IhMHRGM5vtAbgsZlLdGIQ=;
 b=CyX2cswe9Cdx3+85nooxB7wSD0ZYpHclUz/RiPzctuUdj6WVUiXnpJaLHbKBZxoctaJqAmO+m
 L5x/PXtJ4uxCUiPpl/yb5rtxuHy1vpPP/pYi1l24BvDo72oxiRdiamz
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe6349 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Ri4dh-MVe8xHpjP2HccA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfX+SoX2PeHFXbp
 MdXliYG3rFzkHSlqe/YhUUB4JH2KWuXF3AGXC4t7nbvanirMdyRe/pglYebEP8NW3bKIU5iKrlq
 YLUiVIXhaNytR1CB1mx6hA9SLeBpLK4=
X-Proofpoint-ORIG-GUID: 2T6cXewi1sATS6kx58uQLrJfY_eroXN-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfX6x+gFFuYblrc
 AM4bDlE8Eyi6UliRAS+tyAmVQawNoGVlk4HB97EwMbZLROxGt8DJpczSnA9KYDAyk44fSwkp1C8
 A9ZDUFdiGJErG4t0ujAUW0N6VfmdDg6UN8DIcz3VsFPGT6cqO18JuLYbwaHY3fZUw8otz7TXSiw
 oHTvCxr4yF8+YG58/CmgCRirOvThIZBm/pdpEKu3o2XlVXNfBIOF1CguVTp9P9YxpI+Ue+UT4/8
 36UyEoGB3HKZAOyfWGIJNdYsiIr6ck+GN8QBZSOqsPn3HR4ngYWpS4K4jeKd295PaZvQUFkiBAn
 kKgLqE6TbAmvjlhkiMYdL4n5e4M+kYwxPXJFB1b/Ghe091nGOs0icDIpgxoWtbxPi6FJAkfltF8
 dOFmfFKnr49nm/3xwvE7ffDCrS4AiQamNRp9KsBZJQbPQRVgoW7mXDXLCwHr7y93l4gZpaTm8By
 pzdLJM81kl+5hhTlTCg==
X-Proofpoint-GUID: 2T6cXewi1sATS6kx58uQLrJfY_eroXN-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010053

Add the Iris video codec device tree node for the Shikra platform.

Shikra reuses the QCM2290-class video hardware and programming model.
The video node is added to describe the Iris based video decoder
encoder block, allowing the media driver to probe and initialize
the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 9823c591b02b1905619be06483f0a0a4ce7d10a9..d2e4db4025dccef21fc39a042785c7e7f4475958 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2809,6 +2809,67 @@ adreno_smmu: iommu@59a0000 {
 			power-domains = <&gpucc GPU_CX_GDSC>;
 		};
 
+		iris: video-codec@5a00000 {
+			compatible = "qcom,shikra-venus", "qcom,qcm2290-venus";
+			reg = <0x0 0x05a00000 0x0 0x200000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&video_mem>;
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			iommus = <&apps_smmu 0x780 0x20>;
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.34.1

