Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F663019A9
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 02:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784775363; cv=none; b=r+3HEBg+rB0UIV9SNvQFKSd8uTuQyTMW2ZIxB7Er76dl9ctMVVppvGwT6DLcGDnjBweyF0UtHw478hOm7adpso6P8AxczssKai5p6+I9gzWJP4Au2JfrO1zNAIzhRjAadCYRSzZWdl/8PTuwZ4rFMqTGgVDQkZpgTwwTAftTgJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784775363; c=relaxed/simple;
	bh=fitKuoq3f0JyMs8K6A7V2u0qijzshEjj3lKDbMsxf5Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UiSW162v6IpZLrmm/w8T2FfSWfZswqOkEkfX/Ap5hVzt9YWB7g0Cgifqx9+3avEHFwVKQIgoQqe7Ph0g/jtrWZegwEAPrKTjeXP/qJcge+FaN2B5MwPEVhwSAG7teRLQSWYk9FzGtt3PKwzUmfoGl7uKa/5OSlszth0S6Ow1e/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYZ0SzlZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZo9TsKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYZ0SzlZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZo9TsKN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0Wupd1927356
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 02:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mlMFXOUkVU+3nCPYf3vcrl
	NLG9N3WolfCVeBQy9I9u8=; b=FYZ0SzlZZncaVx25lLZUHdcY95Y7c9BXzPqa3C
	FpIiqIXZjBrHSR6WZmCprp1Gvjgc90qCu/jb9QY8+kmTWzSuicHgF5p9MDZcO08B
	5wJM+9fXLl8Wq9sCEob70ugyptHZCAzAKxSr8Wcc7ucHbF2e4XBPTUqGIVZDUmDF
	HKKRSFOlCD9d4ZLf9wxwGQUjgAy8h5pr+SQU+ZdqaOQZjaI2qglg4qRQghf6MYQU
	J8fk2E7J0JahYexuOZkA5nu5Igq4AGfRgErRr/2CXpuvPnzCybSPS44LiqnxMrTR
	8K7ya0Vy0nJpItl2sz4pEbdNtsxvpytpTpBDVBjlT7y1LajQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxmgk1e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 02:56:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso207338b3a.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 19:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784775360; x=1785380160; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mlMFXOUkVU+3nCPYf3vcrlNLG9N3WolfCVeBQy9I9u8=;
        b=BZo9TsKNjWCWqTzYILp2jpUpKR0g39O5uWJ5tuxSxfHztkdzuHSF86UuZ9iY4QQJuE
         ApoyXKB/wjTrMS03I8EhzeJ1vbLqw/CyHBZjOvfOxJZnx9/xALhSzzFsceLiJj4Baek4
         VOTqknMckEgTNPrmtp5DHJ5XzPj/xyYMKiff76MrcRMXkOo+wViBasmuDWEt2K6IwaIj
         q13E0NR4+YlASR/KAbqn/O5dVOw7BFul7CAxvFbV8rQdJzap4wovD9V74htztWPqNExD
         W2Q6T+npA4uuLy0M3sMOdcyR2ZSGPWhkODd8hzjajChYixwGSe4YmvGM6Eux4AlaIzil
         qjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784775360; x=1785380160;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mlMFXOUkVU+3nCPYf3vcrlNLG9N3WolfCVeBQy9I9u8=;
        b=Oc07t0N+smYcKqHmgMW9CSrMFFOMUkOlaYTc1bEaabrVQDDbQb7ZvhK7EP4uzSOsjD
         zDcevN1r33oGBUxfC6/FmBCPoJgoXw0yFtrg4BIabrFjPdaReieUub+hFTxhGIxqYZKq
         n6K7GzYjoKRBtE6J6GKGJs7TiXOkqduluVNZ8r6GjaIFglIuq1EHNBsjbKjdbvcvzLP9
         QhBpiMXyXm3BJbV6WdmeJqv8UDDlJ7tit+UzyDXii9aXiFipIqPmnWTR8AqQ5/T5WZZD
         2IZg6kaNSsW2FTit9N1Zls8D0aroyvSj72C2EXiLi69o9Nz4omrqn7d/SxuF0dYh6ynr
         Khpw==
X-Forwarded-Encrypted: i=1; AHgh+RpIr2c3oGu43uLuV7zYZytWjdjSeHxWYYMvsg/tF/lCJaN2sMRVj+7YJ9j0tN7cbpZmxywjNspUfvVhfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw/zmEptH75TnA2R5tVsRDk319Qbe39svX+EidEw5lFH2u5bqb
	fyA6wPVjnuyZ7r2R0yeIKGVLmx0cnIa6XI3ldkM7r2yLpOCwSmIgHKwql79G1ZW9ohnzVxF4LLj
	/38dcHmIysexLJngO+KIX0z6Oozb3a0pBgVPih9VqwrCATK4aK4VZ1bTVuF/D154Ipw==
X-Gm-Gg: AR+sD13gGFKnpeY1o3ebU7jp+2ceAMz5dXyzJZTvQ8c350sILrFxl/uCHlHapeEFNFT
	ZgCdALTYuORL5YdYl5+0HpUtRoVsR+t8PH5u05BDAz9LTrHt5MHiZoHp/26JoThZNuQQ2i4jePC
	nL950dbVD9MMd4e3ubivaXtUCfSAl6hTyuz0V32v40KHfXLj+Z56v8+VMyUt8Q0xBqBIKi9ak8L
	K9qobOdRXC81EdRngs9GFQnBVt2O3Dsd+bcctE33QBxzidMY97nKO8ZCltCtr37EKyRDoYt2M4t
	DBGhG82Bj6mMq4+aGsCE5tAA2BU98DwL3z3zuVTmNFT/9mKqAarxKt4GqAWwDpXWjr2+NwD9Gye
	zTeG8KUOkqDX/ggptqlYyoGjFRHUlq7lQqFhJ6ocLhhtIgMtWxgRlfXN85CctVCveKloi7hnatf
	c=
