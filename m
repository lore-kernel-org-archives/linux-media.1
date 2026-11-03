Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743832;
	b=H5p3SrHpeqdcBgBqZxNQnHy41lshB4PPGDFqDugEpxnJdRsEWgELDc2bj9iisMA6v/A+
	 Htf4Y1FQF3/f4pYa+KUt+ArSQc9eywNHq25B594VW4NjtluQhZbl0nw/wfq7Ir1bhDx/B
	 4a5xCbJylNqfddBGDQKvDMr4QWMCBKfTtwYNggTAEZKIEvXzmjNcSid07xfh6uUBGyVdA
	 3BQajjd3Iqz3THcAoF7qiDfnTBYJN+9jrBIXfi22edAEtZJerJvBUAoGspPwogCidk4Yu
	 AoxAVYNmfqZLoDsR1xbD/RXIf+Ab0B3fuYJNQ9sMUREJaD0D574yfIRCTcFhGPjoPhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SsugyDwccLy3pMH9vThYKW+QiCws2a471g5HurPgIdw=;
	b=Xfd7lDr+Lf4s3nyxNWvqa8w5Cx73JFVHvTdiw5gVBjGzeQkPNnshtuVe70b43fo6+jgl
	 Jm6Z4cdeFAs5ZP8hK9QFauHL/uAno/J+w61hGXb1KuoeToFbj7wTLAmrnQCHBrDpq/pQl
	 4JSKDHwznl2tCGP6ScHoyO0gYgyYMTGRc1UF5SRohR/anauCgW/3zQj3s8bWakW2bhVM4
	 Z44SbYwjnELPDHKbqyuvE7RieFzjntFWzcTZJXLX78G+tFW8iPqbu7VbPaF4R/ZkSikwU
	 NP4Tgom2es7NflQL8JHp8mulMr63EcElHW03r5ivi97SHbdC9wU3igdtcrsnUfv3Juw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hxu3c/hb";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H3K+n0PO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA97606D802
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 22:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FA97606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hxu3c/hb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H3K+n0PO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LL36i3678039
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 22:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SsugyDwccLy
	3pMH9vThYKW+QiCws2a471g5HurPgIdw=; b=hxu3c/hb20igTZkufbJ0LqVRs4r
	wLrWqhXIjS4Cu1pd9IoaytvkL7f+quiw9G91IzHx9lZEPMfguRO2UIUUqo+9AH/N
	WPbLih1IaiCUEK6dtqPItq/y+fvhdoXWi4N5Eh3Q0Ztk4AVNBEXQl2W7YuzlNa9Y
	eou09PyEECW3zuuPpZ31HL3iugxHP8XzlfJ4M7dGxxK9Eb86+lc+pOQKM3AgaXtE
	Tn/veUKmlFnAC4dgdw5B3XLQiNHgAkQClh8NtTEXyVlgDfyHtCpnH5Fe4BFUFe5M
	viiWEmid2oSv1p+VfTFC+m2GluTpdlB8cyNMFCHmVTtQNPRP1ftfFez/8Ig==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bj19j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 22:10:31 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1acbaf81bebso136709c88.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 14:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793743830; x=1794348630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SsugyDwccLy3pMH9vThYKW+QiCws2a471g5HurPgIdw=;
        b=H3K+n0PODxxhOqXwpnMope3uh+DO/DBvTO2BdOzS2O6jNi27rwnIa/xnvNGf9kMeAC
         NdFfnsbhDR1zhEW9MIixcwbGzTZSxvc/Js+3DmlaYHX4TJfV9aeoupVAfbvesluBaPIy
         udilmxJCfcozimSmtOPlNfvVAF7xUP0NYSW7MA85rfgJCmr3craCpOxMG5UNbtRs4/8f
         K6HVAqiiLsY2o3jWo5FLN0Nhz4J6qdX3Td+l+iPpmUEhNcRH/pH6JuzbephazKtGz+66
         u+cOOEQ2OSdE3w06pB3rqwe8Nn7C3sjWmivT5g6zavE+w+wjl3Z7y0nZ0kbdb3ffuAcE
         HoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743830; x=1794348630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SsugyDwccLy3pMH9vThYKW+QiCws2a471g5HurPgIdw=;
        b=Bc3Lh6bhUdms/4JIKA4UEMTRTDs41Kso0gQ05GFYh9F67XYHburAA3xb6JHy6XLmD0
         uaOVeGfLv0+GzDTBJqqylJ34izHbeSTFws3ffzE5Wfyg0wiQExdHmjgSOzzZWmO2R0np
         BdANsHxRl0GcXqAbZyQVfE7QJFwJwYynNZQhYoaACzBgZtRtFGKb1n074e0e34swYZ3i
         HO6WkOIlThor1mC5nlVID3tyzLypQ/9Lr3IRGwO0d5zE+oW5/5oLQ+Z8DpFjuEFM09eN
         kLW3BGWyLSr8Be2++zYj2Oj7QT5JjP4foKtZl+WdkFBL970O1laqKZM0A76bepJ2aR18
         QrHA==
