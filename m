Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586730;
	b=bArmyQf5kwtrj0j6vQVUD6MaCymuy0yZgkNszWf0/py95erKJ5XFQVhQWbVSzFOrQ5TD
	 DSihG7RtO30zDFUXlMh6B1r3uL+dB8AxwbgHw03WsxlmcA8ZBfCkz9FVph2jr3aFwZAxq
	 I6B16+n14gOIVb9FIEUs+Ok3BEEY9c8x1/at/HC6wtO+bhLxW9xKBCrHmHCTz3QoDoScD
	 41jzVr6OuKME7spHPUH1A9x+2I/N9s0vlaw0QK3up4D3Kxc+2hc3Jk1uWzkVsimUGL7ex
	 SEJaxkrzAw6FK9s0G8sE6eJcqza5DkJ3UuCSpB0wgQaY8qfGuOgMxgcGW2G549661YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=wB38b6je5TukLZG4QeKQmlwzA/Ycxh9nT5Bea008608=;
	b=ApSdyJo8hWKMfHmo5Dd/my7mnWTgMU59D40vMLersroVUiTnNkL30Q55mEHI/UaIec8n
	 llU0/1adVw4ecvcRNsXEp9TiJwBVEHE8GdIM+9rJWeE2Wubpwj1rji+v6B/p0l0Vy5Z1L
	 UNZy1dKDpz4N5ZleYBVi7h7zLSEVG8DinxyTHWBV021xxh5fGN2FZi8vZiKOcan6DIqbq
	 tuYdnVVVJDWHKA4XmmaQOTdFd/kYLcpvwvysqciASCbYwXQARUoEsy6vXbMFlaC3q/CdL
	 5FIpgSKeLLCjho/C/C26yB3rmwUN4OLOMG5vH4PkA4kAyA8Y5xbsaDhHJ8s+P4o5XIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At09PamB;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847B4606EB95
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 16:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 847B4606EB95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At09PamB
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c247f6687dcso289681066b.2
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586728; x=1795191528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wB38b6je5TukLZG4QeKQmlwzA/Ycxh9nT5Bea008608=;
        b=At09PamBlx0mgZ8wA1mn4FX0b8cMAl3wGpEtI5vUsyZVLZyLykijn6m+GBgHgmaz3k
         N5Lo76AHNSxg4Qh/mPhuczNxLbchBt9gYHFcLUj67NOD8u4MARnPOl3nJDJAZ7gABrOk
         aeyH/buHFumDJ/xvVZBaKjF5ueH6dBa8X5qoVlK7mgs7IkaoAUxDM5msSqZvSzxUpqnr
         gLXGN8g2/2+nmIQWofHRVcSR2Og6UWJX9G0RtZymvfi1lAnnf3q8yQ8T41Ep8PpFBmDu
         P/KCpvPP58K3MFtcs4kVVsNbubB6RKywoF+xivcSAJQj3YBXNjii7VJY1TMK8EevsSBk
         umwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586728; x=1795191528;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wB38b6je5TukLZG4QeKQmlwzA/Ycxh9nT5Bea008608=;
        b=jNzN0RHji5D62gGFAwZCxEeUwhith6ljcG1KOhdL+grseSF6qWLf43tsLaQLa5UmxK
         qGnc+69MrgaivVMWGb/KEUYxNignpbZUHSbhDwRGES2eXidSqc33FCis7lebZ760eYZP
         zF5r8+AEihhXnVJfKvJP2KiJ3AyASQviWeBs/N65USIwRGHJybAReyiaw2Wg66OZpMhx
         +mEtTgPvYpXkGtXOMkD8Yxbl+n7kwuVzhlHfYn4xXgjke/Li6wiSRrfTS9k5SWjLWgE+
         kFrjKsyyTzfV2hoB7jtixFHOm78UuQ88L4n1yiTnGZEAPRVl9t9x5+ClXWIaCdv7Yqi2
         pf9w==
X-Gm-Message-State: APuU4Z8XnlRhJ+v+SgvbMU1jPkn8zDLF//fbFSNrLlADpzbaXGAXdbSw
	dfNGL1TlDewcUo1yjUl8oLWhNeXNsrDk7ukVv8+DEB2HBj7umarJYvAg
X-Gm-Gg: AYBFou0ed7UlwXwocFqF5dSjIusBuZppD2rs7ZVKIR0ZoUvMfQ476TmlOdHyrAdtiSl
	TjeRMTWnlVhGsY7ux2iW+jsyQstifA8jhb67OXvGIOLrX4NylZ8vPq03LV4LsRLPcAgZoQ+PAI3
	BSC6CLxWyOoBow6LXlQx+kul2sPqPIpcF8a8I2hgFcW5IOSkWVvC6SYYnoFsogYzmTMAdj73kxc
	F+Z5dfjgiQpquj9tpmEzn3OeVAse0hBeugoAjHPPjX/4NzVNUf3qxAxLMKfSJGNivRNdcOCnjkQ
	rHvMCr2ZM4IL27EKt3QiNvdrWHltqB31sPe0opv5Ab/pX/aaOiHLc2MTZJeNcV2DOs1I1zr/InX
	Mblz987EAG/vX5tfTWIdfeP1Na3HeK9t4Q2aJOK93C2kHHmpCWiHhv4Aqo4t+kkFxeRxLb1yCXF
	yBqo82Liu4r9+Om5A5pSna1Sht5KblggcHcE3GiB1bfZEo9GHHBgG9gMeIug4OqguQMfk5rJJYw
	6GD1+QtK/8bzVmWKI2SOJYemJ5W1XtWA3+WGHqja/ov037OoaOho9rz1FK574DRrgPWpG/YmEd5
	jRh2FA4K0o74452fSr0DJ3l9QhhoNYYwvcGs9Uh2v2Fox+hGmmEAV4AztebjQqcDYzA3xg4sDU0
	QIxSmnXxk4w==
X-Received: by 2002:a17:907:c09:b0:c49:9231:5518 with SMTP id a640c23a62f3a-c50963d4f29mr272520066b.21.1794586727949;
        Fri, 13 Nov 2026 08:18:47 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 04/10] media: tegra-video: vi: Switch to media_entity_remote_source_pad_unique() helper
Date: Fri, 13 Nov 2026 18:18:13 +0200
Message-ID: <20261113161819.36847-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The tegra_channel_get_remote_source_subdev() helper walks up the chain
to the initial source. It blindly uses pad 0, assuming it will always be
the remote source pad. This may not be the case for more complex multipad
devices — for example, the mt9m114 camera sensor with a built-in IFP,
where the source pad is 1. Switch to
media_entity_remote_source_pad_unique() to specifically retrieve the
remote source pad.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/tegra-video/vi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 12eaa89304e84..a96ef26af89eb 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -187,9 +187,11 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 	if (!subdev)
 		return NULL;
 
+	entity = &subdev->entity;
+
 	pad = &subdev->entity.pads[0];
 	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
-		pad = media_pad_remote_pad_first(pad);
+		pad = media_entity_remote_source_pad_unique(entity);
 		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
 			break;
 		entity = pad->entity;
-- 
2.53.0

