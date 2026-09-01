Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F8D4A0902
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 19:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289491; cv=none; b=H+GhUn0KpBXMMkASFHeInUk3T1eKBxxcjIE8M46364aQv/35/k45UWD+NmLWhDYcFP24EqHe5kPm719/sXfo358+ZM6Eb51YUOsLfnPOwF6X8akoja5vzmtLceJGMbooqcjyqp80P/lmxIuDzngHvHQ2na9CHZ9FUmOREOaAyOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289491; c=relaxed/simple;
	bh=GY/0GwAYKkdGCB2mGjNb9iNJ3uZoj4B7s9rKLLBlD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UytjuqvP3yThnG7c/HC/hnLFqdyRrF3sKvFnvnNlyAxKxGvioEYw3FLAr7F2TBx8GNo7+bRWCtl+MrVU7whQxvxRho75a0eg3JDwQRtlkaCGc0Lx+CLGGu1zI0Zw1NK5qDN7xoQQxoq0URPIDCHj+s9Mp2WtvbC8r346YS/CbGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XA2Qxap8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XA2Qxap8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b9320423cso1663975e9.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 12:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289488; x=1788894288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=XA2Qxap8lp9eMLlFDXMHRYbohfJwxvynQ9UuW+5EI5uSTdu6hg0rZ+yNA/b9b5PVIY
         2FqsEFS3ynWifjtN0dOO7BbtAe1j5+guT5iUkOlKnXASFElpMbYDu65XMnT9co0Vnh2s
         qSHsQKV6UIP6MGPyAfeZw48Du4CfMdM98y0kTl5SLqEUUz5rl4o0tB9UNYFNgJumeKjQ
         /BdYGL8Hgd1f82RQIbmnk446n2t4MPc70fvl691g1bqEraYpAXmKgopHez3bQcmjzYjI
         1W7EsOAlBIMYofxKjV9A7IJHsrX3k8XY6YAfX8TR2HWox99IJJNsZxrbODXPbl4O+1Qb
         cqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289488; x=1788894288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=YiChOjNAC1GGM1UV+OYkLO29MSXp0RKb0pGPkbaA35h8qcQUkbBCIjGjKjTyY3f6df
         +GjSLoVu4UB2llSF6z5d16UR7ni9zsKhntAzjX0Vt6zpg9pruLrKSPlFCr7HN15UspNM
         lJNgJNCSDdG8I6cH2B87gpxzZWpTPM+aoP4tP7nyqA/20a3jZh7QuKeNUUmBCd71R8l1
         KcaAtEYKjMpyCOeT+5LPOg82Bp7N4pnWsSO85OS02p1Z+MVi5Rn0JBTVQHHB3FOax9Xy
         5FnqxtDBJjwNpetvQaxqMT8++ZDDN/A+497jlK8QLF0605+adyi36a/LSBtzTfVAx1g0
         NAXA==
X-Forwarded-Encrypted: i=1; AHgh+RoDA1m6Es4LK2WSSRnFtV2Dk0A+ORb/uLy/wWTXY2yta+DsmTS9eanJJv21Rq6HuF07IRVoKHWYmcmlww==@vger.kernel.org
X-Gm-Message-State: AFuF++mD0TEzCpqYttC9cOqha/tVflRZnixVOptKFVTohXgdHgTGIKoY
	soIDeO4kwromFWt0VZjroVNrU+2Liiz0R2zHSFIR6UfpDyLJVfqqMkLR0cTp7sK6weVrgw==
X-Gm-Gg: AR+sD13/KY0C7VG6KnGN3TQPYMt963jpU3zXuAV5O6vHqCMy1vSVY/8wJWeYiepPtj9
	jFqN84ovnFQvPt3GzwtP/kzkkROa4iTWmov2bzsVdvCof/p0NqTqyzppLQY47QWbx967NQUJECE
	zF/oACtGWTETy5anlSyjwP0dYfJK/Kkv6f+JgGw8e9h/sxRS/efDBdAGsybDIsLoWz48kIFhKJI
	HJuCwqHQ5FCasT6f8k8jHiVR52h3hPBlYInBNGAqhp/QzeoTz4tOtBMCMyaNadQbpRjdN6S36zu
	6h1iUHZjaRq3v2Fd8SzDfHQzGA90N4nTFVmS/XYrCl98vns1wrZb8PF0LTpZVH/zLvGxN3l/KdQ
	0a2njBo0S61zTQHDVBkhi3C3ddHQPGp7iU/2/rhvYwHiDYkCo4fAQ/2Epb1Jt/bWMksOvYIXI3D
	aQpRDX9TrRyCdge+CivqLWYH8Lc3CPCscd4jxG7Zh8orN53y5vNlY27/aQs712VXsOX+wXLAvX3
	gOt8vgpPYnBXYYp6QLiTENZE5QRr3IZxELOFotTIA==
X-Received: by 2002:a05:600c:4747:b0:499:dbba:9859 with SMTP id 5b1f17b1804b1-49cdc57bf3emr158663635e9.5.1788289488556;
        Tue, 01 Sep 2026 12:04:48 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:48 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 04/16] media: ov2740: Add OVTI2740 ACPI ID
Date: Tue,  1 Sep 2026 21:04:26 +0200
Message-ID: <848348bb4f153d165e8c47673c62464133fdaf99.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 8f0ad5dbb245..18bb3ac9701f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,6 +1462,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
-- 
2.53.0

