Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953544;
	b=DP33rRkEvT3L9wZmXXtVOQIutVWy4i7pG8sm/RvWuNV+u3PCz3dPq04NEUNBpCXM+wGf
	 s07mbOTsHWaqa2vI/+3V8hWkwPCOePT6fyCQN9RUEKKw/UstFv48WN84FXAWP4FLiPjmt
	 2xgkXsGDkrQggnf2h4I2rF4f9XDe3egKBquGJbAM2Zw9LiUQeT+HEv6i0XE+KKelZXWuj
	 1eUh3i/96BXXqJkOmn1zuBe4dGquaajPZwgG+V7rcQeP60c2WXj27Zqhv7mPM9zZsHDRM
	 jytsZiFkS7Op3lX0o0Vi2B5oMGFh7ZgWnifgjZ5qj1NbWir9fj4YBxMnn4nGCVWhn9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953544;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kE5+p5P65VPjFBQS2QIkASIL3ETgZUjcBDE965AYSOM=;
	b=Bx8ifDrrDv5gR7id45DoYDU4SAaCWE4Ey8N57JtZfCyJm1TyvYmZb30Eq4UX3P8Y4nfk
	 680k3+ExB/DcYL2nQl+kP07fBgf8+RkhRlngF64TLX3KIM7vByb4zqb9TnHBCLjnaY0Sf
	 63PGBc5kyfov9q81BhKV3L9zo16e4ZLbxdTyj7JcVDvSI0mApmqDvsFdDSpOeHb3ca5/D
	 t7M/w8K89IwNAxP4KKpRaGssb0kLLeqlmZljL+hk3+nR8VhD0j6jhoH+y+4hOXOXOR0D/
	 JZ4Y9dKz3RAHhOnb/tFQL3Z/V4DOXVFWTlLxbSs3QbNEimGuZw9/JSz7uCYNzG380vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0zg83WE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tk7B1nch;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00D2606D810
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 08:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B00D2606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0zg83WE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tk7B1nch
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67ROEN2933643
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 08:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kE5+p5P65VP
	jFBQS2QIkASIL3ETgZUjcBDE965AYSOM=; b=P0zg83WEuMkifmeeV8xUqbW45X7
	0rC+m7lJ/m3JQCTqKQpEzDLE9tJUSHsNi84J18L9PsE1ChkZ7ftnuk9Z/Onge8UH
	6B1phgqmiiTIBSGouPh7CVimEBWr1MIvBVf+2DTarC3krZ07HQY86PYT9g8aGKi3
	Y+j4RJs86Wy9UDl6z+3c1k1nNpqVi4+apVRh21rhzFKRMKcJB+ZX1zGBrGCfMo5z
	JDKjX17td+FjrMlZoxP6JQ7AFcnYWKgtN/l6sH6dIGCSkznPfTFL3EKJ8uOyyRuO
	V4jzWAKBODoHP3jzdPVvxHaDd9n4BUaV1LYzwcUVQ+D4KTZ7Fj6HA3bm0Uw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1uvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 08:25:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf6c528aso80302285a.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 00:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953542; x=1794558342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kE5+p5P65VPjFBQS2QIkASIL3ETgZUjcBDE965AYSOM=;
        b=Tk7B1nchFGiqZDNgi2rPFihSgE9VZxtvO6r1BCwYtXE8YnfKQvLXHety9yj59iRhGC
         zg/LILCn2M2I47HNzw0eranHHv9OlslaZnS97rOmbcYa9g4E+NsizCXDSl2Ta/wYcLra
         amiPrJYB0VG8xzbDXxi59ki1h8g36wjJSON0eLMlSDyw7MjdFmV3wPaRDeSne0S4mT18
         TL7D/VyHa5CTGu8q44Smp6/zd9tAwOEIGOCSxcJpKncRxLBZ0oQfVYZa9IIGwwy6owie
         GCmDta9WZ3ERMpRR7K/zXHdnsceu/AkCLTp/9RdVz9QL88J39nagKheLEq6wBoOm2tf+
         3haQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953542; x=1794558342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kE5+p5P65VPjFBQS2QIkASIL3ETgZUjcBDE965AYSOM=;
        b=HbV5FW20a0Q85VOUuVkRnsPuP811zaoC29JnWjz+J3Ja2Y/J5pOJ6J5mTdP9TL3bkK
         dK7Zz4+kDWDx94T20wLAWCy0pl80WQDEAMMe9LfJ5ardqyh6qSxMQeqONge20BQ1J/0J
         nWA013rOtKjjE+tED7W8ZpJQTv6i7D8nNIq1+AqyH3IzVHhIvW8ggdcqmLCfWeaIJUlg
         HNYyEQbmaF5DG+14v4XlOTyv/IResaMZJDBOsc7SElJwgtciWsVdSwVcpuj7DTsTzkC7
         /pFNPwTG2vNMeFmAFUETaC3LMtmJYV38DliR/Y6yRxDcAnMQoLB5FZ1aJfbFDdwAZY4c
         9uaA==
