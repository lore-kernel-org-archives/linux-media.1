Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C982192FA
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457923; cv=none; b=C6PBIbjE9u6gQf/OuCnTAVnrn4n7+/urBuRGHqGliShwmukeYEMmbCLBYEhcmwV9h7Kc/qqETJHDamGQbIBOxbMOEBgEPCupAQddvi8dW++ZAYINT/DSftpYXGhQDep3+MO8ccSjPGfEeEryZaJ6NRZZpdNs+9ZMRT/tyaHWZnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457923; c=relaxed/simple;
	bh=zag+8wxpB4el2kZvCJLcHBJ8sy+2Lyq1AkJATiEYMWM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pVxeLkSFXw0kE6hgNTiI3yzAranm7KxEPwuW8pZyhY3oOMRU6i7W8k70KN5BuPuMLTZLiejE+UNzE8eR3Fzy2YvNCUiWEAZTaBdFDurCG+9CCy9TDGk1xcfL9RS9TVzagDkdLZkcI7SA0ArTPKUrctxtM2zFByCKHRWo8pW/+QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PfF0Q1j4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZRqiPhg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PfF0Q1j4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZRqiPhg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V0MKYK2307337
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A3tlWX2lVRj1vE+ze9rk+6
	GxOnmopkhVgHV/anyC8B8=; b=PfF0Q1j4dWvRWuPYF3FoYXgc0jhFmofxnS7apr
	cQ4C1kMxS2ZRjmXZvkknKvl9SAjFfP2qmf4lP6qTJO47kQYcHhtHXNUwfyumSHxp
	leXnKNmV8qDixASaRZnR5jz5gm2Z3D1HDt/2IdClWjARX9P2hu4o4rBOR01q6F2P
	TVKVbMeyP4/PqUXNEOAKRQE3dy7Q2Jv1Q/BKAHiXUdFNPCH1TJIP8dSQoU2xtXyS
	XthdaxaZhrKWGoHC+GHEKjwtXArz5W5BPEpaOaHbwX76AGZBGPyhQoJ6QvKCzRSO
	UP9uml/3oKUijIPtMHoTzVHIQoSYxvU1PZWoW/2T6dZWN6gQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frh3nr0tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:32:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21c01cf3so6744411cf.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 17:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785457919; x=1786062719; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A3tlWX2lVRj1vE+ze9rk+6GxOnmopkhVgHV/anyC8B8=;
        b=KZRqiPhgdMMvpAfkqzzLMwJuve2LIwvSQVrUnIr5UktIjGlr2OgYQukbyvJzDWFWOV
         Xx+odwPhJUwJgBV6si8I3FRvobH9K6/tSrvOn9RpbHZtiV2B+waLLWNFqmFDI4BW018R
         fapVNSOQkYnwjkVFgB0PkFfWjsIInag1oP8TOe/FZiZ2naFu9DGd0Inpcpvmzz1a+HcC
         HLKYM+t9tdqlx2nPohEI+mCLsJQMG/1rFl3veqH0JCXjCEigwWMV+B6R9uHOOTUCKbZT
         kOsqxUIqgs+8t/K6mHKqJn5Gmjixv4To2uLDfIXvqUchOTr+smwPgvNXa30Z0RyV3Daj
         J2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785457919; x=1786062719;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A3tlWX2lVRj1vE+ze9rk+6GxOnmopkhVgHV/anyC8B8=;
        b=O+D8g61PHiv3s3sQg60IaRcqts+RCU/sKehHnzNZMHL+IzIYrXpnsKQoho6hUeqAD3
         7u1GMWZ4UxXPKnm9IJwRgoJOnYRq6OuNXdAOZ+RWg8N5JHM+oS8W7+/PZfHAk4HXxTb0
         AWrehXtMxGH6SXxbMmuDd+BjsFbLs32r17SCDTB+JKHZM7yJe5aMHJbRyNcEFgnBsWG2
         /7oKNovB3pO98sGflN7b6GkCKU4uPx8EjdDoz+Yl6VcCm4iaKL5oN4n+8cjRzLxofpvW
         s/n2TVOYPqp9xBvdg6UqK5Ec4FeVo1AFLr+QPD44sgkjEGSML1PmypEtPba29gem1ur6
         RdpA==
