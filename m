Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2815C38F938
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787388550; cv=none; b=HJQyFkKvXogUGuJYQR8+o5CJqhTvd/NZzr7yY4oGqWVxDVnV3lMKJJl+PMDt5EotpbJkm1LKer+7ZsEmJ78Myup/e/IRSESF+XECw/fiGI7HnQcNw+2OTcY7QQ7imsXcL+OL+GhC28/hS6c+K8RplPJAKWbq5c25fkuZdJFIoQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787388550; c=relaxed/simple;
	bh=9sFj+2Zg93TLyhMuoQHzR96CV7efblYg21SrHIBwwDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NuwY+T6eqYc4AIVvzC5OnlfGLVpWhm1hHQI5WJBqre+uVR/SzFXdEkL7Lpkx5Iecl5Qa33TQC15movVxTuHjvVkczYQ7oPd3z3w38xyExaINdK6h0JbSLtXwE8Abw0frR1Jdq+PHMUakrR8fAbZZ76icUssWq5qcpyn1lPPS2V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGBXYW/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9mr391e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGBXYW/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9mr391e"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67M7xxSA475458
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 08:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UnXKGew5QII5NxsBPl0obJnI0muW32nfd/TT4GgHu0Y=; b=JGBXYW/aLT9ANHYz
	kUXALbd4cYiIL74InmFCISBdcJldMY+1Z6i6HW15ZP1oE4XLeUaF+rloeQR9H/Xi
	+jjjb8pgAQrEvpPGKRtW4mAyXwk2DmSavlJO77/lm6muXFqbWEDlI5F2RMxJvje3
	Twl0izFxXuayb4o12HRMEkFlNycdH8kyW+FZbaOUwmUTKfqS+hcUTXOIonVIbp3/
	wW0ubmvcx2QKgiPwCpkd/fTcoCej9l+dh/daaqxfgxpoWfjAKfmOmpidCDN1Jx+g
	JsbQAPHbmIQLNe4DP4PoOZukg2y0VAwOWH9XETrtzMpqyMIzypwre9S1IEJXkyUA
	GRatsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g740f0p7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 08:49:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b571432fso165708385a.0
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 01:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787388547; x=1787993347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnXKGew5QII5NxsBPl0obJnI0muW32nfd/TT4GgHu0Y=;
        b=N9mr391eJGJnHobvRvk9pFzWBUFockkeLYhbwh6GXQKHAs0x7VnTTytKXFkXRUhXUS
         XkopTSG0T19fiNEWxjxT31bN25hUx4Y/y9dj/4jsHxYFxuPCKDZNw50HT4KQSB7oZb8/
         8yYi1qzoT0y7tzyh4dG0QfWXyqIBQUaewTAi3jvraD2sWkrv41bWY//MDjeUqLSuKhVD
         eIzerHdKYiCpN4FyHbUDaFiRnZR4D9uRlwYC18kc7KF/zQiePCGMZjnVsg29csUhmJjp
         5ejht41tHzfcDUpCQ9RAr6/b2jYy5cDyo9qtsRu9ldSrxnrFisre3I+UOdik37Q8bVdI
         yt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787388547; x=1787993347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnXKGew5QII5NxsBPl0obJnI0muW32nfd/TT4GgHu0Y=;
        b=P6dLDJteZ2E1sLwEyjdX7LrsCGVONinw2iNZ+eB9UVfj55b/MSgpCQQqFsFComxT/A
         2J2fKziuNhOzgnRpCaI1M6QffFZqt8JTltF5J9ClhwSOVRXoM4YUordR8y67kM5bODt4
         gjSnXqxsdA9OcAdR7uy/QY3hbJM70BOhTOSVJ0AncU8rWuSpM2OXDfEJd+cnr4P4/3AO
         G8ijDZEW+iSNAfx8Lbj7kvkoUai4YAT8yzk3gC4thz1qU0KDh88hwenaPH2LQclu33bW
         vlQodxUvptHr5haqnMqvv/JQ7aOdWy7pBxkSIk9oOHdoX5gc3cyjD2+l+++/NHjNB3zz
         Srpw==
