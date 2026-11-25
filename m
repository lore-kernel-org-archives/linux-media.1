Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604903;
	b=SDCt9SkBB+uO+DezUTdkve3y5Hh5JBxJHDmSXJ5DIUtDpltvT4WmlozHRwwNgYHxVJqL
	 sIFIaVcKnqGEgJCxq65Zsl9iJWUffQVSTADjuEkYpMBSCY+UNv/QUwJpb0zcfNpC9moRx
	 f4Ylhtsd7f9KUOR4kVDxU37cEgs+39hBTlBcVsd1ofQrzUIMgHQHSlUcQiNTJ/ep8Ug1l
	 kfMO8exhQZEGji1liSm92bjoYXhaYuIFnI42V9s/sud2PaXjMnBj3Kh3Z7Vp/I6Wu4wMC
	 DH8IhNzwxj+efozM/LOEnu8NkLecxUK0G5gg4h9a8r4y7t0vALZu85HzEGZp+oDgxzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pi1j4jPx9Xx7Gn8t2YcyKoLu1ip2xWWQfZpWKlKgfuA=;
	b=j+f32bos7YZhVS5IpbA+4Y95NggYZQfrPcEjbQkcJPL+wV5RD3sJpkHN91UzbJk3S3Ff
	 r5vUnqObct4wkYaI++9ElQ9kJGAE29tWbl2eI652IPdIhnBfGvsdQNfqfPuKnKf01oC5z
	 5r45SVm1hJGPY3QDZv1WHnYkb5Q6IBliZsecxN00tAiBmzQRaYcSN3ikEt1VI5BJWiyAW
	 URjt3gVd8vz6aL8PHZqv5q5kbcBme53sdNR05qDTNR7MrNUeSWF7mYJOnGZP1GHa6ylhG
	 GYHt3u9YS72LYzt1iIZLBxigr4nqMJLkdrA2o9PpCua8F8HwhhoRymUtLJ8EySR2RaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HNIiFnr4;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A47606A337
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A47606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HNIiFnr4
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c5126505cb3so723478366b.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604901; x=1796209701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pi1j4jPx9Xx7Gn8t2YcyKoLu1ip2xWWQfZpWKlKgfuA=;
        b=HNIiFnr4kYWvvinIi9eS5v1a7s4KzYoP84dZpIw/UT2N0xiLw5WC+TyHY82kEEtvFx
         l1cB9biakx/lkaaaVKgEibMrcDy01bjkHnJAqe2zBzZ9rJTkGBDLNTsCQ0KRiYNxJQ6p
         385JO+Oz6qiFIb7Z9OBuZjzPr7YRvDcED7d0YB8B87Qwk8wHfVRECUHDj6BJqh8gx6od
         KmOIcIwZZjzWwDGxfQhzewlNmvIHMP21m2SzDLm8iimepReIMkWNl/SV/XmfDHACV6y3
         pMcrmaIOPKMws4NeIWg+hDImK+vRhEuDRrVDCoJdZqsfTs98sf+lFdITLE+DnjeCaOmC
         TPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604901; x=1796209701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pi1j4jPx9Xx7Gn8t2YcyKoLu1ip2xWWQfZpWKlKgfuA=;
        b=UOldZfwHZmj0ejXw9Pr3G3sZR0dupWOgrQUmg3mWbPAqz+QXV5VgBAdWjI7s0VCrrU
         ZKrLy+EneD0YASd5qiaYhNHooGPIB6hGg9/Y4GnJgqnHhO+paVpsgapjEEbUnjQ2JPU9
         QQQPU6mg1lmCTJuK/+K/Agco1Ke7s8sgPqsRn7l4gUPZTsPY9UdqfXwjq2ghJ7SDa0Q2
         8CuG0ZxMUVpEKXlUGpHf0qa8mzOyAr0EmPp1IWoZ92x7w73JeiFFM/7+/0a7Hh4KTPAE
         jq6CzBv+x3Gcr7SZV0cyKPPS6VO2+7JdpqJ5qTR5ofChBBPEE1+2s4IUWRzV5n+tNh3l
         5SMQ==
X-Forwarded-Encrypted: i=1; AL+hErFgm1P5aWWMkIfvDkDQxr2Pq6MJkJqYgH/615vgxPg679qaLQIsRc0UrT8ejeKoXUJjquwfFBfiDgnl4Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/jUlMn5Z58hIz5qIPTHdpoJ3f8KrQetL2dAKlUHFCgEkxzKi6g
	P+7I5L16vG2VA3oeb0/JsB7FzwL/1UxrWFr5iNqnVF8Rdb6E89lTCKJx
