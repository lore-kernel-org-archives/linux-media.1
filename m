Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793243537;
	b=sVYMYQhPQFfhBUlF95347yj1/SZRmOhgC+iXm2IJZOCgG/PJ8ubO3JxEBvni8vJLA5de
	 LsF/glCJ2OuNOC51z2aor69yOtjr4Jb0YgE3Th0qIQ3udUmm04B7abyqnq+bOIXzRio3e
	 zwx/xgNqHmr6TS0RpF+mQTPSmaOk4K5vBgWJda/PNcgRff7cOz/MJJabmyZrH7dpAUzqX
	 d31W39lVk2V4thbVzzDGruCq4TU4vXw3tvzAMGI2puNVa8Lqji7DcjIyfY+ptCO8WEX/w
	 FXixpQO81ja0E2f+aRpYzAditizty2eL0r3mqRSAuc2pGRRG1Sh6HYySATeEvqOZnxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sWFtIw7fBe+RZbcQ8738GTs4fQ/rDgZ8HgatAU488Zk=;
	b=NJtCL+96L4UgKNLQptaXtLOUAZVFJZYi3hfhK21q/yzQpkXfw69C8HuqelTLGM/YC5n8
	 5SZuqPVdob/gXiny34iwDcYXxAD9eCWwtI7fyDXBncA+T2MFbHvdA6JsslsOHwuYGw8pf
	 BOEn12kIgBRiEnuxpWIc6IQuDkrirn4UW+dLn8QMg+JfvKd4GB8YihVtCUy1wlN2pTKyC
	 +86NnDCIaii5v8S8YUPTBbAbDV5hYv3hrb+XnZUuvGYSfA5xUvx7wp+p4T5cd4YdJnEhy
	 DRlwGnThJRDkNe2az/bkkEqgmvUn+Vn3B+d11FLJi32y3AMNrq9HTyJ2tvxu9on2CKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cdGaSOVy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZD6KLixm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70396606A31C
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 03:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70396606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cdGaSOVy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZD6KLixm
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jTjY2337777
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 03:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sWFtIw7fBe+RZbcQ8738GT
	s4fQ/rDgZ8HgatAU488Zk=; b=cdGaSOVy6dXszkHtSR+9sOCOqFzz5UcJU4jgJq
	rQrs04VP76FahjdJ5r65DHif0IWcU7rcqwcFHZK/4Yvht1INl1/06PPEgKDpXn2R
	fbGh1OjbQEGHcX/jrV7W9Pcl+z39tK4buBKDQHtso85TIMoxBG7wSHdjkNuDwhZZ
	cXPHcWsBttD/MZntdIZ1IhmpKVhNYfThtKtkrM6sPXR/kjcGjwUVILL/j4pTSF/f
	HxOL2CW8Li505LPaNYR6hGd7peNnYdUP9R3pMICw3LeFjCGa6wOYCSaxIbPkrASZ
	ZGOpX8MIENmt8gAseoTg3CPQkDhb5CBsMod6xnJyIYI2iRJg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3n91c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 03:12:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36998507c13so2478853eec.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 20:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793243535; x=1793848335; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sWFtIw7fBe+RZbcQ8738GTs4fQ/rDgZ8HgatAU488Zk=;
        b=ZD6KLixmKrwhjYQ8RcKxoFmhsqMQY7pypv3IpaoKNQ1dY3e9yJTT5xVBLQBRh3GKXZ
         jhLK2uK9skSvma4Aoo7jStsvTGBg/b0kpJLS9w0OTtYhs8YsE4XpEODJI3GmmIfhlrzd
         PnZ6o3YvDj+Oz/LeAswEaYx4cfsvs4GPAVmgX671J9hH1pmEJafZ6QtbsifSZqAWcgvX
         cn83GV7NOryhiovA0GGRYNSBAUGPJvXw7lWOYCiM2KP02SSVw3vCexniUxJ0fP+0IzLR
         /G3yrU2O84MF3QTDnrhOyTxtJsfOyVigAsqGoZNsTtoPV/o/vm/+wavnlsEGAuxBX2X1
         nOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793243535; x=1793848335;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sWFtIw7fBe+RZbcQ8738GTs4fQ/rDgZ8HgatAU488Zk=;
        b=N/3qwdT2CeOw3hGha2V1dqbwvWnt5UiZZGisPIvVJ8ITLT2gM+GCGFVSXv8xoHgjUJ
         rc11O8I0iX+STZyGR67RsAysJoXbio7VecQqNMQFc+fsvE1qkJKURn4OHt6xEdIyicPM
         0VTzE/XougRt9T5MweXhu/Y85UMVhMNHyoNywfmow8D/H6UfwanNbif9uuIe6aNnkP4g
         Oy+t9eG+Svp7Ci5YAH0sHvFKY4SKtIEjX4UvOw7JugJuWR3Cl0oSG1thX/FW+jFp5dxx
         9pyc+/wTMcK2RItJDVhSHl33FX8o40QL4ofx7ysB6R4109yKTAA2oGPaDqL2rdkfyfwW
         TU+w==
