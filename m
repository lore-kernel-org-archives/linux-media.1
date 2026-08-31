Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7964A2054
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 18:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200356; cv=none; b=dMjQFNw/QEDdBxDbCcW9kNEBvt2TjYyN+ky4m80mTXlXsL6cjGme2vgvW1eDtZjnqEHnC2ICkT/ckr0SSzDuNoqRlHq4wUMuPe3VvCRRrF/CMvfGLJX/w0ZZ8ykU6hDAdUSbmzwOh/Lh4QHio7dN8Ab7OuDABAHAkk8vjXs+RFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200356; c=relaxed/simple;
	bh=38NdsR7peVgmU+Oqd+nIHCO2SJKGV8pY8vX9DgyGykU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhUsApfrvRRIT23tPUnexBz992TSHtBMKoT+YS+UFVUZA3mKy46gVbCzaisVGJcNfgCqXLbnILPG4k6lRt4JdjOV0Tsd+Vq21nDO9QAqSjWrzT8QWFtYxl8jpAdd9DtBYK38rT3X4UgN6C42axRa8bI8lciTEGfRS1U/o3qb+7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cit7pU/8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cit7pU/8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso151455e9.0
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 11:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200353; x=1788805153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2abaWYtjVKV9VZXaLgXVyTO08oA7zY/lp6O2BFsx6Gs=;
        b=Cit7pU/8uR4akFIzlwQcRbKgon3icdWxW+vdCJbXVuYYaiQ4PWUfeYDMMrFfGG/49t
         uoH4KJDe9p2uVTA4qqcysNfBOg5JM+4LGxgsmYu5ZRnIe12Ht9dqLiDmxjiiEKcsMaBu
         C0B+wKDUZjZRkBZcr3IvbqYe7FKC7EAzoyysY2E5tBDGdNE4WWcOL5wF6IetKozFBoyI
         UUeYnsOLp2VWJupurv8G8GmZjJUZC74NzAN3NcoeCayCPxt5OYsFsAlbGmWPPxyfSSiR
         mrJtIpcKi12ZXHZJAWuPpDuiRX2/rc+D9FJ91v0Yn/tEoRvIASujSEs89oFwjn836lZH
         HbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200353; x=1788805153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2abaWYtjVKV9VZXaLgXVyTO08oA7zY/lp6O2BFsx6Gs=;
        b=nMQEVtEZ+szVurpdlzFPQZJ7PsI/tYcL1zd5A246xsMcDBq7E4FiHr4mUBoUMw9mS5
         6KTr6Y6RRhpraaTyhHbXl+LYNJ8iG1gUfbeZGOvTZi9opInu+goCJMQRR3wl5zVCyftt
         o2J5WI6DEN8fSapyGTBLUDIihn4oELDyHF8jRbRbymVMp24NVxeTeVtcs1WH6+kuL7sm
         xMsE6LdG+psQa7cgn5DBklWhohn2KH9qKLW0rTl4uhjgHBwE5kbcD6LT1rAg9BqS8aLj
         9M+FvuQHUj/byXeNVb3FwAKDZbnz6KxDsCZQ8GwNzEFcv0JZyPYdNvwZuDsvSdRqxltT
         983Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp4J1j5vCVq47GkxCCtQM2mjBmhjY6Q3FwWh2oNVBWpHY0xwbXCvopw2MYUhe8hpT1d9LY/UJStWeMw0Q==@vger.kernel.org
X-Gm-Message-State: AFuF++n4NUEQIBvzdVtE0sWBsqGnMDEyy95dVBtXzVHOdcvS+n7KApJf
	+y9YI82WQ7TkSw5wzlhHQ0KqAuY6AmC5ZKdIpH59DRTKWa4AXXkPtLvS
X-Gm-Gg: AR+sD13M6S0xodhtQzC1XjxrbiXcaoL+YERRAmtc30T175yD1ojK46QriUGQTmm70cD
	AOsQDqaFiDX6YpQgW3MLP5BTKIwdr8yHmegZRBVuATdR0roZJuTuyvqdn4M5oqg5alRxp6GV8hH
	Z2rGTRwQ0CON622Ehj2lkNbes3Z8bBZPBwhTAc44yKUyTPGKUdFPHyWjq9gewpX2dgU/bNFRFTf
	mYPjgWetuoriAmoBJ4xUmjtu1+L82/muuRi22vlFOo3JmVbqmoyW6M9AZ8t6lL2alfNqP2Y8QCQ
	diMR6BcCSuDASYgzSLNyWKpHrV6/uOWk68EviWWFOZoiQf/itNhDAvOm1OHwBSyD5MA4lLVImo+
	2Pb41kC0KvAjM5lojhTKXqexf5rfI4D5ChAvkl5IcqwNDNfzZyFzj05BPXRZYCDmp05CmhTneQQ
	CT41qsTU5dbRhDhz30vgn3bCbbA6Txn7wrKqQbKV68Vg1RtlGdXZ+nTKgWIVEuYYE77GE0Wks2d
	iGmqcgsr8YZ
X-Received: by 2002:a05:600c:4512:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49cdc14d69dmr51045145e9.3.1788200353295;
        Mon, 31 Aug 2026 11:19:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:a74b:bc2a:bdfb:30ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e4e7sm9041965e9.9.2026.08.31.11.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:19:12 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v4 2/6] media: ipu-bridge: Add OVTI5693 to the list of supported sensors
Date: Mon, 31 Aug 2026 20:18:54 +0200
Message-ID: <20260831181858.325109-3-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831181858.325109-1-fernandorimoli11@gmail.com>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260831181858.325109-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IPU bridge builds the firmware node graph only for sensors listed in
ipu_supported_sensors[]. The OV5693 is currently listed only under its
legacy "INT33BE" HID, so on Intel IPU6 Surface devices that enumerate it
as "OVTI5693" (e.g. Microsoft Surface Pro 9) the bridge never wires up
the sensor and the front camera is unusable.

Add an "OVTI5693" entry. The link frequency (419200000) matches the
existing INT33BE entry, as it is the same sensor.

Tested on Surface Pro 9 (IPU6).

Link: https://github.com/linux-surface/linux-surface/pull/2171
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..131c70844 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -95,6 +95,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
+	/* Omnivision OV5693 */
+	IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
 	/* Sony IMX471 */
-- 
2.43.0

