Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D3F497B81
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260266; cv=none; b=GTMwsj77M80xOFTkVzH2mefJQxktK+67pK+OMlnBRkBoVdiWC36rex857HhhE1BYNRAPVWHKbT80waVdrZb8CRdDj3uib4eHSNKq0xFfOFhhzM0nD7NXc7h5SS94d4/3Ape+SaGMRhSe7HQBCvRNnJO4+Ln5CxnNtzJb+NYNxJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260266; c=relaxed/simple;
	bh=WvJzVZ93u/jnZMmTJFoA1CXtfvTl0ya7PkrEGzPonGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mEwDioKxPhrUPig4xrUP5BUN2aPgpUQ8dbsiR71t2z2SQCvxzglTI0AW18HkPxH4PHnmZpkEUfB/O43o5vsRXbRUMr0vLgAvRnbjsdS4sbUZ1Yz1wWrKT7hHjOW7hMheJwgyW4aLjzNTG9ztoZ70k7ptHOULh6tJ7pcplvQVLPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8ksqOCR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAmSh4mY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8ksqOCR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAmSh4mY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4v3Y803993
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 14:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ldpVhahcAZ5SyKKj/a7T0l
	AqAoDK8x+z9W+veZE/Ybg=; b=N8ksqOCRAcbu1+ZgQpRSUb3UIXuGOzoTPH4pZS
	xLCydb/IwGzn57lRC+x9mDL8nAnXEsrOgzd8MlgKcNOpzHaygJdXAJoD7NfE9DAV
	0ffvKtdVrTPpplVWz/KFzZsS78ZhpT7K/po3o7ZtnDoqbgtALiJesQhOSLwbY2il
	V+XDheNPuo3wMiJe4PBZhNHLfc75QXvVVTa3OLb3HVJ32hgevOQG0k/gZdEZQR6g
	wsd5PsAbEzTtd8MnnLUMUFqKRnQik4rB3vUKvdtiVNYVUIS8S9cDO/KH5fSEI5dp
	vkajSlHpaVc46vNUp8sZVSgpEwCH5Ut67xE6LbBSxBZkAN5w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc9222-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 14:31:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d9336581a2so29610905ad.3
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 07:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790260263; x=1790865063; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ldpVhahcAZ5SyKKj/a7T0lAqAoDK8x+z9W+veZE/Ybg=;
        b=ZAmSh4mYcyH6ScK/R654UYczdZYPkOjc3rOgsCZrDLPppSp357E4OZGcMMr0Y2RopU
         uDI1/4eh/90/gSOI2LodfQ1IspyYrdfo4bqWX05p9aZan5O6zhKHPigB21/v5tNh+PRu
         SL+j1v4Ai5cS9XtGQkFASYw8rstl3gTCzG45lzwBIH4+bfQUI37BBZ8SEXx3/DP8EK2n
         pWNL68LU1BBEdsP26A9O+FX+kT9ou8fuxNa9dC9EDNzgv2AoTJ4ChvELTVwPrfYF4s9Z
         HilhM/EMHEqieaYf/QRvNtGYSUasHkht74P+pYxaWe89Ex87bsrfhmdl4GuDFYtwlybF
         v7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790260263; x=1790865063;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ldpVhahcAZ5SyKKj/a7T0lAqAoDK8x+z9W+veZE/Ybg=;
        b=zK3DOMZhk3LlO+dbPgtn/anSbxVB4P+P1PXSRX/mXkAz11v6UyuZe+Ssx2fzz5KH/g
         /t7VwNOgrkanU4ehKuvDS96UWTjPn7dCGg2Ure97zic90b3FaQpHK6lic87K1fdumt8H
         H89kpS56dEDsYSQOR1b0fm/hA6NygIK/oJLdLVP3Ox98m0U/mrvj05yfcjMcvFw04DTT
         YT72Z5HktZNkT+xhSoevh1QJJJ/z5K8LjvMjkB8hEA7+qJtF8fwfyJCrWvQqesjQn+TI
         nfaefJ0BQxED01FAGGQqm3iHjTvDZotJPMcYQiDkIDJR5UFr4ejQc0LUmeiqKZtxd+NF
         nKcQ==
X-Gm-Message-State: AFuF++lBdRmgLa0tnL8NtiN9DKqPeZDOyYUIV2hJ+MGzOxLd56EzfwzZ
	q3cSIKiHP7una1Deh+bMy9PPWKIBz9ViAuX1ewAluz+z0jYytCI/PFVMZRTbq7Zw3NaWgysWy4d
	MnVXjLQA1XJ8JrahZKM7vF+avE9FIcb7KCpy9mgo0S4VImSnKkXX/JTRdQpPgsj6Kcg==
