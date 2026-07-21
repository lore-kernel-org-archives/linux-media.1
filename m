Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ACB3D413C
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600459; cv=none; b=qAMp7lLjl4Mvg3YrGNkzS+sWpw5kPOiV4LiAoMa8l2KKlntKEkewU2Glk65/uL9LT0DauX7X+Gb8BfsVvXsf315xteHIPtfvmdWsBGHXxwhqjbI0Y6GnJBr0xs/C/VrZjcXjX54qyqE9fXJ2bJRkvMZ+WPR2gxIu55o0mOYlmFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600459; c=relaxed/simple;
	bh=XrExrogGyNY8zefzhUS+pWbzmqCVYgThgf2zASOamL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QgPgOGFosI0qphht62JIHQHlJ84xUdFiS0hOq+unky6/hXMscYcck7pHQx2rMyNSo/hVVrTUAr8IMLI2jcx3XtKQ9FxWQxvXSSkdRqdxBoZHEne5QBwMA30ib3ebbgh9HRJef3WSZyZ9A5r9LXp6sc3zTL0irpzXojhpMbwgdrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyVCAaFW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UiygL9kz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iyVCAaFW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UiygL9kz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCkx8933449
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EdKAn8ifT4fLcJXnkTbDem6y66hxcJsOU6t0kTzLNac=; b=iyVCAaFWYdZ7TVPm
	HVk1jhPHRX4qIaysp57+ZPjKVBTt86SgHWrC/tr5knUQa3C0IFvuvQUmA72fphi+
	Uri9/cdGzel1p8C5Po+qUkHva+WS7TNtkhjmvthdmPeknZIr3MenjXHQ2wJntolu
	Pexwr4lUipnIQyBJUMdgpmD8pXkCsujVY2n3/LyCxOAQLK3OJEc4TnY3OVA3C7L+
	Yb71MvLRltbZSIGEuGc5wz6DOR0ACbCd+Itfjsmn30eCHdPFTGE9XE2fUT95KiNW
	kw7/s/70RRGqLPJoZTgzX7U0K20VwoS4W95BhI+9voalAOCjHPcbEXhBX8B4Q+6K
	aqnf6Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5st2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:20:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso6829877a12.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 19:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784600457; x=1785205257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdKAn8ifT4fLcJXnkTbDem6y66hxcJsOU6t0kTzLNac=;
        b=UiygL9kzgXHExAjIY2fEOOwZ7dPGKPjVc7+r/GECEZpPq11bgOQ7RkyZa5Czrmy5Fi
         4Z/4OS5U7QEj/ZcNgpLHi7hqkLSVwODx+2OR/lNbgxU32pGlgHMLU7cumj4aVWy2OqqM
         zQYPG+wZbiU+w/JUV2acoEX4SxAQvzqsUfheLkbazFl1fn01XrD6ZOe/Rqj10B1/WaN9
         1FjumCJSiQ9O76r5huLSChey4mSvPRR2u1zA14PENMYAsFItn4VPtydQwkCeuHhC6Xlq
         MrSZvX7oRVCkNRQ6E2aRHbrRM5bg/8nXmFO3MCwgjUNaCF89Vb2uTse4kF+qsYDxTxTz
         Io8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600457; x=1785205257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdKAn8ifT4fLcJXnkTbDem6y66hxcJsOU6t0kTzLNac=;
        b=XIiJ3eCVIMRPqfYOFkk8sgpnexSk6Kivs/j0Hcjn1ciDbr0ktx32VF3So0f0jM5x8r
         BqplnkVM7DxKgLvx/XPZJyGf2b7vXfvOafYRBD8RuXdvU02zJiGLiR0mxzTgxQQGW6Vw
         SbLzBlNIx0brs2DHBeP3lyh77/IrbYz0EWRGkNCg5AUA0kLoumsh/uoqChT3FjEzn3d5
         nWhJA6QXcwZWH309+BojPNpfgwR3Z082Eef2iE04vyQiatRCcjkFN55l43OBStguHE9H
         mr3+RviguJs8lObGi/7RpW1HgRlYYYfrBTHR1KL4ylYuBboaR5gDFmZOM5FIXtYIMaAK
         AL+Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro26t67ePDS3D7Zht5ePue2ZpC3UkuJk4SB/bCQ3wI9jvNdoWGzffSSUELh0H/QeMp+z16IIlPEEHcCPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOS3C2ZAcD18oejQq/SH3JNKCCW5TWn8p460IxypltIM9W/RF0
	bRxW9T+HBsf+phlx83e4z5XzgM7qW2gyXaKWQtXko+kC2Ev+IERkip4eV94HjHdQ5RZ4V1Pp2d9
	pf3OPNG5MKr6PO1qCV3/2utRRkyjwtFQjCHmG7DZWrZntJBg9ZiWibN6RzmtpHPGGcA==
