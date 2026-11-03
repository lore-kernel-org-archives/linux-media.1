Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721213;
	b=zKDSaczMXE7wqjYbwxdiqhV6F5FjdHYFoPOqzMpsHSQhlxCK3+3k1qELKDI+QZd5MK2Z
	 IFooOttkiqVsbOwXHGc8vXFag0Xrxy0msFGdQSSPiJA+81uWpU6VB4AxnW1IMTFTYns7k
	 BSijOLM9N/NQk05FhdBgQZTTzp3xjoNHWncyvwkTND6dYnTBmqvLxtntZ/GJuqAmHX225
	 7JgzvTDFFmJiRhpokrxgn4Z3GHiKgPikHNjTiU5PKglN6Vt7ptKC7nBzO4ZvInaRyWsx7
	 ro3l38xdML3Hs+LQ44QT2rVpT6X8EgFm+sFaPmiL51W5UJH98pQRU6+j4mJRnVtNkrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N3SYB/BgxSNTh4u+DnHBIGPI0+Di9/c/+FCF8jLlAW8=;
	b=dY13ij57XCFKbPH8kE+KNykLAHSX1F7Twy1xI66NQ03yqJZFzFhhoknHcERoO+8keMLR
	 WSKN+4yxHyLD3J94hU6cMZa6dMnPKCBRx6FdbjBgOZXqU1HwUGqGpUpVitZAYgCd17WNz
	 mBwSboBl3Nu5grt0Zhz5Z5AlGS01s2N43DKuPJHGBfLYJbS8n5Wp3a87AGk/9QdxezZUI
	 Ttm3G7rxPD22sLvND3t+v9oRx1RFaEEnqbDV6vbptg1zJFGjK4r6JTl+TTpznpli5oC7+
	 yYphD4v/9+s1h+dorPhesD9BsLuMTlEby6ghsAJsOaIL/ue8itOOG6q5GNuK5sdzx0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cV1rfcaP;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424A5606D831
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 15:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 424A5606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cV1rfcaP
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a68f888a41so7227515e9.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 07:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721211; x=1794326011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3SYB/BgxSNTh4u+DnHBIGPI0+Di9/c/+FCF8jLlAW8=;
        b=cV1rfcaPqw5g4hra3OliVPaZNo6ZdIE9kz5vixcXtW8Tfcy1T3Fd1n3Qomk8mTQtoI
         CpwV91/ivTc7kQ83ItiGXYNE8ylwa+AsAircAYdQm6ZwwjB7P4XiRmfKM+vE4jEG34Ky
         o/4C6yfjE8hT44bQiK0txjwN9GJYfYPlJfGGvoMJUrQGGYAtowQYH6GIoGokPjSUvtmv
         rEBoIKAbNy+l49cfORY/Y7SbiazcTqcB67q8IBSAIrSy73fTqo4/KjNSTFKw43puoHE1
         aiWcFLDFiEkTGYTmfDSKA0vUw3dHJP67zgI+JsxiYKWsnckfO8ZbUN7mHtN9DDpUFG4w
         IniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721211; x=1794326011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N3SYB/BgxSNTh4u+DnHBIGPI0+Di9/c/+FCF8jLlAW8=;
        b=Ocq3B4wRUOWXdhv5GPlxSGzHfiHmEEJr7FVwlUQInGNITZrSUZKJeoyfKmTYXKDPNl
         sEHC68/9ZfUjOcemENuFNslCUbUB2pdieBeDFwJySlRzqCKUYf67qLbHamdBfmw9Vz3x
         muK5qUqnAz5DE2JOlDrm/vMBaY7XqphQ7JVsPR64Wo8tSXwkI+VwtMxE+tXZt6SMDby5
         30QO0AEy6whq3vNc4pqxLdJTHCDc2ceyLuWDPvoxkiFP2syutezrxWBcHKZrLX99z5kj
         z6WJJyfVRswZq/MTOLbk8JruJ1vEwD5VvDbZvQr+CCIudqhUSYsIZfCHLd/QmSo8Bs77
         P2Kg==
X-Forwarded-Encrypted: i=1; AKwUvBwt+GZSSXikj5GVpv5wPKm9vM874NvJWpqIxOiR9J0/RYsransnHKnu0lFN3yocaklsle/hZgbXPxdFdw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+LSthnnvz6EZB/q0AA2ZCSuWD4YysCyCStttUzKqemdA9DKRiD
	ie9LihgqF8y8ElCo0zxKfsfj4ZtCc370PCBK1Nikg4EkjfmSYL3/D4o6
