Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013048;
	b=QfexEKj7BfsDGNlxX2EZv16p+X/tiZZKQqlFTGstt/pfQxAj8eowwwOe8OXKJeXV8QWJ
	 x4DqQtSnWjh6GGC48Yzf99nr0hVCb4cHm87dgDip9VPKODNxlX+cvwqY2d5C5PQrCRZNx
	 ZrFKBLwuEKuOOLulxrBYpvufU9X22Gr8ic6cqFzf54DcrRFfYERK7syHHqCXlU85f7Rm3
	 4w3aZ64ajMt3YQccRLMIDd1McJiS9+73yk4DwpgotI+OwuLtn7mep+RXfXylL4N7PGB3V
	 tElsrSTfTrLQQHxv63VofgFTnwL48WLNkN04zMU1LYwbN5msLOPL5mbdYVNeMITPb3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hdoTOfo3BJdHq4CV/lOfpmIhiwiyveElHyqS3Aj2E1Y=;
	b=XxbaQWfE/dYGvzFYuCi6ll+CVBXu4XapiLSflNpuiMm8ri2yfMuv/xgx7cBbsUCMn/kU
	 jtpYoAn3o3vYZK1NqFipvq+u+Z4Sa7SylAg5i11VBct7n9OAL8S3EE8/434WXaZWGU1YT
	 V6NuJvrYGKEWs1ipUZrZ00NMFzDYez/z3Hr4kwCjHyB4G7HE0VHfARw8o9fo/ONeeYnmy
	 Tr0rzju5I1ik+AIfZQuCL2C94buAqSgSr5b2ktWtnjzcbAPTxEcZKndufo59i5fnDCm1a
	 9FOO4DQk0eq57Yc8ZvburNi7ZQwr4YRvXzVzrfgTqlio0gqi9WufcpDNlIhG4piAXXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lPAs2Fn0;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0748D606B969
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0748D606B969
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lPAs2Fn0
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9deceda30so2365625ad.1
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 04:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013047; x=1793617847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdoTOfo3BJdHq4CV/lOfpmIhiwiyveElHyqS3Aj2E1Y=;
        b=lPAs2Fn0UlQ54Fqrbwo7zNVdAE9SPQgcmX3z/5ZSn5NeQWwwcMOCsLRKycLroj0CwV
         5NJwwYRNlIiXzZIGWbErqMaqXclP2oAUFgcWE2U8AkEDSUoD9NyYBupI4uj0LZ2syIzH
         DJNKZ14mhUFYt8ohUGo8gJuoXZkOf/1d1DeW3UXhpqFvBzr12Pdrpd6UgzQQubQKT8F0
         svemV4E/dIZsViFoMDr3FMh2AAOHk76J+cUQuHl+7zqXc+XNKbM2j/fdjd50TsYhZhdf
         /vEX7ORw/2L2FHEfegzYtCIgIzdG4VfCpieReeewv4fpIcjsswv0GvlQWVhfbZYUdbMG
         g/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013047; x=1793617847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdoTOfo3BJdHq4CV/lOfpmIhiwiyveElHyqS3Aj2E1Y=;
        b=SuBuZfj2Qz+c1T8Tnb3XzbpqB6lx0PGOJbHbih+zjZ1qoXmffNQ9SPOCs740DJIGwK
         aIYtkqAoL7CidLYrxhHOpeQzzQLljJlYKcu/a2fM6gcqNKCywFBPXC/IhRmGi3MaAHZk
         I3Wm1xengsZuSOqjpu+KRR1CP/W/WNDqGWob3azffiqYP4R7C2iFSPTAnqAgqq3DH4Nx
         QVfNXPqESV9rwwPmQ5yjOMg9YGlhYDQLxidtu7C9BFtcE5cqHTQVDjKOmGRMACFq2fyZ
         thvPYh5b3menu0kCHeQJn7qvHx0w2knWoPip3Dm64beGahVv4zq4qwJ6kbl7WAeTJ2KL
         Yt9Q==
X-Gm-Message-State: AFq9FYJuav+UGPEUm/O5W7udEW+bWmL6EWP36RiQwUPkk9wL0qucaosG
	g8BVMv2nDMXszuUAK20uTS07ucr868qjbnoShfKG94T0rrQkmrzWpLd7pNvosQ==
