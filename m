Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8959F3515EA
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564893; cv=none; b=LA+UOS333C3HfodyPKvETlRgCrW1XCOVwLhuANzIf5WsbLneB/HYkGEZBV91an2HX8q/zSkKAllFJ7tPAlTDw3EmCVSj9hK4rNLNt/Boc+EeNwpz/61i/wWMXqLMsnPZ/xGn1f5bsh7zRoZiRodJ15+obGBQu9JfDZiSy8e906Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564893; c=relaxed/simple;
	bh=r6opA0kNEQrfiaF67bom8srKxpwwHd5XT4pgmfEnYNw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RfQhc12ykH+NbkRURjKzujkTXE18qpGmTrhFP+SgwPig3ZC1ccAXlemW+sGc2np/eBncoBkrvM9s+1KpASOo0/pIjweB+OgAMboGthwsc4VjMv0AxkqAfiOCpoXAIRWy+Sm0dODkidpkCmRX8t3rGoA7OUrFiWvIBkOpvgRLNyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gl0vzHNm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BLUKbudJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gl0vzHNm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BLUKbudJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CI8ekN001076
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pkY9uRaTzpSbkhel8Yhdfr
	qDz8pSWXGRHDaTs4X3HMw=; b=Gl0vzHNmkmH2fBqNnJz1ki+0ENSyEVnz4YalB4
	EvcTgKhQfh7/Z8NJG4R1qZtTwK667d8G0vYgk3NjuQv4QBJvvzrMFMse6k7qkNxi
	2efZAVKbVKuUDDa4kkeDSct2retHUC8Hhk7Ff9MQUYkSSq0d0IcVIt6pzdeQcGky
	aPCPTCrAWeM8yWKRYPW364XZsb8cN+cBvG31W/amcEIwm2lHRCGRlYE1idyLUKpq
	1hXfCcCRNB3azux7Gt6mHPbl+q/f9cpINYjVp+rW7+YvSN9Wfg8Y2aX1Wq2ssReC
	0kgptGNcxQczlPAWEnU2W1dyh6oddHdekKQY7I9f+KH4wGUg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0uts15k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:01:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d28f8737eso25593871cf.2
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 13:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786564890; x=1787169690; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pkY9uRaTzpSbkhel8YhdfrqDz8pSWXGRHDaTs4X3HMw=;
        b=BLUKbudJnL4y74zXgDf/we4bIzxc8G6LjUSqOvl9fNgkv1c8nOc8dYmLcTS1SKdQ7C
         Wks0hohs03o6LJn0CZyqdGECSNCIJAQuSEb5ZxEIfIMFpeJjD7oLmEfQDg9NVCS8lag2
         LZKKb64dFu0mjdrefPsQG1NbugQFrNPa1Sa/e7NrSQNmWYwAQcw9p7CioIaTIvA4bJv4
         3WFarnLdOG/Zn/SpuNFMoYC+95Jda/LI3PFEfy8BxU35iMdFrCuvF+hW5H2cbN0/JAcs
         hTuPlXzi3J0P2RqEqthKCkwJEcW7hebnVzZ/3Dp+GGlyugHp1/yXTaXKgdNbVwV4QX4G
         Rojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786564890; x=1787169690;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pkY9uRaTzpSbkhel8YhdfrqDz8pSWXGRHDaTs4X3HMw=;
        b=gLvi4rMU2JN1SL961A4FXHCxxeA4cluIGQ230+6oz51Ss5D+xDGE6/wPqzL6iMNhs/
         ffPkrM8twvQdGJWHn83atQ1IBkRYo4R8Goo5V7EMm+sENF1zGlTWkvtbnVhb4vCky1jG
         hyB7TFzaFcbnBK4DeLet6V6i1i895S++vthWfAlGgx3uNU3HsidJ/Tbw5TH3CvU8k4Er
         WkSt5kyeNnk9EhBP6DyUxSY+rOEo8PRVTqOAV48zaPvuliFQQ6aNJLkDi5OtcnWviuLZ
         ZODYRVfxYKxCRTzNRzrmqHX/8V0Aynof9yDdcFaUM8lgcf7u/3hzeMAZjTEmn+27XKcw
         zMmQ==
X-Gm-Message-State: AOJu0YxVHdmTdI6Q+d0isZXFGt42CFrdGBbVSGA+oQEX/3bj96+R2wNZ
	bDPwgAUX9IK0R2CCMgQ3PJOzQ0H3W3nfr92eGocO8RRW/qsAwLIpDSljHChUk7MP2PYjTw3e1Em
	ht/m5cGpCZGcgOq4xTkpNJDlPk4ZCy/j5OY64iJ/t8Jd9OJNctwESgx3e6JXMebUD9Q==
X-Gm-Gg: AR+sD127YZkbfNkIPxjZLjg8gS6iqlcu7j23Oo49BOa3v+E1QXO3EP09bKnXQw1/vsg
	TRfoGKS69DLGRO3hbNVNpXMBixvmbYnkJq5+4+lmCXu+Y/NlLgbPsOXKR28lpC4f4rstQXqAE/C
	xEg1Tzyp5J3VS+NS3qEUeL0cgj6Z0S8CQ5sh2babpcYMVi08Y3rPKdelOKGsKJv6UBsP6h85x+p
	zHkpa4McDX7dYZJUWcEiTDOK6BG3QiJ/hD9khNj1PNZUh5TYyCUxomVTHFRDKmxx4vnnKkglbOE
	0GGGNPLUfG2Mg+LmJG6OtDik4aDsFjI+Jl+uGB/1lKizwrRN4OOYcV/KWb1/ThvkEJNab9t9Jsm
	qCIxLQhSL12kSuMFaOVjGflN99Nrw5nP5L18G/qnLSg2SloKIlcdpCIS1rtWeRvB3oXwIxfLwOZ
	4zBBToQ9TOaFXu
