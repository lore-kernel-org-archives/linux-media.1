Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA063F9A1E
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403461; cv=none; b=ZRZycCTRT/c2vlduKgiCPoiFXrvtECEEaGQBgPMJt0Ada1+aXiwKhtSi9EUZa2wsloeXecYmDc0+2OZwBRF0abua8T6WKdnF+bIUt7heN7Eg/Rx7tI+LyL2J50UJvDn8n6GAS144TiD+NIqCWQShHYu3yIRGFGRhdGeanGTjYLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403461; c=relaxed/simple;
	bh=fFmGrw7nFzxQnrIVNYz77f4Z7iGtRWEKk110+mrBOwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GzX/AmBHRPcdy6jTYenRsJEs4lVDogoHr6/pC5JXycEvp8L5R8+fv9PrSelHe50clmQxAaAqJMXvAOBcq2vPWJsmR/Or7H7VxHRUgwvQcYsIwFI5wDuonLR0yk7pvMJoA9XEdk7VLRv+sXxV/bL6FMq9ybDTRfYKGLZ3LYb/uyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0q4pdSN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6osqVCi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0q4pdSN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6osqVCi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U9AG06378517
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U2iQygbMBEDEjFcsu6VDu/jCcNgEi18VxHqCMcCNMUQ=; b=F0q4pdSN9HuTiDc0
	D9jOuTNl5yRWdMYYT8cY0iY/mUjpTHQv5C7qpAf9gYcESLlOGCdZoML/xK0OxVMk
	jCbn4EtkT54w4bwgNKhsJMcl12b4kwp5mXFST+Xq1e0Z+pfg8vHC7NwqnwTnk0kE
	3cfB71AbdrgKlWuRAac+qdmvy6RgxKrVU9Yvd9Gh0pJXk6zqteXG+XvgksvAAXI5
	jSj3QX3OLvfzc1icrdfjTsWRUWaR29tAh4XziFAqq+xmGIiztnDiufFr4oOH2lJQ
	RjaAidrWbs6yCLCbc8+dEnVjSbUWNnvPTWU9Szz3gKWahOS5D/KS9cQ/HA3p/+qZ
	UXJs7w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3rdg21n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:24:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-522de3c645dso35855681cf.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 02:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785403457; x=1786008257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2iQygbMBEDEjFcsu6VDu/jCcNgEi18VxHqCMcCNMUQ=;
        b=Y6osqVCiYqwD3HrSBiL2pNgXB49WumMnmw1sPz6EM3lreL0peYAwWjfnH0VZXuhUmF
         q5ST96x9QLRHz+i651C1uhC398OejTmG7gvx2sdh/iZlJLow6T3IfYhbp0H05I5W6RZy
         PI/r0WEgnBRiyWRPYgyCaZHaGBFqoRtzd7cjs5hc4091lpGKbsLGLSTQAJEWYyqPa9Ol
         iivS20x7wUSqZ4YHIJndqUqXWwzYk+lzc+sP57WZg0vo7CLq4HD4hxfyH/6uafKHcRJk
         ckBtJlfPw3IP3jxtASX3eF7DA7ePqN8O+zS1OkYzAzN2R8egR+rpAzhYnparrudBQmHK
         dDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403457; x=1786008257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2iQygbMBEDEjFcsu6VDu/jCcNgEi18VxHqCMcCNMUQ=;
        b=Bvwfba760NlRQTJepb+Ytq768EdI4LLDgCtjuy5X69mMhPRw5JFv24PkshZGSHLPpv
         4ZWTjOuZ3S3fPdVLd+qEx8y6hLPQstfXmzs1KAcXRSXsOViWas8w9R+T3TTgrwGgEeg3
         nrbbbdIonOH9eANgOt3vreepX3uq/YyHq/hj8VdR3MpOkCzU8yteusU49xZSSF0ARfW+
         nea61yBeURe1y+9r0ln6HjA0OE4q/4Kd/kyKzQbZwjCzBEPePxnl0kG4U8AtmU5RlYjC
         9tYwfZZ+EIn2LpqwE+Apq1+s3CymkngxffbVs3Kv7Q0ukC+SyKQCKL+yxKTrd5OonXGJ
         HkJA==
X-Gm-Message-State: AOJu0Yygab+xhNmiMEiekphtr3ruWrtf7eVyqV4wdpMYDLq/vr22ZF1S
	5f3j0NW+qHIZ+X7+9mBb5PjS9VqmFgnxSoF6Hz1RXvmOQUVbYmNhOBgEQ59AjFsNSPRN4c8yUcZ
	e8YdntrhullLIlLYIwxBBh2DGi6hGp5VVBlmkbX3/8XpaALd6Vc7DDwyfmdl2UN9cmg==