X-Gm-Gg: AYBFou1bxxF2nHxsS/DonoVOzQsFqSfox8eCz8uzJlDT4LmZarGR5D6G7AiKWpUC3z6
	7XK8WGBzKOerA9gimBQA2RqEu+qaJWhpd8aMSqYUiLUgvpUbKMWVvMRwPao16/xveHOCdg1AWWr
	nryU8nFEd4l8M4eRHTaJ9A5r2KLt6NRTGQBFk/vnxDCTApi+6FA0Sc68l18oWXSpBk3XGwqoF8S
	myZvtHb86WPDYWf0TDxJSB/X15p9kptmPoWi6hJ+PxeO9+SR6AtSpHO/NjyYurHtXrWZIOpkniG
	ujqpRGaeDXBARf6SFcn9dQlIs6eQp62p7cjNd3ShRBQG2rIrAPlCZko94ZSLXt03qWzvvpmIyit
	i2or+qwiUrJWScc3DzXgfaXNRqyA1KVrfIqcL7VhnKfDJ
X-Received: by 2002:a17:903:2ac7:b0:2dd:ad74:ac7d with SMTP id d9443c01a7336-2df7e27c485mr25943765ad.24.1790260261361;
        Thu, 24 Sep 2026 07:31:01 -0700 (PDT)
X-Received: by 2002:a17:903:2ac7:b0:2dd:ad74:ac7d with SMTP id d9443c01a7336-2df7e27c485mr25943235ad.24.1790260260770;
        Thu, 24 Sep 2026 07:31:00 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3160sm28994415ad.40.2026.09.24.07.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:31:00 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 20:00:54 +0530
Subject: [PATCH] media: iris: reset AHB bridge before enabling HW mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-vpu_hwmode_fix-v1-1-531498f3499a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB00tWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMT3bKC0viM8tz8lNT4tMwK3VSTlETD5GQTE/MUAyWgpoKiVKAw2MD
 o2NpaAM/taCVgAAAA
X-Change-ID: 20260924-vpu_hwmode_fix-e4da1cc447d0
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Birk Skyum <birk.skyum@pm.me>,
        stable@vger.kernel.org, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790260256; l=2029;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=WvJzVZ93u/jnZMmTJFoA1CXtfvTl0ya7PkrEGzPonGA=;
 b=Fsx6oom71cJ122h37d6jT2FTuZCNGrBl4UQN7681bQwbDGKwbchyDpt7q2uEacGxdn2OuJ4mg
 v4qtkGa+tvNBQo1BAKCz5xaxwu39eRbgpreg9nP6oUcHU8AGu//lyfN
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: OF4FIoC5MqhGWie741RPCKzRhCOpDhd1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1OSBTYWx0ZWRfX+ou3X6yLq1ah
 BKiMO/m8h/nrb5CRTpnjAhm5s2YbnqKCyS6eLPNsc79zNKprJ/DkNzAF3wXahFakOwUJa7kHWpy
 0QuREH1ElrPEI+DK/ELqltYC31YwnYcpV55ODFY/DqIDQKOLTcA06R5SKZI1Rl0Et7mXBkPCYos
 fpC8N8eB7TmEdeVV2XfPzKT7r7YCzDWmoE0TdV7V+sFDbLegkSb7vhrgXG63RJYnNNuV3KfKjqj
 Ia4fh7QcxNBKMifMhXLZ7RxMYrUBk9/c1SHzm8OUJ9wVgAFLFNShU4khk7ik9oRsZ/NctcYj3Fv
 edxXEWgYroUKOyimdnDBTPC1Nlr4xbxgPyXrHgsFkm3BIeSGomok1ozDy6OT7Yu5OeBXcfHzYKV
 lxDSbPYUl5N6rXUgb2seGzWF4NQNXIsL4q/uIEfzRcPf6Y8AXA61TsspkYcbGoscAadY9VhmjDm
 5BDXkaimdN8u1F766Dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1OSBTYWx0ZWRfX9bNwI016Z8lG
 50qWsbjZX4EXz7NHDMPkHkxh8I+T2N0yEU3IHi6CYQynygb8JQ3YWo45fKkpYrC5CVP33PdhhJe
 i9gYzTlfvwaaogi7/pD/soJ2pIuLmFo=
X-Proofpoint-ORIG-GUID: OF4FIoC5MqhGWie741RPCKzRhCOpDhd1
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab53427 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XKV6TwXv6a9nc5w5uhUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240059

When video power domain is switched from software-controlled mode to
hardware-controlled mode, the core may be powered down without the AHB
bridge going through the required reset sequence. This may leave the
bridge FIFO in a stale state.
Reset the CPU-to-VPU AHB bridge before switching the power domain to
hardware-controlled mode. This ensures that the bridge FIFO are in
reset state before going for mode switch.

Reported-by: Birk Skyum <birk.skyum@pm.me>
Link: https://lore.kernel.org/all/20260913194707.91885-1-birk.skyum@pm.me
Fixes: 95a337f92f0a ("media: iris: switch to hardware mode after firmware boot")
Cc: stable@vger.kernel.org
Co-developed-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
This is tested on X1E80100, and is applicable to all VPUs.
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e4847c1077097160cfc8324e807b4aabd9747812..2ef8004e976e34ac3e5ad1971894253fee77648d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -311,6 +311,11 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 
 int iris_vpu_set_hwmode(struct iris_core *core)
 {
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
+	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
 	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
 }
 

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260924-vpu_hwmode_fix-e4da1cc447d0

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>

