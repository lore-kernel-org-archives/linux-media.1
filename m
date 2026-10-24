Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834849;
	b=vKfZIKH/eTh2PTC5RG8d5zvHAehbHZovwpdR5Yo2N42hLi9XYPmY4Fqt0PoSuLNPfuj/
	 WOJSdrD+nw0bWcXh8e+coSKPttqXSLBhPSvvPycKtNowge6QaOwZrBsxLpIFvc4xblkk8
	 bkkWFgj8E78Q1dzoa72v44ew0aKAVLqTYWTM4xAEjgfMFw8Y6lboJ7UIUTxSiUr/uQDAG
	 mJOCyd5mplXqNlOrQWu4Dp7c8VKeL/hn/HmBFp3pDVBLXSPBtugPrbic5x+SI9PLT2l5V
	 jZFgSGOjSe57SazoG5DIDanLrpfV2Rysoppyb82PXzkNXH1nLuA/xTbBLZN564R1mgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jgkKAewrB4ulG7W0OsxbbjajcwrjHSByS/uUqiEtUBA=;
	b=GhQFH7Em2VzAgBKbg2xPSA3u179hJaOMr3vI0j49i6QMMgYbhMp2sbfIBAgufhHB4S0r
	 9QrMb284zKltnJcW+0XpxRl/UksjZqPGxtDobjfJFmkJpuAhPbE2kTyCbqvTAHy3+e8fe
	 r64ShiWLv3rTIUO0PTg2Q7ogAfl9PcZE7cuXigGUPgsyXq4DcLFnCVqu4XPr5UczJRdiP
	 Nmw+TvnIZX/cOuVfkthU/sKqLopxaj4FYQsYT+CYoMaERQs++KIK59EC8skfRILqWHKn+
	 G7vcy1SfMDIrNPmDbEsrTogCOQI0qL/crO+ob++2gP4QAWLgVVt08SAkpiPXpURnWmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bV2dsHZy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxlxblOh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3900F606A33B
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 09:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3900F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bV2dsHZy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxlxblOh
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8o2cT1143157
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 09:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jgkKAewrB4u
	lG7W0OsxbbjajcwrjHSByS/uUqiEtUBA=; b=bV2dsHZyZzUoDGgwcjLHfW8u83D
	2dlCetRtENgZEMXvNJJC1quy/HlLmoU+U/b2KD/jkLs1wScM8yymKNnqmfJNfIaN
	nI9uc/9lHloewTlXfxdGZ9FcD3ade2GUb7tATr0H8qa1P/4DaJrqamMp7kwfbQHw
	okVr6LK5c7ZmdqNPe0gIzhJCc75p4FTlbY+EGPveP5Oc1YZ8VNNRUap7xV40y21I
	ejTNbNt2jI0WW+nqdcG8rGxmdIYYFJAq2c/D9UqS56jDsw8KyzlfgLAC9dcAGKO+
	SflHWKCuFoFPIp7kNYGy7rzyOJYq464ewewWjdKMgYYU+ZkogHs4GfWR0Cw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgj1p90v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 09:40:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so310458385a.0
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792834848; x=1793439648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgkKAewrB4ulG7W0OsxbbjajcwrjHSByS/uUqiEtUBA=;
        b=DxlxblOhLHvp4MaG161aY4QO6x5YZw99Va7zhiIX8TfLZGWg23aecNLwBO6Y0SGy41
         ZiPVeGXncpi+rAYP2AYgx53PBfZ1v88anUzWGDvLMmdH2IlLZqXgzQ1C5q31Y8UKrTvm
         snoDXUNkatne8txlJZI3gf42A3Jt2yNqHCbLJdG5UzKj4KDzjMu6uFfj8eq0B/zKYeJr
         rpwtrShBPSv3HCP+PO6OPSghEWWGUEQapSoMTaEL/1M6nOq12csZBRbqJPPamm1khV6m
         i2PZcXXWke+1dLXXH0IlWdR1ZGJQu6FDrra7E2K1vFomNFd+e8y74ghn7Y9AX5tK8qvT
         L7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792834848; x=1793439648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgkKAewrB4ulG7W0OsxbbjajcwrjHSByS/uUqiEtUBA=;
        b=wloCfyM5c53g3TrIgW0n7RrJsras9VKuKqJKhP/q97kDYiMif27c3aJObXjJTGnVwM
         Xp5xkVDdRr7/VI1KVnzCPAsSXsGN8CMsP0WpWpHju20FtQCr3lbK1P7/wVvzyplEPnDb
         Heum3YhDtPxkJDSMtkcVfQF7p8dDi1AthnH7dmSRalzxJCMyUdCzsEaU7cJwFaF1+sPi
         5IZpBfukazZDP3w+qPiRHz2+6t5E4FIP/JPldVN2cPlMZzFIDYnI121hcQMAuZ6Tulzq
         rtNQT89wH991auudVKrR30BUuGKUyJfbRlw4J7laPhqyilIY/++MyAduA/X0MIfLZjP/
         8+Fg==
