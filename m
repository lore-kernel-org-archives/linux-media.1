Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AB0451981
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425180; cv=none; b=Oxj0w/E3KEKQ7W4kEbHS66wY813WT1hsROd7lLp26gdkP1joZVCCwLpj4Rjm+V+IDVei9AKTa0wIkA7l3fYHYOAzhQS3d0K/lHGNRFiMdvlsy0rvxq9dWDAdjvlWs4EBDDhQ4WGWjDY55IsDd7X0VsTYJ/ZuTPaNX7Q7FNP+zN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425180; c=relaxed/simple;
	bh=jA34yBnA0u8syAjpz0YDHemxRSdDyIzpxGZHohbCe3M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AHdQ1eo0pvSlke+txG3+a3vnuPcDIbNtqOqQAzNNSxVbLkIP9JFs6eSLEXn6CbZfdxgMVZ5zK9OwpzOHjdfRyQZG3/FaMaMKw+jbroJfDdnnpKLUz2+C+HFrfyYfcUZ38/hSnlTaYySNk9LsmX10TljsXpFXF8zP5XgJR/zfujY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJOFZ/WD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WemW27RS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJOFZ/WD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WemW27RS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEiWkE986903
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X7eyaTLQ+KQB8fRExHIRXb
	GwfGw6QatxQ2D0kSDv06Y=; b=oJOFZ/WDoh5aiKsu8B1pv4y+zt+yC16ZZcwbVL
	miOmzFbMPnT75ld+33IQCqaCDE5YG77QmSF1NgzyUgUKOlcfPnHRNR0LxY90Qfqq
	HXwJYeOTAfiGp5jEPPRNuXUYZIOdNF8W1b6niTYYgR5JeVBDDJ0PwvTWKrYBJ6m4
	8eUVCGpNyoKA/RK2mmOgQLpDjVZ3IiSsCbvpkRCMpo/USgDF0yurest43tTn0gY+
	QqIb+pvagjX2cJr2W/Mzw/rwNZkPipYILnxFnYuDAfs+PsuArb2/r3il0wEc0wmL
	/fMRMPWTzr3Jiks42PSS9WKsgGxVI2XBzroT7Y7tFLZLcAyA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n38778-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-526da7e3c9dso22921201cf.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785425177; x=1786029977; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X7eyaTLQ+KQB8fRExHIRXbGwfGw6QatxQ2D0kSDv06Y=;
        b=WemW27RSDP8DwELENYYWCiVHQO15XpexzLikeg35MaoHlKFbmCeF+AfXeo+Os8nm2L
         N6+8aOgzt8hloscXEaaXCsFfqNM5vyUkpDB0yTzbN9dioplRwLTluo2sHODplHryfH/U
         isdVRfGC3gOSkBvETBK3PrckHIhlRAXyD9pqKTynCaHfvO/+WBUUGRc6FFk8HB6wMc8M
         BLEJPyMN/mGhj+D5pC7QsdMmkoW/LSLxvC4OybOOPCrJYVXgR1LXn25fnOwfiuGBSl4+
         yIDmERd5uyeQ5GlRviPWPNgjknMErhGPhJy9keQufi/BPLx+xQUp1OyhmbjTa2dP/iSh
         qXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425177; x=1786029977;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X7eyaTLQ+KQB8fRExHIRXbGwfGw6QatxQ2D0kSDv06Y=;
        b=CeTCk69n+kD9PGH9YSvNDHh6iGJB4gHRu9h/e/3Cec5zHBkp6ltgddw+VgJ+vAtJva
         1mufClSAVgI385BTB5OsDVmOnelVYmplnZ1Lu/YiPyD1JxGEQw/t9r35PZXT44dVZxdM
         j/IquBKAoKWeQh1DXIMDQe2H8pqOrT6bSp6V95dgUT/LMUtXWOGbV1zPRYryFGIx4PYC
         RSWfvgg9hjwATK74dYLN/0cLLInEkDsk+gHFYFyubUkEHG08GqOm3rnDK0EkBosrw+29
         O96BFIR/nePdxPSPW8/Dz/p2vIWVo9Yl0YgfEsYc6l8OGwjeG0OyBWAJ65EeVx3Q+z3K
         Voog==
X-Gm-Message-State: AOJu0YzTAtSCGba5g/Vk3Lkk8qubZheErzi63OlWUjmoF+QXje/FJ5qs
	qE323S0viUGdmwomwZ+mNx/GVa8AvMZowV8ejb+O57PG5A7JdpbxA4B5qxGrBnRxRLH7ZOKBfNv
	UmHoPwLKW4ApYHXPcqpKJmPBC2jUD8NraztaDnS2fzxMT1UbQUOtz+I+A3/+8h5uMsYPfYIQMCg
	==