X-Received: by 2002:a05:622a:8c9:b0:528:3b83:3483 with SMTP id d75a77b69052e-52d73d5d865mr7476611cf.23.1786564890525;
        Wed, 12 Aug 2026 13:01:30 -0700 (PDT)
X-Received: by 2002:a05:622a:8c9:b0:528:3b83:3483 with SMTP id d75a77b69052e-52d73d5d865mr7475561cf.23.1786564890051;
        Wed, 12 Aug 2026 13:01:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a11b2acb0fsm354561fa.12.2026.08.12.13.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:01:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] media: venus: fix several caps parsing bugs
Date: Wed, 12 Aug 2026 23:01:22 +0300
Message-Id: <20260812-venus-8996-v1-0-6615f82a63b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABLRfGoC/yXMQQ5AMBBA0avIrDXRhkZdRSxKB2NR0kEkjbsrl
 m/xfwTGQMjQZBECnsS0+gSZZzDM1k8oyCWDKpQuaqnEif5gURujhcTeqNJoW1YOUrAFHOn6Zm3
 3m49+wWF/D3DfD6pjgi9uAAAA
X-Change-ID: 20260812-venus-8996-1eb92496a45d
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=r6opA0kNEQrfiaF67bom8srKxpwwHd5XT4pgmfEnYNw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqfNEWRZShgm1Ac2l6Evgha/3DMJRgBZ2S+a+DS
 D2T3ooeJmCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanzRFgAKCRCLPIo+Aiko
 1XYgB/9NW40oqkYFA6WL7rRDjaoKop1bpP2rvz13hZiNy5hCGKrvU2qpujM5zDr9NNyUAFmCDAu
 7Y3mh6FQ+QpG4+JSDjTM7Lota2x9nAlFhyOOKs1E33/cqou1WBSbtDM3+rLq9KV5V1LAFlSBtDw
 2RnWzKeCfbZ3xUEmYbbe6/YQZNhrYz3ZKQwMQsOwvyi9UhPZ6LU3nzYxVbnpySQmupNntnoNvqW
 Nc0IL0PiHZhNsT0MDaq3YmS/DUOkIDAzcDc7RQZ2TqRWPL6PGqXwA6iZZOC1kvRLvgD23VRFdS5
 WmxHWzZYykRu9qa0+8xoKlPR/QbTbGtfNJXjU0lLHvgDiL03
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 3I_KDO66IN_jVPOgOLxCqP8oJbXXCJie
X-Authority-Analysis: v=2.4 cv=aPDAb79m c=1 sm=1 tr=0 ts=6a7cd11b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=z1JbGT0kfS7yTgG4yncA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 3I_KDO66IN_jVPOgOLxCqP8oJbXXCJie
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE2MCBTYWx0ZWRfXw0LT+BYhNPyv
 C55Z14HDxFQYpUaRXYc3vuZ6TCTVmPiG0nl8DUPbRIpCvRF1p7yYKGfbgDZunWsREeUqxQByIbT
 PxDWxG/18DHhM1slNsU6zW+WnWbaQ30=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE2MCBTYWx0ZWRfX9ekhcuJISDD5
 796D3DJ+jJooUbxEyA1tVjPxbbHq0roKzqUGBPYi7Cj5jtIYUWekoEyzDSIQRZlEVAU1Z+R40zU
 ftGlM0g3MQmB7Jps5tR8HKzHXIverzCDmkls2avrCPTYep/MyoWF9fxDcIBTeDmg7W7zoFOKy86
 KHG1s/Y2QDhAfJgV2u1iA7BaDGy7Qv6F7tsCojw08Owr7QNagT3JmxiUBM/9RG6ytD+ftTtj2W+
 hSy6yH7pOTc0Q4jwkYaNX6fFg5F2Gx8if/50+QSO/4kKZcvHCMHHLgMTfBElV62TXbXSYkwK8J0
 QnNY+q3dY3el/T90doqZifVjKUgaSln+EwLRvxVjze979l5lmY+8Urzqi0LGLsAm9ydLs640YgL
 gVHst/EHurM00FtO5c6dPJcD2OMwRRXLqAk2rHeHvQYUuccZcjxJ629JVFfoSdgCAdCftfKj0Qd
 zkIdmKxmyTZOqWTD8dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120160

Testing Venus on MSM8996 revealed several issues with caps parsing,
which didn't manifest on other generations of Venus hardware / firmware.
Fix them to make Venus decode streams properly on MSM8996-era of the
hardware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      media: venus: hfi_parser: account for all capabilities when skipping a property
      media: venus: hfi_parser: size a raw format property by its own entries
      media: venus: report the frame size of the codec being enumerated

 drivers/media/platform/qcom/venus/helpers.c    | 75 +++++++++++++++++---------
 drivers/media/platform/qcom/venus/helpers.h    |  2 +
 drivers/media/platform/qcom/venus/hfi_parser.c |  9 ++--
 drivers/media/platform/qcom/venus/hfi_parser.h | 12 +++--
 drivers/media/platform/qcom/venus/vdec.c       |  7 +--
 drivers/media/platform/qcom/venus/venc.c       |  7 +--
 6 files changed, 66 insertions(+), 46 deletions(-)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260812-venus-8996-1eb92496a45d

Best regards,
--  
With best wishes
Dmitry

