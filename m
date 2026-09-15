Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728D6468C13
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459886; cv=none; b=AJwmUOTmiZZiq1VL3Qz+zuGusm5T8/MQq3nOnl63MP+gNqO7UVLcR6b4GT1K5q35/xqAVkflC+dZ7n2ja9a580ACAQFMlqKMb/8juG9KOWfSSUL2/POWYR8lUq7a/z/dkW7w1fM2FkK+09ivq1AX9KfpvJsq0Yb+CttPrKeOLZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459886; c=relaxed/simple;
	bh=7pNTV9aax7vqzihimp3MiGg3DmEEDdR6tA0nGA/y/KA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EtDYceyqTbTqQkYoaeJ/jjOs2hGe4X4FGYVe8q5jHczHNqAbnktBZ38GrNEJR69bFiuebijPBWYpAaCzRBHGEBzGC097j2SiYXqOmaaY8JfaeuhVpNRWXkvy9NTTBEjLK2+mBHsy2caC3iK1SkhIQz4ZUqB0bMJzFZb8/kRjyZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNZuoGfA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdF1kwXt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNZuoGfA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdF1kwXt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZQlR2250554
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oh69pNBvSrb7Yc9lkBxmBF10IePuuREI+No4HIGmEos=; b=gNZuoGfAwGyb5+nt
	MavO8VnWD1eQKafNVraT9Sy61YsAUM0tqNITdYZbFpBw5H7+x+fTMrkZeetVFJSB
	YGwSZEweMMVZY+L7zYd4RJeWAd6JBItzbwc9nnpK5+lnQzYa2HJN18hjOElXbnIy
	hqx1VPev6r4WPzNOHmXD9GDECkuVNzR7SamgYXkZHrI4mM1iXjSJH9UkqcIQyCsm
	loD6mWIhFgcU7S/mPWDFmPd3zW+BPuKb4zXrJk7/hAp6fkzc672VesNSG6EIqODE
	dsLNWcJaJky/xfvpgCZDZROUo5N5mdaj26jqw6TpOkeiG8kju6tpkweQy8TrC0ra
	ZqS5zg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye70qvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:11:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0312937eso320101485a.1
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459879; x=1790064679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oh69pNBvSrb7Yc9lkBxmBF10IePuuREI+No4HIGmEos=;
        b=JdF1kwXtCZGAlnthNbLAsenwpeER5PoZtxqnZ3kQUF65h1+OqCq63/4F1MuCBFJTh3
         VxC3byWHpLhT0MDDit/B0z8p8SDwxywQb9sBnzdm6TojKOlp27BGcx1zhTYnoSUYYQVr
         /Y24t9IrmOK5ME5znDwRhxrR6SXv1jyfRa2NnvzBZIutZEkldtcUdQj7NgBjR2TeHxWy
         wFTm826mqJWtPC13W0Ud+KMsQdo1N4XFBDfR1q7o9m0yS6oTf53/ESm7EiZCU1iafPaj
         sxTkwXd/8I7Ky58RF+IkYPO1cJoQfsSQarYeI1TuTiOKo/5kA25nUjqqGnJxMIq4QyeT
         qTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459879; x=1790064679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oh69pNBvSrb7Yc9lkBxmBF10IePuuREI+No4HIGmEos=;
        b=X6HKdiGA1ScsKXt2eXNvvvkY8JViBGG3JGYdCjg/XgvzRIUiJVshE232qcCWlBJsGA
         47kgXOTmwerDL14hoJ/yf9DHRZVLmR1RhvQgsaWXwo3zJEpVd/tvg2t1nDkd7qa0onvf
         aWbKKxXkqs3jCO8C7+mOD+SkKNEtmImEGK7YfS9MOJ1vTUI1ZiTi/kKCwwFn1jU1lopD
         /WKfMVVYQCjXNIPZKU5wEtZLJPkqYiw0LbtX1TULCx7wa8r99pRq2W0Suc1nNbFqxxQr
         I5/KUzm6UT9gV+he9fRErqJNK+25I49N7KMcmdbDPrf+Lu9yRq5R6LD7MNzVWT/HYsCO
         Odzg==
