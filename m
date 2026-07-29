Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905AF4779BE
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 15:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340630; cv=none; b=saS1TdRmfw15Rl31Iy/GciTecgT1JRpNK5ROYrHPhVYxus/t8MMpFQ9HIQKGEqhln2TkgQHZmfFsdYwcj3OeZprcLwd3BOA+IDc+Ad982IsmUo8eINp5VO4TrHiTgdX85TH+bUZ+6m0nKZ3lfIcRagivhJlue5Up1IOdyc8dh9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340630; c=relaxed/simple;
	bh=XuWvQmNP712Kb9HIW++bTX5xsDuLuiqi8rGpIAdzbO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyuAE5XFn3P0xEY3vmqcpJkCJ4OtwQsaMbXjkLecMZ65jMvlvwpQ749hZt2xf2Xt+gApEUi+QZMlGGvN7f2Zwu44au0ySTfTSBVnPw6mgBt+SDmhpYpMBEhrwYp/Hg7VS4+AT+k2S0+1ki2B83EHiyeSv3VoPBHYxQzAt16Q2V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4NB1F1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Om5VqDwj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4NB1F1U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Om5VqDwj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3Qn42593356
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 15:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ci5a3i1KHTi
	GYmRN5tAXD+AHcmxzUAUAXBR1lwdlYe4=; b=i4NB1F1UfAVUYHKl03lQVOqD1Rk
	oLB+opu7ZPiRCAPzai8aAZxHWeQajb8cTccGO935ykfNar6X+vamagMjGmPJ4AsF
	e7N1BzvQYSsp89d61+jszhkU86MW2aNhGHIo18YPT7lPvs1Aup2GVAQ7UEaamVPs
	sQ4HWya5DD7KE4fSNZo+GoUyQ6gXDvHR5sGbmOKhqZsfHhBlgUF3Wi0ooNeRBlxt
	1+Rg8wmuq5H7evgNhcwiOUJxbGSM1QuV9kC+t5KW/1PDx61o2kcLJANqBzJgRawg
	j6wrrzZVpIKOMdsEYkS3hCt9p7VzXk6Xe7gXA0A3XvhwGX1cHbovNohQsBg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqke08h01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 15:57:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc5faecf01so22814955ad.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340626; x=1785945426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ci5a3i1KHTiGYmRN5tAXD+AHcmxzUAUAXBR1lwdlYe4=;
        b=Om5VqDwjJPXX4/4abuinzosUkC6nYrUhqDNIO3M24Vr0zrOGwiNjEZOZTNgb2JU13L
         6T7nxoyWZAaMmtuoO+bkxEiWEP38fKwrd1thbTKL61RD8I0HY7euM2tAbcAZ4cb/JY51
         idIHYIuJfaszoSIzzIbRLSvMGo8lz+V7zrlgbDqR+uPtstptwFJlVUIfcGaw3zwA9txl
         zcm+4kK27LD9X1oSb56jsYJw8gOkc7rF+eZMN+4P3O4wYOmWIEdUL45pSszTDWDhI//3
         xzIKFeNvzpsqzpY/zyhmHK7rsddrDGc076uphP6pGjJrHzMKw/5cMqaMP+/PG88lzvPO
         gYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340626; x=1785945426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ci5a3i1KHTiGYmRN5tAXD+AHcmxzUAUAXBR1lwdlYe4=;
        b=rXUZexjyQEa3Is4WvxpW2NzfMsUXdeeijy6KwyOGjBf84MH8ieA0WTno7Cu6STOk0p
         sFKtfvd6nw4M73xxpC9QL5+CGIOYcvnZY1GzcFcCEaNJr0F5KPNaS78/Aoqvbg+8CxmJ
         27Jd/R35N4LFrzk/2kKGbini09NgsBntsQ7bTgGGe6ve5tAlDTx3RmLkZYAg68+yDW4i
         5QrMRApz6F78F7WX8/t+VpicscCK1aDiVo+RYqyzPTPdqQBT5StKQS9cbbJcIZQp/rg/
         Satex2Kyh7jin8iDZH2ghwjGKHQqXjjScB0KIoR1+whB5nUVLo3xWmL8qF9vrdA4mLHD
         SHkg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+76gazUuzTLjeZof1VWksrU3ta0PZ63CRNiyNm0PCXPHuo3xeF2YOkP0t2GriG43jN5F/zTU4nK18ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEpcjfv8yqMJ0sBJYeh7kxD8Yp2gMoIYf7EZtGO3N61iV2JGG/
	lHnnSqYJgBbHgOWjigoBdevoqjhpDfdsEww8X0pCqvfVMheuPbIksGDRzj0Yueb8UfxaqnI9Gxl
	RQWM+V5Bx9DvmXGnes9ad68UAoeAzPSp6iMBmK1zVzilQ7aanNCsiETyLpC0uz87t5Q==
