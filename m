Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46374399E0
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802099; cv=none; b=gkFKrpqvJm2SshXQa2l8NgSEjlO6kJRLX6VbROA9JlyjEqsKgYw4QNc5XV0oEcZXP3xm4lfs1IXFjoPCRQx7A+tB+Q0incU+Y3dcp5lx4kjr/zsBa6Y3km+9k8mLfmfbQbU89LLhSJjS7ngydXCkZzqQWGnEWCz0KSeU9lsoJWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802099; c=relaxed/simple;
	bh=KggxMVR5Im9EKl249BhNUqFflJp2iq9ZhQsGM85dyl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xmbm5bo8BJ2XYdD48azjGg24KNerkP7A6YfE6vC5r7TAZV+VXc82Pe1orQ3rsskaAxSQ6ar40L3SHxlML0CQUAVbY9rNFn8M7kp2meHOyAi8mKHxJYS/WdzXMx/ssBsUrTD4RNPDsJropBz0dpH+tksD7IGHB8VDGna//wIFWwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWH0Jo0i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aaSo2Uws; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWH0Jo0i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aaSo2Uws"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qlDY467980
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JW75+axBmdgxfFRDWcmPMpgML/dxXnxTmjaxQD+KhFE=; b=hWH0Jo0iyICdyzDx
	shHjxOCQJPjVuNEvwADfnSmGflMdR2SJyBDe1KMaFepsWfvmpsiJGgYEnRe6osD2
	pO2thjZa9LPMnUFoj5cj24+RixbE4txEV/+P9C1ePcGUV27e19rdl9yHRE/5/YJd
	EdmhGyGOpDYcT46GlBL1X/PoCKOvRGpN5elYfwiGbmx8squKa9qN8bfZhgUpuPDo
	6BrDnD4BIjGzSCKDWxFBkOCtSTLc6aXMaylUK1prD6E5DHSrG5GuToTTsJ2GCYVF
	KfXVkjZLUF+BSHDURh9OX/MSYHCAoa85s+0S68viQSXaIaXx7Fwr5ZEVBXA21Siv
	Q7hehg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xuj5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:21:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484f26852dso530839b3a.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 03:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802096; x=1785406896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JW75+axBmdgxfFRDWcmPMpgML/dxXnxTmjaxQD+KhFE=;
        b=aaSo2UwsEWlIkToNXotR+9pIvSMumAd8ox8DkFd1Ho6PYMw19CeX5tIqoy12TRzZej
         JsQVUgrkVeCAuNrikxjSf3MTsJt/WV8qv5KS8D/snT3jdkzT+z+D2Wa6fl6CStfR71T7
         EYlo/wX0iwELJITQbvhCSCSm3pPiC0WIs6OT3iGMhdAtolgzTtS0/d2BUwgea98PKSuh
         kvYQX5N0Dk7VGhUUVXlKUP/zOWkb75QxaXokc47rrBrlIg7fqrUqxfvq+aNM4N0tep9T
         hFH5oZLL8ed9f2PEsXmaJbqsgYVexhhMLlrAicD/uzVuN0z9Ugl9LYWC6PeJKE04RTkU
         xkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802096; x=1785406896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JW75+axBmdgxfFRDWcmPMpgML/dxXnxTmjaxQD+KhFE=;
        b=Y4UBlYZp7wiKKvwgK8nO656m/MCLphwd6P9ogSuh0wnBX7KpV0DyoRWLmW+bP7WLNV
         z+9fE8lRnvD9rbqgPDqIx1LYf6Bm4/WsIt4HVtsgktDO+iBBiYrGf7lPmh09W6uAU4tz
         Ph4+eiBT7sbdXH3kAhzvWI/JLXb5+i2hRlkoA9ztlL5Sk/9dr+xtMJB2bAXHKa054oVj
         v7pLrnBUSQlX5kedX/V3VCbnDQf1I5Eq1C8tWIzJRvp3HvTVI34GQfzV58pqTWlUD49n
         7uGIOCTxoyisrUwwBRUpOvoFU5EWCDlAcJwrUAKmziBQbrTKPUuSSCYcOhKEb03EH0kf
         ovzA==
X-Gm-Message-State: AOJu0YwTWsJAjKXmlvZ5hkxUgvXmSh7kToJ13Gq5WFhGwrpMDVA4+Ez7
	mNTwbOKrRdumeSAeopFAj0inpNGlX0IwBYYFxN6ZPI11cyTw7/gMMwzyyr2+HonM1DlsKaxUyss
	4+3rUT22tx7U+0z63eCqL85DJOQB6kjZT5DfVkI60L7UH9kDdk0PJm5x4uUMkW33NcA==
