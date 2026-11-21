Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267985;
	b=mfP2w87K6VOSoTW/pXel9H7Lo2ocGdO9NK0X+UYxt8VDGAJ45rx99o0jIkKPUeeQkOaX
	 0hrKukV+mJbj2xc2uzYRtpHFttnTRkYjMYZhmE6lrdw6kG6nvNM3VgoexKrZ1NCWvUyOz
	 gaCozduG7UwYD46w5inuYpjHCLvX+oI9mFado/YqFQCjepQx7ZdN+fIqS6xEFilBjwfjn
	 pV10ErpZWFtgj8V6yig3goEhX/OqT97Q5FrLUgeezGL0eaHpiYmG9Fs2ZwZhAso1KJ62U
	 zym3JqzBYCSQYnCCNG44L9eQgzZdHyro/3EnWZgohdJ+L0OS2Kzml6v9znmEWLzHmQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zgg4MnVQv6eXgMCmnMqV/EBaLR8DuEalyOb+7ER6OOI=;
	b=XGNYBVV8o6LhZ+Y7lj04s7WrnP5ca8GG3XqG4XazKUEIZZ1tdFjijkVyaXrVlBwXdRg0
	 uGCnbNLQa6mI6/DL5qVjFz0rwyvohrnj+F4CMKyJVv4BG7lu9NP+NpldcNGoi5GYJZVNJ
	 O6zciozb7siQ3dOTehLGppvg+8gwigBVZFc13d84QjxyLs8sqVD2VXz7j0+DIHlUt1g14
	 N55DDJ2H7QJYIC3geM1mtI6jSLeNjjwLbhZmcVts0hl9nVapMUrNbo7/JqvTT0UQqNGdl
	 wGTVFcCuVskiwJVdYvEazSYgYov/vZMfRt7NpXQmAFb7fKuISYIEMr40l6EnKe6/Y0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pPRuaaJB;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E82606A691
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 13:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7E82606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pPRuaaJB
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so16512125e9.2
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 05:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267983; x=1795872783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zgg4MnVQv6eXgMCmnMqV/EBaLR8DuEalyOb+7ER6OOI=;
        b=pPRuaaJB6IYv8fYThOP/xfRsBKfp2b2ApTm3d2bfi2AoV1aWO9Ob1S2Db7uJKd++a5
         mmknRw0F5uGQ7OcXJCcqPdVwH4D1Nz6fUFherbE8/6BW4vbFWQ+CJRcRMm/1HuAI1eoM
         Cr7OzL8voh6XZO8Gep6egxH2tRkWYK6ayof5az8z3tGqwnDJK/7CnWnMqKow6jn8SPte
         sIZyO0H6bdj0Ov/ZxjtAUuh2OpAmlLj/WfOAYijLFKExSKKAljk34V+4tVopxqlN16ke
         7OHTuO1aZW2LPbxkhEZA0QmHCJlBhEy+GFCTbaXtys2R83fZqNVUtRQq1CWYvG3koaPg
         1YyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267983; x=1795872783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zgg4MnVQv6eXgMCmnMqV/EBaLR8DuEalyOb+7ER6OOI=;
        b=B1NoA/uTa//39DVW6XcKzeUqg0n5bMIVF3rCw5PdiZslN/S6axZ1k8f5cy89Eoygk2
         FSZYHDYgwUF1chsyIb4VSy0/2P0eVHngdp4txrqUnvR7B/Ym/3B/wXxbgk+qpUjCgPJ+
         OJwXgL+jPZxiDkeg0VMF/2HwhDx8ls/KF7oLFB94qtf9zSzOyUpx3M5qlDDn1oko7hvh
         torXbZUSFtyyhNVlIPVgaF2/GcHkK8pqT8VvRaY+EXnkjx6hzC/fvMJf7pgIkoj0GPwk
         NvAcOucH2A92f/66asX3ZXuh36uHkmdnWQVRi8AVF9KJoxWVWhzIs212PWSk01MI7RSo
         2pbw==
X-Gm-Message-State: APuU4Z/wBH9u5SJOYWzUq8iuN+o7dVN/oUcgHX0cGT+S1oIUNYGtZ3Oh
	U+jsKovD7Du4ScMzsT+DIS4pLs4ODconDw/IB+czzgVNrM4J5Uc96vsoGJiiVw==
X-Gm-Gg: AZFdTZfiiqUg8cqCyR9MffSHrFVfndzkLsZxtn0GBsWyKO+LhHfs2k88vSSTmS51Osa
	dqlIS3YfV2IWTRKvyV34Px3b53xm24sG60AWeNrDzI3YiLzJYWNd6aOI5Un7Bh6YqiFfyU6NiI0
	sXBqWUtoc2+J8B2lsFPuAsMqTh+AqJjCK0MFwa1o4UoPIHvKRk1IoZlCXUY5J2WkP8tPBGAIOYW
	bit3IxIZL3hwyqZ13Yq1Vy8qdIU6ZVCCU1B09qYKxzIchTsYO1ryoY+9w0sBaBooM0sUzBK4p+v
	33EvOuZ9YMAK0sgOwzi62sn8dkrkj2q+Mq3LgMxtcNqflrgnQEkHeO6hF7WG8vDKVmMCGBKKSTo
	Yq4lgclOG8/iJBhC/TKruzJCSqT4x692xDTSTuESTOFC6HaYYONJF6zl8VQPoF2RoYT19pYamyG
	LKKsu76+Hml30vacTcYjvKg3ha5SyPtHJajIIidYDYq+xHFZ+4/MAYX9p+0LmPdT3QpUtr3vreg
	Ap3oTXFE/XhGVh5Eu8+EIxX4jIegIXiTB1MID6u1WKn0q7vRC5VpAqNoxSyvF3FpdJLKw/N/kGj
	9+nZKbmdA2VAPSP+6TMmbsrUWZ+316iDHVqoMVfzkubP5zoGmZxGW11RwV0Pq93wPSjv0vlLB66
	HzD9DIO8hfxwz34qh7AXXaBTSqAOmHrXLWg==
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr158498155e9.6.1795267983223;
        Sat, 21 Nov 2026 05:33:03 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:02 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 08/14] media: intel: ipu-bridge: select OV2740 frequency by IPU ID
Date: Sat, 21 Nov 2026 14:31:38 +0100
Message-ID: <388d5bf4b5e2f99f6e6d8c0eb41e88ad28091b75.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

The OV2740 connected to the Cherry Trail AtomISP uses a 288 MHz link,
while the generic OVTI2740 configuration uses 360 MHz.

Use the bridge's existing PCI-device matching mechanism to add a
Cherry Trail-specific OVTI2740 entry before the generic fallback. This
keeps the platform distinction in the bridge and avoids adding a second
per-sensor link-frequency override path.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 5f6baac2c..5dbd74e2b 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -58,6 +58,11 @@ static const u16 ipu6_ov5693_ncont_clk[] = {
 	0
 };
 
+static const u16 atomisp_cht_pci_ids[] = {
+	PCI_DEVICE_ID_INTEL_ISP_BSW,
+	0
+};
+
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* GalaxyCore GC5035 */
 	IPU_SENSOR_CONFIG("GCTI5035", 2, 175200000, 422400000),
@@ -116,6 +121,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG_MATCH_FL("OVTI2740", atomisp_cht_pci_ids, 0,
+				   1, 288000000),
 	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
-- 
2.53.0