X-Gm-Gg: AR+sD11uMMW5xhayVuNpWnhLG/m6b3vrzxfcQZjHEnY7PC/H+1kwtWjYe+QZ48S1+ZU
	aB6jZwJroC2OKq59blIUMowHG2ROfptAP61qQ0yd61d2JGXb05XdJoTBTTxE5moKShczBDyNKJ/
	uouvlZPZ4u1efVh1uhi9l5KUKAHAn2nOk8pLe7PRDnpHCZyU/epSW3iaPrHzWSlau5sspHv2ONN
	Nnwepc3CPkU8e73JEMEoPpfKtTSQOhpMiAz1/cGV/yy1s1UErwMqd8mFQGxUkct5ORKn009VAlD
	p72UZQdyAIuWaiB0toqHYK3XOoXHBlbo776DraT7ts68UJ59TPx4pP4iJE5AYnKawpRzkI9k6ih
	9iJL+j2NSSemUIV3YRf6g358YgZGsU00NtwiZKHU30gKssucSONpnfIgkj6UxAMcvn9LUUUbEmS
	H0omtauKIzqkXYH4bg+hHvE5NlNvhM16OMgwtOTo6XGMaVdZk1nqYe
X-Received: by 2002:a05:622a:551a:b0:51a:8c86:bd3c with SMTP id d75a77b69052e-52b38673fc6mr19454621cf.57.1785403457000;
        Thu, 30 Jul 2026 02:24:17 -0700 (PDT)
X-Received: by 2002:a05:622a:551a:b0:51a:8c86:bd3c with SMTP id d75a77b69052e-52b38673fc6mr19454531cf.57.1785403456601;
        Thu, 30 Jul 2026 02:24:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d3831basm411483a12.15.2026.07.30.02.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:24:15 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:24:11 +0200
Subject: [PATCH v3 3/4] media: qcom: camss: Drop top_ahb/ahb/axi from
 QCM2290 subdevice clocks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-camss-version-v3-3-74a87302dd9f@oss.qualcomm.com>
References: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
In-Reply-To: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: XizwdVJInS_iQxpbdTEOcZXIlFvWKZHg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX2OroYFKrYm0R
 OWN/kCrIaMYHgLBan3m9P6P4wFOYEqrP/fu2y50pdTc+F9fNm0HHST6KLTa9Ql0KzHz4JWZzVq1
 SYvGDQzGOaOTd0XgS60ogT4ZQaKuPyM=
X-Authority-Analysis: v=2.4 cv=UNjt2ify c=1 sm=1 tr=0 ts=6a6b1841 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=RNuhJxbiNEtIex8kAdYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: XizwdVJInS_iQxpbdTEOcZXIlFvWKZHg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX3Nd1a9dsceem
 rNnoB11ae1yQovIPedzHBl9dZt5du2b30JeT9sLr9w9KdgaOpx6knPHJ1aYtv+tBi+WsV/ycUgW
 xb2IyNJ8e5IDtg0S6244ATPfe9p/oeTNRjzjPjrl93GVqrlFc0PapJ21Bx2IwYbDfukC1LbMFG6
 NSWyYJfaFHGElEbvuw+ognkOBSoHi3It+ic01YspFSm5X4yhHSqTllFhMyPHMFyKvuy8S6ieY/Q
 imkHh+dAXhbAPdy6oAnssMO6oazEeri+EtlRQTueaiOEZHPGGCk5H3zElmQaC/rPxy6xb92f/Su
 KC6qn7qSjU9WCf4T5mva1FFPG5RRZIa3IEEKDx3aSZkAzD7946al2Zv9CW7YeyFGEDA32x+4bBe
 ML5PUI59VAV22oKZ5nGO0ID6oM+4aT571sG45yeztcY7uS3i4Baee1CK0W569/VFDc0cI2eV+U+
 WDLrhbcxVpE/Q8mVlxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300069

Remove the top_ahb, ahb and axi clocks from QCM2290 subdevice clock
lists. These clocks are now handled centrally as global CAMSS PM clocks
and are automatically enabled when CAMSS is runtime resumed.

This avoids redundant clock references in individual subdevices and
ensures consistent clock management across the CAMSS pipeline.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 38 ++++++++++---------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7e755184b3c67573752c9d6f21d4436143b3701c..2301aa3868d26692c0c67034ebccac2a4f9abc4a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -688,10 +688,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
 			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
 		},
-		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 240000000, 341330000, 384000000 },
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
@@ -708,10 +706,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
 			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
 		},
-		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 240000000, 341330000, 384000000 },
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
@@ -727,10 +723,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 192000000, 240000000, 384000000, 426400000 },
+		.clock = { "csi0", "vfe0_cphy_rx", "vfe0" },
+		.clock_rate = { { 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
@@ -745,10 +739,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 192000000, 240000000, 384000000, 426400000 },
+		.clock = { "csi1", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = { { 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
@@ -765,11 +757,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
-				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+		.clock = { "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
 		.reg = { "vfe0" },
@@ -785,11 +774,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
-				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+		.clock = { "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
 		.reg = { "vfe1" },

-- 
2.34.1

