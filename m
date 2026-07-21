Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E716F3FCB0A
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 01:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597820; cv=none; b=W1V8II+AH+vy4p8Tm3g2BlV7DBoiy8Nnx38rhpWFD32vpwNSmm064TKHZjbRYhbHUlC61Gy5DipCLdkxthfx/3l72jbTmV2ezYa8UUy2Cx94C8Vv/attCvpSjplRNLJeT8mh0ExzIJs/vVnYC2PBlmx5tH6yaEbdZFilOAz+pVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597820; c=relaxed/simple;
	bh=3j2x1+lQlFcMTdsCcuRwFmW78M+AsHPWoRABLZ3MqEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fsnmBczy/wfcONbcbOUpxvcdWTc7/+/QbpLBhLdIfEiTexOx8sDyZgQmLPNfjIb7FRJKw8KleCdIJ2ofoLBxc4MlPRbyAxJKglDpsNDXvAtPR0N5NVz7qCIU9YXoEf29vuTAO5O+SuQUyjKvX237eo/I+9lGZy2fxzgfLLZ62Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gy6vWPgc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdtoUqm8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gy6vWPgc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hdtoUqm8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCn5g4083202
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 01:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WwfoVhRiq7D5C1TwcTTPPHvP6c9EHLxAyJ2fgVFJcKo=; b=Gy6vWPgc0rHAzf6z
	m3apbqWzYAlFy9yibQOdoRAozv7ADYpeSiypKUNz+xetTug0SIYFzuP/SevGw9Vi
	YjoYW3e7z0prk0G4UVgbAYhapAGPAdNvqesc/4H86aD/aS4gMhATpGHH1DNouvfN
	EI0aPnXevEjkF81vq/mnyHeaz3RuOx0N16eJZRl/8pW8fhPlbOH0Q+kNMCsrpLeW
	r6azta3qjQ19Lh+hatuHmc6rqWDm9m4F7MnL90cNKM/2sf9/t7t9VaCe14vZSYxG
	G7mQ23asGiH+sfrYMHUyDU+huAp4Ku+mc6HeILe43W4DnA4JR9Ec4bSRZxahak8W
	ZREtaw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgrebxbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 01:36:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so1163268a91.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 18:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784597817; x=1785202617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwfoVhRiq7D5C1TwcTTPPHvP6c9EHLxAyJ2fgVFJcKo=;
        b=hdtoUqm8sSUT9fgjUmiCqs4iQ3zvgW4WDzVSzMIrtDMCMRQwNVJu5LOKs5vQ5pYVxQ
         0sl+zAxsaRyE694bD5i3k6Yl7xXo3fMgR/Zxz15h2ANwCegzxF28+a45j6XtuIWSld/L
         2ORuB8tsQw0nTEdiB79HYqxWB6WZ7W0fk1rHvVQLgFkzZ6jVzRvia1r1EkZPnVZlMYpk
         MD7lW8waV8aqbcLR7xgs5hFNdfUyTJS3u7wwmUeq1J918pGx2pKBk5bXL4JPE0AY5Dwt
         YRoD2gVcxKAHgnNWTGwuApL+vuZ93BiUm2clFOy7KEs09XTAm0IWQYDlxgwGVaVybL1Y
         p0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784597817; x=1785202617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WwfoVhRiq7D5C1TwcTTPPHvP6c9EHLxAyJ2fgVFJcKo=;
        b=GEAIRof2Ajjdw+Upxji7bWGdW6dUzo0k6K2Efg8OyCHX2QtDRD2vkTOlsrMk2VSkbq
         hTy6vQ1rgRXAog5AKZs8VfdMeTENEiEmQgIr1ilwPcoKhSFb4FTJDEBBcfBJtHJaAGIl
         lcqCt+IfUhw5P1jjKrAE+fDG7wzVDoXTGegAlYlW7+IANG00RD9dVTE1sApyW8PUIX5a
         ut/6T0f48y04rEYQFo8tl+2PpM/Y4DyHiKPSkkRLmRVRnIz0G6YoInCZZekHCBnEpa2x
         /c7QctzpWJ3fzyVi4HM7ZIq8A5E39sNawFYcwQfgbEdpqSu8oAIc9VcLuwYw3Vy3VrPe
         fK9g==
X-Gm-Message-State: AOJu0Yw1kapMCl0YFYr1p1YKiggR1ua3tZAM5m4kaoc1Gwm3o89diuyh
	Hf9oXscDO1uuwAdurh8aC6jATolXxhPyDXG6NZqwWDF27CgYeNYSzx5vr+c5SulZAWjg0xsAUVu
	kuMgRO81zN/bXmPwUhFLbw+QIZLV6TQft++hxfkl++xcBHEzYe8DnIz7qbxnNoGyn8w==
