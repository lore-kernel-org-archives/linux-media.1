Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973354;
	b=vYkdZ0aQt+9dyEzTayqzqeZZ3ZU6GozH3izzWgrDbuDWTnpYCgI7lCtzRdBUh6NYzjpv
	 nvTnvqZC/Wz5oHYYpx1pnkP4/SpjIA5YijFbbZP4TBYaW56Gw35z/6XbhMq9qjCaWOY35
	 6craUknaNLNe9vu8BFID5yqXceOQfxKgE2WMKbz/zjMGVIE0GuTO2kzyg7Ev8X0l09zeO
	 dVohhrAewZCFT/U5jhJJMepDA1pWov2GKYYnKPW8rVVBKAO0HNieLm5t8HmokQd2aUDYa
	 9BRbp3xJW4sr3UPyXKQzgOGTsr7o4t1LU/pYXVmaNmydR593sA584LpjmqdtHQlohKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973354;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=;
	b=LF8ojBHtqZ1zDo3qgJSTPvS7ul0d+MgB/aSQRY4IGUQD7BYFO1SnHrOdVA97u3VZl+Ak
	 5Z2oLgD835XPlzUNNfrw8slh3kQkeo9e6fN31qCsm4lgoOc75IkVB+ANKtt2ax3Vo/n2W
	 K05NTRPZNrTo9q/PMJnt/nUb115N3TWmuoMNMuLQqphwU7TZVHMmrLZFZB3WdzQE4xEnH
	 2Eg+uEJx3NH8fexAzikQsvccV/NCU1HHSTMhhaQzzrD/DDHYVeqDlPfNSDZQEYFzh5eIH
	 Wp3+xwuA2ubpRv/ifaxapdsyey61wHq50Vr8Dwn9MV41WTTQMmPUuSyjXtI1lTES1IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dyvZCes6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="M/fUQvmd";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C684606EE9A
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 13:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C684606EE9A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dyvZCes6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M/fUQvmd
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DoAow4147234
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 13:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=; b=dyvZCes6NiGDy9LV
	nUkUVCjJMmXfm323NRoS1JsUVpuUzvl9IIm9NBvE8Hiz8T5hMLIfx5h/xxxg7Q0R
	pY2BwAAhJiN48FdCL8uA9uLulO22LtIkJol+K8HgXsIhmimsFKfUtdsoMCx4TapB
	/YPhMV0I4poiY5Q6eon8Oy8GEhwUoAqvROaaEiavncEeVdn0peOD4XevxC+WUpEs
	08ikHwCorLjGCa6Geltc30VsuA0MLAv7mZmD7nqXjmcRlbbC8yNt2u2WYJVwtLNm
	Cea9hRIJNWnegv78qXy13PyjUtzWkRXR8OeYeOs9Var6JVqvjvOnmV4wsD74/VAY
	FxgVmg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa32rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 13:55:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d07a14a71cso594109137.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 05:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973352; x=1794578152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=;
        b=M/fUQvmdyMMOSWuozEROiD9HZycoYf6ajE8JXqMLdB0p2OMoabnym/CSFRuoKVUXDu
         j0riQG3I1RbQY8R/xmIB/QEjVq/Br1wE/Vy3+++cFGnOhVSoFXmUoxOHqCk8xQL5547c
         E4nsbJMtzVi3kznXOiaUs4BIuAFOS7qZqoAVssRULwBIYyUBRp7WmXxSr1sa4ssldKKV
         kGjtJ5YLdpzLStcUxVmlMPfGsTfXD3kd9eJqLlIlK1NTqTzMc8bvKFEf8Hd4mGHEk9Xr
         S8FRq6E0ggkDqCKQ52J+8rRMDY5XSo2rjO5pQougXMO5OhqXea/Gdx6z4oD3gTI/o6Oo
         71Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973352; x=1794578152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=;
        b=X2v2qLTq4KfINa23x/0+qY2ltWPxGaJU9UAMmU6Yqkv41gFFKHlLO4V/TBK+PZh9GG
         1Ge9Wq67yYuLkv7TbIQr7g1BPL8M08NIwE4X+NWAsbb0leY+6AoTRs+B9gpnHu5FZvf+
         9JeOU+aaWEaKetbjQfgu8eViEOgPWCeSldHo+Dn4e2zJtEyyfq1hkT3XAmIg71X989HO
         vkawTunynycE6VlsT32TIhw/65jShA8NyvVdVql7DLH9jqom/Qws1pYKRoLM38xwPS9K
         Ec0JtoOEDoieYoIjhBqVCRDZWWuRSadJMhT3hpcd+XiPQ6lE2uvxs4MqxgyH7l4FSA1M
         Zm4A==
