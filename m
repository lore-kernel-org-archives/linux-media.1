Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3452222C5
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 03:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777173053; cv=none; b=dc76MzgLl/TvOKeSLoxp3hjyZjWlDAl1Re1sOwcahmoSu1IWJ7scnfwM4jhm44zS8ycYgzyi5BHEXgAM54okviktg+avtlBflwc8HVnQICYlVULrI9smk1U3tSBa5exT8IzB7WIkvXUkrD6IwMAI6xJu666Sh2LVVpMbTkSCTvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777173053; c=relaxed/simple;
	bh=iBMhq5lwSgwfGGv0sD5W65o1I5F1349MCKU+Iaq8XvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eTw9Kfq6zBxr+2gS5Gp9bzS1RjzaqL24WA0b53x6KvB/h3PmHRtKsDuxwXSEFiY6tDQjw7eCQYImK2EyKcQwHV5IvTriMBX4FZR1BDzo1zPQAansPiuAmlwW7jiYNhPHw1HCqkcO5Qqa+xNoUmuWVxkZT8YApJRLelGkBbf4JF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xa2662yW; arc=none smtp.client-ip=209.85.210.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xa2662yW"
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-7de7dc85b74so47710a34.2
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 20:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777173050; x=1777777850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOULwLqvgrU1wCEhAdPKlH+/9gYQPD/8K3H9nkcKM5w=;
        b=Xa2662yWPKPLaCtGyBi3Nyp0Wi6NFfXeEdefDTwdLu2/Q/17pWxo7lyJIGJUOExt9J
         douG40SLwrFdcVy9TA+XKlQp9o7Xt3yTjLL7NC9YPdtIb2p9+WKzkuLj+M9ms8pLcsEj
         4HZCUAj2IwrOl0kBClkEK9NiqTCjC/jrhCruOjvWFKPjgAcN9y3GVgwE9V9sPSHyKN4Q
         nZiiLhT1zOPr7Z//Hhc65/hKLci0hob8ucnyFS153IRq7VGpsebyQ/2OTCVFrqU61RBz
         ZM9O8sOJAlOE5nxIEzZgVWslXlqDod6awHSSZvmgv1XoOb+MXAW+dsEbjQqDV0B4lIFE
         5Y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777173050; x=1777777850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOULwLqvgrU1wCEhAdPKlH+/9gYQPD/8K3H9nkcKM5w=;
        b=E0LLHSmPaEZ7oZb3pzCUObEC5reo8IoYHWeKYLkxydkrvr0Dyn0UgBM28N4oNOuJ2K
         rbMts8ravu1B6TAV82GbBnd/Fbo9VcJYVtfIKGu3PkIzE39On3TDEpUbHHC13JpjVyF6
         OlPesIbwLHyZELfPptHvPG5o+NjtCaehrhxjvDchpSy3Hm4sE6W3PtmodL+Wl06kPUpu
         7QBofjDUiklGkRkV3Ut1HCs96LOJwjc8qT+pvG+fgTe+UwxeOVMtjhmL1DJdETetPsHP
         aiDWxTdzdsLiTxNEUvdSMfCJZwX9kdkXr85Oh9F4sBGuccutFu4/T5WGr+ZXrZNtDi3Q
         B6DA==
X-Gm-Message-State: AOJu0YzLNwTqendmRFFuUMQmKvZftIFw1WU2mw9QlFwn+d5IGBsBNdHN
	peO6UxXB5DChWk197tIkxUL3PBVIut+leo4NspxwLx1m8iszZ5igFlE+
X-Gm-Gg: AeBDietXI6oO96aplj1+YfuTI8pxzCXQHVU3y4J3t7dERVIYBWCebe3Fr3cACWrpqEv
	0YiK31Xe3zgNo+Q25ax3FTzRaQbPTakRdV8Bmy2y3UJUXKfQyq3ou24Smc1sfES/hEke7tLyBUU
	WxtquTzEvjWb+GdAt89OLdI+r9fZkuBpDTGf1t2TGAW9MlgrAsZ8S0/8WIVSgCJduFWnxBY2cPN
	pmLHcGggByh5JKfXzABU6p3Kqpjkdg0moAylEORy+HoHjXXYyiwB7nRVnBx9eIL+Uk4GNOkecUz
	SqfcK3iwKkLt/lWU17Kuiia4S/OS5wMIeiHNQLnyAA5pUkt0MJyxwPoUT496RJji/HXTa/bEyRw
	hbINiYn6PXgx0PRrsNQoTgLA2TmWY4xkMprk6idEU7NVnUzD/p3epyi1JJMgoYcPQYsMnMWQrJA
	f+5zX9QVNOs75rRA==
