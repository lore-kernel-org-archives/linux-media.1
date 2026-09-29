Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D643C09ED
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673788; cv=none; b=lasWrd7hmkn+eLzMj2o+iDM8Tm8xuIIkMvxj2q9TE8JFtswEHVe8y1zcFyiGapPsclJKbZzgxa22SMk7YYYfnSU4Cs/KijWoZEnu9kuH5aLuYJO4KBd/iM8xOXCN6zoN75zbxQSB0WzTAnuUMJys9EgZMGmpr1BGRRdknEsfSyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673788; c=relaxed/simple;
	bh=Yvv4offk/A3nngbeY4OC0TNI33ABSFCQo9LNH+QTLbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbG6ZYOtOt3sZ/OIKmdsmbCAFSKxQ+RVgXMJQZDejipBJPrO5P9Az9QRjpy5FV8WcL6LyLJHHcovocPxKA9kLTB8sTMi6gzeFN5mrNNGSvyWI7Xve6qHNk+UNrp386b0p6IYgixrUNVOpAPPWWfLRY8AoI1WfXWRHeROJ41tinY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Srj2A525; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Srj2A525"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a76cdef66fso1468131fa.0
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 02:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790673779; x=1791278579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yvv4offk/A3nngbeY4OC0TNI33ABSFCQo9LNH+QTLbc=;
        b=Srj2A525OvevwTMHidJmtVDgHePcc17wpKwTu3gLwrb0ogJezUQQllSydx7z9+OkLK
         qlNt7iHCr6Jgbbx5wxUppI9iDnF2fskOU1exXyqmQg3P/y7EtA4+VTudflh1HqzmaPTl
         4YbWc08UwAFSWExy2EQzjv+79EDGG2MBWX8KAFseIK3QHT4/bwmxsLa4bQsxBZEj2Ez+
         Be3i9IOJN5f1LGWkqByA7lWOhRxh6waKXf1tMC2aiNBs2wOv0t4BUqq2dumdGP2ajxEB
         eoPN5DXT9nuKoGHrHlpGuelrA8b7nv/I2oV2s27eyMq4zGGhkuTYYsHirG8ws8Fx1/1b
         0gFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673779; x=1791278579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yvv4offk/A3nngbeY4OC0TNI33ABSFCQo9LNH+QTLbc=;
        b=vkNckS8qX/zP4KJgt9gwy3djaVjADg7p4FPtfPdZWuTvJwHkhDqSraAsZ49BBfhbGM
         qKvT+O45IUgbg4g5LzKRjAtXnipymQv+bWv1RLURNvrkg9+nle40wzX8ERwAHB5L+BGh
         AM3F6haMdZJSJo7eILEmthXMVH08znv/T2m+cgUt1S5nhTmRq/WIOaxEGqltu/JmzYTs
         XAejwlYRLIjE34JcI0xiNKOEUpLagw70X7rhjGyMR4m8udfMRcwNgDZPSGIBJk0OsZqb
         ArpyJKipbKiqair3nWfJUKKzJlvTZvzL/wpN8ztGcN+LPvzcZPCPCPO2I10R4AOS1Fy4
         LOzw==
X-Forwarded-Encrypted: i=1; AKwUvBwneei/oCWWWkcw8p5vw1ozNwFMZp1UvgKJhiPpqQ0ZRM7uGPEuh+z5KhXfMp4E0kYGrMyMrhPU6vVqfg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJFUGo0ThD8CZppD/GFxKGxBZQ3EjpUnB4IyU5/Z+oaN3A29ytg
	gK32GP9Ypbe1D0cPpOm2q5bOV9W1Ha16TU9KWULpeHpu6EEQNVW4jpFe
X-Gm-Gg: AYBFou26/rDjL2Iip+FgryiiD9GEoVJOSSRYiLyVSnmgev6SyPjUkcsAag5FDUcbJ8f
	LCca15dJjxWrBedOgsYc4l1A/+5O0IivV/lCILLKtVMhbl+qJesZP9umxr72Igwz0dsN0Ucewa2
	+cN9HdSUD7c4GP3KFyh3LDoTAxAW7aXyU3uo3zr55kc+uJD/2RVDY0Y3W9s7qjQhq9aMQ1UX8bD
	fezEilOlXOFWoyKH0gZod/B69x3g5725PMZHEhArSkTKjzVwKqHzu28JGKaHWCvw4tYZyWWTj6R
	QeDSd+DPw7khCXveQvolSpK/536GFsUT4HSHuKQJaKtNjZWs9kAj9BBn0vm+Ni2c4Y0hgZ6/I+L
	4YS2tsuk64ERaX//kM6gL9iwS3ylUnsSD6svaYigaazI0Ur2J5nXYS9HQ/iVmHNJ3GC+zNZOLIC
	qxZk2RYAIw3iUFeX+W+8Nbvkmt1hvfsqoomYqDl2d7pZ0KmrRizPcjrbPq2nJj93A/RrUzmxVwu
	gc/PWIc40c=
X-Received: by 2002:a05:6512:3096:b0:5b8:ef88:d56b with SMTP id 2adb3069b0e04-5b8ef88d614mr3358193e87.18.1790673778535;
        Tue, 29 Sep 2026 02:22:58 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9d826f9fbsm1262160e87.12.2026.09.29.02.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:22:58 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pm@petermarshall.ca,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: Re: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Date: Tue, 29 Sep 2026 12:22:38 +0300
Message-ID: <20260929092238.1765758-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arY2CULvwXGyVvH_@kekkonen.localdomain>
References: <arY2CULvwXGyVvH_@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Fri, Sep 25, 2026 at 11:51:21AM +0300, Sakari Ailus wrote:
> Can you try doing this with the ipu6 driver instead? We're about to drop
> the ipu7 staging driver after some smallish number of kernel releases.

I wasn't aware the ipu6 driver had grown IPU7 support, my base was
7.3-rc5. Tested now on next-20260924 with the ipu6 driver and patches
1-3, the vd55g1 one reworked as you suggested: the sensor probes,
ipu-bridge connects both cameras, libcamera streams Y8 804x704 at 58 fps
from the VD55G1, and Y10 and Y10P stream with plain V4L2. So this patch
is not needed there; I'll drop it in v2.

Ruslan
