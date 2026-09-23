Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A842D5412
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 23:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206932; cv=none; b=bvxAqqSHyAulN9dCG8UgGzb2ObCeb6LL7knGk74kgunQuOWIdcMGub4trtFxvdu4XUU7RwN559RPBjmTVhAfKiANZrvocos9dbpB2PNRqZe/Ym55wlU4qMdOgkJ7aTRbxAzv+Bf/1z8E3vlrUMAAeXVdtcTQD/WvB5ZqudVdlHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206932; c=relaxed/simple;
	bh=pYjeim6rkRmaxSpwPitBNprXWpSBnwzEpUPN7fveHIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uiFEUD9XvvL7okPfU3kJEjMz5VXPh29ZNETe9QJLZmTIDN+SdB4IViOB2NnpQWehIYbkonto5jTMkkwSTN0wj+RgAAcEoMtrOo8Btz+F7qq7QeWaZEadH4wD0aiIPAaWcQxRFUnZBOmIs4lkD8hCPbkiw6xsKR9of6pTKgwnFPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4hM865a; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4hM865a"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f47a9b57so1574219c88.2
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790206927; x=1790811727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrUy8lEwXCvnZORNFDyE8boY4XaJRyADxOjRdBxHQ6Q=;
        b=J4hM865aVfy3DxSvThXVmoTUP9BSh84SLYtYPV/Imv71Ch+wtVeyeMpZE8tqKgsuhv
         rZD3JsV8nKormNgIbPO18UGJfYm1LzwgYrD80QkxMpuvmJWI4eq3gWjr/MVoMiJjLD2n
         WnC12Aso5dzMCuG6zKYWNJFzKR0CCKEcXDcPt/lZsUlt++HpRWDQwhlX4esFqdLEZ4Nl
         4czuu5XPkoCtxpAQXyd40mcO4hNT8FZ7lBKoMS6EiDrjGWagazlG/YmNCXOO4kISs3TK
         JJ0BPzHxPAnmL92CtalPA/+Mwt+MN93sn6Shsz96U8rDqz2GU6M9KH8mg4+bvnfRslsr
         wzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206927; x=1790811727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FrUy8lEwXCvnZORNFDyE8boY4XaJRyADxOjRdBxHQ6Q=;
        b=F4nbDW9c4DemwpIWb4CvsBWWKtl2+PlODnporFyGDOqzW2ujBPN2POGeqmtl6ASmjr
         uoU3cF8TL8XqsLGZLI24eDUySIxGgXgxuYAP1sIbJ+tMCSPpyZWwlEM4oJBb44Suj70/
         OHE6PEd0h2SMJn/rNB5tnHF0Pj1qjyFulmQHDJ+QeWGYpsQfAqNuy3KnEwyfnG4ZRFUh
         VQs8UvY80VdV+3qWI0fhu4/208LO8zlk8JTCdC+Gh578Oqbu8329dV7m/amLVxqKqCnU
         EQPo9Sc0HoiQIScd8KAOAjvH5Jv0x3doFN13FzosQ1MLaP+8tSyfuP6AVg6qYGao3AM8
         f4xA==
X-Gm-Message-State: AFuF++lTLSGF/OpD0GOoa+zPbrHHQUwh0iPq+Iqpevlk0tdyqXSbKo++
	qDStvWaFQrWNW9hzftO0HFg5i7dbWcbbiuEyjHzPo+C8ZpGQ1YEWDDQPHv3p3YT1
X-Gm-Gg: AYBFou1GBiTNfnDLNY/+g5o0kfCjWMtTrzQMWu8HY5MQeC36x85Ln6/cUnS9oZTBFM4
	NcPToL2kIABU7twya9PWrzmGWhvzGOk2RNZR37INkxi7DnEKrM9qrN4LAtV4lOx5+SPzG4u9mg5
	YEwpaVxqLkOczaxKyM1oO00JeCJhv6lqaeBAVFCITfXDqbXrGEutFLWnOasTE8kCAGqs7mO8ejZ
	bCCEmwgzTW/2j5aBdo8BJvqBMAuWZHxyM20WX4VRvBEzidRiA8NYQA7+2voa0Sc4ffY0ZLrJ9uh
	DDYrU4XnkmmZ1NvEkJVm4Nw/GzngHs2edAcpS1PjPLZLo+yLV9jIZ8bYcOZEBe7KP6wlq/1Uw5Y
	CkCbIsi2R+DOWENsNWRxu/um0vqboSMDEcwmMC3+nZGoBDq+co7u50mugh8kMKiA5wnZtTziJUz
	Yi7Pz/DUwucU2+aCeupM+UPCzjgbhd2OvH+mFTTFWjT9vUfk+sM/rMQKGBI/IJ5iINkY0gXZVvu
	bv+zklDXe57JN7Iphhzm/RcVt+1gzGEY6Br
X-Received: by 2002:a05:7022:b058:20b0:130:7246:10aa with SMTP id a92af1059eb24-1450404d324mr444369c88.12.1790206927261;
        Wed, 23 Sep 2026 16:42:07 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98209ffsm8100182c88.4.2026.09.23.16.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:42:07 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH v3 4/5] media: ipu-bridge: Add the OV02C10 26 MHz link frequency
Date: Wed, 23 Sep 2026 20:40:59 -0300
Message-ID: <20260923234100.318151-5-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923234100.318151-1-calliarifelipe@gmail.com>
References: <20260923144257.119076-1-calliarifelipe@gmail.com>
 <20260923234100.318151-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With a 26 MHz external clock the OV02C10 runs its CSI-2 link at
399.479167 MHz instead of 400 MHz. Add that link frequency to the
OVTI02C1 entry so the sensor driver can use it.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---

Notes:
    Changes in v3:
    - New patch. The ov02c10 now advertises the 26 MHz link frequency
      on its own (Sakari), so the bridge has to list it.

 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 77257311d..6548691b2 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -93,7 +93,7 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI01AB", 1, 400000000),
 	IPU_SENSOR_CONFIG("OVTI01AS", 1, 400000000),
 	/* Omnivision OV02C10 */
-	IPU_SENSOR_CONFIG("OVTI02C1", 1, 400000000),
+	IPU_SENSOR_CONFIG("OVTI02C1", 2, 400000000, 399479167),
 	/* Omnivision OV02E10 */
 	IPU_SENSOR_CONFIG("OVTI02E1", 1, 360000000),
 	/* Omnivision ov05c10 */
-- 
2.55.0