X-Gm-Message-State: AFq9FYKVlAZ+vjpI3Q0oO5y5dTdHpEf4GxYHgDIhi8awKeh9Z97VL9UI
	dfYtDZ8mHXU0HKBK/cZLRaodE1OS/+EMYN8wTBe4hWOBIda/SrJlGhzRIqEQINhcE2CymPheaL5
	AkuOJvdd8f9bM9fB4W0c9e3ouVQ3+IJVhr/HTLQnounzpJHC4wU/1XApCYORP/gQ8fg==
X-Gm-Gg: AYBFou0/nmiPCdNz3eKCa6Zssy7RLMWssaSHdoCZuwDvLJIHvYiUnRG8XcAhH4A+3Yt
	9IwIx3VCa2/Tk8ZOv/3hXhfcWbU1JElN0+PI97i5J/TvcsIlmOy42bClOwbiFElcRpdM8H9JfzX
	zEVcfK1RSEFqmjXcPrWuQSyUB3fHl+jb3Mhayr1PN8cXsFNAGHXXkmUNimI7UyMaft630SEgw0V
	iLqAAJoshwqWls8ps2QBHe8A6aCRefmAUbjy+oJPpUUDMUUGizPx8R1J0dX6dcRV6WQgkcfSEdw
	4mcv9KdVqwAe6vzV3fuDwUB6R2i2aC2tqS/B8MCHMZ1J6f+8djue5QS/85o1PWWdPPnu+7QZdmo
	13OtbLd065cKHfriHXVYh+vnjMF1n3UGcbfD/K/2wBH6qqmvclMxkz+3Crdfip9uW8GDfA9Z60s
	R2bNdGB0iWXpMZTWiMNJTdb6QwrfM5HSU5ObKF2Yo6GOhUzJ3f
X-Received: by 2002:a05:7301:1708:b0:369:987f:d15e with SMTP id 5a478bee46e88-36a202871c0mr5670437eec.2.1793243534880;
        Wed, 28 Oct 2026 20:12:14 -0700 (PDT)
X-Received: by 2002:a05:7301:1708:b0:369:987f:d15e with SMTP id 5a478bee46e88-36a202871c0mr5670395eec.2.1793243534156;
        Wed, 28 Oct 2026 20:12:14 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237bc445sm11151663eec.1.2026.10.28.20.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:12:13 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:12:00 +0800