X-Gm-Gg: AR+sD13rn6IMRgnq1Z3mcu4Fg+DteyuBmHMNqr1gAlyw30Lrp82iDrDqws4Cjv3yHkL
	lc4Rut/flMY+zBcvlmxLBsn7OSkGcZZMrI6IUteu7JgdLpE9RN1lLyrjpBI+aVgxWyqPyxIC6Wy
	xPc9Jmwwwuhj+Dbuc8xPvOXnDhyG6rOnreRpVqdQCJc1A4Zch+VS0V3B4M7gFMUKFjaTigncuYq
	m93W969Jsgmpxxz+aW9uQn/3eeqXUsnGCxXccWAMWv/yxf8+sv8q5JzbKWH4kkcNZdtDI6lCxk7
	YRyiZ5ejOX1CfKnyhxeBGXbHZYT32CzKU9sjgrDT0oIJaVa1MueeoE1ZYOM5+XM1NjoZTKytYi2
	Bq/M+Lh+aSeLu7CN4Vgtw0kA1PuUAGu3PyDtsn9MlTHbwHkg=
X-Received: by 2002:a17:903:1b08:b0:2c6:d710:3e58 with SMTP id d9443c01a7336-2d015d5b940mr84315985ad.36.1785340625633;
        Wed, 29 Jul 2026 08:57:05 -0700 (PDT)
X-Received: by 2002:a17:903:1b08:b0:2c6:d710:3e58 with SMTP id d9443c01a7336-2d015d5b940mr84315725ad.36.1785340625211;
        Wed, 29 Jul 2026 08:57:05 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf39b5sm13502115ad.57.2026.07.29.08.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:57:04 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v7 09/17] drm/msm/gem: Fix dma_buf import error paths
Date: Wed, 29 Jul 2026 08:55:46 -0700
Message-ID: <20260729155609.20190-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729155609.20190-1-robin.clark@oss.qualcomm.com>
References: <20260729155609.20190-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX60SZtwherb+G
 0NPa3fzB1euEM1vJ3ddc+IBgm5Ktq4kg3dmrplhTui3ESweCCIWv5OccyTJWsIN2Ko//bsX4fiQ
 u1lmbOfPlztCnaj/EbaFSAO5Yn3D4dg5C3eYcI1W98bRtCPHMOzlsz7YshdnHeTEfQWm/SxTOzR
 IHZgyvChkEFtwpmbf1Yzy1hAzt/MXPgJ+xZ9OCCOq8vz8B0ymPVM9OAdsKg+83X/Fy3Ij39tszL
 /R3b11zhbzFUPFveADkm/pn5y7VrGmVzzQj98aDlReFt3vh2axMITfUbUp34N4gqOqqj5wLGHUx
 8XFlHFb0eOjWMVfVf7XWus3blPWVhdgoKGJyI6Z3pV0HRYHV22+/cZ+OdFTKIWiD9gnC0BD8r4D
 MtwMKG5ECc8mnhjmec1yeH/t++TD/bni0C5nuFDqW/Gp1LNGSGazdi1FCh7oxBzZp19JfPEP8M8
 8QmNfe+AGFCaELRsX1w==
