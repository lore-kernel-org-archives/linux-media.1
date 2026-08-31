Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108F93DDAED
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 10:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171793; cv=none; b=WmEI4YpgDWbNHLrfzbKH68t7CobXevIcHRKoYmOFhQrYTIBIF3oCx3gOtGIZoaDgOvM2rPzViXB2rlaXF9ntdi0FBimUdgmNyVzZ8wY8cEks8ryGDvnjNxxHlb84tOH++wLqDA5jIjXd/D3ZGVib0Y5+HtNizEu3BhVQBzpGIKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171793; c=relaxed/simple;
	bh=CH5MgHh2Yp70t9jxgZwCYlslBpJH+qKPrwTqGMpn/Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rFqSQAlcFESx6OQ5r4utCtj5hd8Nu3JaWcpar6EhR4rJ/aTcfFwV3dS6leJF+H0X/ByLK0dkAfqP5am81glZqBP/jeuiFoj2VMjc9rexgx+9ejQGUqTxVhOboXK4nHh6V6rCSkl7KrzJXh+xRDRHqEl/7COi6rMbGg4woJgpQTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjTq/PqG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjTq/PqG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so37953125e9.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 03:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788171788; x=1788776588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqDMDB/aOr7Tvl82Ke1slbqITnm88oDhA/GUgnMCl34=;
        b=JjTq/PqG3w74rpMfCXBxYIId+TY/Sz7IQA6u+2hRq2/Yz+K019UVk7Li7NK7MXoem5
         D/yUgnMsfclQKm9K9fXexcgosoUfAExcJe4OpIKY+TOTru0L1C9CYT/4H2+dt0XLeoAD
         zPckzFh6LeNj13JLoOniuFkNm33u/90Cm5E5rJzV+k0qJSlAMK/cY7PY1+3W6DJGwwfY
         ZDe5oqBASk43MkNuvBhGNTYqlgaCNIYOeFuvs3iShPB1f5yBA2oYwj3RiDFaJb0Dl48W
         T8Cr9J092Pq46r7cquiVVfAhQrvF7nXQS8YAiUQNzfVaExQuEPF+B04yZvQgL2/8wh4o
         5lbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171788; x=1788776588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqDMDB/aOr7Tvl82Ke1slbqITnm88oDhA/GUgnMCl34=;
        b=WhJl3MZg+h2c6EQME9ttFLI533KLyU9sQFvDm3W7K6wgTZNx4g4P3PQbxWxMICqT0Y
         B8sAK2UuFPygnxKc13fgN7S2oV0WM7OrCs9Mc/PuMgik4EFEdu5EgLGBAixnYcNfe529
         zoOd/8lQLAHy26MCsKSPONlcCxOML8z3YwREWFbg0oaadPg3PEwycpTa/LbvCY06QQB5
         I5GJe7b6+MSRF+3gHPAHc59nn7CJDnreDBhWIC3XoY3hCDJyjH24AVEPPR4jaa1drqNF
         pQyoqdPMAscnghph5XfO2NhTdlylJaAIv2o+XzZGCbz7q0SrQPpOfB89McPug3/osn7b
         Hixw==
X-Forwarded-Encrypted: i=1; AHgh+Rqq7Vems+RA88bOZ9uPxEp/jYGCgBp2oW3ux+nuJxASqZ9PoU86XBv0VDcNvoD259e/iUt6m9+Q6Z/GRw==@vger.kernel.org
X-Gm-Message-State: AFuF++kam59Br0ZaeYKW+cLOFrL661BPO3fFCX81+ONfWs5G1FUqH8l0
	BNSjT55k1//1JoGQdSM+0tEHbV90PSs7gW/bLFdVmfALnX3xlweEYnk=
