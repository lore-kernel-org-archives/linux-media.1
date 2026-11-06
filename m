Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793997827;
	b=S4mm2S/c5eQrya0cxNOUUpUHNCrg/9weUffG2y1W/tukMwNsEAy2R/nYOQh+XquDFh/0
	 eGYYmSROinNe2lK6enPkI30/YDJYtqjsHWWm6LFIxTk4WcTSQlrdRyfVAqu+wnHexSf3r
	 psD7tnR+Sqhgq03lPp4JyAayPy0fNAzluKM+rn20gEKFHVdSskl709mJ/PVVdsbtMNMte
	 kCKf5t+dmx6l5Nh+yWP4WGzFyZaFJKteMWH5qdbWPBCHDGv4wDovkCmqvqmR70pxXEd3F
	 b48gyiQ1JsSGCYpivgovG4GWTpQJ3J7tpAxsTRDO2PkYWaT94M5vK31qxHe0QyKO31A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793997827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AaqI4nsVwt8NwQMUqrGb4oKNqMy0e/MDsMcjH/j6UQo=;
	b=NKidmMsRdbHvWXs1gE/iq53QV/c/QurqMehHjEDbDTnT+mtfeaGP3ESdFwwi2BMPx/CP
	 5yr1VWX+WiLfeI6KcDdtesG9sqzfNUK/QqzS/zP7qaiVga/fMEey55TTEitWt+mHfPKdX
	 RfrSwoqsvTqwfcI9kaaDnpratFrcNUrMkzdt59sJyzQyGwhs33NFcymXnKDEAffqybPC+
	 6WOfWYXjFS9R0lFJbeAnykCSrVlDW+6wlLm9bPQ3xj/b5Ki9f1y7tVya+L2dpOuRfzGfv
	 URCBiwPw0XGzSrWLzMm8ynQS6NyrCI6lMqfy9+CYXSicHOKn5+8mDuv152InOx4/0PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQH2BzUH;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE8C606A337
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 20:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE8C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQH2BzUH
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67be1e468a8so647141d50.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 12:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793997826; x=1794602626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaqI4nsVwt8NwQMUqrGb4oKNqMy0e/MDsMcjH/j6UQo=;
        b=jQH2BzUHos+6wVQQVrDY0Db3P0nk5zQMZ8YzcSOOuzGGG+IqNiVNHmxDukOpVanSFn
         BdYNUUo2AdHsX1jjY3in/R4k7k6EiNTRVALyQFO7RVEW0mSJ/mrLmGWQiytj11HcjdOK
         ZtSQ05+zOeG9lotPJGrdMIitnMwCjoYp35FenSPEPxXYLfVvRC71WLV/1FMwA+IK6VaG
         BnR3wHv/vQBJn//+qD7NrX7dVn21OjvoHPkcfQLn9POqGmO3lEhzCBt8BIOWwNvgrolF
         OOLMxsg0cMaA/D5Nibvvt6O8lYjdhPgN+gWsOOMnTb6/uxpgR/xTokK/kO1PLoYLDO/U
         03KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793997826; x=1794602626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AaqI4nsVwt8NwQMUqrGb4oKNqMy0e/MDsMcjH/j6UQo=;
        b=pWFS9KQ72QS+V0XD8WXNo4QwcygV6Zp2++htrtNr1PaGY2chQ9fVHn4j52qCXWjLqM
         ZAI32lWwaItGqjgUhFY+nf026XnvPLM40ogrOpl2EhT1MEcGQqLABPoQYMEnuJgOy0z/
         SUSw+oOjGmo7BJBMZUG4reeo65fJB8v2vXy4KVTBoIVKNydT08+a0NBiSeNmPvFIAOxb
         a0gIUZg7o8N46xDyYPMOA3LQxV7TCsuVJxxt2FVeJr7Sk4nNo1HbJOHFKrrKvQUKeseZ
         u1mAReWDUW89TZTFN+CI/FuQFVNDnxPXacQk9929qKmw0NEqvPbT1kWcsVoOzYQGF9SZ
         3sEw==
