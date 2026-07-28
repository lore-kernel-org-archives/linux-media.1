Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414ED430CE2
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 14:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248243; cv=none; b=e7yIHuJqeNOZOaU/FXUGaNjEcJviOYVC7Mkqjc6lFyxV7xd6lZeJD87wux/Kx6BpnvjLsaG7IFL/qEWTGh6AfBtF/CX97dSUbHvqn9LPdOjLrxt3MnFjTzAOU1Xr/8nvVuXSU3jV6kM7FyKTBPNd5e6kFTHT/ZFzcWj0d2LA4dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248243; c=relaxed/simple;
	bh=EdVkFbtpplFmnucffU6hGrzDkhgdlpdINMGBgZFsL0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9F5ufKuFeBuf5t7TPrwA1LHNCfkjEX8iLfWS6wlRDMx1lIcnEskFa2Nckm49ZXEpCDUSQZxW2cUeBdOYUp0REfZPjYtcluKKeT+FjDv2X1tL7/YcX2WipT0uERajSkmAhRKXbBSNkf+6waRmXJQxcE2McsVPYalSPXZj1mfmCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoryMx/O; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoryMx/O"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8efec2c28f8so26456396d6.2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 07:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785248241; x=1785853041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCAZLkoVBQcESsb1+bFs7MFWU1Mwcnz5Qa6bnHCVZ/w=;
        b=VoryMx/OalvbWiGg+8zHiBB4b6nsSJSbsByuZUbZK8yYCgaREHfnGziQBSxBzsJQSn
         bsZGVF7WrNLfMNYVMXbrod4Vw0/xmkkrHik69PojNH/AqDUqGCrjoBBVCrh61SUg6m6r
         MsuQPW77zcYMfNKLO3ytSM6ZgWzwOPME8l7J8b3D4FAxzAWylO2gvrlrVxaIh9/tZVYe
         8ZjT3koSg0r46q5W3NnOZBX64glvFqYrCH4C+6x+YJndO0uDAu9gMSsJ7KHq65KeuFoe
         OCA/+lBep27k0UN3vQFtE+0wNuejIuBBhFKz5mBb4DQuOd1mJ6F4LiiWfoRmkyYZxXHH
         HBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248241; x=1785853041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UCAZLkoVBQcESsb1+bFs7MFWU1Mwcnz5Qa6bnHCVZ/w=;
        b=ROI/9d0Em/Z8OTem3OEvGfpgll4LWAjU7i/NsF4Or17bxL6UTgqANVHHqpcK4EieUz
         /LP3kfXaAkVTEnvk9j88Zvem3YbKfMK5B+EPdUn7t4XuQjes9HSPmVUKjidikqk/zSAa
         F0FF+8mbt8f9G4YHzyZ5QJObuOBKZ/sNnYDVaa0oyaPJnFq211N0XlTkdRh5fLJUbNt2
         /oThsZ3BP5wwKZoZvxTDJien1rvGSLyLqdH1CEq5aul+WCLoJUc6Z+d0VJq9DA4wNk0k
         QRIbkPftuHaqM+KpHH0XXmRXYAoHFyjVFDAQpaaQYUuTvnHS7uLECSSn/1cJufXYgUop
         l0KA==
X-Forwarded-Encrypted: i=1; AHgh+RoCNOOXrZTuPAx79Gu76h6cT9dfVwkNlUoPHmG9LHLfq7EiuJbKzETYZRxHb2ALHV9fkVCi3zxujHHWpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLOPBoSUPOkMy05Gu2NLG+omwIe5qSZm+bog7lV0sdQ/gYRshA
	NivnvRzI7ku8GVZYViykc2XruJWW9uU+GYwmJolV95VZd81qfYN012mD
X-Gm-Gg: AR+sD138buEit9wqWhsDKlmnsrEIDkmfJGCux7ETzhmYhxdmBnOBSFyWyqtzxFSqkgJ
	MEDOMXp6j8hgXOYLoz6xmYsgBrKnLZOjJqV99p0qUtdTc6lcpvj5Tf9y5LOZfgl1Kr4B13a4Lq2
	4uIEWgwt/VERMQSOdsFsn8IWjt3KerJj2NfGcd6Hg1OaQzVj+Geju3xbBxY78imnsCZwbbmpBnW
	yWOsvBfJWbIvEGCy4dFbDiUlhzB+wRPHTw39Eg82dN2aAlQQ4VpbcHEQ5DxUvwQHilm8InNsiHk
	ZzKh3uiugIxlOgt/CmFlI/cl+xEcDawxLfuTX2sLf6WNVyvBrbPJcGedXM7LL8z9lAq8iX/CGbz
	9yYSXuoaU2xWdUUM5gGxCEiCRnVYiZ86xtb5gG0XirdjAPGMUr8j4KezvV8utwtk7c09tRxoQLZ
	wgFjNgUh0nvkWcapgruLuThNXv8duiF9X2cgsYzl2gIjN6enbcksMrf8GJpResHd+1ddo=
X-Received: by 2002:a05:6214:4017:b0:8ef:5103:df9e with SMTP id 6a1803df08f44-90816f64b6fmr28948866d6.8.1785248240970;
        Tue, 28 Jul 2026 07:17:20 -0700 (PDT)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dd3b56esm85856d6.26.2026.07.28.07.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:17:20 -0700 (PDT)
From: Yifei Gao <gyf161023@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH v3 0/2] media: amd: isp4: fix error handling in isp4sd_pwron_and_init()
Date: Tue, 28 Jul 2026 14:16:48 +0000
Message-ID: <20260728141659.62310-1-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727183500.298036-1-gyf161023@gmail.com>
References: <20260727183500.298036-1-gyf161023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the error handling in isp4sd_pwron_and_init().

Patch 1 makes isp4if_alloc_fw_gpumem() release partial allocations on
failure. This is an independent leak that was previously masked by the
deadlock fixed in patch 2: the thread deadlocked before the teardown
that would have freed the buffers could run.

Patch 2 reworks the power-on error path into staged cleanup. This fixes
the self-deadlock and, once the deadlock is removed and the error path
actually runs, the runtime-PM usage-count imbalance and the MMIO access
while unpowered that were previously unreachable.

The staged error path in patch 2 relies on isp4if_start() cleaning up
fully on failure, which patch 1 completes, so patch 1 comes first.

Changes since v2:
- Added patch 1 to release partial allocations in
  isp4if_alloc_fw_gpumem(), as pointed out by Bin Du.
- Patch 2 (the power-on staged cleanup) is unchanged from v2.

v2: https://lore.kernel.org/linux-media/20260727183500.298036-1-gyf161023@gmail.com/
v1: https://lore.kernel.org/linux-media/20260725203640.915626-1-gyf161023@gmail.com/

Yifei Gao (2):
  media: amd: isp4: release partial allocations in
    isp4if_alloc_fw_gpumem()
  media: amd: isp4: fix self-deadlock in isp4sd_pwron_and_init() error
    path

 .../media/platform/amd/isp4/isp4_interface.c  |  1 +
 drivers/media/platform/amd/isp4/isp4_subdev.c | 28 +++++++++++++++----
 2 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.43.0

