Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D8A3FA5D0
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 14:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420871; cv=none; b=n/r9SDrwW8r8+TF93fAuTQbmKT8tetvDl3dZdWWTMMDR3hQTPlbHaqWj4dc5SaiyvucKIhiael2YDj39fzotPSvLr1zUOB2o+J/7P9dYCLGqymvxnjAFyel9NKsa1YU2BCsBctHxyafpvZh2B+VAzuOcyO04xy6T1EzQHI83vDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420871; c=relaxed/simple;
	bh=LspIGlkC3utLj9KX4g8wOTce1r8t63CuDZOUtaDFN7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u7j59Tyxf4oQTwut/8Cs8kuV0UX90kKEfQmIxaCprZdu1PPugWyR89qCVAqoeX7c+xrHd8OeVmJGqzL5vuUcfoa2KTBPVeb0/mBWhAo3FciLJFTZdLnRvMIpqcn13yViOgqwo0PZbIsWiFIxA7PASGR08VxMIm2+pR5jfaSqFxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFkT3+O8; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFkT3+O8"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-526f963372aso15765831cf.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 07:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785420869; x=1786025669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vvl0B22iyf4JoKX6Wbp5Bnx4itJ6Qb6rU8IYcuIBjYI=;
        b=XFkT3+O8DJAfOnwWLNQltMjqba7yUUsDckoKdAPWCsNyml+LJPNTDJWNBdHbA2sc9Q
         aT7xseeBw6bb9byBhf4MhRH26YW7fm+yqW0S6AdsSB556a72izxpMfG5Ce81rJcN38QL
         5A2Xdp5ehzrBYhJ6jblNkHPxV7hG3ShWoI3t/eMhK2P3F8Ho8NO/modT3fxMYtmk8w4K
         z8HRI8UdxMulOrFylz5vPtx6C1C+9paqk30KPG1ORhS6deqIBH+iI4tiyQmpDw1VcLpi
         vmJ8Nc0Lg31Tr2N7BDWBLsF/a4IxJfLfCaJii97fGv9IDCkchkyD2fvle4DEa4PkvN1x
         2XsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420869; x=1786025669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vvl0B22iyf4JoKX6Wbp5Bnx4itJ6Qb6rU8IYcuIBjYI=;
        b=mliFXX146KhEa3nhu/G+ntiZq2PFyJoNtYWsSJpMYMKj75Kv5MWPVcB0Wv8W3xvgdO
         2axVrFHfO0dU0QvmqHJHpdBsuGs0+04CfzEMhIRLHRMP7Hbux5B6EGY/PprXwVKNUloP
         Wea7eBdfF2l4HGzlvDQHB27CP8UT3xZk7+vc3eHX0At5n/REBA7Icaz8VqBtRCUSEPAk
         WBOzCeOXiAiPfzovjPwDhHSOherXth4FY5gnBKcxyQGrdANSsj3bx3r4EaS7oJMrr5FP
         xPqDdZk+oBW/5ARmaw2CY1ZI0GV41qwSLz+ikbZFvyH3l710oSG/Z4zAN7scHcO5QdpT
         Sc/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrD/9lY3eMaOVnWQdFCcPfqUHWK97mK6lugyxc08ezSIKYhhR1jhVJbVYogss5ef695O/Ft3792Cppmbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu3n1VGttfqWrtccuEzwbxXOKi2T5l//GYl3zhnmRZoUNC1wo+
	vhTmjxnnidquv7gwrJazDocHVbHxShDDCkxl1GCVlhHC9va7sl3uXSdZ
X-Gm-Gg: AR+sD12UKMpYfcyRPZ4aQOgKGk/lMw0wzCvNrc19/XYjvswCiR1qM0x4MF64JKmxxHV
	zfja7Ko0mBeViaHP3EBQPy9yR7IQThvlGSonba7yIku+cbm4pWk4NrvJZwFDXh7ruHz43fkw4vM
	ZEpZUdum1MbIJkEDHgwPmi2qhf0xv1IDIASoS42SNHh54nIOPCr87p+lvdFYxISFQPS6JkzE3sf
	S6zEt0fv2+TJ//dR6Q4LVeoLXYKZciBwa0kuhBh5433YSmfUkwot/94AixZ5KWNUtIILbbhwgz/
	5Z8jQE/dpJSLwpXuyFhZZRDu9bhRs3tAghGSVicEmETRtLTjaOaR2nUft89INkVvdnmDbE5eiVR
	Sd43962gKLP/kijWzAS2DuggeL/Ws9/yLiCWh5xVPj2pB4gD8ufGS6NcUkq2GzP7N8Q5qONJY9J
	bVbTarBFsNz28JY5Ig0LV8paAKrCnfltdcJUebt3sDohBEArgopES36lOWseFVYgVc4WDSVr7GL
	pqZHcOmVhDSKrPzyohbpRC4eNAqpCDuRbk5z7q6S3pAY2mDu7b/uio=
X-Received: by 2002:a05:622a:1315:b0:51c:8432:1753 with SMTP id d75a77b69052e-52b384b2072mr29687141cf.30.1785420868526;
        Thu, 30 Jul 2026 07:14:28 -0700 (PDT)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2ff6f31sm41998101cf.27.2026.07.30.07.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:14:28 -0700 (PDT)
From: Yifei Gao <gyf161023@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH v5 0/2] media: amd: isp4: fix error handling in isp4sd_pwron_and_init()
Date: Thu, 30 Jul 2026 14:14:02 +0000
Message-ID: <20260730141413.4136502-1-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728190754.363464-1-gyf161023@gmail.com>
References: <20260728190754.363464-1-gyf161023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the error handling in isp4sd_pwron_and_init().

Patch 1 makes isp4if_alloc_fw_gpumem() release partial allocations on
failure, an independent leak that was previously masked by the deadlock
fixed in patch 2.

Patch 2 reworks the power-on error path into staged cleanup, fixing the
self-deadlock and, once it is gone, the runtime-PM imbalance and
unpowered MMIO access. The staged path relies on isp4if_start() cleaning
up fully on failure, which patch 1 completes, so patch 1 comes first.

Changes since v4:
- Made isp4if_gpu_mem_free() silent on NULL entries, which are expected
  during partial-allocation cleanup, per Bin Du's review.

Changes since v3:
- Trimmed the commit message of patch 2 per Sakari's review; no
  functional change.

Changes since v2:
- Added patch 1 to release partial allocations in
  isp4if_alloc_fw_gpumem(), as pointed out by Bin Du.
- Patch 2 is otherwise unchanged from v2.

v4: https://lore.kernel.org/linux-media/20260728190754.363464-1-gyf161023@gmail.com/
v3: https://lore.kernel.org/linux-media/20260728141659.62310-1-gyf161023@gmail.com/
v2: https://lore.kernel.org/linux-media/20260727183500.298036-1-gyf161023@gmail.com/
v1: https://lore.kernel.org/linux-media/20260725203640.915626-1-gyf161023@gmail.com/

Yifei Gao (2):
  media: amd: isp4: release partial allocations in
    isp4if_alloc_fw_gpumem()
  media: amd: isp4: fix self-deadlock in isp4sd_pwron_and_init() error
    path

 .../media/platform/amd/isp4/isp4_interface.c  |  6 ++--
 drivers/media/platform/amd/isp4/isp4_subdev.c | 28 +++++++++++++++----
 2 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.43.0