X-Gm-Gg: AYBFou2zVN71wcvMuR4SNIMBjDkdXFBDS7wbQHf6ctYKRbP/DtBq7miUSjojAQOu5aL
	OLvOQFZYZ6RDb0dwPpcTaCmti3pzTrXyCalDu6IXL7r1ogxojMtbXFnuotMPOe4bjTg50bvDxHS
	Qqxz2sgEZzauyBPzv1hnR6og+ngvepEokFtNSILUZxIP4o1aF5vGxuZXHTaU6CihBirD/9a2Chu
	8D/A1lqgolbZegk+gsRE0bEt8kORlUOolTj2snz3wNqa3RBmBMol34JzdHZqR6bMCK+rP8t0xCX
	fRvv4gHI9rFfjA4+Yv1CdB3Rjb9DaDo1FIY/XoiWzL2y3hNgiHyVwK0ZEBcJFf9AJAqBEO+GPvX
	lsCbnF1yroCeLPCZv3Sb6kEDGDYSFQY63swyEw8YHHBJy2HKf34wjabIjfH9tgnaCW86mamRevF
	SkBEHpAeTDXw4/GdOr0ePYYX8+s2LuDWR/7QIefdK7agscfyRpFMP/qhiA0G9HIHtu932gzqH4j
	Dcpdl8tmPK8YaqVhiNV7ZAr9EUE4J6S3QMf+fxf8q15djLv5FmxCxzbhu29HQGQ+YWJ+Sq8bXpy
	mQxKHapFAQ8y8Jm93a95DsSjlkKngDK9gUZk997qTmM9i9lKn3B8w1MvBYzZo+qsLDhIgysGJqu
	vY1Zue8Y8qtjS67sugeTAphxIlaP4pdflLt0qQ0AeZjoa7w==
X-Received: by 2002:a17:90b:39a6:b0:3a7:a463:54bb with SMTP id 98e67ed59e1d1-3adeb10f4c4mr9622839a91.5.1793013047320;
        Mon, 26 Oct 2026 04:10:47 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm8023593a91.8.2026.10.26.04.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:46 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Antoine Pichot <antoine.pichot@gmail.com>
Subject: [PATCH 4/7] media: i2c: ov7251: Add orientation and rotation controls
Date: Mon, 26 Oct 2026 20:10:29 +0900
Message-ID: <20261026111032.88355-5-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026111032.88355-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
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

Parse the firmware device properties and register the
V4L2_CID_CAMERA_ORIENTATION and V4L2_CID_CAMERA_SENSOR_ROTATION
controls, as documented in
Documentation/driver-api/media/camera-sensor.rst. libcamera uses them to
place the camera and to correct the image orientation.

While at it, bump the control handler size hint to the number of
controls the driver now creates.

On the Microsoft Surface Book 2 the ACPI _PLD (via ipu-bridge) reports
the IR sensor as front facing with no rotation.

Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 917285a62d..b6579a56a5 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1591,11 +1591,17 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 
 static int ov7251_init_ctrls(struct ov7251 *ov7251)
 {
+	struct v4l2_fwnode_device_properties props;
 	int vblank_max, vblank_def;
 	s64 pixel_rate;
 	int hblank;
+	int ret;
 
-	v4l2_ctrl_handler_init(&ov7251->ctrls, 7);
+	ret = v4l2_fwnode_device_parse(ov7251->dev, &props);
+	if (ret)
+		return ret;
+
+	v4l2_ctrl_handler_init(&ov7251->ctrls, 11);
 	ov7251->ctrls.lock = &ov7251->lock;
 
 	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
@@ -1642,6 +1648,9 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 					   OV7251_TIMING_MIN_VTS, vblank_max, 1,
 					   vblank_def);
 
+	v4l2_ctrl_new_fwnode_properties(&ov7251->ctrls, &ov7251_ctrl_ops,
+					&props);
+
 	ov7251->sd.ctrl_handler = &ov7251->ctrls;
 
 	if (ov7251->ctrls.error) {
-- 
2.53.0