X-Gm-Gg: AR+sD11aGRM/DhucQ2UvMHluOaPRcHmdsWlBgcvHuNangYnWcGGkpuNfim01s5LsOpI
	adWARHLtA5zOksL/sCsUzc1bJEGY8myuVii6Txl9QkRBQoMJKInPn9auPzq7vYJwVrShRcKv9qU
	bpn6nWl+4syRcz2i7cSYqEtP+FecAP8RfjKBvnBvG1FTFDtmLw+Fb1PbqV6ZDkuzXbwDZixFHU2
	GsJT09g4pQzHK+bP44fCPUep/JOtZW6RmXTGbsP8wt8NtP9fnrmovoSfCnvfBZ/B1J8sXbLiIIA
	TF/XPvXQfx3FOUXRgRgMMwmaM9jmOrqZK/CDjK3/uq0IpxYdXzrKRxKjS4sQFQcGtDWZUy7H7mU
	Ut5EdE4QCDMlGLIuWmQ/sP3UbMQSZ81U=
X-Received: by 2002:a05:6a00:4b04:b0:847:7fd5:aaaa with SMTP id d2e1a72fcca58-84e2b899250mr2789001b3a.17.1784802095881;
        Thu, 23 Jul 2026 03:21:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b04:b0:847:7fd5:aaaa with SMTP id d2e1a72fcca58-84e2b899250mr2788976b3a.17.1784802095424;
        Thu, 23 Jul 2026 03:21:35 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17285662sm2781395b3a.20.2026.07.23.03.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:21:34 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:51:14 +0530
Subject: [PATCH v4 2/3] media: iris: force stage 1 work mode for CBR RC on
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-iris_multi_slice-v4-2-45f0a3fe7fce@oss.qualcomm.com>
References: <20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com>
In-Reply-To: <20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784802081; l=1336;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=KggxMVR5Im9EKl249BhNUqFflJp2iq9ZhQsGM85dyl4=;
 b=auzWmmIJBU8OfdL16mWMHOMWwt3Ighy2+vaiEMg5dXMhta5uxfDVoDn/Of1P1dFQStWGo6b7x
 weZ4S9VA9u5A90CfwXhVZCrFXNlabkQPhxGdLheWFwR+3z+ZmM+0YfF
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-ORIG-GUID: ebkeid2hybRJiUsi_QZ2MFSWX1wnQq7o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMiBTYWx0ZWRfX3+fbd30Nx9yo
 FC3kbKJkLCwtq6TxTOJPuJhhKms+v0DGHvtBRMVk05syWAwYIqke33ARomPKY3HPMqUg+YLrtkv
 lhZo9evGk3QsSYpbMO3dFb1t6Ko0TR4=
X-Proofpoint-GUID: ebkeid2hybRJiUsi_QZ2MFSWX1wnQq7o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMiBTYWx0ZWRfX//fOX8vX87FM
 5/expKKuSHLPKxEy010QJmAfpvv4V17ylSW/DOPZ92KxHydsaAbBPHIumCqYUfxl/raWE+zPv6Y
 uVgTr2ct2Mf9f5LCAhJVs/4jB2NruBL/Gw2liI3nIDqSEtKzYRvK9yGfaN5g4QqmAGMHgfmAMAc
 A4yT2yR8X4MMv0aPRG1Pt+m549e1YLRlNJTVSFHSinbx4kz+ne+JTcYBYgQczvCdsdQ3ARYDJUW
 4pmirsqdnVAbtYAz2rXlBnAakbTI+f9VkM+rXIYfh8bkFFlPoFRyWGMNM7t71Ign8PPNxboe4BX
 YwWjlm1g9mVvD3fDo9JFPtM//NVJELEC0CbOS4JbZ8YF/7ZBpTL/QqZGQwiThrnOBqJxuJXkvnb
 40h1jvmrde/uRFMILCUhd0OV0YS/B4ujNDl5OzEF8pbLfDB3gVczSsO/E+fBNj6ymoHmRiLfYeM
 /d9iaEHbhGGso9dC2Zw==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61eb30 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LMK2Ni0dcLaqO0rVonUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230102

iris_set_stage() currently always picks STAGE_2 for encoder sessions.
CBR rate control requires stage 1 operation, so force STAGE_1 when
BITRATE_MODE is set to CBR.

The BITRATE_MODE fw_cap value is used instead of inst->hfi_rc_type
since STAGE precedes BITRATE_MODE in enum platform_inst_fw_cap_type,
so iris_set_properties() would still see the previous hfi_rc_type
when iris_set_stage() runs during initial config

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 58d195d2ab87..d7cbf6c3614a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -519,6 +519,9 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 	if (inst->domain == DECODER) {
 		if (iris_res_is_less_than(width, height, 1280, 720))
 			work_mode = STAGE_1;
+	} else if (inst->domain == ENCODER) {
+		if (inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+			work_mode = STAGE_1;
 	}
 
 	inst->fw_caps[cap_id].value = work_mode;

-- 
2.34.1

