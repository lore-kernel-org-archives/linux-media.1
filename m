Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F36519F121
	for <linux-media@vger.kernel.org>; Sun,  9 Aug 2026 04:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786249623; cv=none; b=GQGtJx2b4JeXeRjbg+rcaqyfxvV5eS4TtqevHe5UdN3rTQSkIgYevVvIhNpIFV99EwHgfvKBHuElyEDX3sXxCcTKhIMk1DE1K1f0rOBgivOdE0YhxWpyL8FDlYidAMHQvKA439gBXcMmATnrGXGLlTXElJp+Ow5JGl/fLsVC7zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786249623; c=relaxed/simple;
	bh=cEHlWZML2ga4aWj1RY2I55GP/wsvqEDgh9jmkMn/Q34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YgvW3GKFpiqvp0OQPPEZOQUVu49WixPTJo+PU+E9lUTj92HN3YVps27/upFtXIun4fE6W1eDVz//xS1nz8Yo0v4DCAi2AZXuqGHTeCN1n4W/hhx5CLJngxS78GlazbrRNF0Y4F6iNpOup16WhwTNmFjPzzjSM8pQhNyiNRC7us0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sN5zvBQ4; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sN5zvBQ4"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caf228a910so6224655ad.2
        for <linux-media@vger.kernel.org>; Sat, 08 Aug 2026 21:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786249621; x=1786854421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hq8Gl8becy/WF/DMiRZlVep4ksVkXKkaPmZC8U6R6nM=;
        b=sN5zvBQ4TKB1JLgmbBzzG96z44kOPKrjOXI7JOlHWb8X2wZAvvMLn7jnrjVEwaJnO6
         QTaiOgIMUUXq+OLdUgRUAi/Be6clY9forJiC2aN7v9UlOoM4Fyg1V0/ouwdY1PLMvaOO
         R4ZC9U9fGSmjaMuT5KjgOnfu/jE4nox4BOcwzA7dbytO9T1KCi/VhrAi80X/3lX2O8KX
         tWsQzCB+HIDqFR4mrZclj+uMJBYaXjxeSTK2/gUmkeyUEfsrP8fZqsq7dc6bGRcsYPxY
         rGtW5PMtJUgPPeEMB5Y602FGL8X3tnGB8PmT5QoJOJff7xI743izvE5qO7TMDHKw9ag8
         GhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786249621; x=1786854421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hq8Gl8becy/WF/DMiRZlVep4ksVkXKkaPmZC8U6R6nM=;
        b=c6GhlHf7l6doqoV8JqAF0z8LvpWzHbF9K6YCvLNrN8CkdxwrfAUkq7OvHobAF3wGML
         EHh1A2SusI3OQL1nVz63I0fUt7nwCdlyMB6uZ8Xq4zlV2leAjqTxmZzjGlf6RHmUD+MF
         W8ulNaiT8KPZCOyqfDa/N74kYrZQ3OjIYpFs8tcCXu0fReyc6JCh0qrpEJ5FRa/JbdZ0
         u+9bVLelYnNpdY0+OadeFxcWTcN8p2CSOQYg/6kNmiv86THWEJ8UTRbxXhYPFUD8/Mx1
         VRkWw+aIuiu3+FOM6n9J+pgthiRloSUS7Vhw9mS/XjPMmndnRy7qX78e8h7nahsi/SW7
         ULNQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXVSHoNCwWlNQVH0kg8L0We0p4a+gGDjU3AmRKkTCaxGmzeOn4qMo1y9IPzfmZj43sWn47NZvZXLZO6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX1oQC5Jnbe7spYC6IuNQaTbY9vLMIwwleabkvesAKnMF8ziz6
	3C5LYy4mY/gd/JiuvbUaWANrFbsPk49pWwoIK64/3X5DDc0+85CqFoIHa7CdUPju
X-Gm-Gg: AR+sD10TlnSmkOEBnqOYSQZ6PmiqOqdqG4JuP9hTNa1uVXGs1lAsSNL9U1+Z+Z/I4wa
	mPrwuXtngl8LFYrMNtfJb+zUfDcvPsYN53rmse5Ff+LwOzHD71or0nGk5aYKEorag5RW2gYxcYA
	Xsk3Ro0iavSC1AXnyYvd8fDYi9RUY1bsGkJsQ63S4n3EnGw+BEaKZuPIQRjT06PH19aMvTI7gzQ
	ylauMc+fyUacBy5GBNyoV9iSy42tyoc+8XRsHNHJMKzUwQ+BhIlgaAFMohNeCf413BnW8LbM1Dv
	m1hP4jSUQG30n2lrHs2zGuSpN8BK+c7h+4EcRNGX/l6HR09cFv6YX/kbT/DRqF9SWffbXOMoUyx
	wDHufUE8oh3h4LiTZZFRY/41EOX6EOb6ZYj9Uet7nwkrsFYDfeLBKbb92R+ATvujRq3/0sytYTn
	dkklViezXkQ8YRfJ9nrZkHOxeH93HJa8WwscmEwl+M0pHOe8IeULuAlL7Ep1ZCFRlN86kIddYTC
	0Ls0+pZFAu9Re6/t207AHtBWovMVKxHsi15NbgcKtllS+pT9GSI
