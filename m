Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193865;
	b=wml4BFJw9dWHkrrisi2ivvlqehqRXNlHbjyu4R1DeKvCM65MukekPGHPuC7+LXyomjjP
	 YN9o7wAYwgMz/PlBthknXon2UyN/fAZr2r8nyNxeL7OWHus7IGFphV8Lf/PVo4qQJONm2
	 rJJ5641XXGEFojqQ849P4TnEevaAKhRWWDetmWeCvMbt8rKFQUi5+lnU/4mBa0xdF7ZF8
	 VBV91//PQhDoPt+0GAXPhjNZbt5CxuM6GMjVohnd69KyX7XFNFT18PXlW4nw73mhp1gce
	 DrbgLR3YsT3m7HG5NiF7WWt34g8Mbm6CsWxqGA0qaTKtc+IS+rgnSVcE+jXIk6Gg5ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wAC/SldCPnNA+WsUjU6cUfaa8rufpG8GWvTQo1tuJ2E=;
	b=FN5vUJ8R4A3tnOjxUY4J8gVrOK1+G6mZffGDibFnVwgnpKYtC2vPxl8u4P59s+neX3kd
	 wokeqXV0mqQqZz8zhWVJ9XafMVYVrfPG771Lb5SAu3VBCTJ+g0ozgGYz3hiDm3w6X4ci2
	 9vEnaiml6R49PLhFsX7LcM1ztQTj8ZH3tizCPjVyVyuKZxtzCjmnCu6RgdLQE/fvlF/y7
	 bvFSCmkMkQsw2YFLmuA6kDd8pB8rPKhbzhokMDB+I7ZkuMtegbGyS+oPb1Agw8WcuZx1G
	 JnklnfukJliMG5a9qoUbTCpu0G/muTHkcFBHJDiOgyi9JdKP/zOjhl6g4iUvYCa5s4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=As0sDMqr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TR7Iqgp7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2646D606A31F
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2646D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=As0sDMqr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TR7Iqgp7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2PW1538941
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wAC/SldCPnN
	A+WsUjU6cUfaa8rufpG8GWvTQo1tuJ2E=; b=As0sDMqrMpPuemuxopQxV3UW89f
	APjAaziJ4+j8BNg/TnCqXxpDC/YF+GPKIW94EXkSIcEBqI4NgA2Yll0ds2R3NAEZ
	rB/ju/RqbhvbcQ+7Iu9DGtHpzWyXNVAVfG0l0vOpAzrJFP3d2YkWBEFZ0edGWNVI
	3WsRWXi+GsYa9h11zcOnE1XrKfyeSLTWnNxVcE1X1BvoPffiv1hLdR6UM6tVJc2x
	klDtqlAbKGmOhGDT3k8EZOuizt1p0Bq+t6sWm50eAtyqv+S+LAetNdKr8r8eOfUy
	oLGdPS/NCL4pD70GWAha8ij/lGFJcI9gIAzpmvBTj87uCekruCG966dZoMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7s37b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so196002385a.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 06:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193862; x=1793798662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAC/SldCPnNA+WsUjU6cUfaa8rufpG8GWvTQo1tuJ2E=;
        b=TR7Iqgp7v6xWr/Q8KltPZLbqGj8ILcXO9F7aXmVk8Fl5PwjjtmfSX+oKVh3Cv7R0og
         W730CltPQ/CX4nopnw1kTOmqIDRh3Xqa9KnFqvtWtN1XVVruaMvP7GRZaEqRuRRA6vss
         6dPtm9BNr26MUKKxYxQ1gqBetVnl4aD/D1qK7fu9PvevOBH+a7ldtpfwgondcyBvcLmf
         S9oLxJfb9zRM/qnb/R4X3ddzqCz4o7M6oZjBI18kQ927taT2OrNIuvKTTrVuPwH+4aw6
         ogsbyiJncfqgMdPnMDrnZw+PFGwuf78q0Q3icftGK0xI2p2hmAITV3dGZ6EKii1xYOyb
         Izkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193862; x=1793798662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAC/SldCPnNA+WsUjU6cUfaa8rufpG8GWvTQo1tuJ2E=;
        b=bjFOGOObMl8O4eE5INa2krB1JemRtBDsGCf3t9wbi8NFgCvd/BHLlNPqFDh6jERpm7
         vCebCqg6NLUBKv3DW5Kn1cblSIB3iwyeOfwh+V4Zo58QDfijSLzPMV4KZiX/bwllagJ6
         ypFPpCzZPn0pqYT7GXftrFWIPnq2r6991n1plb1BJrDd6Tv1RfSin6JTpHeQmhBzm2bU
         s3p8g07t14gbTd1CiCQKheZyhZaV/QZ1VX0eV6K+mygSssRTMMYNg05L0n7ZjOCi6ICX
         R+pTc/1TyFjlG3r5ropFF5UYk0zAdzQoggndb2a43LtEP+suVxF/sYth+aNTN74CwVfb
         +TYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMvTTdhRb6X6CcTGkvEmllnwJaxGR5rjXl4AgcVxHdfZOdbi3xR6zHhOSUeKbmwq71pbLfmdZW/k3xXg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJfCArQl4Gb90LhLdvJfKT+0vrkl8e6KJhQ6774H7msw9tdRRjF
	ZKmh5462BDoyh6lvhPcJvC3CpwDq9YpHOmi1OZIEhweg9Y+k25CD0L4stNspRpAp3T2kho9U0xJ
	Y5kYjELXYX9xMYrNsdeAYI8LWgPBpg+1ZRI/WdFoiWD9e5LPOqnt3KhLJTq8iqF2tFA==