X-Gm-Message-State: AFuF++nelhZzMpF620YnqG4ZC4pbS6p/rZSVb5kmQL2Xte9k7t3RTfVV
	ojAWBcS1JvoaxjOOpzT+h/0rVkcoitRDpwSfKcTYaqUZjqe0MMlILUexad7NdPXlszG066s2M1P
	sqMQu3tCLtbPCR63xTD4WIbM+Ge3t2OkzZwmiHG0XZjWqI1hekfTRW//xpWSDfQvQLw==
X-Gm-Gg: AYBFou08+iiovYflszkrrA7nGNMa4m3MhySvniaWpP2QRXsG/RtaHlQ7pWjTMJg1FBr
	eC3t9ve9vrPuQoE3gca8GWcK2TnGM7vvTOKRJ/105cxlniOmoHFiwKaFyF6Alu9U++QGbb2dGRh
	DL/JgLKbT3mzMa1R2s76NokHROyrjzhQlPEK8Lo+d9gtA2ZYR4hNTAF1jHc13UcP1ir80WSgOBH
	wRzaTekGhSZbiEzSpN4VL9nzySuDXOkO/tESq0TJGQnd1ev9nsKNEbFUYKu2XCXQh+uFKH1Hrwv
	7yATyYEcBAXsR2W9gAThNl1hlxKNgvPYbXS4rxN+CtQS5eF5HX3yC8YDYg7syQZZwFNW5S5zEQa
	9F9p77SX4RxO2fOmaoqUZ02C05RalqKjQk2rUs0Xof/MZp7QSDLYcgk9/GtwLHRPJvo9S0U0pB+
	R1ir39NGbPXi7WUQ9abxDfwdUHaxmTc6mcfQoX1GZDXT1PcRsMTXQ=
X-Received: by 2002:a05:620a:1a06:b0:937:2d64:57ae with SMTP id af79cd13be357-93a294bbcaamr917634685a.0.1789459879309;
        Tue, 15 Sep 2026 01:11:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:937:2d64:57ae with SMTP id af79cd13be357-93a294bbcaamr917629785a.0.1789459878622;
        Tue, 15 Sep 2026 01:11:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:18 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:11 +0200
Subject: [PATCH v7 8/9] arm64: dts: qcom: shikra: Add OPE node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-8-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX+mu/YNimR0DI
 gQ0i1FNIKIcbVv4UpWdB4H8O53rg3KTyWiKQ0KsEn9KIkd2F8hLFD9ZfjicEnz/DimYUadqDM3B
 V4/dZhHpaEKRIrdmq1YII72kwUUwvdj/ulvNGo15AqA6WfUeZfZ8Pbuc0QuEeyDwu6zqqSPPq0n
 U3H77Be05rnJiBXA2P5gwkwrmyeNMcBFcVJergsf8Zeb63JteA48QqQSm31X9wJ4ad58g39jGML
 kUfZg7FX3KDM8664iVPPpZDR2YVYACOz9rWVMXTsxxIGeFms8Ul7slaYCMrz5Meom2cqnBz5IJr
 QhrWdWoJLOxZRzI1/TWzLdqC6lMf9AW4vMxP6tPfC7j2nPYhoGNasOdeDCxOWrNZ/hb257PkrVQ
 OYSLjZUfDVG75IFKkMoF71e8V8o9TgpN+AAKa99hss6p1OR43G1kCDosNThSr8Ksk/n2jmZ8Z+0
 4hvWs17SuIxI7GX7ZhA==
X-Proofpoint-GUID: tIysGAu5GXzp1uvEtfHca2vcXtcmn1rp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX7ujNbgRBlxPl
 735CHkeeHWmz91nsK1b57A8HNkKirAcCblNrSSGBilkg9YNnwLrWyamuHbBiiT+Kt2X1WroYnZM
 F5H7VvcDHtelj+wMVwsWishlGNAmlcA=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa8fda7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: tIysGAu5GXzp1uvEtfHca2vcXtcmn1rp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add the Offline Processing Engine (OPE) device tree node for Shikra.
The node describes the six register regions (cdm, top, qos, pipeline,
bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Shikra boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 92d22e3b6931cf49f213d1807f78fc1a261f290d..5adc28e9aa64508366e6c7fdad191a152b8cb6dc 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1828,6 +1828,83 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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

