Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586724;
	b=p9hC/q3ecqlfw6WJ0FCh9YrsY74JgD4O4pYFOoXhxw4F0mfd9Dnhrp4FNZoZhgaBabny
	 4rjE7rI9sLkHzvIfywRhiPYGxHpivuBtJEfoBwYhilRO58nRXWqI8jT7pOqVPZi2zk2O9
	 k4kTmZ0mf0cjI17o/KqwZOYNtihSMugEdOt+Lj2Y+dOCTqmLltinBqe5nJh37KAwnDhof
	 iw8tes33XbMZh6l9iJP4xN1c51MyWVZ4EhpLSsfjnFeq2CeZ7nLh1tRrpPYBvIjQWokjh
	 sPLq8zypbkgtobao9kwyvX/QtxRWVx7+hJDIpol6bqR/vERyHmiN98X5Qj1pSjkSjXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qfj6AebNSoU7jDJj6yLYm/vf9mSvU/jdtYeDUnTclVw=;
	b=GHv69lPNK05d0sDTGtZ1EuOjCyEt2zl/OFWgohmEi5yD+z5a8JW6Teh5rbpbymIVwr6R
	 irdzKRq9FcAH8/qqLZSlGTqbFfB0CIf8ujQe3WJ9i1ua9fwixdv363MIegGzkJnJliZ03
	 cL9iAz9qtXuWTsOyZTFy3nOMHUCMCr0w9bYZr4QHrE/1xOB+qq68SKlJbL6UmFxhbOSOw
	 pxCKnbZBXGEDJhG8f1nBCCw0MppveaIk766GGpeeyzFuIeO0Ei7JA+d9U89iTfY3AFrP/
	 Atoe+m2zumcH0KzyPLKcUrUnYYmox1NJAUVSf9v2ZueSg6BIURGe6aMR/JrBrBYFJew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW2CnBlh;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8FD606BA94
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 16:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F8FD606BA94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW2CnBlh
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so216100966b.2
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586723; x=1795191523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qfj6AebNSoU7jDJj6yLYm/vf9mSvU/jdtYeDUnTclVw=;
        b=zW2CnBlhNSQR9WbPdvEY1nHu1vpXRgzQpeR3yrSN56lUcI/pZtxdjas+HtPIm8XqSi
         TWLFOUCYOewkIUmW2iDbvQqCgJlMgfAMOSKE952+2yWhLejL3RNKCzxB5HXiWMo3suYe
         DxaAY1f6GArbgflFx9WoZ9OgvZoAFGxLgpfKnw5hhHe2MgJwokbZa+MT0/+zguSndgAL
         vCfISVMh3jXLRcjuy87D8WpSH63Ytc561VxNc4Jfq0JVA8ZTyd/XQdPwEmqMzaNWSFQ8
         9QzMVOHV/mFoGCmeCUGg6tLdmUiT1YZ1hdA52uOQiq1E+j6/tEtuYncspeHZjPIp02kh
         6vOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586723; x=1795191523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qfj6AebNSoU7jDJj6yLYm/vf9mSvU/jdtYeDUnTclVw=;
        b=g1k8Z3mJo0nWwpJZ4bIR974htRAhpzinIH5Hga2OAQivKfDacp/UowWrSfSR2vFYqd
         Rdom0lOwtVPbIhWGJqCYXqZwMsAHLGGTvZsOFsXTTVoPXVhHrrLrbol5CnYEXUtMgB1A
         lGrzxzFa6p58BtHWjKTKDXEcIlBWZNNQ+Z7Ck6Vmx0mJCzDR5y5iUBLM2st0vfXBBxcQ
         LCXVTp7JBlmK1bqiGrK+f9LbWvYD840+ZIwhZqFiG27fyWY8w6uj9fcrSO4Hk7fa4Cop
         qnCf2hUFfGcT4quGLVb/UD3Kw6XJFFzN6Z2ZYy6v4uP5T3JOQ9w5/F48JFilmin2wkTh
         OmwQ==