X-Gm-Gg: AYBFou3Zu9PYPBORra7bPAmRGCcCuJE23rtEI2p7HFgB8f4ArXlo5lfNLFfuTxM0fIu
	rCa1J2UgDZKeERCJCXb3JrDVvV746kIUn4tQjA20/9Z85/Ytrm7nqkp2HJDBPXYSbuBacKemR7W
	B/KEx9YwXkWsm6CfvtJE2rAbVxOQPWjJrz1rzHKKgYRH68Bzv69WWE/ytk253ttkn2yYTjrwNkY
	MqVrlxx1QM3W9Ti+6ush+sLgFpmWVinhsLM5R30KDpcsNMmzuRc8M2wZ1N+1o1X+sd367YmM4VR
	GC67reVEli/TvpyiyHjppxyI++a8nZUT9DOD0NgzUlL7CjzCDVIJgn0o71NlnyI1cjPfxFEQ8E4
	x7AUGt/O1vMXS517dYOq6ibMfNHv+mck48i3IUaHy2sLiOs7bgW+4BoTfRu7s4WLBcvbnF2spk2
	7yR7E1Xg45MfezsMO3KszvOHHbqsWbI75Rzykc7JdY6oBznY6W57ohidHmYY0FClyCLF6ztSev7
	6+ZXWCz+OX+pb0+9ZfbGak8TSpyOWucQGODlJP1NgzLsoy17bITdkZRsWSM/5Gyjgh/KoBy1r1+
	fOhW3t9xH/B4HJcLqWunW44ohNR3UGn7CEfQot3gF+WBFCwYMNY=
X-Received: by 2002:a05:600d:6505:20b0:4b2:3c81:103 with SMTP id 5b1f17b1804b1-4b23c8106abmr73912745e9.2.1793721211351;
        Tue, 03 Nov 2026 07:53:31 -0800 (PST)
Received: from Termis-ROG-FLOW-Z13 ([2001:16a2:4495:e600:1209:ec98:a2b4:9c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm63777815e9.5.2026.11.03.07.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:53:30 -0800 (PST)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Mario Limonciello <superm1@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	King Li <King.Li@amd.com>,
	Caspar Adriani <caspar.adriani@proton.me>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: [RFC PATCH 3/3] drm/amdgpu: add the OMNI13B1 (OV13B10) ISP sensor
Date: Tue,  3 Nov 2026 18:53:13 +0300
Message-ID: <20261103155313.114347-4-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103155313.114347-1-saif.elden.hatim@gmail.com>
References: <20261103155313.114347-1-saif.elden.hatim@gmail.com>
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

amdgpu creates the ISP 4.1.1 devices only when it finds a sensor from
isp_sensor_ids, which lists only OMNI5C10. The ASUS ROG Flow Z13
(GZ302EA) has an OmniVision OV13B10 with _HID "OMNI13B1" on the same
ISP, so its camera is never set up.

Add OMNI13B1 and register its GPIO lookups:

- enable_isp on AMDI0030:00 pin 85, as for OMNI5C10. The ISP4 capture
  driver requests this GPIO and fails to probe without it. On the
  GZ302 no ACPI device claims the pin, and the ISP also boots with it
  left undriven, so its function on this board is not confirmed.
- the sensor reset line on amdisp-pinctrl GPIO 0, active low, under the
  "reset" name the ov13b10 driver requests. This is the same ISP GPIO
  as the OV05C10 enable line.

Like the OMNI5C10 tables, they are registered once and stay registered.
The ISP setup uses the software node that amd_isp4 attaches to the
ACPI device, so this needs the amd_isp4 board configuration for
OMNI13B1 to be in place.

Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c |  1 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c  | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 63088c072..412d3992c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1726,6 +1726,7 @@ bool amdgpu_acpi_is_s0ix_active(struct amdgpu_device *adev)
 #if IS_ENABLED(CONFIG_DRM_AMD_ISP)
 static const struct acpi_device_id isp_sensor_ids[] = {
 	{ "OMNI5C10" },
+	{ "OMNI13B1" },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c b/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
index 363266f3e..7d6072e27 100644
--- a/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
@@ -65,6 +65,14 @@ static struct gpiod_lookup_table isp_sensor_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table isp_ov13b10_gpio_table = {
+	.dev_id = "i2c-ov13b10",
+	.table = {
+		GPIO_LOOKUP("amdisp-pinctrl", 0, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
 static int isp_poweroff(struct generic_pm_domain *genpd)
 {
 	struct amdgpu_isp *isp = container_of(genpd, struct amdgpu_isp, ispgpd);
@@ -240,10 +248,13 @@ static int isp_v4_1_1_hw_init(struct amdgpu_isp *isp)
 		return 0;
 	}
 
-	/* add GPIO resources required for OMNI5C10 sensor */
+	/* add GPIO resources required for the sensor */
 	if (!strcmp("OMNI5C10", acpi_device_hid(acpi_dev))) {
 		gpiod_add_lookup_table(&isp_gpio_table);
 		gpiod_add_lookup_table(&isp_sensor_gpio_table);
+	} else if (!strcmp("OMNI13B1", acpi_device_hid(acpi_dev))) {
+		gpiod_add_lookup_table(&isp_gpio_table);
+		gpiod_add_lookup_table(&isp_ov13b10_gpio_table);
 	}
 
 	isp_base = adev->rmmio_base;
-- 
2.56.0

