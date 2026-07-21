Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7183B994F
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 21:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670183; cv=none; b=HkYG6xpN14v5tgGHYIqgX1Dqh3DRhiQqPXakoWo4lJAmNlMtXQLu4W8lSR5nKCbWC4c5r21awcs1kLBnRG/qtOEqTh9EL1hGm+mFBBeeiGU1E5UqF7Kry3WWAYvoHXj/sAsvo9p5vzTdLPxIAb8yqVGHiJxqqlj8kcOyka1lq/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670183; c=relaxed/simple;
	bh=sGfBMQplWVPrUg05+eJzpMGHz3qz++af50GFuNqgMLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=smgufOn8fpuKfUzSZSsRVWjiJNFiZMVUtpcgNIQcEn7960tZNkL+pW8Z3+1CYwbYJ4o3N8RPrjZO5RbJzqcRut6Fx5fHTMh0EVVSTuRaeiUCLvx7QQTT+ublmZpPmPJmmjsDanFGrxLpbMdndtE3Oi+i34BJhc0+PLtn6gdjcao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ge5eOhGo; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ge5eOhGo"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b15c6fb864so5483786e87.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 14:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784670179; x=1785274979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KcmQLusWughGWb5DI4/2JeDa9Y+YQfkOsDn0H100Ow=;
        b=Ge5eOhGoTLuyhyZdujKDSIcczZiYkSzvvgio0C839NoROCeZgTurBRZmZLZnemA7kj
         WZ4Ebo+5SnemxPao7+D4FH+PeYoywDrCbpdUTRUYTp+oRvFufgJpgmrN+2TXlYWBpAEU
         i2dhMRyX9vr2WMbKk1KYZG8ez7TNK1oRb3HZ6qpyx7VVhOjyhDt3g7U0AjTNtSS9nBsL
         lXAttYDEba+tsnmHTT+rlj4PEoyH9GUlMg/E3OV5dWNSDAEZMH/RWKbd6U9ISM88/LiB
         o4+rT1fWecHGTRKZGSAWhAaCgY2AzIqMtjiyGOdX6rV0GvHBfnfahINKtEIBblKZSgZJ
         L1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670179; x=1785274979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7KcmQLusWughGWb5DI4/2JeDa9Y+YQfkOsDn0H100Ow=;
        b=NQLPwIhaOvrWcHD8lb8/nYWxCL1NrGOu3ryfDhNoQ7aiH/VWyVLCVBOiTS9p3gwb/D
         mT0Srtzyjtnui8W6oCge4pDhs7C30KN+7eFYaBWWApsos81KadohJVQx1Hclxj/gEQOM
         iDi+DXBmVhPWaL1Vsgg0bvpD+W9yILjSJc8yiZj4A7nC0b7rQ4vd0uMls60+we0fCiup
         6jPoKzbRlSK6LdxzDurqYN1erXCUk5u92uPRtESneDnboMRGebvQdETXR9tVYKMdSHHt
         B6zCBexGGT4aYMuEqXVL4sVMjSHWgcx/yjCj4NnLtY+DjJfyOd1xvoTan9r9HzxkvVQV
         2Q3Q==
X-Gm-Message-State: AOJu0YxQnsUqT55Ee0hOS0gDUQZR0B/CGv1ZDbRiTd7GaWuUWIr3VPxe
	X4XvTc5cQ5NVaN++sEFGJO+9ddDE1pr44vhRryT08mLOcZzy96z80770
X-Gm-Gg: AR+sD11+FXAyULkBwg2+5TNpbsK9/qidw1NRkWcVaFG26U3VllXLa3ag3l3M5hYU0GF
	nwx3Xzro4p6kWw0jJI0fTapF0BaDSTke3gNz03FTH/BafPKx7XE4LLy2mO246wNCGNAZ2wNSilQ
	uUXIcWoMYWmBLKzwV4AOTtR9V4+PEugJP87AfOfRRURrutzkOfIZ3PZzYJ8UCcbPASc2kuPlE/e
	038lOCUuirz5g25Zq6sVBeh6xGWZESOwBecJqY8BDLeCZyizGMDd2PJb4ZeYHffM/3ycQf/nxA2
	hwefdmWV4cVRxUNnBVYQdKNJ9HJ23rMtSmV+CHjDlKeRcQELa9GVA/6QYatyQgAhmkemgqE/Ibm
	BpUziiMhx3/9ydNsR7qGZHE3guuBv6A6vagrYLMryxeMs2DPlFjUz8eNB5oizf3G+iePKrtIFjO
	E=