X-Gm-Message-State: APuU4Z8rck95LMGNlYNVVhkKzWYMKwJdCVBg1L6qkxO0vGDsl8D16Via
	iuldwUOeQBgK+eCUwrNI4utdU/YCG0p4n6xEVyZwD5EMKJnXMnZE7jmP
X-Gm-Gg: AYBFou0K1fn1Z7GczHjhjmyiFfe20V8759oJsTegPxCMCeC9mSr3J/rrzcQx0z5pZFc
	7a5Lzv+BsbMdngupVImGzSxB1wfQLxs3AZyYaktgPVrYNgu7RbyV09Thdu6Y8SG7mdD7H5IJz3L
	m1vsRtF1u0Y2BmqrNYu0MAcSTalJJoHo43DIGt7lzRGI8yO02TGZ6zxpyBnLtQDeupZ1aL0Sx+U
	rUIQoc+ExXay8DTUAgMiv+hnXQ92meUy+o3QyEbLTBQoQVNMuOZOZKbcD4z8SGQoFNgNYyeDgAi
	iogS9ZXj6DIwQEjJ2l4Mlda2wW2LO0p+g6i6UCwEpX1ha4Dmim4IHGWcewH3JxT2Zj3VqHoSFvQ
	6R5NNeyM3Fl17HlJofw1+/ccz/S/jJk2jD+lDNi9kngWXA2tgdc/w03wOleo7sYDnlaKEZGRi9x
	QyGB/UDZ6jsMWvJej1Y0aj0Oj1EofErl3c5KwX6eiamG0uD2SxQa8TseCnfgkICwb4JDHkd5hF2
	tD5bja4KvOa+WD1N9m9BAuyQ40rWmflW0OVBTbvIVjknAGkiiBv8P16qo/N7ajF9d+3FZl3dwSo
	PWc07o7RilaunPpoL6ZH/k5xPESO8wRKkKXFLWpByH+yETJs+2GxKJRj4Ewh/Jym8Y0GKAaLVwj
	ptcibZ2Uz6w==
X-Received: by 2002:a17:907:c06:b0:c21:9b4b:2690 with SMTP id a640c23a62f3a-c5096328858mr256085866b.17.1794586722589;
        Fri, 13 Nov 2026 08:18:42 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:41 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 01/10] staging: media: tegra-video: Move driver to media/platform/nvidia
Date: Fri, 13 Nov 2026 18:18:10 +0200
Message-ID: <20261113161819.36847-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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

