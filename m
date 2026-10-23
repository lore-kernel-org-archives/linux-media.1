Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769354;
	b=o7mj8OK764P2GVn3+63mV7Vwdr4dsyt50zy8Vpo+gN+I2MdG3KCUKOXq7IDdF4FE+EVN
	 wTsVnzvajR6g/TJTMSh91KHqIGtw1Psc3415kVbveyhjgJNekJiq5bC4Us3GHjqERof6W
	 w3SDXBXNzgMulTqXSCgbzKnv1oQbTlCeBAWuLRQlX9r5aNIelwzL3ikKk5TEVjVDu0ltB
	 R7nuawfKsH15WQaoCWNc7Aqw9NsiHFs1h1xotjed/OeGl9zPTfjanpbNGprgjcIgrCWJm
	 dxLW26wfgGwbhBHSxeAaASqRIYHz7hXBAaplhgJpTr3kcXgJ0ftZvqY9UDTPcl+ausg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769354;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hHHcAQPfZahhxZFJn/s+xEtK12OIVnJxh2g2wSCkHj4=;
	b=S7ylsInybgvHFJjQnhRLJcbd2qGUu1mN4p4XxuUVESDZvHT3hswmP/S+2ZpsQYcCtqfd
	 ZxfH/2Btn10FA89B4uC5XNvq9UNhIHurV0/8bwrM+4qzhDXeYLfK1g41RXhLBSK8x4hQF
	 HsfSKqoa6QCsFmoiwxUjMhPzSLx2alGYQ9U9xJkY3pzTEqvn1Sm2uRfu+eQK50KifSQXE
	 pnQGBtv2WZutc9TQdpvA2OuHjg9EQYu5qWl0F95q/mMttPznSj8O6ns1KVZKgJlgHsac1
	 vhpbBeEfbCsJRjSJwQxMugf1PiCr+DUqjx92H2o46BKpDseiOq+EjwV8e7yPk61QgLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nAxuM+CW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG0RXALB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7F860A261F
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7F860A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nAxuM+CW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG0RXALB
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE67x63019022
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hHHcAQPfZah
	hxZFJn/s+xEtK12OIVnJxh2g2wSCkHj4=; b=nAxuM+CWplogxlLs11krXNiOTxf
	BVvteGg5rpja93tkYG/pKKrrkUGHe85qk96aYqJ4NIG1R93Klv+HOAiJO+PiBHnm
	/F3NhUM1T7BbFWPObD33876BB8D/TYuWXfa+l7BkjsILC+mECCzbDvJcwaHw7Uta
	PhS+SPP+7OzAUv7GJ4QWirKVlqajN9rTlzfbR7WLA3X2qodpcGyOaKr/wqphelGt
	k/N9U6PDfZdcm+GTBjStHhrABeoALmonOHdmHxI6mbcrRYabndXgMHZtMmG6ehy7
	o5OfmPzZ1u7/udqrKlJAk3H+XCheovndHw/O4nsCVdGVmGqAn+rycNaMFGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykbr93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:29:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f322ef7d3so227101785a.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769353; x=1793374153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hHHcAQPfZahhxZFJn/s+xEtK12OIVnJxh2g2wSCkHj4=;
        b=fG0RXALBIS42dTsVcBOP+McjJHRxv0uXsfG837XPgl6A7cVM+kOUQX70JIv4OZDcmi
         7+kU+i4pJtmcv29hCHQbZgHJ5Wphgu6LVjqASdvHl9SrWpAO1nKTKxSj13tGZWuK4MXw
         SBZk2YIALp+Bnj6c5yMFos9QxCaTKVNH4DQNYaaajNM3WIQz4RCHdx+JEMfvJ7bQZWNh
         CyQyNxnN3si2VR2LqDJx2W/gRPCm2UefiCO692PdXsCNu10+XM/YVVYSxtRGzvXwlavn
         bHwekqhll1vm64ytpw77F29aas+pgaGcfffMfGtpykHPNvPjcPLYHDKdJfR3yQ3EWS+X
         3LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769353; x=1793374153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hHHcAQPfZahhxZFJn/s+xEtK12OIVnJxh2g2wSCkHj4=;
        b=xqw1EsXX4MWgORcsMAsra/Mjsq1kd++OHbmVU3RDqbPh2WLQmr+7WcXx3T5+RUYMDp
         ttN8alTMikHZf8gckRuAzeWnrCnm2IJdiTiylU1PT0eg6jfC508532q1nKoVgRV7qm10
         RB9BL08CmDy6dQ5b42tk50pnl2rNmZ7884wQSnolh+mdGcRx9ezaYvaqM8DQRjOidTsu
         O8kr0OoTcYoVEwM718ybsUXQKeOVhAKC58Po0B+tLq7CtgYYqv/Wd/6mfl3OWqZL4/ys
         v55slGG66pX5RMTUSibwdQHzcOgp4ikg6UoLfl1nuj2X0ZWQMvmp6D9eL84RsVDc4Kbh
         iydg==