X-Forwarded-Encrypted: i=1; AHgh+RpFU8XBIUnU92AIt0V3IYcGb9Guf+VS8SsEE2xMKLnFtE9Q/FtOnQ8EQmsuJ+4pXCxwN9fl4aBEIcN1Ug==@vger.kernel.org
X-Gm-Message-State: AFuF++ktH6QVAUIKR3Xe2cH/qhN22mgEf/TYoSoRulOvooCDaPBESDvM
	IBNeHy1Y0wbPghTxqjB3lmUj8sxnaeEwJVgSgbEao46VH1ZS7A7yQR1j7DFgMKGo7ShjQi/CrYO
	fyVKjTlQK0hvpqxc/ONnMAbDCibr0s4qOD6ZjWusIHWprT0RgTd1qHPNiFjk5Yyhjow==
X-Gm-Gg: AR+sD12Gx9k+ga+z9RFMQ04/YH/AhMZgwkHS8kYTj+i1yrbt9ncbsAlmbnNMCq0CYKT
	ZG5ZzruYh6gSCtL5zRccsWfI7zyNF3cAGrl3ss44sV+YTesfXMBQaN63YBOizleqfzpTPxFRqon
	u9kY9fNiRAFIvdQDcQw/4NgNyfSCAlEcLoqq35Ye152IjSITQjsdUw2c9R7RY3rV4BKvxoIYtHK
	ODYK8lB61HvAlGma8AtfCEo2asGd4hD4joLGQoyY/wsXuDboriamtRXJi1GOwrK6iXUoaCkrw8S
	4l7J6on9+TSRD/9kmSDxagZ/CPj6clV8DQveDKGSMWkwRH72uLZzxl6CF+TStJxHM0ArA2XVX1n
	6OACtC08MtOarpv+gc2MTaiq2WZliUwUnMm8BX5VhAvbyz8W+rKpOhIejNhkl0SullibchUqBJh
	i+5X1BTKgA6L8w
X-Received: by 2002:a05:620a:318f:b0:936:cf9c:a994 with SMTP id af79cd13be357-937398a8cf4mr998426185a.19.1787388547282;
        Sat, 22 Aug 2026 01:49:07 -0700 (PDT)
X-Received: by 2002:a05:620a:318f:b0:936:cf9c:a994 with SMTP id af79cd13be357-937398a8cf4mr998423585a.19.1787388546825;
        Sat, 22 Aug 2026 01:49:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1c2fab887sm3066901fa.25.2026.08.22.01.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 01:49:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 22 Aug 2026 11:48:58 +0300
Subject: [PATCH 1/2] drm/msm: factor out a locking put_iova_spaces()
 wrapper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-msm-fix-export-v1-1-917b3cbedd43@oss.qualcomm.com>
References: <20260822-msm-fix-export-v1-0-917b3cbedd43@oss.qualcomm.com>
In-Reply-To: <20260822-msm-fix-export-v1-0-917b3cbedd43@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4016;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9sFj+2Zg93TLyhMuoQHzR96CV7efblYg21SrHIBwwDU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1ZnUo0Fu+wBx0XhR23uyspMdFJIL9INYYu/rFvr8bH5T
 2t8EHcnozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACYiEsn+32vWUY1vei+jFlzN
 eGGid7S6/5qxM9cHXlWXAxNY/Pt1Kx3cJ/w9EvbQK/1Zr9fJ9R1L3n4yy1xflXFz5Venz6oqui0
 dPD9n28RMrPBaxyXF4NC+7394X7RR877uz+F5D7RYTZXbuH6YTGXY9jFH7vvmmXs0Z2+ducPZvi
 CO7Vs6R0uZgdyOFYs5t4ed37fUe0v2PZaUe8vSfv5wLZJ7ddrWyljhE9uZ87ptyofOmbrcirAzt
 18VKmZy+c3PxBePpM+Jt06f92WrLHfuk5Pytv4GPjKSmg+eLpSf6/uoWMAz+HC/391Jr9a6PyxN
 m3mqZGa+nF/B+/1cV79XHVlYFjVRpV9V64LZbn29fRwbAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDA3MCBTYWx0ZWRfX1uCGVRYJu7yS
 JuBTjLCEM9Z4QbBM/ahrViv8bdqxcEugoLeyQzrMJFCQisBO4e6vt6X5rni0j5UeCfefGwblfB8
 exjD/wXU4mCYdvxPzeIpRzT0MPzUP8Wab4yCmpMqrCkrrGOfilPINdPifN14LAsWAdO8wL94ysD
 NrH5RgyDeCY2sole9m7BeK2+tXXtPcLlg4wHfzR9xv4EjG7vaRA1FUzqYaHkXX7fQebUgId8RWM
 nqFcVmH37l9ykhCi3vu9eZYDY45wIlLgkDXveqAa5hlEgBHMVdiZPbFll3JFQWvBAiTLGWkys76
 hlU461ef7IowWaQeKEiPvDKcMMI908BznuRh7IWOYln8YNbuDblNxt0M3QNZLiCQG855/sl+POG
 UQtCMBvVfluJ77aKNV2uFrVDxAMJWa1qeuTsb/aUSk/mEb83Rfqz4Dxa/huYJeeFo2ZxMV25PiZ
 IWIkc6X0GZk+sf3rPDg==