X-Forwarded-Encrypted: i=1; AKwUvBxlAVg9Akc4HIH0eAwD9Y5ab7smoQNTf8Omwsh1crpxlEZq1cauKodaSYaR/72MR/bo002YDADwZiQPCA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIMrH1dil8a4MrNdr5gp+QGSFOwA/dbjGDmpKvaVatB+XD69LkB
	rvsBn2Vr3u6j1qubOKos7MhTApt6Mr1Zwe+DpqeSxsXiJLO5sxd0pfBqzfwIJ8Eqlz00+cxuYze
	YrIHbbL0jwRaC/qugImTZzyDcQ5LygAqakd6wrOeS94nJz2UskvkmdFuoKdFX9tAvXA==
X-Gm-Gg: AYBFou3mVJpuUMhLQxIpQqcNAz9pYIqsDGkNwIVMkCeC3TSMCg2lHPE9L1fgMl/nKuQ
	n4MM9WI4+gOpdLBh5kDE/8mrL7DEVg+75DVhRWVAAvB1XuuLtRxkdV3af3F52dTr+hOKG693j1N
	G/WtCroZDXFmvEhdWZ+f6UXUYfeU27kAi0ghvjvw15usIMgkJqqQNnyyb7s4TxYYw/llZh4+dUd
	yCKl1nkR1BwaKroV0p+J3+NoUVcXGbenhvRk5cFfdHqYL4WRzctrydmOm9g8BPV4R9FMe6TOTzE
	0mO0VEPi+bZlPNlfKR/+KUGprQWkKuJceP0Rhz0QS/bt20y+JshH2DGU3akAglhYmhVRz1BcxDP
	lbOUVJ3XAXUW7t2tIbsgTunTR
X-Received: by 2002:a05:620a:401:b0:93f:4a02:ed99 with SMTP id af79cd13be357-940ef956f57mr143096185a.20.1792834847721;
        Sat, 24 Oct 2026 02:40:47 -0700 (PDT)
X-Received: by 2002:a05:620a:401:b0:93f:4a02:ed99 with SMTP id af79cd13be357-940ef956f57mr143094685a.20.1792834847230;
        Sat, 24 Oct 2026 02:40:47 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm2857166f8f.13.2026.10.24.02.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:40:46 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Date: Sat, 24 Oct 2026 12:40:27 +0300
Message-Id: <20261024094027.3095475-7-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX8anm/iW0Qhyr
 OjlNhyJ3/ICGp/OYlRIC8mvQ9qBZR/rCRyW9KQ9Zda8NyhM4pkAwoTkhxv4VFDqo8q+upnUbBaY
 xu89NjMC49RsXNM9z3FDJYjsYdOJtq4=
X-Proofpoint-GUID: vYkOp24ALMqBnNEqIXit3YUinneTbAf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX+5j9jtwuwAno
 K5zxNTx1PR0so31DLGoWa8yIaba1vco+g19+rylFKT8slYP2wMYOaikXQis6UEmmcrhKLxg8z8z
 rwlDha94iOA7wrLDllSGCd+YWfXDiw1El3luMnKCg5lHs6gGvx5JU4HrV7FXDUgXmfssrb3LgLB
 PUC28246mId29rXVBKV+IKZ3CpWOMaMB/6VoFsIbDuhtODRMvbR3CYR3wUH7nSWIfSf6CtDKJrW
 CDmOV3UyV78jaYCg9N0+22kTxk4hWXY6514q1rNTGumFpwhhRvSFl457TfisckNlkyBfMnvhl44
 gGVXcRoOTi7WuOzkYt1/oVKCmbPw16BkdweNvO6Mi9ExtlZZ8ydi7aB839/DK2fH2GDsoSJRh8x
 +bX1C4jiYcvwvPYBtLj7JV2VfZaeY4CoP6nRgOCQmdPlBodr5mmsWpKjy2l8qVgDp2/USc6ahId
 eyyIOchOqjfg8Ww/eRw==
X-Proofpoint-ORIG-GUID: vYkOp24ALMqBnNEqIXit3YUinneTbAf8
X-Authority-Analysis: v=2.4 cv=D5vSufRj c=1 sm=1 tr=0 ts=6adc7d20 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=FiRPRoyJa4ALD98OXUAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240038

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
index 100612d97fa7..9bfb634ee9f7 100644
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

