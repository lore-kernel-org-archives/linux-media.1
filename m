Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267978;
	b=o9GEHb4j3PGr6/J8bBs/4hDA1PPISC4GhY2rAmD1By8oowBDcWIiNXdTNWROnjqbc1jR
	 a/idoHasTVUDWEx+kH0i+GuIGTVawcghW2U7VF+81hgwDtciSVRqyHhRMl65jmrJxzTF6
	 KE0kOHrEBvzihNKy+pHiEv54mFrE1wz18lusg2i21KMvntFFBp0nayxI9HVoWZAI0huXb
	 ezXkCLwMAtXqfzbw0sOv8rMReBnj++YxRNNMnD1qPmrRCLXsKVzJ8Z8LrA4JuDOMBtISz
	 rvKlHg1BmyNjcUouPY2/zV+PtG1uZG51McuLXsKF6I6acIFR3srwomWQwirjmuXbtWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=54HoHtyBCmpZ6kkP9mnsCMJlZYb74fsAgesBBR9Cid0=;
	b=njGmAYCfiHbFmC2WFwl8yaBr0vomxu0WXrFELMFC9f5x4uPpM+f1xs5RXjdBiW99Gj/u
	 nHsCFiZifFOUeonXpwz9O1CdO5TfrLT0F0vMPHjQl+NJchDkfGMYV30GhKLxUnBkzYv41
	 MtIf+vfA/vsssLwXl7KBDWYz174ecypVr6Mo4L7dm32bDsyiHaZ7O+Gh9I568UcGIO2cm
	 zLyQgD/Hs/OwaT1+H8Dr8ZzHhMtQnIXZxtN4LxSRtNkpggM5l6YTC8jEtqJy651+I7zJx
	 tkdjNQ7bT5BW2BH4/HYcvicq5IsLwb2GNEwqdccx9f4ul1/lxF/x170ZJ18S1hIZugg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4FSYklA;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DA5606A683
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 13:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43DA5606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4FSYklA
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so13645775e9.1
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 05:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267976; x=1795872776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54HoHtyBCmpZ6kkP9mnsCMJlZYb74fsAgesBBR9Cid0=;
        b=o4FSYklAFTz2MCeYPLpS/6EMK0P7m2UZ8gmkwXhHcI6T0QNTTe2NzKMKuAF3wubeYw
         MCIE31sJVJH0+ih5gbPlUOhtfVFO9zaThOnxFWMtgV7KQfkfuG5dkBTR8Av92hflocdG
         7S4cfW6GaAyU7kZyI85R37D/wXHVSxtbRFaRmUiRu6Oxxe3IIiTxF97xBRKnLNRhGlPM
         xBNC/EXU9nL7mzEpB6Y2pNZXwVP2T/0Qy5HkL2CG0MPcrzLpjwE0OXvftsYIh8GWiXFQ
         sEYj0b+wrmwrIn1JwE+mzuP/hS5h1FNQ+aXT/Wk4SX6LWRSXDjkyTE9CNRt1fHGvuNZD
         YeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267977; x=1795872777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=54HoHtyBCmpZ6kkP9mnsCMJlZYb74fsAgesBBR9Cid0=;
        b=bmHxNJGLkjcxIzaDDhvXJq+togpjkF8osXG7IqoxS1fZ43WTNLM3sFhwucKh8yjjxK
         9+xbWQpjbK221ueIQhYUQjWNo+DpM7rxFB4YFFNnr1MVPTgMrUIBB5rHHjFt88BUKufm
         Uqu/NhW58hXvQd/s1rwmlbmzDBQFKt1a39mBH+esl12FuzM/3MbkC8I+9iAkocWr8UIa
         YtewoBeYYzzastDA+EYoI+HJbL3IbrP6lECOwcKUmuLIT8eR+y3LZgCXaBWJooa2LtF9
         WHfMGg8nOBgrvgBHegNPvaQo+FgIqVe65ZUwT+Cxkc5Q2L8u4F91wk+woHIQG9JOm7e4
         VWlg==
X-Gm-Message-State: APuU4Z/xAkthLkOMAxuaPkyM4adV9iAzBNzXXyAUNu5fI0JkyXf3kY15
	jwQZ0lICZCDcOA9/ypAAFBKliL2ER/YQtPvB/a2ihp3rO48aeuW8REXCXP6ZfA==
X-Gm-Gg: AZFdTZexknUmWD6ozjzwCqh2gUrD9S7HkoRBDEiEMAZO3dyaCcr7+YYye+uiEwRIdpY
	W07H6ZfHaKpsgwmjM2VVOymHKFOGri1Hdsp/Nsk9SzKm+Yjy62eq2q+VUp1mbTY9f9D0qlKwIgb
	aRhl4gTWB2OaYW6TXMAlDiVYxZC444qxYICzbMxkEmd+0S6X7ekZlq4wn/EixGeWp3iSyVOI5T+
	5vrxTX8oDlOEF+Mrja/VmXOL6nziSmGZgt5+epFKzQK4zDGuisDzZ3SbYSZk0gd3gifNtsKGNdC
	cJ+wZ6xgBilNyqRcuvsJrfOd0FgROZSrQQiY5hydDdQ1oMEvBccUX8/nSi+IiUYkCWFGPDJcO8U
	+YTva6DLu/cpbPTXarHUur7x8vWTW5RgN6dNy9FG/2hjwXnjx2P+tputaxGpXb0jHfOUweL3AA7
	JJwkpSuPF7NF2ruAuoCu9OHM1n5uYQaNC5UMR7hGDyQz0M1tfIjagOxzp9oeZ0CUxJT7n0a4jaK
	pRzvdu4sqyqRb1k2h0F1SJvEkTnb/1oMioUAhEFjbOyLSDEIjYgINjJHABn0XtEcM8QCw37NZV2
	EAHZuKLxfoyUueqPlrwRy3WtCOnmEIPNshZRFfOEns18s1QbMrxXfsaDwEILVPLldbno9QPT7/M
	glWg878APm2CA
X-Received: by 2002:a05:600c:a088:b0:4bb:6473:cde9 with SMTP id 5b1f17b1804b1-4bb8880f2d8mr120065625e9.6.1795267976558;
        Sat, 21 Nov 2026 05:32:56 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:56 -0800 (PST)
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
Subject: [PATCH v11 05/14] media: intel: ipu-bridge: Add the Yoga Book OVTI2740 entry
Date: Sat, 21 Nov 2026 14:31:35 +0100
Message-ID: <48564c62d0c08d66023a40b6cdc175e5af88fbe4.1795267528.git.mauriziocasciano7@gmail.com>
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

The Yoga Book YB1-X91 uses OVTI2740 for its OV2740 front sensor. Add
its default link frequency so the IPU bridge can construct the software
endpoint. The existing INT3477 entry covers the rear sensor.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 2a38c4bd8..5f6baac2c 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -115,6 +115,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV5693 */
-- 
2.53.0