X-Forwarded-Encrypted: i=1; AKwUvBxgyYNJkH8BdRqvN1ivNsEs/dWZPNBrr3dGKg0lkXVi0v/8n1mtp8ySGCVZyx+ojQN19VSoPuMVRwzDqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8NEHHHLwkgsX7tMtVrZjzS1a6ItaAMXrbLDbFp1RwJpffbRYAZ
	qlTaSyXXjqyM4hhxrUHlTtLfP0OF0eLms8HAvbG0xMTwkgJVgRDjmCCmukI05Jxv62lioSBKH//
	s31IL5qHdcG1Rwzq+8Y4MSzhvSjzeJPCzy4Z6cySI+rYDYjhv/bdNiZjUXIveI1jEtw==
X-Gm-Gg: AYBFou0UXP+v/wf8c3VVdQ7e88hQPGJ51TH7ts58dttLzOnGIa4Fj4gCp+Yb7tNVHSM
	Dp6fvNfkN7Iuq1xf0EwDZxmfpHFOJ2RSf2eclq4GhjcDuifCzy/l8nvzBEF8alKK/P5dw9Hyi2Y
	w1yvilsbu/yDLAIxxM0tKNxwA1OSd19Bgn6kINNd04AliA7qoO1klJp7w4m4tlGUoxSRH6Qc9M4
	exKemQnDS6Tc3wM2LbfgtRFDrevU70EZ3QXFsXzxi4PUAAcAQ9vKFj5YYBDkA3jrO/OoE8sz5ft
	4kho/qeiVzp+oULFcM95XGoJm75jSVObZEbjs6vHRvaF0we/KmaSO4YquvSptndnAjd+Hz2tnBl
	XI1JP38lLrDsZPuad84Mk226g9evDEDDtrx+btfsBawHrDEIO6iLGC+XRLftWxBEYsPMoCZclD5
	gZ6jy6aI/xAFbB8Mexiv2XH6x4bJjx
X-Received: by 2002:a05:701b:418f:10b0:14a:8df8:56c5 with SMTP id a92af1059eb24-1ac5dd5a055mr21906061c88.26.1793743830151;
        Tue, 03 Nov 2026 14:10:30 -0800 (PST)
X-Received: by 2002:a05:701b:418f:10b0:14a:8df8:56c5 with SMTP id a92af1059eb24-1ac5dd5a055mr21906031c88.26.1793743829568;
        Tue, 03 Nov 2026 14:10:29 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm2137312c88.15.2026.11.03.14.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:10:29 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: dts: qcom: lemans: add CSI2 D-PHY common-phy providers
Date: Tue,  3 Nov 2026 14:10:24 -0800
Message-Id: <20261103221026.3662383-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
References: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfX3bj5/1VXmzZO
 QflwYcEq0pYr0ffNukeUfNudYAnJ1HOjM0YkQTOGUe2W/HlV1/7LzGyMQiB24qm6j0RZCvC7boV
 u1Z6+1bNPzVv7LtjKz0lNkLhXRZ4Fiw=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6aea5bd7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=WG68aFPFCIj822xaBb8A:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: iGTJa1uBDZ5vrb6OSmUAjp8iyKClXHeO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfX7DJ9SSseADHx
 3I/3HNp/6nqlaMhAXq8Pyid+bmTEN2skeLHL6MFg1IBFY16YWw75UR4vWgrm0wuwFjEsgpSKW5h
 C5YQ2Qcc47BP++Kmm1Tpi7CGxpFVuVbJjMa5dDnlOutn/mZLoPZ6ImwjDH5lnjT8/9V16Wr+0iS
 kJzh4MMgnl+30AOs3bBSFeOPfNbFfBpYVBJV12BEos7SIMAuwCms8D7fH403l/SO9rQXNjLyRtU
 ZwqJM42uhqqjUHYMVLRPDq2LzGnJDG+bQ421e+zuSR0VpOwzUcixCIOl8AhPsdIQ3IRjKFk1rMg
 Uy5Jz42kPIxkIWT2VYT6dc4Yiw58I9J4p4zjgtPIGuYaRUHMZ+lXnitW8q/QCKKyDoAHSzVe7x1
 Jn+MaIexQ8Nd129oV1fU/vmkILlxPA4Cg1s/2w66hfXRYMSIqagLF6ZuKJm277oxgWGJGYQm+uT
 8/uHMCTZgi8YCUd+pFg==
X-Proofpoint-GUID: iGTJa1uBDZ5vrb6OSmUAjp8iyKClXHeO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030088

Expose the four SA8775p CSIPHYs as standalone qcom,sa8775p-csi2-phy
generic-PHY provider nodes (csiphy0..3) at their existing register
addresses, each with its own OF graph (port@0 sensor-facing, port@1
CAMSS-facing) so camss_detect_legacy_phy() picks the non-legacy path
once a board wires a sensor through one of them. The camss node's own
reg-names/clocks/interrupts for the CSIPHYs are unchanged, so boards
that don't use a provider still get the legacy binding.

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 140 +++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..2a30bf1c82af 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5164,6 +5164,146 @@ cci3_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: phy@ac9c000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0ac9c000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy1: phy@ac9e000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0ac9e000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy2: phy@aca0000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0aca0000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy3: phy@aca2000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0aca2000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy_opp_table: opp-table-csiphy {
+			compatible = "operating-points-v2";
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+			};
+
+			opp-400000000 {
+				opp-hz = /bits/ 64 <400000000>;
+			};
+		};
+
 		camss: isp@ac78000 {
 			compatible = "qcom,sa8775p-camss";
 
-- 
2.34.1

