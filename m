Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721207;
	b=qBAt8brT+bmJKn3GGBydlj8oRV9VBrJhTVbtd7tsTr9YN/Ea9O+GqxG5xc+IHXhIpsWk
	 Jf6x3HN9kDwIlVrXGw0vCfQ5ih77evz8s2Cz/Lg9NrGZdYyn9WrEnC2onAog+H+fE/MWg
	 hBIZ7PnKwUIEVRqyFgygnogCTGoDVHgJZr1TG0wZb1X0vYP+OwbicEIfQUwjdNqNMK0Tt
	 G1XcM1nSYmut1LFxQc1DmOOOmeMb3HmUXkaBO26VyN3/CFklzxFeqaLeR2SLUnzICgvWS
	 ZFhdzzfwPediIoYNmmkCArkmN2o+WUmnRBKj7hU+kLqAoB3AkvbOCzBXYpokZ/tzMsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zmgOx3DOkVSwagY2PRIacCzKqEPjbIHBYHXTptn9QVw=;
	b=Wo2yjEDUzE09gO1IgNVOGA86c4D3azFQdIUU20dWsGEk6xCIqV/fFzDNAEteIgti0H9H
	 dTj1KJK+WfHTgJNez8hCe7w9K5Q7PcHQr/tARsTtx49b8Myyk4NanhmT9NgmPfHW6OVps
	 OWSInJz2U+OvELTha1xi+K6PCGxQ+D9S18eAsSH9PIbSfTFkQC26dJVoRqGfAAzhphLd8
	 XAAG5liCrJMNSKbSm2YwcOG+jheYg7hdi+aMeoeYqM72lA1QWz44F3uyHm/N8SRcaxgfb
	 do+RVbMJJUmyY+GczLFrNAR4/K6o3Pj3luGxI+y91prGXOT14L4LILlSmsJ8jVipFmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yecahwDX;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15D5606D807
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 15:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F15D5606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yecahwDX
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4af52002471so9253335e9.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 07:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721205; x=1794326005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmgOx3DOkVSwagY2PRIacCzKqEPjbIHBYHXTptn9QVw=;
        b=yecahwDXyL4ixwjwAtwXtbzFW4oCartcs77hkEkNndr/+1B9/2ER+Goy8hgElFvZcp
         4PANlbS+T5MWn9GWy1sLu/scTX+ZuZsledXUZo4y+t4NQmFj+umbmxqoXieVvWXPC6JU
         kajMYHvs72ea8bvnsPsYipzb//43xDBUPNWjBH8vwMHfzTYNiC84PTbnWcF5/mPc1Ozo
         3fcrzoniWqx7iUdoVWz68jjQn8ILPVp4+b59gw60wG1NwDvWybW9x3BSTCZzthBA2/HP
         xrrkG2zyPVLK2SYxovLADOzd5fP31/EDWT1OHTOMgF/RG1QuZVcIaKCLl4hK2PsXb4kO
         Swbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721205; x=1794326005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zmgOx3DOkVSwagY2PRIacCzKqEPjbIHBYHXTptn9QVw=;
        b=VsHT6jOuNptHpgDWBRuqo3X1OcdMARuom4kwjbj4JvLH/g8qe3d0YrwoRsWsFLY2RC
         w5rl/u1hfeFwqFa8d22BjTpV0nA4k6+nKf3a4ng1SWEOEvnK5J06yFdk+k0D2I6a4dya
         xa5cyYh1siPiGe4EmB/hvJJXbsxAVnYAdRf+tshGJh7soU9OdA62K7AeWmxQL+wfYBuX
         JA9l8lnH58uZNiLl95DTeR4831Q1FZUnN+igdlijXYA9tq58/x0BwvDb5gzFjv8TiUSD
         4NnuFhpwwdSQhkisyvHG0584FBzGpr1MCJ46aDxYL89XFXKoehgLGI1WsiKt1qIsGQYE
         eKnA==
