Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625769;
	b=xdLCH3awzcWScrInddFW8vXIOS7Q07B9SUk+/0oZhbLz7zYGcV5KY6y9Sz5V37rcpsGh
	 0b19E6A9b8mzXzE15OvQKk/hb7EnqT6aSptgYeC6Uo2jZto+VeIk21svGl8BAJWwwwQpp
	 R7Fl3EsF2xBpfAyxllGMJd/2+Kq6BDYsohmAIxunTz7ehIhSlOuNkqHzXTT49D/1SuIGs
	 QaifP3NWtLoQ8dybevsjSfg2yqN1dg5XHtXpU9/E4K3ULLRa6sRn28Vcru0OTy6zZfW8n
	 2iifYFnbHtXJBkSzQoIRt4LA6o2zH8cxrQiBAhbJxahKOqSYDGj2rF81hz0u2uqp/2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=;
	b=3NrcMd94PNvFX7Aw2WOQWBHLxNPzqS3aNE6Z+javWZUsurkK2sWpJK3a5nT+E8qv7tvI
	 e4SdkaQVo9p8zdrC5dDg16temUGc9HBj6uQJ2l51U3Ilvq4TnC0Z7r/hDSHEM+IZmB3PG
	 RobuGPDxjUwaPHanKIXepjNwNP2XrFCKk3+CvbO4VN9eoCkzSSAmQiNuMuzNHI4zjPYAS
	 XChHkU+//tHdAG4uodNYKdCtG7V7HjxCPlQvQ7aOrIt9b3sgcLaD5ygGfDtUsBPbPusB3
	 djy2eFODNsVUGUR7u/VJ8pGtERd4PxP1fxkgaqen6+NlLFKKjxXQaouWKlj3EbdiUug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KhzPPwlD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TRqSzZJb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9D5606A880
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D9D5606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KhzPPwlD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TRqSzZJb
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE202v6728457
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=; b=KhzPPwlDNmzZsIoR
	H00OnEl7/kX1tlPRMexasZ/r7bTyeloozJyEU1lxIw3W0myb77SSMiuLLRw8wge9
	YpuOc8GxA8hUmmF+PTcdYCBRk1dcGYTvEGV3U368p9j8lT+WdDmg3m4dvV2g/G36
	MJGuwCjvdGtTnwFxOZx4cAlzcPM0Y7YDwAk2ehrjJozpKmpOkNIY+QFAJxZd7as5
	pDv5Kv4gNXLqMWah4QFzpnfLxp25i8m1lwnBQNiDMX6VNheRN+denX9OcbD7GEBB
	88FuDWne488pwUthOAMJr9J3QbC4AqG83DwIQTd/ZvmKLWUc82vLWodDxSmHQo81
	e9ce8A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxd0nrcbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:09:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36e61c89e2dso171177eec.3
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794625767; x=1795230567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=;
        b=TRqSzZJblMUO4su1u7Fa6h1vaEgSUBnl89L9HTjzOoVf2zMb4Fx/ycJm99hg05cRm2
         ZU5sthBFwslwGd83xmPzy6rZy/MEYLkAaBS0GBX6f3awnFkT4bGdhfc1RKPVrgjI/Rdd
         crpeatHXHawwx8pEqJeFfgyBI0T/tvMRmISLtRooD7ytIa+pRgaEHk++n3JZ9+Gbl0Sj
         Qdc3PtNmvbW2TlgT7x2xS57LrANzgHju3ecY7pctJC/gcRDvDuZEpv1MlRgB2PS4pNRP
         71vlh6CM4v6OnZ+z7DKbRvRSlFsSk4Qw8n7usNY6+CwpZ0u/rrHKTHopTG0NSHDRuhrV
         wZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625767; x=1795230567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=;
        b=urRkN2yumwMHmHqQ2xAjU/2l6kfyQbc0raEM5QYe68vcNZalzRp/sGHligVlsHmtek
         9F92mFoLLjDh0FPdsK4WLQ2D4InNb3/GBEUDBn8DhQ9jJsBJOmNYlhPcsd3Hl59xuJD5
         0kBxSVym0sK0HEqdaFhuqxU5Bj/snr3As3A5FV0+6wE2vlNvb2bKKghWkFmZWF5VbwIx
         MDl8sLe1hB43FpckPLUVgbkpoRFypWJfFYPJGevz6x0H+Sas9cmKX6kd01tsEqTiuo4e
         rRQzsj3rcpsYJgcBtvn3+Npa9zGjHdNiPLGdVBZt/cnKrIuc2I5Bpt87JdmWM1mnzpL0
         FH+g==
X-Gm-Message-State: APuU4Z88zZ/Zh29Rb2LICPm/0C3OmQnTmnyuLlVtfmF5KW/3Qo1hRLMT
	11bY29bEjR8IioVjrQ6RBy9Qz6mVyoYKkfBcO3zDaFeo/VxelMUcO9PWvXTURHtsRnlPorW58Kr
	tbPBFB3JJDtZEui4VLD9GUkXbp0YuaNzEb5/8tOGJrAQuAKuxz8Faydmbh1xTlWdAOQ==
