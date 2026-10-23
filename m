Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768189;
	b=I7h1LAwEyXwqM971adWUbP5rd6iakJ7WHZunM98YbI45IcFQEnCGxNWEu+b8X3vX7FmS
	 r03msoUqMlB8YTgLCXkqLackrQzwXiJeHsDibWE74VKnqf2dJKXYx0xcmY2/itLywKidH
	 VAzTA6MmLFGISxwdqkmf9okf9TaYNqURt052r8vl769bapYwK8mamqMnTNVTNRw6C4MqP
	 MsVWI4kR0mkP8Sh5r9OAg9vZG9KoIMIKPjp7OQ+9KAenruCfT3OYvxcmoHfSlBYl2oqjh
	 5BM7AfrRgw8KThJE64LFvkAXfCNAW+d7WJnR65P6DdPGUyvP/+CWVRVK0u/gLS1Ihfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768189;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
	b=nIET94yKHISNVPnAxfms0NaYP1ktz8GdalGpm5S490C7mWmgnt94J9a6Dn3fA/N4pu6j
	 nW7iFyWlP6gK5JtCaLxruW8IzyboOKzyS38mgpSvcf31w8QMFO2NGgXonzE9gRe19MhjD
	 WQMe3MN0LFHX28kWkORIhutF373u5CxOyqvLIUlbF70gtDPmZGhJlEe5HK4DCLp9o8w21
	 je+vQYxt8B2ul8rlM0BlUlz9Id3Yp+bIDFhBaRLfUMtg5o+AMapBsaWmcw45wBLsSY6OV
	 7wl3CXoG56tH3n/WILmvx1ZPgBeWRABQgWgVifiKVxcPu89AH+h6peq1gf4YoRx8QPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gJW3TE2b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jA992zSR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6536F606A334
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6536F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gJW3TE2b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jA992zSR
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6CdY2462562
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=; b=gJW3TE2bIskO3wua
	/3CBzsmht76Yuz7pYUp+wSeoplyYb8Pg2ILfWDGyud3mrglqoDcPm/j3KramEURf
	D711hGci5sZyJsQQ25QWjgY8hiNT6YvtRzFuD5GnveCrS1Cb0Ts7ydhP6zHyy6VR
	EEKonPCKU9hlwPwncNFpd0qvpauhuOczcZvuuwCGnjnkIdDCSL2SEOM/BMEEPZ6/
	KPjw0BmI+ssVfbKeE+CyKvEZFSkhG3A+PiIZHt12RumFIHSP8UWUluH8maGQIpD6
	LUhA4SqYwPTf2Ts+FJU+lZt/bNo32x3XOMX78ACvLYzL3QmkUql082SNfzD1cw0o
	JmUhgw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtv9nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-534f3fe0236so18204911cf.2
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768188; x=1793372988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=jA992zSRmjtComup/Fjm7SSk7nfKKnbF+9AN2ffLQ7qT9H1YOHcpvCTGeszAkmyb6V
         pjPRTQ3UYl5dodeRC0jp/o74nxfqbU/hu4A5v9sbl0Vbfv/U35Dly9GSG5wc3KN6if0T
         NkSCY/l/Sj1y0rekcV4nozqFrIX1BSlIwX+VkjsXHsIT3iFyxXmOwnVNIoI5C2Q7Jalf
         P8TC6sU32t8sWxQJkO/+zBPcVJwfCspBhN0o+rjpSqxXg17PnN1sAkBYG0f+jhYmBMc4
         w3HW3XLapxRRwVSa6fjrjbmvRw0Q+4IILHDw11vzYlAqSYtT6N6L6l26ehvRCFuuv4m2
         IhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768188; x=1793372988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=X7ukKgx4cCmlO41KwzSWQ2k7Y5TKe29HMpl1BzUx43ZtlrbpvSmw+ymCOQRIBcbZyQ
         FKinlLVCU70Ep7uFdLmpv+uIvmOB9f7pPplfHeGKCye/ahp4gPTpIKLzlx+IgeSwLvAk
         oS58ZtJ/muDOKLarxntSgL+62jNBKh1M1Di5TtQTifQFyYuDXLn+asHqEC1SLE+b6K6/
         Y5S6JrwYwunS+WFy5SeCfa0G/U6SQnrdiNPaC/i3y1n4h/IFCxmmXLw00oKdGC9iloCx
         tEku4Ane6DpUKi9+y3ABSNeRYE7qRx8QpbD4vsD8HHbuKpiFqXqjGtpsSi2MEjDHPF/N
         CnBA==