X-Forwarded-Encrypted: i=1; AKwUvBxJLVthVb/f+/R+lBO+DUK6fEnTlIWhqMOf+pib0QBciSpjg6JIdMqNmzXJd09+sYZig7HP7N0Md3fljQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/gTRGKe18/2UpwAR4eeIaqOLtmhVRIXi3/ncXJSqLNO8MomFWQ
	g18jniOtZ755vhqCFO4Y+OoXN3b4mTT0BK3ti3PxB1hroYjy1OsjTLLI
X-Gm-Gg: AYBFou3g0LNA7xTx+n+Yk8vtVZbdlqI3VR68siEX4DwAp8QHXgkPCzXEwZjwoBII/JR
	RwJEAAL3Y5YOewtGshhkvGblkwZ5EXEHbM9V0NcwJ0wrjKpjILLLlwLImuS3FR4dmyxYWdI5To6
	tL4VEucf+w8tNAzV0JJnMbRp1Vsn3ndak5KkD73yD12G7bIEFJd7WbV3a97PTxNXno0S7x2tRv4
	kgn+qeMlFAnIgDXxsCuXRKx+VCz7f1t41eZggXrnm4OxS3u3NLKxDTyRhXfVgeJyw2DhGn0bMYy
	Lp/Z9dCOuAiR/CXcNrIDVunXu9/YtXN7NkGLlhPF3VHhmE7XT+Fm01pxq7Ac4PyEpoBDexB47St
	3Zf0nYCiAx45eE50YV4UVVetkoUKEka4uk2ydg8RMaTFw9Hu1qIlUQEUHDz4XRMmWsRAoX0y30f
	45ulJsfRkA9HVsjTtlUDcViEmHq2MdqzQTiPystrGJFHplrJ9Pyj3mI2x/KFeYeekOzNVp6WGKK
	5XntDbwfArAKJ8YnfSmyLZtYME1B7hPq1Yk/3op6hdPEFLhSFxTszRATao4ztj9p3OWrVkEMBE8
	OKhfr/6BwQo74w/lreypUJs/EBw1Z5TjyN+RC8bKb7HL6AifYmY=
X-Received: by 2002:a05:600c:4897:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4ad5ec2d3e4mr152905945e9.1.1793721205339;
        Tue, 03 Nov 2026 07:53:25 -0800 (PST)
Received: from Termis-ROG-FLOW-Z13 ([2001:16a2:4495:e600:1209:ec98:a2b4:9c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm63777815e9.5.2026.11.03.07.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:53:24 -0800 (PST)
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
Subject: [RFC PATCH 1/3] media: i2c: ov13b10: add an I2C device ID table
Date: Tue,  3 Nov 2026 18:53:11 +0300
Message-ID: <20261103155313.114347-2-saif.elden.hatim@gmail.com>
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

On AMD ISP4 platforms the amd_isp4 platform driver creates the sensor's
I2C client by name ("ov13b10"), with a software node and no ACPI
companion. The driver only has an ACPI match table, so the I2C core
does not bind it to that client.

Add an I2C device ID table so the driver can bind to clients created
by name. Nothing changes for ACPI-enumerated sensors.

Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
---
 drivers/media/i2c/ov13b10.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 242a95834..d33fb7032 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1706,6 +1706,12 @@ static const struct acpi_device_id ov13b10_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, ov13b10_acpi_ids);
 #endif
 
+static const struct i2c_device_id ov13b10_i2c_ids[] = {
+	{ "ov13b10" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ov13b10_i2c_ids);
+
 static struct i2c_driver ov13b10_i2c_driver = {
 	.driver = {
 		.name = "ov13b10",
@@ -1715,6 +1721,7 @@ static struct i2c_driver ov13b10_i2c_driver = {
 	.probe = ov13b10_probe,
 	.remove = ov13b10_remove,
 	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
+	.id_table = ov13b10_i2c_ids,
 };
 
 module_i2c_driver(ov13b10_i2c_driver);
-- 
2.56.0

