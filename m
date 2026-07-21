Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CF43E715E
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600471; cv=none; b=sBy8nMmjDLD8LE8ox3k6ep/RFCSKRzUxdKtSk4HdUnoQptZFQvOCsV8eFEhU2BxSQ9xjDNgTcvC2CEZ5VccKCF233lzRS6spy++Hsa6ZzbD7OcXvQKHr34jBwwG6r0XxCR6TLR3I3JbXme3guj5SrPgGHKrtev2/TerdOahGDo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600471; c=relaxed/simple;
	bh=ZTYKMsVOnyG8cMZ/TwPFJylCEKFsBz2QGxSy1ViKpAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E5GDx6nPoCsf4jPmp3arHPAedy+B2sQkkeAHEKjbSpKpFVNu0pAcYYeixJ4n7Qtu1D/Joadx6CyxoIjBe51XT1bfNPFS7qaTm3sgf0gwAEyYrwExUzQeUdBq4UebLh3EjQrLnowM4rCni2nfg4kG6dZAV4Ij0nvpncqgS5EzwkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TVKk0ZcA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRmPcoMD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TVKk0ZcA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRmPcoMD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KND0mK4022356
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	59w1oo2SNjzeO0tUgvu0vMcI9S3z4tjMujLA8N27Wro=; b=TVKk0ZcAeZ6xY5DP
	qNRd2ZmwIj0/ZbcPBEK3ygtIiHmucvm0B0pd+f0Ss49LRVdKl6mhXhmo44TER2oy
	/QmvHoms7/kSRWJL3DXE5z6X112Q5+khLNpj6WaL29gf0rTtI4DqZE2D7niVlZ7n
	rJE4ZVZ6VQBSHe2QBycCUzQZQVEBwMo/5uD8OHImCKtFXWvW2H+esp4XCA90gWis
	Mz2lVLRThVki+z4GkxxZhYn4/7ZJ2RQf2FebjDF81XOEwAdGULtLfHkoLmvTC0nw
	DP4w9qcC1fBjFDIBhE4ajHjt/Ptk//07ytGgv5gGBMPF22P9zWXgMEgO4zswUqMw
	J7G8cw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhk2fbcc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:21:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb7049fa552so1534332a12.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 19:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784600468; x=1785205268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59w1oo2SNjzeO0tUgvu0vMcI9S3z4tjMujLA8N27Wro=;
        b=hRmPcoMD6orYrfqvVl+ndUH+7PFrccQ2S4WxH6bUubcgyXPRFBWSrUYn9l3+TRxZQY
         P7u5yQHJjzOGbzbOrVgdnO91mxh2/Ooucp1ycYP3rQWq/uexwCltJhQBdns6yJVeqTHs
         GWrdnABHhjSTimxeN6cnjAxkfHoxJ0VFSqqjdBnjXHr4HMMzG80BGVWjLB7hfUS6a0ec
         +GDtipFh7uG+z7XOOThfHtMm1UHSAhrbxusv850BdkzpvFcP40iRJHjh5roxbDBmzlhs
         0D5hxCupXH+Fb0fteZ0iy/RxVXWjMVAw0y/olBFCIKx6ibbKhcaL3LYBaLKiqQlG8WFh
         zp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600468; x=1785205268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59w1oo2SNjzeO0tUgvu0vMcI9S3z4tjMujLA8N27Wro=;
        b=aiSqSPoDy01/fRffiI0xOiAlVbyMTz8uziKTeFNUvGYh3TDGNd8WF+GZcMRYNktbTx
         pG3dbTuTEwVHoKPo42W61Go6pRAQuRPxVB3vJAPBF97aHT2PIBA+/QVrea3BEWi0S1nD
         86zcz06khxp20MbJThyA0jyDymVlq+M9mCePZvkaeggdfIUNTj3/VKvR3E9PENrBRw8u
         aZ33fY3c0qw7vrb591Cg/RPuZWJ6ZQufCNihYa+VBitLq2HGMo6kGvnIRiDgdk+8m6/q
         lRnFST3oeJdpg68T1ql7crzLfJYa59mqkeQ6JB6BCrOLO3juY8BFxwPKpTuSIT4Z4FQ1
         YTsA==
X-Forwarded-Encrypted: i=1; AHgh+Rpz0ldP4SKUAnHUGKumMDAJDLYXTEyu54sZMpf8ZtMw1QioSLu0vYrnv2tEEGH5ALHuLW5D8GbbLiCThA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmsFXHL7x0hVC+YJtkbr77lHzkadhwOgXSo7EPpnyXH39CL0Ty
	ypqXli3fn0tzGN7xwjTiyf/+1r/xkOV/UzqKND7gBFLCBrOSkrXiH7AVY0/Z7mpcmi/cfwUO0cM
	eMwvEgyI21kJgGG2VUTcfPdTb9zhgXggSGgX6G6z/FTY2W7TlEY40FwGN78Q/09x3Zw==