X-Authority-Analysis: v=2.4 cv=BZjoFLt2 c=1 sm=1 tr=0 ts=6a896283 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=s4q7lw47J6sqlY71xjgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDA3MCBTYWx0ZWRfX2mevdAUkvpHq
 0leG/vCwM4qkhDirrI5wxB8B07JEtAsxFBi5d5O9WTeFHSzoU7FWZGT9rxdZbJg94VQlsja4GPJ
 U1dBL6n7zhJN10bAsYdoP3er1GLnY7k=
X-Proofpoint-GUID: xkjm4Beklu1O78DsuGZy7KxuW40SaaSp
X-Proofpoint-ORIG-GUID: xkjm4Beklu1O78DsuGZy7KxuW40SaaSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608220070

put_iova_spaces() asserts that the caller already holds the VM and object
locks, but is not named accordingly.  Both of the callers which do not
hold those locks yet -- msm_gem_close() and msm_gem_vma_put() -- open-code
the same lock, tear down, unlock sequence around it.

Rename it to put_iova_spaces_locked() and give the plain name to a wrapper
taking both locks, mirroring the get_and_pin_iova_range_locked() /
msm_gem_get_and_pin_iova_range() pair in the same file.  No functional
change.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c4cff3d53d81..f90afffe3442 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -47,13 +47,23 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 	return 0;
 }
 
+static void put_iova_spaces_locked(struct drm_gem_object *obj,
+				   struct drm_gpuvm *vm, bool close,
+				   const char *reason);
+
 static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
-			    bool close, const char *reason);
+			    bool close, const char *reason)
+{
+	struct drm_exec exec;
+
+	msm_gem_lock_vm_and_obj(&exec, obj, vm);
+	put_iova_spaces_locked(obj, vm, close, reason);
+	drm_exec_fini(&exec);     /* drop locks */
+}
 
 static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 {
 	struct msm_context *ctx = file->driver_priv;
-	struct drm_exec exec;
 
 	update_ctx_mem(file, -obj->size);
 	msm_gem_vma_put(obj);
@@ -81,9 +91,7 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false,
 			      MAX_SCHEDULE_TIMEOUT);
 
-	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true, "close");
-	drm_exec_fini(&exec);     /* drop locks */
 }
 
 /*
@@ -106,11 +114,7 @@ void msm_gem_vma_put(struct drm_gem_object *obj)
 		return;
 
 #ifdef CONFIG_DRM_MSM_KMS
-	struct drm_exec exec;
-
-	msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
 	put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
-	drm_exec_fini(&exec);     /* drop locks */
 #endif
 }
 
@@ -409,8 +413,8 @@ static struct drm_gpuva *lookup_vma(struct drm_gem_object *obj,
  * mapping.
  */
 static void
-put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
-		bool close, const char *reason)
+put_iova_spaces_locked(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+		       bool close, const char *reason)
 {
 	struct drm_gpuvm_bo *vm_bo, *tmp;
 
@@ -669,7 +673,7 @@ void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		msm_gem_unpin_locked(obj);
 	}
 	if (!is_kms_vm(vm))
-		put_iova_spaces(obj, vm, true, "close");
+		put_iova_spaces_locked(obj, vm, true, "close");
 	drm_exec_fini(&exec);     /* drop locks */
 }
 
@@ -831,7 +835,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false, "purge");
+	put_iova_spaces_locked(obj, NULL, false, "purge");
 
 	msm_gem_vunmap(obj);
 
@@ -869,7 +873,7 @@ void msm_gem_evict(struct drm_gem_object *obj)
 	GEM_WARN_ON(is_unevictable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false, "evict");
+	put_iova_spaces_locked(obj, NULL, false, "evict");
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
@@ -1082,7 +1086,7 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 				drm_exec_retry_on_contention(&exec);
 			}
 		}
-		put_iova_spaces(obj, NULL, true, "free");
+		put_iova_spaces_locked(obj, NULL, true, "free");
 		drm_exec_fini(&exec);     /* drop locks */
 	}
 

-- 
2.47.3