X-Gm-Gg: AfdE7cncded6S7bnpNXNLPbX6XqQqVZt15ZTDMMljyxgRXF2tk5JTSkHTsAcKFL6ITh
	RtIi1P/MZ5XbZEj02CPKM95y586Vk7Hopi5BlApyzPddBiMkV8k8N/+w8Pn1d18eBX6YYWwlEqR
	7k8A7i7WBl/ZE6q4qZGNHZ98Yh+NGava61Gbmiea4a0LQd+sPLLwZIEb67qVbf/zr7yBmngi5tx
	FIy3bwaG9AdRg5/4+kWQbsY9YDGTA6zv1B40wr20X77kVFyiJDRtspMu9eJY0mCJ493TT5OHPB5
	CvTe1772jLrt7ueGDswNTZy5q51+A29zfZmvcmUgMNDTs8w+qvE2dl1hUla4Cp+zbmwxDn7KxL6
	/T4T6nXwn7H8h10kgmukPs+rfl1t2iZHrSA==
X-Received: by 2002:a05:6a21:511:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c3ad9dfdf7mr18354265637.53.1784600456832;
        Mon, 20 Jul 2026 19:20:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:511:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c3ad9dfdf7mr18354222637.53.1784600456428;
        Mon, 20 Jul 2026 19:20:56 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41001457eec.24.2026.07.20.19.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:20:55 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:50:36 +0530
Subject: [PATCH v4 3/7] media: qcom: iris: Fix bitmask test in
 iris_allow_cmd()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-iris-code-improvement-v4-3-4395bd8acfbb@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784600434; l=1251;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=iUPNcmr9LcDxjiMweUrnUvGUJcwSJce63MellJNuucw=;
 b=TRScXKpClXiG8jp38leP5YesLIDnBJ2yezJTPZCidndYva2SQvbwWcaFo/W9j9ejxhCybxjYq
 D/SXwxbbsHdCrbrvl88VnUTMHQVqMA9hUIPth3+E589wDPG4Ef1uBLB
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 04kb5-A5qDNeqRaDwp4XxYBcvnFB_v3V
X-Proofpoint-ORIG-GUID: 04kb5-A5qDNeqRaDwp4XxYBcvnFB_v3V
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5ed789 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=qiYeaxkneK40FgSAABkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX85652aHS0beP
 dfW/icu+jd5pkga9063ZhQFmtA/koJHluG7Gat9OM7lnU4T5w5x3oS2xvGVe4RRIJbfaW3ptb9s
 KHul5CY4e/fk366LlaDjvyj24JsjWuA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX6NM5KULJPi/g
 7lwRaDR2B2KJH2Xt9IRey4/zA+rMDEoIQyRjOXa36ECLDkkld7BaVWw7TifCIsyU0upG5rUvDw4
 qMcnqEmXM1Up8Rh1d4WivQKB9ImiEBwQZaBGxDPkAVDBQCSWcjQvfhNY+Qw4ZthCjRbAHqjyRY9
 p6TllPezXqZMPyXDpMpvmCjnymHWg0wPTpQobJ4tN54/lZSRuB3cPUgO7mHYXklQSItx0yBoOIz
 Z7eLPlT17JfwLYUlcKx8mQfo1tNZe249dhtyD9Z2t3qlgcLZpCUwiGeP4CeIh1ajotnMaxbrzXN
 RQmxQE3UhPdazwxVZQ9jN8mzI1Tt/WpKoFUg+0NvT4iqWg6+iYpBQuh8ncz4qhcVOgbo2QC8t3h
 RaF19OD2nfOG7j7bsrFbdzkE1grvUPu9FoL6FG+CG0zllN8OpWFK2/7If0cLihSR4yRMThcVaZK
 uMmbkHEj+wONjOaJdVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210020

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

iris_allow_cmd() incorrectly checks a sub‑state flag using a logical
equality comparison. Since sub_state is a bitmask, this allows STOP to
pass when IRIS_INST_SUB_DRAIN is set alongside other bits, violating the
intended drain semantics. Fix this by using a proper bitmask test.

Fixes: d09100763bed ("media: iris: add support for drain sequence")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index e991f34916ec..5552725c614e 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -269,7 +269,7 @@ bool iris_allow_cmd(struct iris_inst *inst, u32 cmd)
 				return true;
 	} else if (cmd == V4L2_DEC_CMD_STOP || cmd == V4L2_ENC_CMD_STOP) {
 		if (vb2_is_streaming(src_q))
-			if (inst->sub_state != IRIS_INST_SUB_DRAIN)
+			if (!(inst->sub_state & IRIS_INST_SUB_DRAIN))
 				return true;
 	}
 

-- 
2.34.1