X-Gm-Gg: AR+sD12JMeyW30ddyHv7AS4mxxUKNRJo+nUyIl+2Dw/+eSk7o3y6muNoEJ+mV5dP5NH
	N0IcAvMOP2uc5fzeWluIdTNW/fI/5nUSnvFtBmePGk9hjTyhBQ/73pBfLmZ6LyHXbOSQkFaLCKa
	Z5OFYgSqfQlVQQo3rhKUosuhcisMhnkQx99hY3STLENYryRbY64RGL0Guthv4+ftd+jLp8Aa94h
	hx/MSOJYNshkYoahI9srk2SZdoJzY95daaz+0G2a+8ld4/K/BF7UfNAhkWAKDf2oZ+KG0FrtLSq
	GAgVsuMU5yS9SgrqPzlL/8NuD3/fSmG4Q/xPoqDdc2Lj1dqVS9fei9Zg7Is8t4CLq9875K9JkSJ
	xEbxVUyYV3Q+9IJ2Bq7UpW5VJNNsXVnj2MGm6wB3Ylm8hPIArQBZw9oQ4s67uzdqGGxS0hFW/mk
	vrsLos/vlRhhadjQnZS92EJRCJTzIIZwPKyaa4lejZueFDhXg4+LYoUey4GP4RRA9KRRFQXJo6+
	RReKxao8x9GIGuhMVjK9BP8qXDvSt5YEgaJ4etkEZqd
X-Received: by 2002:a05:600c:3549:b0:49b:5521:785d with SMTP id 5b1f17b1804b1-49b91c1e9d8mr361428235e9.4.1788171788124;
        Mon, 31 Aug 2026 03:23:08 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b961820ffsm126176435e9.3.2026.08.31.03.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:23:07 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: [PATCH v2] platform/x86: int3472: map the ov7251 power enable GPIO to "vdda"
Date: Mon, 31 Aug 2026 12:23:06 +0200
Message-ID: <20260831102306.36610-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On IPU6 designs carrying an OV7251 IR sensor (ACPI HID INT347E) the INT3472
describes the sensor's single gated rail as a power-enable GPIO, which the
driver registers as a regulator with con_id "avdd". The ov7251 driver and its
DT bindings name the sensor supplies vdda, vddd and vdddo, so the lookup finds
nothing, the rail is never enabled, and probe fails on the first I2C access:

  int3472-discrete INT3472:02: avdd  \_SB.GPI0 pin 131 active-high
  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -121

Map the power-enable GPIO to con_id "vdda" for INT347E, the same way the
existing entries map it to "vdd" for the mt9m114 and to "vana" for the imx471.
The sensor's other two supplies keep falling back to the dummy regulator,
which is correct here: the firmware gates a single rail.

The table already has an INT347E entry mapping the reset GPIO to "enable",
added when the ov7251 was brought up on these machines; this is the same class
of firmware-vs-binding name mismatch for the remaining pin.

Tested on a Microsoft Surface Pro 7+ (Tiger Lake, IPU6): with this change the
IR sensor probes, the illuminator strobes, and the camera streams 640x480 at
30 fps through libcamera. The same failure was reproduced independently on a
second Pro 7+ running stock firmware and a distro kernel, with no out-of-tree
code, in [1].

Developed with the assistance of an AI tool (Claude) and verified on hardware.

Link: https://github.com/linux-surface/linux-surface/issues/1702 [1]
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
v2: no code changes. v1 never reached the lists (a mail tooling error on
my side dropped the Cc headers); resent with platform-driver-x86 on Cc as
Hans requested, with his Reviewed-by collected.

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 6c729fc..157345e 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -143,6 +143,11 @@ static const char * const power_enable_hids_enable[] = {
 	NULL
 };
 
+static const char * const power_enable_hids_vdda[] = {
+	"INT347E", /* ov7251 */
+	NULL
+};
+
 /**
  * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
  * sensor driver (as in DT bindings)
@@ -185,6 +190,13 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
 		.con_id = "dvdd",
 		.enable_time_us = 45 * USEC_PER_MSEC,
 	},
+	{	/* Sensors which expect "vdda" as con_id for power enable */
+		.hids = power_enable_hids_vdda,
+		.type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
+		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
+		.con_id = "vdda",
+		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
+	},
 	{	/* Sensors which expect "vana" as con_id for power enable */
 		.hids = power_enable_hids_vana,
 		.type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
-- 
2.43.0