X-Gm-Gg: AfdE7cmpRd0OgcdcJ/lh5bgFClF5WqgxGMKPDAWLy7pAS+owI2uOsWc9k7VxDEOy0et
	DVzmRKP/ZVjvJgFzuLFXUqvHPTY2J7i+VODN7W4Otsa1sR6HV4OgwD7OVFUkmKohOL7uWcupus4
	q3Au7qXRZUBrt13E1XDtdD2Me01Jk8W39fYFBcCEpvjpxH/SJ/iRzo+G077O4/9ZSiOXOkEMlDl
	YrEYJ0HJCa+zdzPPfBsU83J91elBwlqGdjpDbXI1S4LylMaJ7XbspAkPok9+ghBU0iLmJ+v7SvJ
	Nj2UjehBqI1mv0EwbUEwT5lL3X7H2dDk9ecgwqNqEbBuhDapfqjsQFNouppgg8I98o5bTA5UCH4
	hKEt8QasP2sXYiDrGdCtGiBytGLN5RE5jug==
X-Received: by 2002:a05:6300:2285:b0:3c3:6c90:65b3 with SMTP id adf61e73a8af0-3c3adb086f8mr17720541637.65.1784600467871;
        Mon, 20 Jul 2026 19:21:07 -0700 (PDT)
X-Received: by 2002:a05:6300:2285:b0:3c3:6c90:65b3 with SMTP id adf61e73a8af0-3c3adb086f8mr17720513637.65.1784600467433;
        Mon, 20 Jul 2026 19:21:07 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41001457eec.24.2026.07.20.19.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:21:06 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:50:38 +0530
Subject: [PATCH v4 5/7] media: qcom: iris: Remove duplicate
 HFI_PROP_OPB_ENABLE entry
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-iris-code-improvement-v4-5-4395bd8acfbb@oss.qualcomm.com>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
In-Reply-To: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784600434; l=1471;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=dQxss1bSYlylmSMgn6m7rVafNWtGTJzyf+ZiN9iZMjs=;
 b=zBm2ZqiI40uuAazT7h+YeS0ugHr1yyetXq3rFEpTKQ2DjBVobnsoq1U6GtvmG1XcjJmZidr2J
 S6+K2NL223yDDsNvymZBJxQsqO4r7C+Pp5hp0QJa0xng7kpLHNyUN4Y
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: VtJX4wcQMC1AXRvyA4MH5mmbiW-stK7W
X-Authority-Analysis: v=2.4 cv=X8xi7mTe c=1 sm=1 tr=0 ts=6a5ed794 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1vCIiHQokKioWWC5pcsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX52RnnQNJNzl/
 WiE6f73dnXBRZC9I1sqd6i1pngIw3HNGkMqyP32dqm+4aGYpXtfVz6KukXM6cuj75Z0HJTgBCH8
 wIIv11rJr7m9nrQWeILHJV9M38sogBw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX2mYVKxtO0piY
 gjMIFkOmm2W9SAS4NOGNbAbH1FR//unQIr3pHTjYmU5iOwivMLNNw30YkPvjunLP5UOJfhe3sfr
 ncZM3R8KeD6uETCSfQ11dDJKPzEZJV78K3kUwtVSZ1BLg7XaiGfM6ZrZf2ZbyOehIv65I7kiELb
 SY8RyLwNMh3WeJXKrIq8YvlZZX2o7ocjY4O5oPRboxKKzG1HTLzue/sNY501gzGM0db3Cb6rXZ1
 AC359wwEzb+amGPDHWxUs/SkR8oTtv0OHE7yJN4d46DybIU5phfFJjlDZLrpP/Dx2XefSd+bQBp
 R7OiDM9ELD04lkXV2MMCM+ne1+cnjl/5GtfLubzQ3PfezG5vVcpwP191dsJ7NLk9ro/2rHnRVya
 FHYZhad9yjtvLd+b8C0iMNoAjnlNW1WUwdoNDwo0Rr46oF/hRrBAPrwvbWN9jIAIyeYB25GqfhS
 uKuM4v9WPGOyBqSfAEA==
X-Proofpoint-GUID: VtJX4wcQMC1AXRvyA4MH5mmbiW-stK7W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210020

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

HFI_PROP_OPB_ENABLE/iris_hfi_gen2_set_opb_enable appears twice in the
dispatch table. Since the property lookup stops at the first matching
entry, the second instance is never reached.
Remove the duplicate entry to eliminate the redundant entry from the
dispatch table.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 62283bd448dc..b3496db55ad5 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -691,7 +691,6 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
 		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
 		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
-		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
 	};
 
 	if (inst->domain == DECODER) {

-- 
2.34.1