X-Gm-Gg: AR+sD1098R6BqpDEZ6j/3KTN6Rh9Xpvs/plAKIpci97eafqY9bpAczkwODpo9TYguZX
	0jHudC7twCct5/RHBdYVAsxi8fz+ypMS0cr/OnWPLDP8/emcKbh2oBEoXq/W6DlOI/O8X6H0rZj
	lQ1pOolY5TbfW2gtNDu/9wJLeSLkHK7LWzeLv3lqwuVRQqAPfPPO9rgYkNTLriUZr+WtPGII/FP
	uXJeOYOtaonHGPWKr3wuD2UaobsiXfgYsl0fb3ZhBHSLCzopvsXI/QBkwuaGFcy1KWvyJ5+wvEF
	revslpjm/HBfYz91m6V9s0QyWuRZkXpte9yfYsUaHxev2/vUKUGF4FAXgL7Zl1uq0Y6xAi69tvu
	8og9SMD2jDaghR90vi8tSirBAneocfuD5pZssxA4cX9+iwLTNqtwDr9kn1CIdxirfILhSpvqXO9
	7ln/wZVuW2zuS3Ig==
X-Received: by 2002:a05:622a:1c0f:b0:51b:f8b3:3d4a with SMTP id d75a77b69052e-52b3867df6amr35152511cf.50.1785425177035;
        Thu, 30 Jul 2026 08:26:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0f:b0:51b:f8b3:3d4a with SMTP id d75a77b69052e-52b3867df6amr35148181cf.50.1785425172427;
        Thu, 30 Jul 2026 08:26:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ed57asm443160e87.69.2026.07.30.08.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:26:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/5] media: iris: several fixes
Date: Thu, 30 Jul 2026 18:26:07 +0300
Message-Id: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA9ta2oC/yXMTQ5AMBAG0KvIrDUpLRVXEQt0MBYlHUQivbti+
 fL93MDoCRnq5AaPJzGtLiJLExjmzk0oyEZDLvNSGiUFeWIx0oUsKl1aY1WhpNIQB5vHL4j9pv3
 NR7/gsL8PEMIDvsFEsG4AAAA=
X-Change-ID: 20260730-iris-fixes-846d7d353034
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jA34yBnA0u8syAjpz0YDHemxRSdDyIzpxGZHohbCe3M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa20RabwaLUZ96X8Fp0Xif9iDTpUEfnjPQ0I4o
 xo6wzDF+UiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamttEQAKCRCLPIo+Aiko
 1fS4CACRASg6/uYRB4rO3UElH/Ee9twhdo12bvBOg9jhWAQPTf81eP5lYlS8sPYHlI+OeZ3KHF8
 Sz+iKBGLt6j5OGdjX5caZjh6Qmb+JJVT2BIjY7t7v3X5cMxbVnAF2qaYwCA6drOtEaeLmrK9bP2
 LM2NC9likB0FaRSflCh/o8ihg3SosIoirWKtb9VWwrwKFIhD1cFipFmD+TKINx1GZc6DoavVq6K
 V3q8Y8DPyrDC40Lt/r12GN33x41zy7PHLdZnkzhK0ghUooNg2KV8ouN1pgRn8GjryuqPV/1lDUZ
 b4TSphFbiLFw+pO6/tf1uoyLPN8wYTaIyccubuXUcql/FYpb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b6d19 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=4abjX0wlFHiq4bt0lUoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: hFuVI6Yhj3uaHvAvtjFFYF01MHJiv3NN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX3bxnjSrQ8E60
 auwL2djlkXh9/daKLyHcwqCuEfRB80R0cBW4omUX8N5nJ4Mur4H3nP+aQ3qvIpgvMNDJS+ZwqT+
 tL5CDUKmR7YOsN/9yBTW5QzKRmhhFxBZZ5HwX/ZLvs9Fm0IIY920iTPgRjnc02uTNuJ/zgp3MEa
 DEhgavfzaY1kt2Skr8epaGKI8DyRXq7M6xeCHyKDi+vTtNewuGArYBd+07E+BmxR0EATuvbwnDK
 TllP5mr5SPFG/m7nv2aJtoRZmMFiI+CJSioANMpaubRYTE6guAHLyUKzH0Yjz3BBC83JXJ0cCsU
 DPAIW9MLXopOZjOb9Os5UwJ5IXQYekTY99jcP3E+QVKG5SPWZhyn9n0sD3O2jG1xspJuArYiaX8
 LybZimYOd1TWiFH8N2uHjFRWitzJuDp7L2sAca7T58tmtP+7OjLx3551em6gBhxU+v9v58uzTdJ
 NLzDEPi4CPzCPi3KO8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX2i/pE6B5DVdw
 uskU9PRgBztNhpubp/KXiKws6iLEplr5oq3MTBq/bj+PmZZnjvh1YI4q0GnVWhQfa1p8thVRIwo
 68OWuoNFL63LTSKC3M8QxeZluKujS7k=
X-Proofpoint-ORIG-GUID: hFuVI6Yhj3uaHvAvtjFFYF01MHJiv3NN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300117

Fix several problems reported by Sashiko.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (5):
      media: iris: fail firmware boot on invalid uc_region
      media: iris: take core lock when scanning the instance list
      media: iris: guard against a NULL hfi_sys_ops in the interrupt handler
      media: iris: reject open() when the session limit is reached
      media: iris: reference count video instances

 drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  2 ++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  4 +++
 drivers/media/platform/qcom/iris/iris_utils.c      |  6 ++++
 drivers/media/platform/qcom/iris/iris_utils.h      |  1 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |  6 +++-
 drivers/media/platform/qcom/iris/iris_vidc.c       | 37 ++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  2 +-
 9 files changed, 53 insertions(+), 10 deletions(-)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260730-iris-fixes-846d7d353034

Best regards,
--  
With best wishes
Dmitry