X-Gm-Message-State: APuU4Z9OjPGu/9Shh0+WpS20+IDqz1g8+jaGDx5SAelpyaKNBSPi89bV
	xfieGVkNW+azBMP11oODBiklFtw3GLWcGGLyQXyG82es/J0QMuUZX8gz9A9G1AE7ZVwNczXNjlo
	UdYpzv0k9TjAmFcsLD06Y/uWdyp6dgISaPXxY6ZjM5La5Tei8FMoM6ZkI8EfocPi1fphbk+abHY
	YF
X-Gm-Gg: AYBFou0GVetT0JMQYP+ThxsyF9Uv4R3jjpMmlPkoeur+SPTEvUthjfLcQlZeszAqKKC
	eXmo0DpOvkJBBtXAbIm70U6A3A4bimtgiJL2I/a6cOLRaet8nqj2mwWZ5+809nx9LPh3HdDkhiU
	NkigByr02OcAdtsKM3Xz7WNNe2SSKpJ2hjAxveJcPTdJhb03t6QUTGswVaBfcjocx4cqIQ7JgOD
	lR9D8oxQWjG+LxoAKfVUZ1XbyiTdjZsjmM4KuuQHBnf4BarQFKD3HvXUJNuJgBKViJ87tNRCtSS
	M3DX4C0X6+ZQwZMuTDLSj1yScvOZbk8jAqlmwdRsxtqUrzCWp/V7D9E+NB0p5OYHupbCkwYkAQM
	VX2D2pMIUga/0ksDyJZVR/StPAUdtqryW1P3tiBt73Tk5Z6CSoHtBG0tV0SN8nkppHrqKxEbiqA
	==
X-Received: by 2002:a05:620a:4405:b0:93e:8614:bbe7 with SMTP id af79cd13be357-945f32a3d98mr255538485a.12.1793953542032;
        Fri, 06 Nov 2026 00:25:42 -0800 (PST)
X-Received: by 2002:a05:620a:4405:b0:93e:8614:bbe7 with SMTP id af79cd13be357-945f32a3d98mr255535485a.12.1793953541605;
        Fri, 06 Nov 2026 00:25:41 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:40 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 7/8] arm64: dts: qcom: kodiak: Add JPEG encoder node
Date: Fri,  6 Nov 2026 10:25:21 +0200
Message-Id: <20261106082522.1448390-8-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kOamGXAIYwCFezp7m_h8wYywB0YMSqxq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXwyMI0UQ4+vfk
 Hb0rT3qD+VP9OvpLqt8TplNGOXV8npm2m/5iGG9AvWAxZs9hVfvcKnbk7Vsyt8Kz9xSsv/8dZlO
 /riKaZAkW+8pRjggk5cKWBGOUiotH3T+LeGYfRLe1orU/ZpbFwjQXaw5QqNyrhOf/TtuwJHiaIy
 uPC0cMj8/Y9zw8L9PHYdVmkdVknXl1K+h+6wtFjSwRiaB+fqHWHJTA6V2CCXQkYU+SXjveiiUnn
 A56pnWizcUUND+GGatazMXWrHi38FPSbNVDGcKPPztulI4/Rt13w5yCOGfmgxENH8Vuc9iR6nvc
 7GW7pagh7wGFNNEbI/7bPRoK2/NDUeP9GU0hHcILMY9AIVCFgQal1A2ZH47vCuM4XHirDeo5S7X
 TAE58SU/b5y0anmBsr2BEeR1YrWPAfQJvgSz5RzCEFj52uRCJ86J4kah8iqI+md7P+HKkvY4CAY
 ayM4tuyABJKkUZ9cw8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX3GkCpZdMDZrR
 jclziOSvnSZuw3aVfz+dwzuEQcPiIm+Tz2acUh8uFSEgP1sovOoSSrkMHJRf14W49mjThEVfNF8
 o7Bvx+aAlgfppi0j+9y866ZAXusVS5o=
X-Proofpoint-ORIG-GUID: kOamGXAIYwCFezp7m_h8wYywB0YMSqxq
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed8f06 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=iVVtd_vrlZ2ormJ2GbwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Add the JPEG encoder hardware node to the SC7280 (Kodiak) device tree
so the qcom-jpeg V4L2 encoder driver can bind and operate on this
platform. The node is disabled by default.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d271..463ca9a654365 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5164,6 +5164,75 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		jpeg_enc: jpeg-encoder@ac4e000 {
+			compatible = "qcom,sc7280-jpeg-enc";
+			status = "disabled";
+
+			reg = <0x0 0x0ac4e000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd SC7280_CX>;
+			power-domain-names = "titan_top", "cx";
+
+			clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
+				 <&camcc CAM_CC_JPEG_CLK>;
+
+			clock-names = "bus",
+				      "config",
+				      "cpas",
+				      "camnoc_axi",
+				      "camnoc_axi_src",
+				      "core";
+
+			interconnects = <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "camnoc";
+
+			iommus = <&apps_smmu 0x20c0 0x20>;
+
+			operating-points-v2 = <&jpeg_opp_table>;
+
+			jpeg_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					opp-peak-kBps = <258480>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-peak-kBps = <531480>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-peak-kBps = <1006560>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-peak-kBps = <1084440>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-peak-kBps = <1084440>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sc7280-camss";
 
-- 
2.34.1

