Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328766;
	b=EshXzu92y5Xo8gm+ctO18uVM6JxcPvSUiR4oGv2IAvai4BZJb7oFtq8bDCJSlSJU78ug
	 JxRsu3uGRq8V4sniz81OjUHybHyVZkUfoHIPwAH0A5sNkt8pPlh+BKCbe6EEm3nMa8ycC
	 PpLaQ2j6kTMKtTjCla1FG9wonW0vIkRSQr0aFQq/B6HHisIu7hz/gf6loPISDn5HQTsHb
	 zYx1PW41+FJX3N3zR6uZc5Cwrnyqo2e3tOJXDc6aTCrwysTl+j++LJKF60EUONnOFbzpe
	 mwmWpPEf58yqFleXHUzw+ImgqqXpp0aKzY4tIE3VDhq3JXDb7vzIZxOGWnRot/X0QWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IK4ypl3sK+dcDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=;
	b=Y/DdqVSwg5Dkzu6nPFJfAzEsjLVEgmw8PFxhVP3tOOUU0oZVWY1Dq79zSFWl3/j15Kqd
	 l+B+isKaojqtgfvgR6t1cvvW6JXg8VQGWGFBUdWaVQfSMj2hIFfbMpqEoEMH5356+Ydt9
	 Xtpv4/A98ZZukgg265LcopwC75Ba/IC+HRTdoxSayZB5qNyAG6vw1xIcYK1esE5hyA5uG
	 /yJzDmdzusj55xzsW60Jrc8lFzJYYneT+MJSHXurBEUqa8qVrbNvO2yaEvmmfL8YUE4aS
	 FNtR7rlWBMYa11uXmu9xlztedSsx4MXmZasZ6wqOBhmN4WATQRrwkFCdSiyQnV+zMEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nIt4vP0Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/6/vY0y";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30900606BAD0
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 16:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30900606BAD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nIt4vP0Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/6/vY0y
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF03383691348
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 16:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IK4ypl3sK+d
	cDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=; b=nIt4vP0YqljacaMICeODODdk6UP
	peemM+FXOoDVWJbFORb2bK5O/ALOWl1hlk4IFSdBDDvz15nGWTV5132hySqCeSJL
	QUvRBsC9B1owfFVzqvz1YzVbnDeTbg1vtVcxptY8OcmmssE77N7G1HZu86aAG7dY
	dmGiUQXyyg27JrStCMZ3Rf+TJydE2yF7Q1uEPf6lPBLQq2Kcmg1Cx1a6RIBWzy/2
	vM/dpJkIQEG5cw9V3jqbiUK9n/ddbRutTTm/+Rq6+kOlKgMIf2ZNjj0b5QfDZXGR
	m0DbgtRpdDB4h1EUpykM9dFO7rIttOHJufP4+4Krb8opYxoxlRNgiOF+CGw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03csqqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 16:39:25 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-999ef3a68adso387325241.3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 08:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328765; x=1794933565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IK4ypl3sK+dcDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=;
        b=R/6/vY0ywwhlG2NwJWLQEhvRwkFjBDUdtHKflCVqcEvPpo2L/nP5apGCZEIfW3zSfe
         TqwPKbg5l5LSET3EIS1o4mfBpMHmqOAYiFDANXCqMq/u1rXsWHxwk2xNcIynzBbTSKQX
         COgtd4t9cr70E6HDb/vZ8GDenTdPjkXbsIeVTADuTnKSsRWXT1k3cbf8gX6K5wx59KHQ
         V5HG34UTZTz5mwsJc3cnbahgpz56A4Y+RY78pKPrKzRiCBH5UxjZAY7X6pBReZwuZWTb
         osJJ4ecb96IBNiltbWQ/ubIZjvyS3hGG1ZseSDoLx1t2e7J+qD6keII1Hw5f5MT3cKsS
         B4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328765; x=1794933565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IK4ypl3sK+dcDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=;
        b=N5kZaPh2bEbL2lW87Pv1/KBL8kYTKvsQcYMqy3fXZQXFjGWdQQrJxAAlmV8GyHrHgl
         jggpwbIBdtF1Ud/MOy7x0w7wdP4qJgeTCn53qC/3aWv/u0deIJZnwzewCMfmTfuyscXB
         yy9mAXnK7b3X31AXmUB7Ww32+L8TB9uNltPOtCtIi9Bc5P8Cfx7XwFufeLMsB3i06jTT
         Syn2zsRySS+bpBY7oi2KvjB83DEHTK7K6rfX1vsWoPE4/C1iw319ZOHFe3tnLZqehJ1B
         /ASkvf9Xc+ri0eY9H0QViNZEpBXggXlYLWXMY6eO+0QHiVp2iXhuoewfMNuBofNqsSiy
         qzzQ==