X-Gm-Gg: AR+sD13n3s6bJkQOMYb6R8eem4Z+7fAFc3k1C/phxQT/KUaEUsmi3QcmfLUOYiZb+aM
	G+ke8lUY+RQ1wlJVzFXY1eztJn81aHiidE7x2SEQjVIeTN4/xh6wXoM5EelRwCYVBZgDeJDm7vL
	xtCQCqIvARLWjBiVLrO9lFys8nUwW38vl2l6nFMD/TdqG1lPKwyhc9fJNxR4a/XdvcU1tnxmH5f
	0m/wC+1wzFg/0oBiAqRi5ZWaJmKzQ1CE+avWXXNcvrlMWaf95JJrqDCK6iCrLq8WL55sK2Dz1VA
	WGfoJYEjcB+YwUMZJg1UN78FcNiFlh4fTLPP3lI86fsWalv5TpA2sflZLqZoOGgSDvbtmb3vGuO
	MWqmhJ5GM475UAt59jVxRycF+IpnTOv1P1g==
X-Received: by 2002:a17:90a:c104:b0:38e:679f:3b2a with SMTP id 98e67ed59e1d1-38e679f4dc9mr7756852a91.30.1784597816700;
        Mon, 20 Jul 2026 18:36:56 -0700 (PDT)
X-Received: by 2002:a17:90a:c104:b0:38e:679f:3b2a with SMTP id 98e67ed59e1d1-38e679f4dc9mr7756836a91.30.1784597816212;
        Mon, 20 Jul 2026 18:36:56 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cd6e6esm34630487c88.13.2026.07.20.18.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 18:36:55 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:06:23 +0530
Subject: [PATCH v2 1/3] media: iris: add Long-Term Reference control
 support for ar50lt encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-shikra_ltr_support-v2-1-702842f1f3c2@oss.qualcomm.com>
References: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
In-Reply-To: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Gourav Kumar <gouravk@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784597808; l=1879;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=iommD7vlBp98Dm7QzymshdGt7WgrbpD+3lhxpAJALnc=;
 b=IVmmMUt6KQ91pj1KbU7V8YWu6Smd0b9D/kc3UyOEznaqmyKozXTYqIWh3hhX4o1s6GVy0npc9
 bvM5BOOcCTfCUoQDtOpKuzwJodhSCtCemtMK2sLaEb1BPUbANwrMvq0
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAxMyBTYWx0ZWRfXzW1Wjdyl/ayd
 7Pvzk8zLGtw3XCMo+l3x0R2NntmpY95nDherLF5KCvraogP4IyNz/OOhSx4+3ee0Sy05pvc8MXh
 Pfab1MSAwgNs5852uh2JXE76Ga3cGMo=
X-Proofpoint-GUID: afHdZ0GsRM64r9mSy4l1ho13bk72l2Oz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAxMyBTYWx0ZWRfXyUbDeUGhKvhv
 qiyqdQYhAh0+tDFBa0Z0WMYzo74f+B309ASwKDiEpYqZKY1xNfsLCtHl85GWkF+8zs/0SfYgyNk
 SR4UcJVgUqEflyFia1oJdyRl4llgBDxTeNHFIr8orrI9d4xzN4VA8JgYbTPuKsRtABRIh79qWDs
 /gI2tLj/g9RZKmxbr7TJMWQ1nLk1ADzWMGNvV+6LloJuX87Pi9KFznM1BMEIjZ5xw2cAJd5Tz1Q
 6NhCJMEDH1V4CbzPiH1uQ1tD24791+bmZ05ctL3hQTartRCtFtZiGaTHM78MO9K+4ufdJPW4YVc
 FepFyYoKDDe3QD7yWtLdJFxAEZevSEjxqLeUkH3aKOfOGRsRQhJbJlm5o3rrJPCt/hzd82y80Gi
 zwd9HYIT8Qc1PmP+iofDKaU+7T43bHVJMiRaAiFywZvgfSEBGWaWxfPPj7enn0ONspidesAm0D2
 AkaqdacxYs4zaT36S2w==
X-Proofpoint-ORIG-GUID: afHdZ0GsRM64r9mSy4l1ho13bk72l2Oz
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5ecd39 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kMRPvbZiJaxPZM8SQqgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210013

From: Gourav Kumar <gouravk@qti.qualcomm.com>

Add Long-Term Reference(LTR) frame support for ar50lt gen2 encoder by
enabling the following V4L2 controls:
V4L2_CID_MPEG_VIDEO_LTR_COUNT
V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
The ar50lt gen2 firmware supports the corresponding LTR HFI properties.

Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index f2903af24cb1..3be77feed84c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1679,6 +1679,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period_gen2,
 	},
+	{
+		.cap_id = LTR_COUNT,
+		.min = 0,
+		.max = MAX_LTR_FRAME_COUNT_GEN2,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ltr_count_gen2,
+	},
+	{
+		.cap_id = USE_LTR,
+		.min = 0,
+		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN2) - 1),
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_USE,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
+	{
+		.cap_id = MARK_LTR,
+		.min = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.max = (MAX_LTR_FRAME_COUNT_GEN2 - 1),
+		.step_or_mask = 1,
+		.value = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.hfi_id = HFI_PROP_LTR_MARK,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
 };
 
 static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {

-- 
2.34.1