X-Gm-Gg: AYBFou2MMfsNEs5vQFeVfCR+hcaeyGmqFWPT59YQ4VVwqxuCHK9YTJHqPiWYaVdTHjn
	Q8JW9IKPCAovv0FCRODgw+NYQ8l76FYy5tkB8G7yCRsPly9jxbirJwoSeiT7KrdBkC6YLJqA5HW
	AcCzTKtcnHJpl7lZ6gsZ84epxWZpSThypDtG1kU9u8Vw65T6becKJg9HsRprt9JLOFdg7BMAL/j
	EpQ2P+Y/Y9OmEQKg0F+GWbMkih5boCqDDMwtW0cgB9+D5dZcxUi49nYXkB12+a64VQ3G32GWg2g
	YI3B2bpLcrZWbblogtrI9dHI6LPezuU6EyJDK8JbS4LOGSuMakH2dGvsDvdJni3IR2yj5korrpC
	uDDGAG1m0PAWCyDq60xnccTNKkfajqDIwsDg8e9IMFENamDJS3zCs7cm7sDv84fqIsNVRgs8iww
	==
X-Received: by 2002:a05:620a:2849:b0:93e:5821:2c5c with SMTP id af79cd13be357-94408cf1bf6mr305856585a.60.1793193862402;
        Wed, 28 Oct 2026 06:24:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2849:b0:93e:5821:2c5c with SMTP id af79cd13be357-94408cf1bf6mr305851185a.60.1793193861731;
        Wed, 28 Oct 2026 06:24:21 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:20 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Date: Wed, 28 Oct 2026 15:24:03 +0200
Message-Id: <20261028132403.3505037-7-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1f787 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=FiRPRoyJa4ALD98OXUAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: JcC33P2n_TnU6FxNBqTUnHZIsEAqujvv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfXwcgX/NHgSFLS
 FT22B8MsZaO1pstEymPD8+Ibt6yKeXdt9FT5OYcmvrHL7nq9G24QcYFjCK3/E6sQ2Xx7+/h2IE+
 1aKT7/5TMCctfsfrHLPD4KoZMgRyZR0=
X-Proofpoint-ORIG-GUID: JcC33P2n_TnU6FxNBqTUnHZIsEAqujvv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX3yOIvaQiYiLU
 jDNyYlrO6h6LMBDwzjo/zkCxJqgq16qHR8UMhbvL/Nbm3j9d2WFECTaHvqsOmPiAhumnY5yJ0MQ
 bloSOKq+eZ21QUwlIVVs9EszsHkJ/FTF5SwDlb/C5Z8qCgN+uB5kwI4GqtaHQXwpEmdjEmifIJx
 eT7LKHmgjAFAK7+gM+CcwHE4UdpG9m5IO9HXB3zQTB9svfdbJtfSywo1h8F4AVdSwPJ7rsHL8K6
 sjzmBJZBP5xHEr7NL27zKOel498NV/JLmT+Yc+bonX6y22TGKqwiCImqJWw/w7N99RrfLS0CWov
 UY5ycqakRFY8/BrsM/fD+NmKT+o/NB4+8L2pnkJRVFgtiOLS+t+vtvvkM3FP6XbRAE6cQPybAWT
 9fjmryukRYZt0QdbUPSs26Rc6Dm6Nzpr8geMEg2XG09tKt7JeArz4/FvtnpkbWGvHT+eqrHDsAm
 msgvkMqsLDbx7aSEglA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280053

The SM8250 VFE resources list both the camera NoC AXI RCG,
camnoc_axi_src, and its camnoc_axi branch. The camnoc_axi_src levels
are never applied, since vfe_match_clock_names() does not match that
name, and they list 480 MHz, which the RCG does not support. The
camnoc_axi branch has no rates, so the camera NoC runs from XO and two
concurrent streams stall.

Drop camnoc_axi_src, as the camnoc_axi branch keeps it enabled through
its parent, and list the 300 and 400 MHz camera NoC AXI rates for the
camnoc_axi branch, whose rate the VFE sets through the parent. The four
VFEs share the camnoc_axi clock, so it runs at the highest rate
requested by the running VFEs.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 28 ++++++++++-------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9e29b713288f..6c3e00e043eb 100644
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
 				{ 400000000 },
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
 				{ 400000000 },
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

