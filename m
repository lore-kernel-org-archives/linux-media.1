Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1664F33F383
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787388547; cv=none; b=hPRu9nqBOI+OdgnMNieQCwyPj7iuomOcrkvlc6odG97OyCGij6sb4iXvY39NXgrZE4lgk9m8d0nqDqeNukMUSrbIsfyN07DGd4ic7K+5yjn4ta2aYEVg8I2kie6rahAzWYEPUKp1dvNiFx8dhh3dBsP023NZ77qt8piy34AT6rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787388547; c=relaxed/simple;
	bh=gOBJwEPeMtlwt03L/ZfhjBd5plqQgtTbCQTqt2MDjRI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S8dD/yjy412SHaloPr4YADrPGhIE+37i+tmnvNeFBd+3ymW01bUeY0LkuppyiNlLuUJm3u/p8p7Ke3AZu+I4qSqwdDmQE3xcDlYMcRDnpJDINC26+IzmA7J6fx+Cmuu5mHTzP92L0RjvAvPbMsrmRB1hj0FxcfDcj/C7+VFZpLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y1Dt1mrG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9VgXNdQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y1Dt1mrG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9VgXNdQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67M7xa4B231060
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 08:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NwPcLGIyQ2TcFXPWJo+/PU
	HE35UurRlilrmlN7QREiM=; b=Y1Dt1mrG9ogBjzJJGRftXHIvZHi5mBTxfznDiL
	vZGEhEsUhDDa7AgHpyk3Wo/2Mgsa4q8XCSpxTyg3LgOSwBJSe0sj22TOaqBa5WuI
	CsV7UeOJV4hvoBF6mQECKphWcoLSKvHpVeR3XOILMhR8z6FstFu85FYijZtJ6WgP
	b5p/qYh9PMWeBy7GfqQsRrzTuPtUP8gD5FZ+IoOSjH3oByfDejxNIsDc3xK2O9Jr
	WtVwhQcCjTpa87Q6hNlkNsrf2BoEKGvcO2StqHWYhhugQFfLIRzMuxYb2QfJRGmb
	YQx7OT7dIDqdBuGOUykDCNPK2QWz9Wph0lkz6pHkoVVAUbLQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74hcrmc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 08:49:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9077b4c35c5so34437266d6.2
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 01:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787388544; x=1787993344; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NwPcLGIyQ2TcFXPWJo+/PUHE35UurRlilrmlN7QREiM=;
        b=D9VgXNdQstzMwdDxZ0Y05Yd6NZILpRjag9wMMDys8u16ONmcsb8KCehzK4wQ6flR50
         jfhqx3kjVRS5w3sQLcpDju0KaBs/jjoBQToRovmPoSU19U9dieoadBg4UuXdoiZ7eexW
         WLxHYOJJDfe5IdCccwLW0Pnrq4eWTGVkFDl9QlZ08HxiRp3LzZo9CK8I/0G+yo8Vg3Y6
         aeXE+hidzv0pxpsWuFA2Y1VWdu/IShBYkqOB2qAOzWgIROlChyHZo6eTDJ1qGOcl6/Py
         GspGP+X6yZukQzZGYAV4u4WX451cOa9OiqxmkF6KFvpQmm82im8BOpVVZKpjIGLy8haB
         fv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787388544; x=1787993344;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NwPcLGIyQ2TcFXPWJo+/PUHE35UurRlilrmlN7QREiM=;
        b=prpkW6nG13IHlERNUdzRIv0WGSOb3YPoR+IKyvjhQB64OlYcz8jUCHuh7Wu8ba6aAG
         pJe7YdmvTIhL4zxWOT0HbH5UnIyxFACuVGZn2HA/p31wzx/fw2jZwR7lBlbnqJ0QA6Ob
         2omOVCbCkCsGE/LfCUCjHy8ufdaqu8RhWzeLm2eDIlgt/fSdOlHRZChx3leYE99butNW
         0clRr998HU4kYcI2skFush3OkKXCLaIjLYwa6xAHdaEcS1k5vhGGxgtuT1p08LzAvuTd
         n4rAlJUvkVAxc/stYGV7BV4tuEGhEhy3JJkd/wvbtAPOP59I+Uk1wvqnKZx+bjXeqyvJ
         0i5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq4bm/hY86Q0lSN59lCtVnKEtqApnKnBdWPuqfGGJ3/0bXzayoUW6TE9YJS8zIx2AgrE7mVfNCbUmy2Og==@vger.kernel.org
X-Gm-Message-State: AFuF++n21yKpYJmcsnLFKcOTtinEMvBFmSUAbU3BBPloceyHX/JKW/9q
	2rINWfljO870yst7UD3tyfD5Mupx4DoxOp8IsjzWao1KDo4xcRDnvDIeZlf645Xpm6Z0s/BNYR+
	jSJQwu4t02qhPIlCkLtytLW7gRlcQ4B5B5z0Qr4TJQ6bLdH02ax0D+plZqe021aqc5Q==
X-Gm-Gg: AR+sD11AP7JQ/JpYjQbw4KTso8a+Tptx8iVYGmWah9lA9m2VAyoBfuhzJf5ECG1H+OB
	IMHn9b+n8Q2uE9WcluDL3bVT1U0AuWk2mlmAc6Yno7lPCMpfF7aNQQ3axs8lndVRMjC4WYq/ZJK
	04NhjpdmqKgEatAjDC+QOsF2ccGSZRnYcBJg4cTKNmEKxOqPBRUvxvyB/unRXYIAMA2NC7KwERF
	5iQN8bODUzIqE0Kr+coGs5jo2thuZbJJhAlms0Gs74WnIr4k2HL0lj0Rg9jzqoFLchHf5KNEvvc
	x+Hs2h6iYVgLmjhCbtNTrP/ufFzchr0pjpwV6l9UtTPw/1ZwUCzGAQo060VL560E6HHuugw/VHm
	WlLAPFRLomtiTPtlU9loAaqEA7KODWwEcppDDpuJA69jAhVRXNWXGfoA+lsKtQvp/gnWLgrsSZX
	MkpY2YO2Bz1YYd
