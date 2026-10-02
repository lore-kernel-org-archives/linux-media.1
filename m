Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5A82DB794
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 16:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958865; cv=none; b=shBgM4KX28j/eGOXEt/bvPKFqcHNkomP8T80koO9QgO2kIGME0LLLu5HgXs7vHfUp9E07o6R0ac2foJhtYZy/mGhA3uPjQ654XjVEUkHwxdpygnvpu08Cfz21cVwA0iuNwsXJfThnSjc5J/4SmZ6jwu/2b3avqtSxrycxNn1LqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958865; c=relaxed/simple;
	bh=m0Y2yxA83IjCU4lcgcTTOLdhjbOrgzsyfgNJo8uL7PI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KrXgCWRb++bwXzpDpZ98LEvTqQzHpA2CIfQXaOvgNJWp1prUERMXnQIrcyGIBnr+nMkO9g8ChJBg0QMG9Ix6n7Heitabpo8+8/GyyUZTgOBeZMe7gw4mUVgfcbBxvzhgom1Tn2rsWLq36XG1JiWPo4M38ZdAm3EHvJePgdI3rdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGX8KaUh; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGX8KaUh"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-8807e5b8fa9so5044700b3a.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 09:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790958863; x=1791563663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkzL0mHS4r6KndnbWbOo2gH6IBD27/Wy36I0mOZpCSw=;
        b=jGX8KaUhJjXGcjA4SQLqZhVC37S4Lz5Y6Vf1CDWoD+YtHAapY28LOaPxIZASzuo9AK
         vMMWBvW+n+ktJwas9XsjeQWwYKxmZkVOddOqoZMSjr31kOVGEq0C9KdbI8j+FyOqRKP8
         y13+/7gZkbmRKMtqE9PrDxm1gdWY3uY1fgmPO+vuHV5SN9729EPWCWen6g7E3UQuGCrc
         w/kIr/nRPvt4qcKGkB64fdbli6m40C1ZShBCB1MZdK42+rutLh1tqopf1ALaoW8uEwVr
         nuqDIoS7gvazd/YAh3qahSUpVdQICdU7JdsBKPZcQ4HUEEsR9HxFT9fbY0Q6tWfNh8Hr
         Dx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958863; x=1791563663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkzL0mHS4r6KndnbWbOo2gH6IBD27/Wy36I0mOZpCSw=;
        b=DOjUr6WVCvXOdrGZESMrHWMPtKL8XhZSxlaXJ7YbGsD1IZ1O4ONyVp04CRnRuMyvuL
         1FSXbH2OpA3mi6T6RFFHEsY5ODbAFe2fv1UmE70AlHn20mZaK8thEoRRroDZgHk8mcMf
         gyn1p3Q7kxAeiBFWPSMvTSMZQmwqD+sEQJQVKDr8/liDpJ0yoviCe5v0nejxHopeG2Px
         M6qf49LP2dTL3RqtxsWxpu1lTryOMyRzXcz8qZWcSLLWwnomAj0opZzTIQ58N2C8CRbu
         aaumqIo+w31ERj48fRQ7uX350/3+LL/q9057gzPoKNzP84vsH5Wt0/d0Xte5zF3dpNmY
         EQVA==
X-Forwarded-Encrypted: i=1; AKwUvBzrHkJdYOpTdRcbd8ANvu/bMjDUupIIKITOwjrKM93tDpudBdDSIzS4GPNKGCD4bNsa4QVX8lEW7zCFBA==@vger.kernel.org
X-Gm-Message-State: AFuF++nJ/b4gsQef8olycSZoXSapF/lu6zZp4UZxmCErmZQ76xVMGWBL
	4OdSaiIWBM7xT013R+GxbvV43hFUaBn0Co2kTrIU27WO+xZ+OIoH0Wae
X-Gm-Gg: AYBFou2ZeO7XB/pTP5VE43Szq+2vqdYaBctB94ZB60HrmywoozHkl8xSo8NqifPX867
	PoRObEZB/PcTVnYyXrazy05nXY5oFo3dXcL/CIguWbl2nb5FDLlka2hgv1wNVxwolNOif2srKWa
	KV3YarGJ/3uMXsRd6hA+P/C4EmXUet4k4m/Z2HFeF/Avlo9BU7Un1Z3rDELplWNNqf9jYlehOIU
	P1JQ++l1CUkW7rSTF5RZID8gIT0mLOI24KWkuBbeO9resjPWx8Xm7187tHa19UDR4c220twXg8u
	Ghve5qtEyf7EFi/5GQsdUME65kYzdBX5mukxOw3TN6BRpiO8+vmtP1rC6UwYSm2j/aJEGxLKiXF
	SRRmLB/61OfXOzZQV6JQjpsUUIX52wUYfuPHhlHkoJghLFk4xzDGN4WhZ27L04UkCb0qPMII/sB
	k5Boat4X8I6lcrumCZR9CYGHdcr89WYEx3DZI5G4zglTx60/lHB8ftQ4r2Mx1IlbCXaE1v
X-Received: by 2002:a05:6a00:1787:b0:871:b1b0:e495 with SMTP id d2e1a72fcca58-88af54f744emr3544726b3a.15.1790958863419;
        Fri, 02 Oct 2026 09:34:23 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968b6absm1135149b3a.2.2026.10.02.09.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:34:22 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 8/9] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Fri,  2 Oct 2026 09:33:49 -0700
Message-ID: <20261002163350.1248431-9-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 is used as the rear camera in several Intel
IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
INT3477. Add a sensor configuration entry with a link frequency of
360 MHz to allow ipu_bridge to create the firmware node for this sensor.

Assisted-by: LLM
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..15fe4d057 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
-- 
2.53.0