X-Gm-Gg: AZFdTZciSM9k20a+QTpPq0dIzueQ1F4MmIEbgrf6+CmB5nfaHl6naEfUhtPUkQL0uxG
	8iPAvaAIAXlWkgskTPL+katoN0NCUjieLvu9OyC+oZ6Uo3V59mT6y0oZPif7ulwRh+80if37QkC
	8mWfEybdon1u5+RFLOkkCCJ4t2LrU7P+IAXlOyb8X8QJT1EVGxQR2KpvDywQEfS0Knu9QItdBoL
	EKfUqU11kPKurXGhCWnunuf66Vvp/KbNp/FD9MBRRUKhBxu1N80ZTtjoAdbt5Tgtb8VVkkzieS/
	wTIBEUs++Q1eVLaKnOgU0mdw0MXxh8YrbqITJQEHkLSoNFcz2YAoiX9szhKB7UBGLKxNzRGW37Z
	Fx2A8MetrYd3LxR0jGkaUZi3uW+CZSwYAaNVJoptzAJxKjn1gdkG0YLzhV01/wADHDoOIkqePPN
	1WM8wFWg/lAJn3jioMP68eCx9IomQmJcaLUSV4jPfFcW4Br2ZPSFHlQXERXiFqoPZfH5CMcnl95
	F+UpB6xlmZgj0iMXjAX+8UXCCJvEQqqQvxQ/Y3pIvb3reCci14jIIA/qjse5kzBsyzSK5HmlpQ7
	cFC8V/466SdXLP6sQOyfi01TcqufpdvyFiphTQJOblTkkGpS1ianeDsqD6IyjyU8ZJ5TjFNAgsA
	/LnF5dvobrw==
X-Received: by 2002:a17:907:3f05:b0:c41:e0c0:e6b7 with SMTP id a640c23a62f3a-c513a99a69cmr1283264866b.12.1795604901175;
        Wed, 25 Nov 2026 03:08:21 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:20 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 01/13] staging: media: tegra-video: Move driver to media/platform/nvidia
Date: Wed, 25 Nov 2026 13:07:38 +0200
Message-ID: <20261125110750.223628-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125110750.223628-1-clamor95@gmail.com>
References: <20261125110750.223628-1-clamor95@gmail.com>
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
from staging into the media subsystem. TODO file removed. Path in
MAINTAINERS updated. No other functional changes are introduced.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 MAINTAINERS                                                  | 2 +-
 drivers/media/platform/nvidia/Kconfig                        | 2 ++
 drivers/media/platform/nvidia/Makefile                       | 1 +
 .../media => media/platform/nvidia}/tegra-video/Kconfig      | 0
 .../media => media/platform/nvidia}/tegra-video/Makefile     | 0
 .../media => media/platform/nvidia}/tegra-video/csi.c        | 0
 .../media => media/platform/nvidia}/tegra-video/csi.h        | 0
 .../media => media/platform/nvidia}/tegra-video/tegra20.c    | 0
 .../media => media/platform/nvidia}/tegra-video/tegra210.c   | 0
 .../media => media/platform/nvidia}/tegra-video/vi.c         | 0
 .../media => media/platform/nvidia}/tegra-video/vi.h         | 0
 .../media => media/platform/nvidia}/tegra-video/video.c      | 0
 .../media => media/platform/nvidia}/tegra-video/video.h      | 0
 .../media => media/platform/nvidia}/tegra-video/vip.c        | 0
 .../media => media/platform/nvidia}/tegra-video/vip.h        | 0
 drivers/staging/media/Kconfig                                | 2 --
 drivers/staging/media/Makefile                               | 1 -
 drivers/staging/media/tegra-video/TODO                       | 5 -----
 18 files changed, 4 insertions(+), 9 deletions(-)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Kconfig (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Makefile (100%)
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
 delete mode 100644 drivers/staging/media/tegra-video/TODO

diff --git a/MAINTAINERS b/MAINTAINERS
index c00d3612c9acf..3f391f0b61391 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27903,7 +27903,7 @@ F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
-F:	drivers/staging/media/tegra-video/
+F:	drivers/media/platform/nvidia/tegra-video/
 
 TEGRA XUSB PADCTL DRIVER
 M:	JC Kuo <jckuo@nvidia.com>
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
diff --git a/drivers/staging/media/tegra-video/TODO b/drivers/staging/media/tegra-video/TODO
deleted file mode 100644
index c821081668942..0000000000000
--- a/drivers/staging/media/tegra-video/TODO
+++ /dev/null
@@ -1,5 +0,0 @@
-TODO list
-* Add support for Ganged mode.
-* Add RAW10 packed video format support to Tegra210 video formats.
-* Add support for suspend and resume.
-* Make sure v4l2-compliance tests pass with all of the above implementations.
-- 
2.53.0

