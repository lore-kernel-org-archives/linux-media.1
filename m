Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915933;
	b=d8NthbnTGlfbjLiCoNa5hcj/SpVyJ0dov2F8M4+sL7IHFAp8YJUgtW9b4cB7OBVnjv/5
	 4iUCoAdZgZcUcY1K/rGZRfIu2YYDkkY8CXUVgAFP0oZ2kc7Zbh5kp8m5s10iAneh7DNet
	 28UPGEphmEKkjjERe1sHSsFXliizVkidr90Mc29takBhil+mD0etZkdsc0PbaxtYUDWzF
	 aTohaWlOSzrpaXQoSlIUDSq74UcIOMY7j2mG7gxrmLa+cwMpID95DQxifpG8XP0uzYn7x
	 Vba+HoICAOmJQLnf5LYlZg8VQIwItyIIVtKNokbhQjAALheCwcMmx58KgDg4kSv4z0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=17Of1ohVlTnK3P4A9jeZWTwwsZHNP9e2kxpo4Cftll0=;
	b=l89CpJY9x2OaeOgOfhuNShO5Y60wC9LE+QcoKbqMS8utHqbWmBf+reFiTTLnfF4JlyWo
	 tlmjURlawqEybpcNq3MaAtCaUsxzk4w8zqzd6k+EQnEGH5JQK8rMBVChMI318dX2N8Smz
	 anojgfWK5pFoddyMbZOE+Lo+gXAjH1t926ZuTgotxJ57+lvgPFUhJ4Sq8ptBv8zqO4fbz
	 yL/0QrFSivG9Kq25vgqehE0o5nCwWTjeW0fuJU+Os500ZJiTraTDeQ0X5EJsZpafVABbg
	 NTrYTAYlNkmaNTXf2w6kKJJ+EN1ZBO9NsYgMkRnh8pDJcX9DcIWm66K1avo+0DyZgcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=S8I8RmoN;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FA7606A330
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 11:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5FA7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=S8I8RmoN
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14470729eso3785941e87.2
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 03:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794915931; x=1795520731; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=17Of1ohVlTnK3P4A9jeZWTwwsZHNP9e2kxpo4Cftll0=;
        b=S8I8RmoNLJKbPWlBsMnp6qxBDKnOAimv5Lv4AbuMtxCxxooienFAIRt7stT2m/7d/l
         5ze9aOCWZ8EMaQOAEdq7w2cEApjUiek0Z4C0RKeamBqE4dR0DY2pKdgGVhUzGxjW/Ucs
         kf1NaE84PL3nA1NwPC82stJux+MbGzMluAmW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915931; x=1795520731;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=17Of1ohVlTnK3P4A9jeZWTwwsZHNP9e2kxpo4Cftll0=;
        b=KKE8jQiFMskijXuqzCLa4MhZSJtc/fw/Dd0/X/+UE4vkcQBJsRtm87MI9Sk/xp86hV
         Vyj5FK0YJ2zvvPuTMYm+1YhEvgJg/j1OifMgv24nOL0FUB7jTjLdN81+EzBNs1dvgK7F
         tFOYXnx6x/e18BjmGaR4u1vM8zkbrpXOjv7PUTNxsZ/dpfZARJLpXlj9OZVQYE6SA9qA
         ddCROzmrb/+xQSQrfsugZSDqJznp2z3o2T3eOzifIeQ6d0bmikYKggnQw5YSLt8t3pLZ
         F2lCJbFL8h/UgnPaPtXMA8kPYz3B6R/R/Rpxgz4Fw6+WUEjLFj6pj242l7j8jvsVFYWv
         5/Bg==
X-Gm-Message-State: APuU4Z/NoaOy5VIe0OQiAcf1wWCzSmDAQ2nplV6FE0mihPbcgOueTlKW
	Kxrm4EfAATRMbqakypV51HHq2xG7kNIAS5Bfq0HCc3QifidWjH8oCcXX9fXGEHBGBw==
X-Gm-Gg: AYBFou354Vi2+tcy/T/mcZuRF8PQMLoegFArks9ISGms+EQsUfyQytQS3Nomtf+nop9
	+Y02g4kEJww8WPbgWK5JpXu97bHsqm6xaJFFDc9asrlsdy9j2X3Y073YzMz1EdW0gTXOIijkf9A
	6G+KK/V0BW25xTqa44UYc4tRmW3zoOvCJwrQu4xY5N0CZW8S6L2Njt107DNiE/MBLjqPDvb+n/9
	RkubForqUEsiTlShHRiTkomLKS0D6bHCg0DXUR08JVkR2qKNGtw1UafpPKFZi9s+fjkStMQ3gIA
	wjNpXiTMilLSSnoW3v8PAUKcPvUvdZj3UpLI8mT/0MsQZxocMOVqpMdEzYyrB+sFXdXcXT+8Y4i
	ZODe3lyYnIeF/0uOCkBs4dW0GtXI+fORRdeDRpGCz7/SEw8k/cOMcy5gfH+DOZrCvFZf+6fmCpW
	ozxNC2fw5AuTZ91f9ZGx97TMBFyc/GExp3JX9reNdUYH3/qaWFtNQAmu7mjYSzfvWA9WyTSipsW
	G4WWVucMPjMMDy5Oc2FCUmNB6Rh516vwsU2YtqEGMrqtjSsMsG+q0jj3WXxF3M7tBVF0NBs+aGH
	EdPJSywXp60n/mDPd8KzO1CYYz7x3I7lC8ulWfAV5Es5pmk3sE1btzM87D0x4csfixbCp+7z9QW
	dy29DsZe7Gg==
X-Received: by 2002:a05:6512:3182:b0:5c1:5bcc:bf0e with SMTP id 2adb3069b0e04-5c170b1c308mr5151649e87.14.1794915930932;
        Tue, 17 Nov 2026 03:45:30 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712d9dd4sm3955141e87.7.2026.11.17.03.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:45:30 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/2] media: uvcvideo: Fix HEVC formats for DJI cameras
Date: Tue, 17 Nov 2026 11:45:24 +0000
Message-Id: <20261117-uvc-dji-v1-0-7cb3cf3b4b5a@chromium.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQ+/GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nz3dKyZN2UrExd88Q0C6PERFNzIKEEVF1QlJqWWQE2KTq2thYASjd
 ud1kAAAA=
X-Change-ID: 20261117-uvc-dji-7af82aa572aa
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org, 
 Jordan Moormann <service@jordan-systems.de>
X-Mailer: b4 0.14.3

DJI cameras seem to have incorrect descriptors that do not set the
compressed flag for HEVC formats. Fix that.

While at it, fix a nasty warning when the buffersize is 0

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (2):
      media: uvcvideo: Do not setup queues with buffersize 0
      media: uvcvideo: Force the COMPRESSED flag for compressed formats

 drivers/media/usb/uvc/uvc_driver.c | 20 +++++++++++++++++++-
 drivers/media/usb/uvc/uvc_queue.c  |  3 +++
 2 files changed, 22 insertions(+), 1 deletion(-)
---
base-commit: 48fe5a7834cc10081887d7bcd9ff0a4cadc3fa8c
change-id: 20261117-uvc-dji-7af82aa572aa

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