X-Received: by 2002:a05:620a:172c:b0:92d:e54e:72d9 with SMTP id af79cd13be357-93746853dc0mr385202085a.1.1787388544185;
        Sat, 22 Aug 2026 01:49:04 -0700 (PDT)
X-Received: by 2002:a05:620a:172c:b0:92d:e54e:72d9 with SMTP id af79cd13be357-93746853dc0mr385198485a.1.1787388543783;
        Sat, 22 Aug 2026 01:49:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1c2fab887sm3066901fa.25.2026.08.22.01.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 01:49:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/msm: fix dma-buf sharing on targets without
 per-process pgtables
Date: Sat, 22 Aug 2026 11:48:57 +0300
Message-Id: <20260822-msm-fix-export-v1-0-917b3cbedd43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHliiWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMj3dziXN20zArd1IqC/KIS3WSTRJPkFEsjY8u0ZCWgpoKiVKAs2MD
 oWAi/uDQpKzW5BGSKUm0tACWndQxyAAAA
X-Change-ID: 20260822-msm-fix-export-c4a4cd9239fc
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1417;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gOBJwEPeMtlwt03L/ZfhjBd5plqQgtTbCQTqt2MDjRI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqiWJ8+rA9THoLWWDYiClPFjbEoXu+P6VcBYxRW
 S/lXQCfckGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaolifAAKCRCLPIo+Aiko
 1fdIB/4v+MAHJ7Mnaap20AO8FuUibmxnVbVSJejJoLD2Ge4r2qPuAFLIT+1bZB7hrNrwxr732Lu
 rITiRoPqTLRegf56mc0sKiiTMhv8yJ+H57xTZYGd+qMcwoExVp7ccoLAA55wHppiDS5lZMgf4cI
 Retr8aQ9A3frQQ/dLWPcW1TXXXtNR886sTGiCz7nuQP+Ik8Wo56K3EM6GCWKL/m7dEp03Np4qSY
 y/o6oy+WSUqMrKZalsvXCBsfjmASuA04jD2ez6wZvv9ZSaJGupyljANEqtQwdQwoBbsycmHu+0m
 UNVIHUdl5S2tMJ33IoP1DwET9GRXkMo6cg27jDMslCGS9d2x
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 27gJEqDuscc3ILNM6fnRwMRRz3zNqhQs
X-Authority-Analysis: v=2.4 cv=U7iiy+ru c=1 sm=1 tr=0 ts=6a896281 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wJ2JNn2w0yijhvieVxkA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 27gJEqDuscc3ILNM6fnRwMRRz3zNqhQs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDA3MCBTYWx0ZWRfXyTsR509QdRhT
 sQVwNCJqeRmIi4Q35arHtpDv5onyTuXVbPUViB8y7l7ViSoKrZgEvsZhBis0qJYxVempWLk8tkM
 vnw33WNVcacW9j3fsp8GpYxnPlrt1d4LLsNxlqux6okqOe6sbKRU7BJcSO+5/gdE4UJdtkIot03
 Fh2/2RT7Upj+/7RtJRCkKNatqmqV9ZMMvPm+0P83fyKTe8cn0r3Cv5yHs1p5ZCyhZeyKp4O8GdJ
 IJ7rycvOtn4x9i18Vqrqc3kpUhqXoUOO/Xf6ETVSqDP6Zy09fxmojv/YLU+eAGChEXyMb4vnycO
 JyJRFt5L65ypSu1ZJjnWhasXTsLO5EAbVdHLTpE2nh/SLlwIXQfrI/Uwvv0vJ0nbmJ5Iti226YC
 W/4m7h0K4NEjBZIEYeEwcvx0W06Vl0F/R2FYF7lgDT9OWC+tye3SHs84ZxwXZcH0yE47dWfbnBX
 UmycZvdgTvEdBWjNpcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDA3MCBTYWx0ZWRfX2ouCL41avAFu
 uegFUoJDATKvwu81SDK1n/T7ahyYyPJ7XDWEsuCXyHit5QGHzJi2BT8ND9+9/xHvsX1V9alAyLp
 p8yPvjc3EjS/G5NIWgTDWB/2ExQp8kc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608220070

Targets without per-process pgtables -- everything pre-a6xx, plus a6xx
parts where split pagetables are unavailable -- hand every DRM file the
GPU's global VM.  The rest of the driver still treats a context VM as
private to that context, so closing a handle tears down mappings other
files are still using, and frees the iova for immediate reuse.

A dma-buf shared between two clients therefore keeps sampling an address
that the next allocation has taken over.  On a530 this is every
ext_image_dma_buf_import sampling test, reading back all zeros.

A VM shared between contexts needs the lazy, refcounted teardown the
driver already implements for kms->vm.  Rather than adding a second
mechanism, the first patch makes that machinery reusable and the second
one puts the shared GPU VM behind it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/msm: factor out a locking put_iova_spaces() wrapper
      drm/msm: don't tear down shared VM mappings on handle close

 drivers/gpu/drm/msm/msm_gem.c | 45 ++++++++++++++++++++++++++++---------------
 drivers/gpu/drm/msm/msm_gpu.c |  4 +++-
 drivers/gpu/drm/msm/msm_gpu.h |  3 +++
 3 files changed, 36 insertions(+), 16 deletions(-)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260822-msm-fix-export-c4a4cd9239fc

Best regards,
--  
With best wishes
Dmitry