X-Gm-Message-State: AOJu0YwAIeWz1Ma7xqS86HtWBf73HAb9FL1onsu+nUVYhshxL9YultC6
	e5RUtCd7s+RVmaMmg0Qh8uCSmKa8aAznY9mZOdeyv4Xe19+khD6VOvpUfGRv1BDp3N/B7jFTsN7
	TVV05zZQxfRXnnYVkDNfwD89FPs4ySFGiqsNiNl7+/NlEIuyrrVgGb5sIOsaVk3JWH2msl/S7bA
	==
X-Gm-Gg: AR+sD13YX9CCnAQ1RcEhEdnH0aNxBJdX6ivCFotgB+0ZDXNvvjpBkZ92ZSNOOepYAjG
	EkQaJrno5KuxaTG+ahkYpJXk/UhLjU+WWu67qc09UV/6if2FCLbwEVz9tID+6Jdpd4dh08v3kWE
	yXW7b/PY6zZMK1duOpRWjS90YGvCrk5EXHnoU5ufKQWBn/UbJpStw04Q8/FrtOQhH9Vh01poIXm
	j9ub6dOSqqSONzxst189SUmAiby5J0uSVg2ZsqrMWaihb7M6QSqBOADj4asCq5rP5J0dcFuI4IA
	XeD27ZheYxfQrnUj/I/Tu6Fc/Utx6MRy2RVg4+K4slSt4uoCJC2QuD5j+c472yeduvNlLZzx9BZ
	QPRplYHc+6o1SbBJp+69IVOHZFr22a9fUZnnmpVuMClKsXPJY9gKjhhQXJUsl/GejVVDi4bolVx
	Gf9rfu6dvsPDJ6tA==
X-Received: by 2002:a05:622a:5905:b0:528:3b5a:67c2 with SMTP id d75a77b69052e-52b4af3e62cmr1245811cf.1.1785457919034;
        Thu, 30 Jul 2026 17:31:59 -0700 (PDT)
X-Received: by 2002:a05:622a:5905:b0:528:3b5a:67c2 with SMTP id d75a77b69052e-52b4af3e62cmr1245431cf.1.1785457918613;
        Thu, 30 Jul 2026 17:31:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9d2688sm620538e87.57.2026.07.30.17.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 17:31:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/5] media: iris: several fixes
Date: Fri, 31 Jul 2026 03:31:39 +0300
Message-Id: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOvsa2oC/22NQQ6CMBBFr0JmbUmhCMSV9zAsajvIGKHaAaIhv
 bstbt385GXe/L8BoydkOGUbeFyJyU0RykMGZtDTDQXZyFDKspaNkoI8sejpjSzaqraNVUclVQX
 x4elxP0T/0v2Yl+sdzZwakjEQz85/9rW1SN7f4rUQUlSFsrXptW6NPjvm/LXoh3HjmMeALoTwB
 QPwYLW9AAAA
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
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1980;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zag+8wxpB4el2kZvCJLcHBJ8sy+2Lyq1AkJATiEYMWM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+z73xmoFdX8w50qNOe9WM0e42beXN+uSyMCs
 jbobFjr2f6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamvs+wAKCRCLPIo+Aiko
 1SALB/0SXfMZRL5XqbbgZQY61vq//Yq5/0I/IP1XxMGoDaYwjuOKbgbiyGie3kY/csnYlZCyB1/
 +U6CTNmSM4NhK6PqR/nwf8TE/ikdI2Phe++XU+yaGsMYxzAsASyDW+Ux3tjdxV0cs97KMwsRqSv
 vavdCFv55JNAzLBTVgRha3xpGbAfVd5HnROzr4oetCbR+5HYjoIhjAZMsaPKWgEgOPRtga1FC95
 P0Xie1L1RVfw8GhCZshP1FI0VfOf2iKOfQ1fkHooF06D60dDUUPDwVxPc2a4w2HPOMvypt6v75r
 BG9SAYNCaD2YkVfIO7WQGwjPPCs1NAHK3de0XeIhoo1ElM/p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfX8ayNAr8aG9aP
 833653MxT1rj97KjY9hIW/9QRDKNFTT7Z6cqYQtlUsb+7sZjIBYYp4bfrfjGRtLYh+/yp8jPxG6
 1U7BoErvXqn6TOKmUOY1YSS8NouCd/A=