The Tegra Video Input drivers are mature and developed enough to be moved
from staging into the media subsystem. No other changes are introduced.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/Kconfig                           | 2 ++
 drivers/media/platform/nvidia/Makefile                          | 1 +
 .../media => media/platform/nvidia}/tegra-video/Kconfig         | 0
 .../media => media/platform/nvidia}/tegra-video/Makefile        | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/TODO   | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/csi.c  | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/csi.h  | 0
 .../media => media/platform/nvidia}/tegra-video/tegra20.c       | 0
 .../media => media/platform/nvidia}/tegra-video/tegra210.c      | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vi.c   | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vi.h   | 0
 .../media => media/platform/nvidia}/tegra-video/video.c         | 0
 .../media => media/platform/nvidia}/tegra-video/video.h         | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vip.c  | 0
 .../{staging/media => media/platform/nvidia}/tegra-video/vip.h  | 0
 drivers/staging/media/Kconfig                                   | 2 --
 drivers/staging/media/Makefile                                  | 1 -
 17 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Kconfig (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Makefile (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/TODO (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra20.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra210.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.h (100%)

diff --git a/drivers/media/platform/nvidia/Kconfig b/drivers/media/platform/nvidia/Kconfig
index b211b46877f63..53f34308f5aff 100644
--- a/drivers/media/platform/nvidia/Kconfig
+++ b/drivers/media/platform/nvidia/Kconfig
@@ -3,3 +3,5 @@
 comment "NVidia media platform drivers"
 
 source "drivers/media/platform/nvidia/tegra-vde/Kconfig"
+
+source "drivers/media/platform/nvidia/tegra-video/Kconfig"
diff --git a/drivers/media/platform/nvidia/Makefile b/drivers/media/platform/nvidia/Makefile
index 428415ff83de1..97a94b60fee93 100644
--- a/drivers/media/platform/nvidia/Makefile
+++ b/drivers/media/platform/nvidia/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-y += tegra-vde/
+obj-y += tegra-video/
diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/media/platform/nvidia/tegra-video/Kconfig
similarity index 100%
rename from drivers/staging/media/tegra-video/Kconfig
rename to drivers/media/platform/nvidia/tegra-video/Kconfig
diff --git a/drivers/staging/media/tegra-video/Makefile b/drivers/media/platform/nvidia/tegra-video/Makefile
similarity index 100%
rename from drivers/staging/media/tegra-video/Makefile
rename to drivers/media/platform/nvidia/tegra-video/Makefile
diff --git a/drivers/staging/media/tegra-video/TODO b/drivers/media/platform/nvidia/tegra-video/TODO
similarity index 100%
rename from drivers/staging/media/tegra-video/TODO
rename to drivers/media/platform/nvidia/tegra-video/TODO
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/media/platform/nvidia/tegra-video/csi.c
similarity index 100%
rename from drivers/staging/media/tegra-video/csi.c
rename to drivers/media/platform/nvidia/tegra-video/csi.c
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/media/platform/nvidia/tegra-video/csi.h
similarity index 100%
rename from drivers/staging/media/tegra-video/csi.h
rename to drivers/media/platform/nvidia/tegra-video/csi.h
diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/media/platform/nvidia/tegra-video/tegra20.c
similarity index 100%
rename from drivers/staging/media/tegra-video/tegra20.c
rename to drivers/media/platform/nvidia/tegra-video/tegra20.c
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/media/platform/nvidia/tegra-video/tegra210.c
similarity index 100%
rename from drivers/staging/media/tegra-video/tegra210.c
rename to drivers/media/platform/nvidia/tegra-video/tegra210.c
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
similarity index 100%
rename from drivers/staging/media/tegra-video/vi.c
rename to drivers/media/platform/nvidia/tegra-video/vi.c
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
similarity index 100%
rename from drivers/staging/media/tegra-video/vi.h
rename to drivers/media/platform/nvidia/tegra-video/vi.h
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/media/platform/nvidia/tegra-video/video.c
similarity index 100%
rename from drivers/staging/media/tegra-video/video.c
rename to drivers/media/platform/nvidia/tegra-video/video.c
diff --git a/drivers/staging/media/tegra-video/video.h b/drivers/media/platform/nvidia/tegra-video/video.h
similarity index 100%
rename from drivers/staging/media/tegra-video/video.h
rename to drivers/media/platform/nvidia/tegra-video/video.h
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/media/platform/nvidia/tegra-video/vip.c
similarity index 100%
rename from drivers/staging/media/tegra-video/vip.c
rename to drivers/media/platform/nvidia/tegra-video/vip.c
diff --git a/drivers/staging/media/tegra-video/vip.h b/drivers/media/platform/nvidia/tegra-video/vip.h
similarity index 100%
rename from drivers/staging/media/tegra-video/vip.h
rename to drivers/media/platform/nvidia/tegra-video/vip.h
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 644aefdb9d41e..8a5f6dcc49adf 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -34,8 +34,6 @@ source "drivers/staging/media/meson/vdec/Kconfig"
 
 source "drivers/staging/media/sunxi/Kconfig"
 
-source "drivers/staging/media/tegra-video/Kconfig"
-
 menuconfig STAGING_MEDIA_DEPRECATED
 	bool "Media staging drivers (DEPRECATED)"
 	default n
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 584720e91327c..b8d874766371e 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -3,7 +3,6 @@ obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
-obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_INTEL_IPU7)	+= ipu7/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
-- 
2.53.0