X-Received: by 2002:a05:6512:3f03:b0:5b0:e15:772e with SMTP id 2adb3069b0e04-5b28f9bd387mr4501982e87.51.1784670179307;
        Tue, 21 Jul 2026 14:42:59 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bada25sm131509e87.30.2026.07.21.14.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:42:59 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 1/2] staging: media: atomisp: remove unused functions from hmm.c
Date: Wed, 22 Jul 2026 00:42:32 +0300
Message-ID: <20260721214238.840406-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721214238.840406-1-nikolayof23@gmail.com>
References: <20260721214238.840406-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions are declared and defined but are not called anywhere.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../staging/media/atomisp/include/hmm/hmm.h   | 16 --------
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 41 -------------------
 2 files changed, 57 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index a7aef27f54de..6bda02b9ff85 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -32,12 +32,6 @@ void hmm_free(ia_css_ptr ptr);
 int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes);
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes);
 int hmm_set(ia_css_ptr virt, int c, unsigned int bytes);
-int hmm_flush(ia_css_ptr virt, unsigned int bytes);
-
-/*
- * get kernel memory physical address from ISP virtual address.
- */
-phys_addr_t hmm_virt_to_phys(ia_css_ptr virt);
 
 /*
  * map ISP memory starts with virt to kernel virtual address
@@ -55,16 +49,6 @@ void hmm_vunmap(ia_css_ptr virt);
  */
 void hmm_flush_vmap(ia_css_ptr virt);
 
-/*
- * map ISP memory starts with virt to specific vma.
- *
- * used for mmap operation.
- *
- * virt must be the start address of ISP memory (return by hmm_alloc),
- * do not pass any other address.
- */
-int hmm_mmap(struct vm_area_struct *vma, ia_css_ptr virt);
-
 extern struct hmm_bo_device bo_device;
 
 #endif
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f90c4..8130be4a30e3 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -262,12 +262,6 @@ int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes)
 	return load_and_flush(virt, data, bytes);
 }
 
-/* Flush hmm data from the data cache */
-int hmm_flush(ia_css_ptr virt, unsigned int bytes)
-{
-	return load_and_flush(virt, NULL, bytes);
-}
-
 /* Write function in ISP memory management */
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
 {
@@ -411,41 +405,6 @@ int hmm_set(ia_css_ptr virt, int c, unsigned int bytes)
 	return 0;
 }
 
-/* Virtual address to physical address convert */
-phys_addr_t hmm_virt_to_phys(ia_css_ptr virt)
-{
-	unsigned int idx, offset;
-	struct hmm_buffer_object *bo;
-
-	bo = hmm_bo_device_search_in_range(&bo_device, virt);
-	if (!bo) {
-		dev_err(atomisp_dev,
-			"can not find buffer object contains address 0x%x\n",
-			virt);
-		return -1;
-	}
-
-	idx = (virt - bo->start) >> PAGE_SHIFT;
-	offset = (virt - bo->start) - (idx << PAGE_SHIFT);
-
-	return page_to_phys(bo->pages[idx]) + offset;
-}
-
-int hmm_mmap(struct vm_area_struct *vma, ia_css_ptr virt)
-{
-	struct hmm_buffer_object *bo;
-
-	bo = hmm_bo_device_search_start(&bo_device, virt);
-	if (!bo) {
-		dev_err(atomisp_dev,
-			"can not find buffer object start with address 0x%x\n",
-			virt);
-		return -EINVAL;
-	}
-
-	return hmm_bo_mmap(vma, bo);
-}
-
 /* Map ISP virtual address into IA virtual address */
 void *hmm_vmap(ia_css_ptr virt, bool cached)
 {
-- 
2.55.0