X-Proofpoint-GUID: cm41QyOtz-LuhcP8nWpzsuAINCQ_C3cW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX4Kn9oK7UW6Qs
 0d+LfEcAA46r1NVnUhMiDu/GOggucd6GwSIcET9dExLXZBC+dUmzeEWeEZBdiYMXdvKHobpY919
 b7G6P2fbDxiEFP49i3dWu4L+GLl5ckc=
X-Authority-Analysis: v=2.4 cv=ONYXGyaB c=1 sm=1 tr=0 ts=6a6a22d2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CL2m_loAqK5Y4tUKEbYA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: cm41QyOtz-LuhcP8nWpzsuAINCQ_C3cW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1011 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290127

Set import_attach early, so that if we hit an error path
msm_gem_free_object() goes down the drm_gem_is_imported()
path.

Set sgt late so _free_object() skips drm_prime_gem_destroy()
as this is done by drm_gem_prime_import_dev().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c       | 17 ++++++++++++++---
 drivers/gpu/drm/msm/msm_gem.h       |  3 ++-
 drivers/gpu/drm/msm/msm_gem_prime.c |  2 +-
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index efd3d3c9a449..74c3728f45bd 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1093,7 +1093,9 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		 */
 		kvfree(msm_obj->pages);
 
-		drm_prime_gem_destroy(obj, msm_obj->sgt);
+		/* In msm_gem_import() error path, sgt won't be set yet: */
+		if (msm_obj->sgt)
+			drm_prime_gem_destroy(obj, msm_obj->sgt);
 	} else {
 		msm_gem_vunmap(obj);
 		put_pages(obj);
@@ -1282,11 +1284,13 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t
 }
 
 struct drm_gem_object *msm_gem_import(struct drm_device *dev,
-		struct dma_buf *dmabuf, struct sg_table *sgt)
+				      struct dma_buf_attachment *attach,
+				      struct sg_table *sgt)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 	struct drm_gem_object *obj;
+	struct dma_buf *dmabuf = attach->dmabuf;
 	size_t size, npages;
 	int ret;
 
@@ -1296,13 +1300,17 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	/*
+	 * Set import_attach here in case we hit an error path that ends
+	 * up in drm_gem_object_put() -> msm_gem_free_object()
+	 */
+	obj->import_attach = attach;
 	drm_gem_private_object_init(dev, obj, size);
 
 	npages = size / PAGE_SIZE;
 
 	msm_obj = to_msm_bo(obj);
 	msm_gem_lock(obj);
-	msm_obj->sgt = sgt;
 	msm_obj->pages = kvmalloc_objs(struct page *, npages);
 	if (!msm_obj->pages) {
 		msm_gem_unlock(obj);
@@ -1328,6 +1336,9 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	if (ret)
 		goto fail;
 
+	/* Now that we are past potential failure points, set sgt: */
+	msm_obj->sgt = sgt;
+
 	return obj;
 
 fail:
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 762e546d25ef..86dc93cc1804 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -302,7 +302,8 @@ void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t flags,
 			 uint64_t *iova);
 void msm_gem_kernel_put(struct drm_gem_object *bo, struct drm_gpuvm *vm);
 struct drm_gem_object *msm_gem_import(struct drm_device *dev,
-		struct dma_buf *dmabuf, struct sg_table *sgt);
+				      struct dma_buf_attachment *attach,
+				      struct sg_table *sgt);
 __printf(2, 3)
 void msm_gem_object_set_name(struct drm_gem_object *bo, const char *fmt, ...);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 036d34c674d9..beb7f22fd694 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -83,7 +83,7 @@ struct drm_gem_object *msm_gem_prime_import(struct drm_device *dev,
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg)
 {
-	return msm_gem_import(dev, attach->dmabuf, sg);
+	return msm_gem_import(dev, attach, sg);
 }
 
 struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
-- 
2.55.0