X-Forwarded-Encrypted: i=1; AKwUvBwyucQdyl/sbJ4daO0qRx1kcDT1lb0k1/GedUmRDV9s9BWiW5v8o8TuNlEv1KvJwS5QSp+3Z2IblDJC3A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKnDFI3jHHWnwPKok9ADZ+5GKF8qlggonYe6sQ4gjlndCTrDRp7
	ESX2TnqR1p2Pg2d2B42NelCIhmJeWSHp9vZmKRJgVzk8oRpDLmps0RLCBJAY0y4ffnsOSzGeYcS
	IOIEzrhPtBvH2eTTg5smRmOivNWfTQENC/dWnwnGZSj1vAyZSRbaHZv/HGBJGFAQrkw==
X-Gm-Gg: AYBFou1RrErGHwmd3UwenIeUUpIOi9PRmtJZs7Dh/ie2E2Z0K6QJF4ov42LTiBHJrDl
	r9/Q1UGRiIm/2jR9qCI6AGMPUfZoD7GGxRePKLOWh3hsi++R0BUCW3u9CaKdJj9Jbtx2M6HtKMg
	ltyvYEqm3BRowb/nuSBOA7tIHLnYJrFPFN67a0H/Xv5rWXoVctpR6rqUWE6i4zCn2TKcOlg8iXS
	WN00rifTWHbq7TkUdAPzaAaYsRNhkFfEqJmGH4wVh/VgU+YdSjQDFuC3jICGnu8YCIcv9GezH6n
	YITA6XXRNm0u4WdE3BAfaMrvWrzFNA1+t22H7jkup2RMzesa/RdArkRDPpuUzbHRYtJvSEUrROF
	uVOdpkaL1+HfBpPrFWLzHwFWU
X-Received: by 2002:a05:620a:4403:b0:93f:6c76:215 with SMTP id af79cd13be357-93f6f7feee2mr456484585a.50.1792769352715;
        Fri, 23 Oct 2026 08:29:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4403:b0:93f:6c76:215 with SMTP id af79cd13be357-93f6f7feee2mr456480285a.50.1792769352205;
        Fri, 23 Oct 2026 08:29:12 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fb9b90sm5546425e9.4.2026.10.23.08.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:29:10 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Date: Fri, 23 Oct 2026 18:28:57 +0300
Message-Id: <20261023152857.2859767-5-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXyMoqhfpSYMoE
 zUmBwA9cfWWHab8YM2FZ5IrtSp1izIldmDIBwubooF6/gJL1n8X8/Sur/vAkXyDTc9G9sQRbz+V
 MqwxBUZBHoBWQ5ZHyut0TehZNB5jrVU8H2P0UT+J5f6QNk3pOonp5x7zkglnQkxjnc8Pauu+dxf
 UnnILJE1I7S/bRiS2GulX849WDCSfrdDypput4yTSqAEVKQ5OAjgk9y3nm2bnPqaFtmqhnmCufg
 rfZ5BtgP5dRtUMRFsWnAO0raPEbGaZj8w7UNr4+rPFiSIbOZG9njnrC+k48YtOq+uym+sOoSMXM
 S/EapTM7LRCAFtpB9MS5ILHi4yW1o/6sjL4Qqqob8XSRAwfpgr1vXruM41yasGFZ7ZwfJ7r5/rC
 iBJVa2U5v/s9fZQQEFp5VHfemUkS1SQxb7FSauyUfRXEnUpo9w4eRgysQCfEcBPqb+2UIUA2y99
 t8EmRUXU3tnjA7vkFPA==
X-Proofpoint-ORIG-GUID: DjPzKyPd0wW7d5uYWbmb0dGnmdKiJfq-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXyoOmMguaKDxl
 hSkJ/PbMsGScKOGBLCFL7+LjzqhXEZd2wu6WZmyWC0eI0KB0UXJY9QZmZBc8WBaz7SX/B/GMubW
 +c90UA7JLEEZvWdawpFHkhlIyhimKDc=
X-Proofpoint-GUID: DjPzKyPd0wW7d5uYWbmb0dGnmdKiJfq-
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb7d49 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=FiRPRoyJa4ALD98OXUAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

The SM8250 VFE resources list both the camera NoC AXI RCG,
camnoc_axi_src, and its camnoc_axi branch. The camnoc_axi_src levels
are never applied, since vfe_match_clock_names() does not match that
name, and they list 480 MHz, which the RCG does not support. The
camnoc_axi branch has no rates, so the camera NoC runs from XO and two
concurrent streams stall.

Drop camnoc_axi_src, as the camnoc_axi branch keeps it enabled through
its parent, and list the 300 and 400 MHz camera NoC AXI rates for the
camnoc_axi branch, whose rate the VFE sets through the parent. The four
VFEs share its source through a clock domain, so it runs at the highest
rate requested by the running VFEs.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 28 ++++++++++-------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index db5212b14d5a..71abd01a4286 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2120,13 +2120,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0",
 			   "vfe0_axi", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
@@ -2146,13 +2145,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1",
 			   "vfe1_axi", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
@@ -2172,13 +2170,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE2 (lite) */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 400000000, 480000000 },
@@ -2196,13 +2193,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE3 (lite) */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 400000000, 480000000 },
-- 
2.34.1