X-Received: by 2002:a05:6a00:428d:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-84e2b7fd971mr1539623b3a.6.1784775360225;
        Wed, 22 Jul 2026 19:56:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:428d:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-84e2b7fd971mr1539610b3a.6.1784775359749;
        Wed, 22 Jul 2026 19:55:59 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17262e33sm2233312b3a.14.2026.07.22.19.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:55:59 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v4 0/2] media: qcom: iris: add dynamic encoder properties
Date: Thu, 23 Jul 2026 10:55:53 +0800
Message-Id: <20260723-dynamic_encode-v4-0-5fd6bd549ead@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALmCYWoC/3XOW2rDMBQE0K0YfVdBunrYylf3UUrR46oR1HZiO
 aYheO+V7UJLnf4IRjDnzp1kHBJmcqzuZMAp5dR3JciniviT7d6RplAyAQaaSV7TcOtsm/wbdr4
 PSEWtuNVCMwySlNJ5wJg+V/DldcsDXq7FHbdP4mxG6vu2TeOxclJx5aPkSgulsYkyokYWg+d1V
 MYG60xdQySLdUp57IfbunXiK7bNAvZ31sQpo8Ch8YYrHhk+9zkfLlf7sVw+lGcZ+902D9veRKc
 ND40Tdt9e9kzws6E4OwWKotHUITIBsoF/FPFLgb0iihLBQnDMerDxgTLP8xeEjW4AyQEAAA==
X-Change-ID: 20260417-dynamic_encode-3751a6360ed4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784775356; l=1937;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=fitKuoq3f0JyMs8K6A7V2u0qijzshEjj3lKDbMsxf5Y=;
 b=4CvjtvJtgpaUpPcjvg4DIz3F9RZTcrf6Uhb7ZXYAqq5DJKlTt0yQfKHtEJJBnc9VM627sIY36
 0rlNd/j+VT0AasV6uIc/93nIBz5JVx3nOVbIcxs8Air2Rw5quzzM9Ts
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=D+V37PRj c=1 sm=1 tr=0 ts=6a6182c0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eqrrz9xRmxmWE_0OKXQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: WaFzbPOsDf1duxTNy5phVZ5R-qWR4FRo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyNyBTYWx0ZWRfXw9XeIf1kkz+N
 uYMmgaBEkMysWWHTAzW5+mWevgzmagpE33BSAuw5jqqd7BTzUjC2AKF/c6Mw4WHbhMMaRLklhaU
 aA2VzY8ohZOzPhP9PVZzRdV+ZbIL1w0=
X-Proofpoint-ORIG-GUID: WaFzbPOsDf1duxTNy5phVZ5R-qWR4FRo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyNyBTYWx0ZWRfX0AIkMhLkawUj
 61/hbC/KInVinu+fj+QGSYVu0DfXPwla4/HKIiQNs5aivlNR0fAUwSHns2cGKiSI+1QwlfpsfIR
 u8NAQ4hxQgbD2GJS3HuTb+Y3uYtC7VuawMiGK5AAtHnQBNM2zG3wDFwJGaAmEpL6EyK/xEW3F/U
 u2F4x3bqr0cElap6B5ISKo4vxMTmIhL9dF5BgkpHbZerefLUUIl4gW+QV89/ntxAd5phO1PRgGB
 B+hWFsdG9ebEK1QyHFQjWTn629wvbFg/Fj5oQIThUcVxzgqbrNJWlsHs+NSxVHXhIK9+jCa5R4N
 FcG3cU2JcZoVUnfcsmmyWLmwlW5YShvzpmwwoCTnukzGn8XscJZSb1gg721RDdG5E/BSXHCgcFf
 7PcCsLYKfgdh10KUcgmDwfCKcdgyiixyxruw6lIs6THoixXlMxr9FOoBZB/ZqzbLF5MF3MlFMlE
 hEW763ji1iLhTX1V9FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230027

This patch series introduces several enhancements to the Qualcomm Iris
encoder driver, improving support for V4L2 controls and enabling more
video encoding features.

- Fix missing hfi_id for gen1 encoder GOP_SIZE cap.
- Add key frame request support for gen1 and gen2 encoders.

All patches have been tested with iris_test_app on gen1:QCS6490,
gen2:QCS9100, X1E80100.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v4:
- Add Fixes tag.(bod)
- Link to v3: https://lore.kernel.org/r/20260624-dynamic_encode-v3-0-f2a2db0ac2af@oss.qualcomm.com

Changes in v3:
- Correct the max value for FORCE_KEY_FRAME cap.
- Link to v2: https://lore.kernel.org/r/20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com

Changes in v2:
- Rebased due to a conflict with commit 'media: qcom: iris: split HFI session ops from core ops' (35da0884068226ca3a53371dbf685db6e0d74658).
- Link to v1: https://lore.kernel.org/r/20260429-dynamic_encode-v1-0-c9fb691d8b3a@oss.qualcomm.com

---
Wangao Wang (2):
      media: qcom: iris: fix missing hfi_id in gen1 GOP_SIZE cap
      media: qcom: iris: Add request key frame support for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 24 +++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 26 ++++++++++++----------
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 +-
 8 files changed, 61 insertions(+), 15 deletions(-)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260417-dynamic_encode-3751a6360ed4

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