X-Forwarded-Encrypted: i=1; AL+hErFvG4MiELk3tPxmdvTKlBj9V9lkkPcSps3L/0YEgtVzZRKN1AvdWnzRpxnD712rhDMRJ+IyGzx1PbxSJw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/14qAyswvvDPo9AC+OrqN8HiEfKg76RhBvq4CEsq59YIa0gZse
	3DKgJL09rW/TJDXw7fzb4s7qbj6SuVZ/Jcw3/n8oRaegAgkqm06laiA0
X-Gm-Gg: AYBFou0PsAe79BwsDOdM1ccL+qPi/De3G5gcp2tm75ocltq6Q2zL3KhL9Mu6tNHMnoD
	0/RbEK3rpuJq/WiTkS/cvShaZr5zbZz7LVr/COjiclmbIUOvH2iQfwVd7VfTZHYaiJwt7LS08Oe
	zS7LP6cvzdeIxq+YZOOerGDzGQ24PTs0h11YaDI3HyDE2Q3TocgkF3XWANy9ZqQXgJobNyAgau9
	AvpO5rUzR9ATmX7CXjXxh1p+9gHHNrPd3xbvXzbb6YjN009ezvwXAD6rrg7RRlqkTmTKj1C4nRN
	fvO+yZd4e+KFTVF4JqMlQkOGiiMHq0FSAVaYp9tWnM8PbyKj15XVHk8jcyQ2EKEKZgR+iCqfO0Y
	CqmzNDT9jmBzOoZhUp9hFDBmWerGeOEAaLOeW2yZOHgt4DuNq9ITnBsNlYFxQbJ6saGD+LkUN2T
	Z9clxBWcBToHE7g7CWNnTt1VZiZM+YVEqhfWK4qpEnA6j4KFksyyFuJE1TfZXYcYq7a+jEnQYIZ
	ktQm/9mbwuPAryBc9mVV2dHkpnZ+Xcg5Qbk7WVmwBPPo989oLmBMxeXWSZlKOSIl2VSrBl+7jl9
	ac/O1alApSVb//VYCOxj2l3gVmxydrMQWNwQgkfVNrT/D9VlC5DCYNdnHDw9BLvqy9o=
X-Received: by 2002:a05:690e:408b:b0:679:a190:cf34 with SMTP id 956f58d0204a3-67c14578350mr2134231d50.98.1793997825658;
        Fri, 06 Nov 2026 12:43:45 -0800 (PST)
Received: from carlos-MacBookPro11-2.home.arpa ([181.216.192.12])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c135ada39sm2731818d50.16.2026.11.06.12.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:43:45 -0800 (PST)
From: Carlos Alberto <carlosalberto4ti@gmail.com>
To: gregkh@linuxfoundation.org
Cc: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	patrik.r.jakobsson@gmail.com,
	linux-media@vger.kernel.org,
	devel@driverdev.osuosl.org,
	linux-kernel@vger.kernel.org,
	carlosalberto4ti@gmail.com
Subject: [PATCH 2/2] staging: media: wire up facetimehd in Kconfig and Makefile
Date: Fri,  6 Nov 2026 17:43:29 -0300
Message-ID: <20261106204329.2176266-3-carlosalberto4ti@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106204329.2176266-1-carlosalberto4ti@gmail.com>
References: <20261106204329.2176266-1-carlosalberto4ti@gmail.com>
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

Enable building the Apple FaceTime HD (BCM1570) camera driver as part of
the media staging subsystem.

Signed-off-by: Carlos Alberto <carlosalberto4ti@gmail.com>
---
 drivers/staging/media/Kconfig  | 1 +
 drivers/staging/media/Makefile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index e7f4c16..fab872f 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -4,5 +4,6 @@ if STAGING_MEDIA
 source "drivers/staging/media/ipu3/Kconfig"
 source "drivers/staging/media/max96712/Kconfig"
 source "drivers/staging/media/starfive/Kconfig"
+source "drivers/staging/media/facetimehd/Kconfig"
 
 endif
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 7d704eb..aaa3e2d 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
 obj-$(CONFIG_VIDEO_STARFIVE_CAMSS) += starfive/
+obj-$(CONFIG_VIDEO_FACETIMEHD)	+= facetimehd/
-- 
2.53.0