X-Gm-Gg: AYBFou0m5/9S3XioRIzuyVPCQJRYjWHKP5KD1nOs1AWfewEVgZRYuBl7dq8188wLIKS
	DIgtW6coTXVf9Ib7SOwwA7smTLC0hbJ2gkkzSfqPSJsH3BxfgEtIVlRPduDK9SdsYScq8O12uuG
	f3oKGcbnlb7veZ+/h4/EPDSu11kWXRutZtofLy4g5y0/M5/W4ptApi8fRLPrjK8vBGTf5Pz8sxl
	ubA7G8VpKi4Eq32Wl0WksY5/cJU2VlWglcEJ8uuGZYao89STfiYnP/pKu3zWAWBsnDrf6bnj2So
	T3qiLsvBJ4VSQYXx/lPzfLsgPLb1DFmXmpVqSSXXDr1Z8+Rm9cRQ8R3RWcehMq7Qth0Qq4xTRla
	jGJsvtmSCCOEM2WImxkBO5xzQJXubUa9JTbLPagQpJJO81N8PJAIBsftRcXXkVCMVhN/2+LZHL4
	6/bN/NJfcNlkMotkQiXOh6Du9k/lrF1Nh9
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37964e03109mr7463952eec.1.1794625767032;
        Fri, 13 Nov 2026 19:09:27 -0800 (PST)
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37964e03109mr7463890eec.1.1794625766486;
        Fri, 13 Nov 2026 19:09:26 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm11158803eec.16.2026.11.13.19.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:09:26 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 19:09:23 -0800
Subject: [PATCH 2/3] arm64: dts: qcom: mahua: add iris video codec node
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
Message-Id: <20261113-mahua_iris_enable-v1-2-b7107e1cbcaa@oss.qualcomm.com>
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
In-Reply-To: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
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
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794625764; l=2554;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=NIhQBb10oAVEd9idm4CYEPbkBor2YqP2ym0YbzLwWeE=;
 b=QDCsI/X5bqUbfX8kcms02h2BT3/1Mzvp2V+vSAQiU0RuybZJjEeM16F6UTFxKdTALiYzPzjRe
 I5e3u/0E9JOCF9pqhPP7PpNPZuQBpCuJtevklmwBBRohvgMH10knX4B
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfXxBrdCK1n4tI3
 6GldgLVfXtetZdty6iHfmnywS1CnSySE4L4w5DL84sGTsaSsDgP4Iwf+BDdxERD5xOKGF7a6pe2
 Vrfb5caOYzgaux14fd+322FrEDHDTGw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfX/Ox5Da8ZsLUw
 0IndyhXx8GEehC4H83qsUvu43slOo86czmYGUSTYEJ4tnlOuomfeHsHGHGwkJMZ8c52wYE1f4w4
 5KE+bUiFdtyUeFpIkL8HZCGy9ft82W5QWd3zr/yomFgkpbAwR0Gzf1Uk6dnvf2xUqIGD39a9YMP
 QPfFzEAor1BT+gH2eM7jucoPC+ntPaKlMm5XNi77MPfiaf06tPfsbsnLLOWBNdnD2qky0mffKiO
 hcLSE3Uk3t1+iIpEpLIeWE4hP/lv6kipyvhlmGUcgYF6+Rnd66yfvzSgKlqhhupnjJ/TR4L3Gui
 z7JQ0+yvlgsYyNYVOAIBlIEg9tqMktdpN6dB//P41bZK4s0rOl6oXCBKETM61vnhh1Sr5MY0ipW
 33gTFyc5mhZRgUzBgWfA6I+VJ37jBxXhLLdifpTYnz8RrYhEE2Ud5kgbiHaQ23pvl0GNQYTGrv/
 +tELbkjt9A+t68UQazg==
X-Authority-Analysis: v=2.4 cv=Zo54uN7G c=1 sm=1 tr=0 ts=6af7d0e8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=A6Af-tnAtVRmK4LPXG4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 0lcRG8KYEY5MEpY8yysfOXrNWajn7LbY
X-Proofpoint-GUID: 0lcRG8KYEY5MEpY8yysfOXrNWajn7LbY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140012

Add the iris video codec device node for the mahua SoC, overrriding the
fields clocks, power-domains, resets and opp-table reflecting single core.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 66 +++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index a59c5ed7b48e776841db58e124c4d66225faccf8..1d01655e7623d13c43063b74d2ab086d2308e3ea 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -400,3 +400,69 @@ &tsens5 {
 	#qcom,sensors = <15>;
 };
 
+&iris {
+	compatible = "qcom,mahua-iris";
+	status = "okay";
+
+	clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&gcc GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
+	clock-names = "core_iface", "core", "vcodec0_core",
+		      "vcodec0_iface", "core_freerun",
+		      "vcodec0_core_freerun";
+
+	power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+			<&videocc VIDEO_CC_MVS0_GDSC>,
+			<&rpmhpd RPMHPD_MXC>,
+			<&rpmhpd RPMHPD_MMCX>;
+	power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
+
+	resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+		 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+	reset-names = "core_bus", "vcodec0_bus", "core", "vcodec0_core";
+
+	iris_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-240000000 {
+			opp-hz = /bits/ 64 <240000000 360000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-338000000 {
+			opp-hz = /bits/ 64 <338000000 507000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-366000000 {
+			opp-hz = /bits/ 64 <366000000 549000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-444000000 {
+			opp-hz = /bits/ 64 <444000000 666000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-533333334 {
+			opp-hz = /bits/ 64 <533333334 800000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_turbo>;
+		};
+
+		opp-655000000 {
+			opp-hz = /bits/ 64 <655000000 982000000>;
+			required-opps = <&rpmhpd_opp_nom>,
+					<&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};

-- 
2.34.1

