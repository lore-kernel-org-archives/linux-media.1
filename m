Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBF9345EDF
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 17:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784742510; cv=none; b=WkrcCywqHDycpqgwEdIDUmNpb0Rtny1Jnvyk++C4jkD3nRi9B4E9LPonWfkKHyXijxpPiIGthu8hJiFLHgmcQlnxEkZbZfCTPpPSBS7Q/pHbMYA+zazBbuqbZK0DyMyQN9VM/S9uIamDb9oeW1JXneQJLE0b5PHCV70VjoT1ZTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784742510; c=relaxed/simple;
	bh=uNGdvVlUjbyCtzw+OUV8NYc8KcS9DKRjygI7lgJTIX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mq2m5KPa1fdEepQzvowDk53b+/vnm4KlIxHoQwWk+qwB5GTvvyR8cb8i0VezpGQTpIMgL8QE545CuP7LRdY2UVX5/T6za3JE+Kj6NIaWfgm2vZc4gTeMl2tGwwTez3TfrHNoYqpzq6Qohz+xhY89+GTU8S2hJlDSAD7y1pckDp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s68STE1d; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s68STE1d"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f752b3423so2993767f8f.3
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 10:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784742501; x=1785347301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KR6U6loUN0XySvO98LQDKeYmAr3LHM2/q9hDv0i3JqQ=;
        b=s68STE1dLUSRIWV2WOI/pOzCh4ktKDXNBtcfcjX3ByEbL1ONjdfoSsEa+mPJOOKYjf
         nNGdliJyej8LI0dkMeVqZBNx4uZd3YvFT0Lv056Mrd4jVkyG5N5MXsSDbBeb/t0bDTDH
         w4J085bUE0MG1nsAiqpsabnBvTCb1HcD5fNkpt7XrBCzcaH9x0/5apvE3EAbCFb6P7x0
         Ku6XVTbWp8lT4qBEFMnbX9bTJmMXXfuWjc6C831fxsCnMKmlMXjVUmxAgKw01zlejfaB
         g+mtnQsrc69cimOwE0bjGQRiR9nDzFy+huAjYs1UPlmmogI74o1oDoIZx0vY1uR8y6AP
         ipVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784742501; x=1785347301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KR6U6loUN0XySvO98LQDKeYmAr3LHM2/q9hDv0i3JqQ=;
        b=iJZlq/43XOqloMn3M/2xCWwmUufKZ1MPJsyXre+smzxkbn6hdob5264pqll9f0je5p
         I0B7ocj0FfEP0tU0IZw2kHsZqRwFYxi0XPzMaRE0ngjlEa/QsZvXUA7eRVpDskzB7uF9
         CUbfhYuLrCSfsGdRw7642a3TBYiK5+ke8Mp3+UQlt0Ce2nCHejbMLAkLiOE5BG/2Mbd/
         PX+2NIYvTIY/Bs15/KFEg6w4SWdorWm2g2q67woVPmUJJ/RerxRSvkNiqAR9BdNy3Lnj
         oVPaHaC7/TN7ZEFtKRbWOg0W8/hWRO2YCCQtDSjrEjDcw0cMizDQZm0V8r3LXkOT4K7K
         c+1g==
X-Gm-Message-State: AOJu0YwK6SMEe2rAidewZf6vpl2lP0ZYHMGaMRIfM0gFMKfSOoCrzSOM
	rKg2zbXalvkcuN+DZIxhp91Ljbkb0/UtFmZsMGM97OfwZ4FEO6SRik2a
X-Gm-Gg: AR+sD13CXOlFE0Hb1NGQS1R5QMShzSU+e+U8ASqnr+aWugTQKHhEGZplIW/uU5zFN7P
	U3KSIjbNEWv6WdX5LzcjY6Wj6f+HVgp/nBK05378FLTRS6+PmoCdHXaW0wryq5F8NcSBYl8jr6F
	62xX6oQMq18pupRaOvgGiLbSLpClYNGC8SFTRwGjCh3DfwyKd+BdZbINahpSiWozmDYNXIcS3Rv
	wYiEHnZNWEXm2m8T+MV8uDQIa5nk78EDu5Vc0+3iUC66ZrUQywFm1xGqQK4yWLEBG+nCL59wb32
	iNUVAlQieVPX8nrduPKmEF/Ddo+TYPasLPhJ81eZTaLLKY/DXAHEyAHTYJG6JerV+fepWyvBbPH
	9XFQ98w8ZGuxWYKmTHciFR2mSrFQXuO1HmbhlY5emrG/tpIQgwa1f86qK7C52O+ytpAv+kkp0Qi
	OpKHQzq4Bw3NAcXQ==
X-Received: by 2002:a05:6000:2910:b0:47f:697b:de65 with SMTP id ffacd0b85a97d-47f88656f9bmr3595507f8f.60.1784742501403;
        Wed, 22 Jul 2026 10:48:21 -0700 (PDT)
Received: from ubuntu ([103.196.162.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bd77a9sm7455278f8f.14.2026.07.22.10.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:48:21 -0700 (PDT)
From: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>
Subject: [PATCH] media: tegra-video: Fix length warnings in tegra20.c
Date: Wed, 22 Jul 2026 22:47:22 +0500
Message-ID: <20260722174722.413123-1-mukhtarfaisal03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap long function arguments under the starting
parentheses because of line length style warning
reported by checkpatch.pl

Signed-off-by: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb776..eb1fc5b7e2cd 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -552,7 +552,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1),
+				 base + chan->start_offset);
 		break;
 	/* RAW8 */
 	case V4L2_PIX_FMT_SRGGB8:
@@ -565,7 +566,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_SGBRG10:
 	case V4L2_PIX_FMT_SBGGR10:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_2),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2),
+				 base + chan->start_offset);
 		break;
 	}
 }
-- 
2.53.0

