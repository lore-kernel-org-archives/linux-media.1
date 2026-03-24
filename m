Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AEC362125
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 21:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388537; cv=none; b=Ii0Swycf7DF+3TfgZjFrfb1TwpmdSmMr8bcbTMshYlcTfoo4l8nROfLjIOggnx/frHUxX8Vg8yCunM3QCVq/ebmR3ciP3zzRDx+Dj9fkDCy39S89/ofojLtDxa4Mnl7L+9XwiMNL0j3GAXjOu2Tg2KU7y34451N2AOQJPB2FQMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388537; c=relaxed/simple;
	bh=wde4TF8CgNzn8si/JL9P12OCZloroRuFEPIxq/TcvgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cKGr3eq7OJzjV5aRZ/mU0iIGbUdVEiumW+qcKV5mi2KxJAVD8pePuSrtxbcjZAI2sD0cjWy+rhK4HibXZqUxe+/CieA8W25XIXbJAi7nsPNoH3H1X2cql/KOArVKZP0klb1yAGSz0X2VHFMFS6LeignKky8XGoxSLRfPttxojvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLHSwrOG; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLHSwrOG"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c160cb021cso88361eec.1
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 14:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774388536; x=1774993336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=dLHSwrOGeT+W1RndkcpEeocleSNzFV/+NM9sjKqUlIGxqRTJ592xFEnC4n6peBvrl5
         pdoCq5YyL5N7A2goP3n9dXESTmFaQOJ1B7GupQinWxPXHkqtR+Lo9ZoK7ywDvw78sZGC
         vrXuFWlqnJhqd+sOWxjifn7y4G/ACZbdbzP+1CI2jk97InT0weCiiqeppcMcJNH/+DUd
         AjTQs3AYC2zzanpHWnOEslyzSUakbw5PmCeqte43bi1o+EKLTWroLit48l0Acrl/wKHE
         qHeCPlUAgjWK03lofsMTRr+CiOMlYwt40NQK2wbNM8hvOu1DwEvvBoyeFFsKMB2vZboO
         aVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388536; x=1774993336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=CTyBA7TQL+ZIMikqDHJznLcHED0nNZ7MIi++yYmFLFMxjbYxd0F8zw9DgfpucP9y01
         zKoZPuvdCPgEb1KJgDIVdZubEObEWHmYpcrz8rth3sjq5NEDMFD+hGRVYsgrs4r1t7Lw
         8hfAlGvuvQxwyAPgzzVwnAvLF3XP8yF6OUoBosrJMJW73UY1p/l88nbSqxvrspoZIWfQ
         jBOn/nZRheOx8tH7CudCnK8M9E8OfgRvqRavSPihdeSz1E1JyTmXbM0s86QtyN9fWnPs
         vZnzbxDO38yz2L8Zw1lZfvDJUknRsLyhj+JMc5V6cDWz2q6BKe0w+NZbvHJb3fJj1rZ8
         CUJQ==
X-Gm-Message-State: AOJu0YxH+tLhuvLHvxbrgVzFusg4/W2zCfrfzoDx9nA9CsMsHA/w6Q/T
	LpsSCZn5OdRS7FRLzOuLWv/3AoL096MNXAesQ/kDRSbHIbmjEsmlg9WE
X-Gm-Gg: ATEYQzxhIVfSXofbXa6Xep9l64ZUJEQ5x5hLG22PKVRC1wqW4Of4bE/3ZU+Tdssti7q
	MRJYFO0cCua5ggNQe9OzxxFJE9+VsRVCOKdG3bY89cazAUTuiJCYno41rIMBFeDfPBkOpk3Q3yz
	PuGfRgkcFi235safpFwadzKFznTbuI0FS+XJoPZww2R2ir/QF3sx7nBxFePojxqXNpuStJxB+pZ
	btZKPRcSvV/bsIdEHfBbFehzjkdjTUVJRegX10xTDKMeL46ggn+crcFSsOhPDEHo7BaO6bF7Fov
	cBHO3XP1RA/+ithIutTnT+hfe0ZreTPi5AOQiwLCMn5PGr5byPhQD8BIpE8Q3JijUvNXiPPXdgp
	VwYcg/YkBHOjrKdC0hg1qGCyIzlsAFUzvaFoKc9NK8tHgAJbuW8H0PMxHh0qKRzYVwVF0tosMl9
	nCePuKm2jBoNLF9K10Xl0W5g==
X-Received: by 2002:a05:7300:dc04:b0:2bd:cfce:4c4b with SMTP id 5a478bee46e88-2c15d32b6acmr432688eec.2.1774388535594;
        Tue, 24 Mar 2026 14:42:15 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm3284180eec.2.2026.03.24.14.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:42:15 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	lee@kernel.org,
	djrscally@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v2 4/5] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Tue, 24 Mar 2026 14:41:28 -0700
Message-ID: <20260324214129.17300-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324214129.17300-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
 <20260324214129.17300-1-tchatard@gmail.com>
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

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index fc6608e33..f51749d0f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -63,6 +63,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
-- 
2.51.0