X-Received: by 2002:a05:6a21:4d8c:b0:3b4:75c0:3ec0 with SMTP id adf61e73a8af0-3cbce94fef7mr12969462637.30.1786249621385;
        Sat, 08 Aug 2026 21:27:01 -0700 (PDT)
Received: from prof-g-y-land-Latitude-7320-Detachable (121-45-161-118.tpgi.com.au. [121.45.161.118])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410199cf49sm21659516c88.3.2026.08.08.21.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 21:27:00 -0700 (PDT)
From: Sahan Nissanka <adee.sahan@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: i2c: ov5675: Add OVTI5678 ACPI id
Date: Sun,  9 Aug 2026 14:25:18 +1000
Message-ID: <20260809042540.15849-3-adee.sahan@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809042540.15849-1-adee.sahan@gmail.com>
References: <20260809042540.15849-1-adee.sahan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The front camera of the Dell Latitude 7320 Detachable is described in
ACPI as OVTI5678, and no driver has ever claimed that id. It reports
chip id 0x005675 at register 0x300a, which is what
ov5675_identify_module() expects, and it streams with this driver
unmodified:

  ov5675 i2c-OVTI5678:00: chip id at 0x300a reads 0x005675
    reg 0x300a = 0x00  reg 0x300b = 0x56  reg 0x300c = 0x75

The two other values this driver is sensitive to were read from the
machine's ACPI SSDB before the sensor was ever powered, and both agree:
L0NL = 2 data lanes (OV5675_DATA_LANES) and L0CK = 19200000 Hz
(OV5675_XVCLK_19_2). Native resolution matches at 2592x1944.

With this id added the sensor binds and streams: libcamera lists it and
capture runs at 2584x1944, 29.95 fps.

This part is not a plain Bayer sensor, however, and the format this
driver declares for it is inaccurate. It carries a 4x4 RGB-IR colour
filter array, one pixel in four being infrared:

    G I G I
    R G B G
    G I G I
    B G R G

Confirmed three ways. Intel's Windows IPU6 configuration for this exact
module - matched by ACPI _DDN, so not a near relative - declares
bayer_order="GIGI_RGBG_GIGI_BGRG" and sensor_type="RGB_IR". Measured on
the sensor at full resolution, positions a 2x2 model treats as a single
channel differ by 18% while the four infrared positions agree to 0.4%.
And the module's Intel tuning data carries a 4x4 channel index map that
agrees with both.

Read as the SGRBG10 declared here, the "blue" channel is pure infrared
and the "red" channel interleaves real red with real blue, so colour is
wrong in a way no white balance can correct.

This cannot be fixed in this driver: there is no RGB-IR media bus code
in the V4L2 ABI. Nor is it unique to this part - ox05b1s declares
SGRBG10 for an RGB-IR sensor of the same class and resolution. I intend
to propose RGB-IR media bus codes separately. Until such support
exists, this patch makes otherwise unusable hardware work, carrying the
same known inaccuracy as the existing RGB-IR sensor support.

One further note for anyone building on this: the sensor's binned
1296x972 mode averages infrared pixels together with colour ones, which
destroys the mosaic. Only the full resolution mode is meaningful for an
RGB-IR aware pipeline.

Signed-off-by: Sahan Nissanka <adee.sahan@gmail.com>
---
 drivers/media/i2c/ov5675.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index ea26df3..99dbf53 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1355,6 +1355,17 @@ static const struct dev_pm_ops ov5675_pm_ops = {
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov5675_acpi_ids[] = {
 	{"OVTI5675"},
+	/*
+	 * The front sensor of the Dell Latitude 7320 Detachable is described
+	 * as OVTI5678 in ACPI, but the part reports chip id 0x005675 and its
+	 * SSDB agrees with this driver on both other values that matter:
+	 * 2 CSI-2 data lanes and a 19.2 MHz external clock.
+	 *
+	 * Note this variant carries a 4x4 RGB-IR colour filter array, not the
+	 * 2x2 Bayer declared here, so colour is incorrect. There is currently
+	 * no RGB-IR media bus code to declare instead.
+	 */
+	{"OVTI5678"},
 	{}
 };
 
-- 
2.53.0

