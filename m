Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388821;
	b=Rr+DlJ4CylTr7ehA0DpoNkNmWmFANtmKG1jomWTiT31GKURnGHo7aytloi+vOndXocOQ
	 6Z3TznHCQrwcNpYd7GfN/0//rv7j+Y80a7GZ/YT6NJ2PPSZ1D0E+GZCOdIbtw0N5ugbfZ
	 8LgxnEK/FcH9St6y542GN9t/2bcI0BQFIi4Ezn9x1XjaQu3dtbi63/GOwpGie8aHb5CmD
	 6nsFzEdHus2J27xYBh2ec26j5T96zq10NKjN5Ryk1OdPj+Wv+yyy8qK9CuhUO5RznqQBI
	 UTxBSaPmmcILlmHocQlOQHe1ACdai9Ut9ZE3hIt1u65DsR4VY6Z74h1nYfuaqP5bA/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ghEJXKWzTP9aAwVoN6uwmlIFk1sC5DaCEYh0pbHfkpc=;
	b=1Bv9cVkvRVIC+t1exE8wB1l3qBWFxx2SXnS3gRaS4EaGqypEouO1KLlAo4y9A7EouL/y
	 FzwSQN54KHhar3mH3VwXVQiqGh6TGECfXmfu63uN/4fl0zPMnXPzTG4h/AaOLhhM3N/Hg
	 M3dQrhosS5OGIR1lnfN4K/m4nunPZGPg945WdkBT0TtN34d8hNAWrL+wmQbo0brLXdUQ9
	 Hrnzcw93sm4XY63jSFMXp3mg5VanHc9wZ+wrfzeHtOJdpTjXjah2WKrA5boDUGhuBv3hO
	 SnWqnU7uAX+BX9woOUb34NJpG+ZSgT1JUM9JynxA5geMQC69eGPUsVSumIBGdlCu6Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RkwtfUx7;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4E3606A31A
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 19:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4E3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RkwtfUx7
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3550c917fd3so1509619eec.0
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 12:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793388820; x=1793993620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ghEJXKWzTP9aAwVoN6uwmlIFk1sC5DaCEYh0pbHfkpc=;
        b=RkwtfUx7lPVh7f38yMfRd6JOWqiCMDkZ5Xot+u+6Klx88GkeGrwkq91B8R7XpX+qiX
         21UGMcfOdlke22CDJeRYW/X7Fp4Wb+VEDiWlCmOneb44AZzua1ObGxWvWNXgCQPgFC7S
         7hg7tdDMUUTkgAT6EQBKDMqbzaxiDxGGfd5vOQRAGayPzI8VtRT+8J4sRJs1J9AuWCxE
         wBBynXzLcdtf5itaQtUW0pqtLVynIFS04hZecX0WwpHAEJjBg0qtyfLduNACeBCvY/0O
         FPOqJDawtNJAQQiH/peypU5vIe8wTV9y5AlZZjOxPg5aFRdOXDbOfDZyLoP2kKgr+VGH
         c1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793388820; x=1793993620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghEJXKWzTP9aAwVoN6uwmlIFk1sC5DaCEYh0pbHfkpc=;
        b=GxlRdcT1MxOnu5wJ9pYtD8mWY2+XmkXyIc/4A9teVJdWDg7aHVQIwWJriVFV2iKlmU
         yNNRWH+QYs15q2zvC0+I+7mxo7oeDXoPvmiuhBX5TWdxtTyWYOs4Okj8C/4Oobt8ya0p
         o1dDajRnWgmUI+LR0fwqKbtPVe8cjzCUnp2YXFmGqcM8NVZk76dANWAj7imO5lfiZfP5
         aujaDOtx1Lz1ZVVXDP+9vGpV2FSJazWuu9NvotvnTByb45eBeLXXDzKFSTIS40fnHSaa
         91+bwLvagyS4ROdqv7uWnag6nEanu/2YJPRUdZyuLajLCaQqQtBjxn7LJCkPNQwZZG2O
         1dDw==
X-Forwarded-Encrypted: i=1; AKwUvBwbW9uq1GiiKsQAck9MKTcaLw9wrmCwdZZy4A+mBnMR7pYEMXfcEZgvw4sY/q+JPB7KmvTLfM7SwsHu2w==@vger.kernel.org
X-Gm-Message-State: AFq9FYK2OY54DGMg0zT7KBiMqpe5xPU1juid31XF5IWz+auv1j83hsFx
	pjuBTtLdRFl8hkzCi+pyeRf/9KmbYQZLr/SiU5YS5tveeklmRBsrhXgv
X-Gm-Gg: AYBFou2oKEJVkylV4CphP+RDevrlmyoxBLFividMAYk9PygL+ji64cOUmAohVSGEjGO
	63wi4VG+rRnugCx16Eeu2IVvrY5aXv2SCaT/J7UArxccpJqa/2X84BfdnlOEVWeFcrgR2T21fO5
	4/q3ykJ39RvSa6xvLl/NrBuDcwWKJ0QYGCGaEvntAbqT2tGyhjiNIAuCWeb34tCJkehN+aS4+1c
	oVwaYXhb0V3akFYElOTrTBkB3Zw2KREHNmTBnGdjyDJNhQoMDHvT6kfBqtBIgrfvGWqnNJm2fRw
	3rJG5nriamDcLsWEriEzS7R2s/+77jXFEUGVMlwz6PeDRfSQdAAIdRLwlR4C72Zd74D/3Utt7e4
	g01ARvFAG++Ur/WgZki2MZuAJj2wHLuyTFq4aovWdZjgTYaumYOAXdmHAp7dbky7A4VcWkVoREC
	eBxP+9pwipATrh0bSPJLeYHCFs7wBjG0ceEGhchD/N2p7WeWq8KnKw2g75qjE7WQxBVD6/96mCi
	HLHz/aO7ttJoIG0uMX+fwT00JN5EU/Cnak1P+7/TzOP59bJcIVwYNVaEii5E1LOh0xvxekY3k5Z
	gdKysev/pEmCHofYCdXAA3/DczJyF2GCTBpvbR3xl0/O5BsNmFitBmkMr62B3yOTUfbVji0=
X-Received: by 2002:a05:7301:6198:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-36a42602aa1mr4298875eec.38.1793388820302;
        Fri, 30 Oct 2026 12:33:40 -0700 (PDT)
Received: from X.tail7c3ebe.ts.net ([103.190.40.7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm10796405eec.25.2026.10.30.12.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:33:39 -0700 (PDT)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH] media: atomisp: Remove redundant return statements
Date: Fri, 30 Oct 2026 19:33:04 +0000
Message-ID: <20261030193322.13777-1-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A return statement at the end of a void function is redundant; control
returns to the caller once the closing brace is reached. Remove the two
such 'return;' statements in hmm_bo_release() and hmm_bo_vunmap(), as
reported by checkpatch.pl.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 0a8f401a1..4ceb8cb41 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -483,7 +483,6 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
 	__bo_insert_to_free_rbtree(&bdev->free_rbtree, bo);
 
 	mutex_unlock(&bdev->rbtree_mutex);
-	return;
 }
 
 void hmm_bo_device_exit(struct hmm_bo_device *bdev)
@@ -957,7 +956,6 @@ void hmm_bo_vunmap(struct hmm_buffer_object *bo)
 	}
 
 	mutex_unlock(&bo->mutex);
-	return;
 }
 
 void hmm_bo_ref(struct hmm_buffer_object *bo)
-- 
2.43.0