X-Gm-Message-State: AFq9FYIQmVG/gx9aEH4UUH+IK5/Ijez6Fce00V0YgSlyOkuKXPEbgsVs
	2MBg3JMRIPh3J6KijmIjMSj+Mx/OQpwCapVK0QHdmIZUPPo7AZoD1K7hPMuV3YgOcADpRgI7eiX
	Zsie+snVJzpKshzZ9qz85SMtHZXDZPhFSHO3jOCNFLONf0Ut++WfI0D99wvBkExWdqw==
X-Gm-Gg: AYBFou1WP2eTsGNauhkVUBtRdfKuhXHaEywJphWSeDMYRnoFx3s7W6jKGQDgfpETJCh
	Gmq5bCS2SBk/2I6GonoK7T3WlCbane2qI1kJdZZGZq+pFJZbx/JHauSqVLg9Ercg2InkSiovsYw
	GygCnc0ReHhzE+UwRLpFtYRKrq7SNM/XVEUfYNcO4l0zDegz9SuVGkAMP2xDLqxp0Nj+b7s3It/
	8GFHpOA/wKXQopaeqNtbxmSktA0cAsktupEh3T2WpeT5MzckeUoc//b4M2M/aTSMKtRa+E3vVzw
	nTSr3oxYTK06qn6XcQoC3iBQzUQZRqlUv/GfLQ/3cbqYm61hM1YB4fQwWkpYccJpmfcefEK40uD
	ge2nagZ4S/jTQ5F7w8BKX0vE4Lj6fXfHT4DZePfAm2u2fxKIkaoZcY7TlOdxFgt4id+jWqbsKe2
	KszuHf6GXe7JmGhCDUZP+GkwzzQH5+/LS8mZKG67iiWY/dVAvxuYU=
X-Received: by 2002:a05:620a:3193:b0:93e:48fc:aa85 with SMTP id af79cd13be357-93f6f964439mr447298885a.43.1792768187583;
        Fri, 23 Oct 2026 08:09:47 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:93e:48fc:aa85 with SMTP id af79cd13be357-93f6f964439mr447292385a.43.1792768187049;
        Fri, 23 Oct 2026 08:09:47 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:46 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:18 +0200
Subject: [PATCH v11 7/9] arm64: dts: qcom: agatti: Add OPE node
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
Message-Id: <20261023-camss-isp-ope-v11-7-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb78bc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: oHS53jRcautXLfr29xlOKa_8frNprPuD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfXw3Lmr5bXHx22
 P+EGq+33OFhsVUA72IKhGlncFrPygsX+PvoAKGgf1kLWmVGBYqIeue8UHJaWvUe8oBjIyC/tjjQ
 Pm+KaZubHrpO+CPyo0AZsBk9Ps+ra7SvseaR1seDpnL1hFNx6rTzYatBdpfISISwj9Q7mAC7bx5
 Vl3kaDQrOoKT0ZhNKDubz767hdJT/8nyL6JfI84gIffRI+hwB7vNh0TbaBY7gDgENGuxXn/xjoL
 CsxzvFC+Ia7in2b3bUApP7CJ8K6V1G3Ba6lVmohpcChNWfkUF39juYFx0phRgT3ds7juvuyBFch
 tfyA9dSit97hY5LOCXwrgSGzkU94rGau8iiw+utOT4Fy59QmYlOE7fSv/M4XkOcl5R1TSn1mYSo
 g70molVAdvURscTSwOD1wp4KK2hNShnzrrtLW2pinOrRV0NaFXJkImQ3+A/BrLuXSM0swLRW2aa
 ckyGmi60rTRjx3GA9iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfXwCGjzukxIqwG
 mWGNHNoxU37DCfj9ChHYT+FzXgqrsp/efWoNf51co19AB+tmsYUXKzVwxf85SebLflvThz9vNqv
 FKo89VDZyHGEnI5LwOMoiuprMNgJIaU=
X-Proofpoint-ORIG-GUID: oHS53jRcautXLfr29xlOKa_8frNprPuD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230059

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the six register
regions (cdm, top, qos, pipeline, bus_read, bus_write), clocks,
interrupt, interconnects, IOMMU mappings, and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Agatti boards.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 397d61a8a27c2505833466bd349acc27ef4ffe0c..7746c58b5b1cb25206e72b888b7559cfe27553b9 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2020,6 +2020,83 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,qcm2290-camss-ope";
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
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x800 0x0>,
+				 <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
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
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.34.1