X-Received: by 2002:a05:6830:82e9:b0:7de:44a5:51cd with SMTP id 46e09a7af769-7de44a55eebmr8910458a34.1.1777173050158;
        Sat, 25 Apr 2026 20:10:50 -0700 (PDT)
Received: from localhost ([2600:1700:3420:b5d0::15])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc97616c11sm22798566a34.25.2026.04.25.20.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 20:10:49 -0700 (PDT)
From: kernelcoredev <sonionwhat@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernelcoredev <sonionwhat@gmail.com>
Subject: [PATCH] staging: atomisp: fix coding style issues in mmu_public.h
Date: Sat, 25 Apr 2026 23:10:46 -0400
Message-ID: <20260426031047.5525-1-sonionwhat@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several checkpatch.pl warnings:
- remove leading spaces
- fix block comment style
- avoid open-ended lines
- remove unnecessary return in void function

No functional changes.

Signed-off-by: kernelcoredev <sonionwhat@gmail.com>
---
 .../hive_isp_css_include/host/mmu_public.h    | 94 +++++++++----------
 1 file changed, 44 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index 1a435a348..58b1af384 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -11,72 +11,66 @@
 #include "device_access.h"
 #include "assert_support.h"
 
-/*! Set the page table base index of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	base_index[in]		page table base index
-
- \return none, MMU[ID].page_table_base_index = base_index
+/* Set the page table base index of MMU[ID]
+ *
+ * \param	ID[in]				MMU identifier
+ * \param	base_index[in]		page table base index
+ *
+ * \return none, MMU[ID].page_table_base_index = base_index
  */
-void mmu_set_page_table_base_index(
-    const mmu_ID_t		ID,
-    const hrt_data		base_index);
-
-/*! Get the page table base index of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	base_index[in]		page table base index
-
- \return MMU[ID].page_table_base_index
+void mmu_set_page_table_base_index(const mmu_ID_t		ID,
+				   const hrt_data	base_index);
+
+/* Get the page table base index of MMU[ID]
+ *
+ * \param	ID[in]				MMU identifier
+ * \param	base_index[in]		page table base index
+ *
+ * \return MMU[ID].page_table_base_index
  */
-hrt_data mmu_get_page_table_base_index(
-    const mmu_ID_t		ID);
-
-/*! Invalidate the page table cache of MMU[ID]
+hrt_data mmu_get_page_table_base_index(const mmu_ID_t		ID);
 
- \param	ID[in]				MMU identifier
-
- \return none
+/* Invalidate the page table cache of MMU[ID]
+ *
+ * \param	ID[in]				MMU identifier
+ *
+ * \return none
  */
-void mmu_invalidate_cache(
-    const mmu_ID_t		ID);
-
-/*! Invalidate the page table cache of all MMUs
+void mmu_invalidate_cache(const mmu_ID_t		ID);
 
- \return none
+/* Invalidate the page table cache of all MMUs
+ *
+ * \return none
  */
 void mmu_invalidate_cache_all(void);
 
-/*! Write to a control register of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	reg[in]				register index
- \param value[in]			The data to be written
-
- \return none, MMU[ID].ctrl[reg] = value
+/* Write to a control register of MMU[ID]
+ *
+ * \param	ID[in]				MMU identifier
+ * \param	reg[in]				register index
+ * \param value[in]			The data to be written
+ *
+ * \return none, MMU[ID].ctrl[reg] = value
  */
-static inline void mmu_reg_store(
-    const mmu_ID_t		ID,
-    const unsigned int	reg,
-    const hrt_data		value)
+static inline void mmu_reg_store(const mmu_ID_t		ID,
+				 const unsigned int	reg,
+				 const hrt_data		value)
 {
 	assert(ID < N_MMU_ID);
 	assert(MMU_BASE[ID] != (hrt_address) - 1);
 	ia_css_device_store_uint32(MMU_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
-/*! Read from a control register of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	reg[in]				register index
- \param value[in]			The data to be written
-
- \return MMU[ID].ctrl[reg]
+/* Read from a control register of MMU[ID]
+ *
+ * \param	ID[in]				MMU identifier
+ * \param	reg[in]				register index
+ * \param value[in]			The data to be written
+ *
+ * \return MMU[ID].ctrl[reg]
  */
-static inline hrt_data mmu_reg_load(
-    const mmu_ID_t		ID,
-    const unsigned int	reg)
+static inline hrt_data mmu_reg_load(const mmu_ID_t		ID,
+				    const unsigned int	reg)
 {
 	assert(ID < N_MMU_ID);
 	assert(MMU_BASE[ID] != (hrt_address) - 1);
-- 
2.53.0