X-Gm-Message-State: APuU4Z/tFypjZ5gDno+4+mLUqeNtjP2kB8Irh306P9N+S3ZEm5InkzRj
	CpdxkSoH99YvWI6yd0fh9uM6Fqxte+qihS93Ylqo8XJ9xdIawMSOgGPt5q3EePlAHMN+Rgi2Afi
	kIy1xQK7oHefh8gassleR/Kl4QGVHN4ckwsd5XPDroPGE9KpW0GyFCSBD0Kana4pp57irS6cJmd
	ea
X-Gm-Gg: AYBFou1XatCvC/N0oSxhEI81aA3BtP+A87p/Kltt7PefGhFraiuhk3ZwddJ4J/uRwYz
	nJ9bZ0dqcx/h+PdZnkdb/Hq8xDjN5f93EFCE4SVUlxh6HS8yenydn7HyaTzh+tlnHfAunCqe62c
	VcPDRMYa1Z7kAKbZDtQQfFU3PNuuWPqdd4GUh4eRSGIZcmeNYbwT5uDE1MCwOGK296SL/wGoQLt
	Kyp6NGC5PVn+aOP2G5XEUycEmX6OmqVAq4im/drKAjquygs7ZbTpQYqfgSoquAc05PyO4HfN1BO
	/doG9WqInPWK56o2G9+GXkz0INQmEvBir/rBQupsMuLNS3wy2M+v0ZeizxrfQigWGNpZHQQDj/0
	0XYKxPJW6UjIIu2KwMl27VMFeylu3Xb6V6LpM74YUZb8SRoYNcmGU3JeI/l937qiFaWklo1hVLA
	==
X-Received: by 2002:a05:6102:6d0:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7d301b84a8fmr1006555137.7.1794328764518;
        Tue, 10 Nov 2026 08:39:24 -0800 (PST)
X-Received: by 2002:a05:6102:6d0:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7d301b84a8fmr1006534137.7.1794328763889;
        Tue, 10 Nov 2026 08:39:23 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:23 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 5/8] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Tue, 10 Nov 2026 18:39:06 +0200
Message-Id: <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: -k71JCa40yUe24j80T5Y3IsAfvFUUv3o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX5L0TdNyWk7nR
 ww4QihdUiofzROOaaLC70OpvhBOC+tm4rud6df8KmHMzT2K6aqLDLpK4bWz28Q4uJRlYNS9M5+i
 oUGHN37dHkrNPrK9dVYhOECWoXCO3xU=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af348bd cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=DnMRqvjp_ngGNQOL0aAA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: -k71JCa40yUe24j80T5Y3IsAfvFUUv3o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX/LulAPmS8d6d
 L9IdHvKmexNU496CmmuoXA7ObyKxBxozv4LddJkqNK/SB1FYvBzSLNYU/ldYZrkbLs4RiJG6+0v
 sQQ8+QDbVqxL7tO9k4nSaeKwcks25mI+t/hgy2NM0HcYHyCL1OLvID/UeC6FgEJK4QadhYlRuH3
 tGe5Kx5njK/xQAV8CVzPAuZQ3I1UzJA7KOLPiFQd8C/nUkPqQIHxC4MPnRB63mm0QcQSe18L7iy
 lgOWRCCcYgcw57ak4NNduUrXwN3rQXKz64rcYcdP9hOy8goC6Guj1QdC2zvXFI0aupTK3raFo4M
 2VprLgG0QLaYjv8Guy4FU/7C3baWmPub/I+e0Z6IF7d2/0aByZaUpRaw19Pm2vNqJ25AI4cBgu/
 wrSVXLJQdc0Sq9N2TnPlSayRZDJpGZoQFiF2+edRtSP6tLEi/87DQ/NUb92XWzfr3jdBDaMaKNf
 jC6YtlnvJkIJdhvPF4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100066

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f975c2183269a..7e8447df40188 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4480,6 +4480,78 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		jpeg_enc: jpeg-encoder@ac53000 {
+			compatible = "qcom,sm8250-jpeg-enc";
+			status = "disabled";
+
+			reg = <0x0 0x0ac53000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "titan_top", "mx", "mmcx";
+
+			clocks = <&camcc CAM_CC_JPEG_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>;
+
+			clock-names = "core",
+				      "bus",
+				      "config",
+				      "cpas",
+				      "camnoc_axi";
+
+			interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
+			interconnect-names = "camnoc";
+
+			iommus = <&apps_smmu 0x2040 0x400>;
+
+			operating-points-v2 = <&jpeg_opp_table>;
+
+			jpeg_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					opp-peak-kBps = <262560>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-peak-kBps = <524760>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-peak-kBps = <978600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-peak-kBps = <1095600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-peak-kBps = <1095600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
-- 
2.34.1