X-Proofpoint-GUID: wArVxiRRT_p3UzFvK-DaR74MgNlnqnwE
X-Proofpoint-ORIG-GUID: wArVxiRRT_p3UzFvK-DaR74MgNlnqnwE
X-Authority-Analysis: v=2.4 cv=W8UIkxWk c=1 sm=1 tr=0 ts=6a6bed00 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=4abjX0wlFHiq4bt0lUoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAwMiBTYWx0ZWRfXx6MbWJc3WVBM
 PsBCUKfThSac2uo9nA0s+rqTI9pNlSz8WPmlWTTYKOC1KJfrHqFN+bWNEK9pKrlk0ciqXu4j6OT
 qADhJ4mCXl8vcHgaTScQY77cxQRlJUe9306j79CdSKNZ/imRydR71i7y78ctB1VcLdhiO/shqof
 g6ae50zmHJh1pH7ZMtgx9vlkhOKq7nfX77jcZpFQXssKZvnnwRKS64hNNrreVjtlfv1JO1x6Q0m
 vafvFfJMOPgCVsajD7DOp2iYgtPvUwgPaZunSTllsjn1ScNOUxxmquizIILogc8N+o6GNZXt+m5
 rhYem/zZ4gdVj9dFDHlWz45V0BZ3fI/uESQuTbHEGTF8pUoRJ8fMAZKECDRKlcuIq6ytChE1I7X
 TN2VtSww4TCYTqLczOPONOXhD3fmI/ZyVfcJFpXrBUl/2jI38lZ9WIBFgRXFFcDzChGcUEy33t6
 yeLoO/rGpMjh5gYn3xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310002

Fix several problems reported by Sashiko.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Dropped duplicate SoB (Konrad)
- Simplified iris_add_session() (Konrad)
- Link to v1: https://patch.msgid.link/20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com

To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Bryan O'Donoghue <bod@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Stefan Schmidt <stefan.schmidt@linaro.org>
To: Hans Verkuil <hverkuil@kernel.org>
To: Vedang Nagar <quic_vnagar@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Dmitry Baryshkov (5):
      media: iris: fail firmware boot on invalid uc_region
      media: iris: take core lock when scanning the instance list
      media: iris: guard against a NULL hfi_sys_ops in the interrupt handler
      media: iris: reject open() when the session limit is reached
      media: iris: reference count video instances

 drivers/media/platform/qcom/iris/iris_hfi_common.c |  3 +-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  2 ++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  4 +++
 drivers/media/platform/qcom/iris/iris_utils.c      |  6 ++++
 drivers/media/platform/qcom/iris/iris_utils.h      |  1 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |  6 +++-
 drivers/media/platform/qcom/iris/iris_vidc.c       | 42 ++++++++++++++++------
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  2 +-
 9 files changed, 53 insertions(+), 14 deletions(-)
---
base-commit: 56a985509842cdef159cea98d85d9213ee047cd7
change-id: 20260730-iris-fixes-846d7d353034

Best regards,
--  
With best wishes
Dmitry