Subject: [PATCH] media: iris: fix ltr count rc_type validity check in gen2
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
Message-Id: <20261029-gen2_ltr_fix-v1-1-6d5518d59b9c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH+54moC/yWMQQqDMBAAvyJ7biAmYXX9ShHZxK0NVG0TWwri3
 xvqcQZmdsiSomToqh2SfGKO61KgvlQQ7rxMouJYGIw2WGtDapLFDI8tDbf4VZrJ123wQi5ASZ5
 Jiv7vrv3JSV7vct1OCZ6zqLDOc9y6CkdN1rLQ6BAbxyiMlttGSIi9E0SDjQ4E/XH8AG9ruuGqA
 AAA
X-Change-ID: 20261029-gen2_ltr_fix-0a9b18cbe94c
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793243530; l=1372;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=og9/D7Lg6daQXDnJX52+VnaCLJ7uMVtaNZMFwQjQ3Ms=;
 b=RLUyu67R8d4oSa4LR8iwPBWBXDLdJVhpCfkcnWGCWnAiJcJoXS36bAhBnU3cdM6llZSM67TfO
 VT0FZu0rj30DsTWREGhkXqXihVNaZISOOqoEKgN4o69PqeO6ja8wgKp
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: 9yNStrx1DGpMs_G3Au2ewh6cUfJVqS6g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMSBTYWx0ZWRfXxZDKN4E/6hhL
 ucwaYmRRdnN6JWj0JXJKtH3PTP8338iWbV+hh9p+ButixwZIs3XzaWjnpnbEMEYt97VOtjujaVx
 E0dY16esjmWXqU06XU2zj1yAmdP8pn8uyutVR50AO4bl/uZ0l0VCO5J8+F+HLsXKyKTc2LDZA6J
 FvlNznFcxTLDDBPzPYRqPCqO/ke3/tWbWnu+XbHbs2J6pIdO7NKzhQnXAGD8r6pXjMSGJQVmc39
 w4A+pplAOTPATqFa2wbQR+sUD/dhrUVVQM/xBMt9R8/dz5oIRj+yHVhPmAt6t0m59Et4rW/VBtB
 zmm7PLWnuNzub/xcxKGuVIS6+j6baOYCrg4pzH5ST0cnioGXWSem1LlEz55wP5zGZUbefvnDu3i
 gyb525jIvBpmZqoF7y5xT/6nSbqQ/qt9gLRInJVI+TBIVwbwoK5rf9RYc7eNCoHRTrhK4T4gs0L
 ltzrMMcijwVI4z7un9A==
X-Proofpoint-GUID: 9yNStrx1DGpMs_G3Au2ewh6cUfJVqS6g
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae2b98f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ddizOsny5C6_3mqkn2UA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMSBTYWx0ZWRfXxB8M3819nVCQ
 jJoGMOpPqUH9tlBfpiVsKwBRQoXoVMSF/ogZQXsRXGXpNc5wVSk6q3w+4BMBOoYF/jnLyGgIoqf
 dNopgAeeE+xq1vl1y9MgjlQx6dHK1L8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290011

The condition was inverted: CBR_VFR, CBR_CFR and RC_OFF are the valid
rc_types for LTR, so reject anything that does NOT match these types.

Fixes: 6870381285b8 ("media: qcom: iris: Add Long-Term Reference support for encoder")
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 4f2633bbb49f81f080ffbe91569d38e954ad15a1..2fd5cec16faebeabe69b836679db8cdbf89b4fac 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1279,9 +1279,9 @@ int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
 	if (!ltr_count)
 		return -EINVAL;
 
-	if (inst->hfi_rc_type == HFI_RC_CBR_VFR ||
-	    inst->hfi_rc_type == HFI_RC_CBR_CFR ||
-	    inst->hfi_rc_type == HFI_RC_OFF) {
+	if (inst->hfi_rc_type != HFI_RC_CBR_VFR &&
+	    inst->hfi_rc_type != HFI_RC_CBR_CFR &&
+	    inst->hfi_rc_type != HFI_RC_OFF) {
 		inst->fw_caps[LTR_COUNT].value = 0;
 		return -EINVAL;
 	}

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261029-gen2_ltr_fix-0a9b18cbe94c

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