X-Gm-Message-State: APuU4Z+IR6kOMTKk9OA8dToFmON1P6ml1MB3FnTc4qbfzvz6CK8B8JLc
	ml4iA2WSarFJqHb6CwVJ909K+GckR7ws6ZNM66opw4BaWu8qLlffU1oqrCN6A/saXnW0ZDQA6go
	VdK7KZe8ONAmDM1gSJlY0zpc3Quy2j92v2/jAUANWgsaHGihwKNXam8KHGi5GSiQaPQ==
X-Gm-Gg: AYBFou1XSvScJr1HSy0xKQzHusGZO0sXqpARdumSargy0An6pDwBs9/3UxpvyBFxWDP
	ibI7vpP7Kk5uarmf8mjO2xJuZnC4lM884OpPQhqkcm48cwt0BklcreY8YBoLxgijk4eOZjBfhCr
	KPMl0NQoGxNTfLnS6d4srtN6/QADeEUIi12QtJZh35wnkcyHmAwlliWNqwwHJOjjMYnduGkeDya
	RVU6mrZ+z0pmNfUdpxd3MNHwi83doHrz60mrwK2JK6POXxu3nmGJt7W+pSaa/uKkCk44MrWRNbl
	ZCv2AK1LPR6xU6Xk2YAtjseTz96RnjBSnUFA5ExicKJO3SzddNf4pijwIKYSHyY+/HHK0r7j2eF
	ChSDYO9FmkALd2GgkaczZtzWqsHw7u6xt14hCFuvjNuzTKTWDmuS8nN/yef9Wej/0fxFpRF9dXO
	FtNeiUp0R09Ng/8jbBMnN51kUp1fa/uQsccuQXJxsqIejGD690Alj7l229vGs6uD/Ap2a1r8DqP
	jnmoT5XrBPF+7Hpw3wG6I4/hIYP
X-Received: by 2002:a67:e712:0:b0:7cc:226a:f977 with SMTP id ada2fe7eead31-7d2a1700630mr1387937137.36.1793973352463;
        Fri, 06 Nov 2026 05:55:52 -0800 (PST)
X-Received: by 2002:a67:e712:0:b0:7cc:226a:f977 with SMTP id ada2fe7eead31-7d2a1700630mr1387915137.36.1793973351926;
        Fri, 06 Nov 2026 05:55:51 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:48 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:24 +0100
Subject: [PATCH v14 8/9] arm64: dts: qcom: shikra: Add OPE node
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
Message-Id: <20261106-camss-isp-ope-v14-8-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfXyLJvix0rPMXu
 hKhbH6rUrObCqB6nWBrDUHLXQLSqxEoblKr7E63RJ/kEihKIrTZSqWqFGldBm4+iXpI09bb6bvD
 wJvzNf3zb6fjPWqSSDfR6XF6LlQ74lV6gNVpHDk4v3DnlXyFqsKT5Uht7DUsrP7SHdAIZs6Qo2o
 QX1hbe0yGSwgOlerL3/rxotc+dAPuO//2/gg3uReO9AKEXdqx1omh2UawZv+obBXV7x5nTyUutR
 jOkS/2a7fGRvhY9V3TwAXVspOqfsP/Q8lrHDUEb/K259jZ3Nci1IAuFeZ8G/lixozdWk1x0mcZ9
 rV4Oa/S9e3vRCkwL15z6mo7ZLvfUQx7Wa7dFeGMpWasdTpDfT3tWVceZdxDWLnPIIkx8tbpqDf3
 88ArIQApeNuZ5aV46jFvKfB9qwEyN65vLbYls+H43hmMFZ8i6JdS8ZzCUiedjrZKyW3Xk8hxZbV
 kqonh3Q4CF9/90c8QVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX7dXsUcUIvvHY
 IAf5E0YdcEyqAgImwrLU6AWGMfRmZhWMFK7rUnUlcAaRztC4V7jsJNr4yF8aEqEqJ5VCXRiVeFe
 LYj4s9zkIEflV2eU4ZRb43Mkn5xf8CU=
X-Proofpoint-ORIG-GUID: gr01kIrxJxVeSeF3xZNT3HLKaVs6GUF1
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aeddc69 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: gr01kIrxJxVeSeF3xZNT3HLKaVs6GUF1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add the Offline Processing Engine (OPE) device tree node for Shikra.
The node describes the six register regions (cdm, top, qos, pipeline,
bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Shikra boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f6398c57b616879a37f84b83d59ac..b95ad1e61b9b4ecd29a1b7b7fb0c2c52ce31a967 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2357,6 +2357,83 @@ cci_i2c1: i2c-bus@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,shikra-camss-ope", "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42000 0x0 0x400>,
+			      <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "cdm",
+				    "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x600 0x0>,
+				 <&apps_smmu 0x620 0x0>,
+				 <&apps_smmu 0x640 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd RPMPD_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

