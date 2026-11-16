Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829408;
	b=AuGg+0J8KQivuz+W7ltGP2vG16okmF2CG7OKLwGdKZ4yD5CZamqwcShxG0HpWPLl+dCn
	 klf8Z86frBTimI2AsYiRHsYo4+BfShWuo6YMTVXX7vPbJueswb4SrUbjTfeOvQ/51UmUX
	 vqCi/B8malJmSuACUoi+8eYvzrKfv4GctA6JWszWZqF4Kty8KuwasmQcosByHYMrSs5s9
	 UAjVQTKjl6yScSyja1hqnkuRYhodLaVdbfv7B+hZIJCkTdkqvzbTySKuQ8PSQnn8VKMTQ
	 rG21gznuugf2t9mJqBt3goy4lpu4oS4AJb0DzTQyxASeMDDN2vWCnTbRvhvunGk2PJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KTQjOLscv7pBRUr3IFndTok2cp32yKjgkssaNhdisLI=;
	b=CyYqhlgKDAZv/+m5mrJ2ieIxDmzjbMh+GGGWOEdaU9IiFLC5CqeIx8Uy9e+YJCiXkhPq
	 0d85o/ZjgcLNCc6YAVTPTRFEWkk95DvjUxxB5Qn4cOsitRZuh7J6gaB02nlSVKx+e8u0v
	 9EpA2qtaClaOw3aXes8fMtjeQwOC/ua5meewRiX+INN48LwOuLaIP2MOigqQOFwMsjd+9
	 Wjhue8hSIx7oV0MmSIsOXNK5gu7/grUE+aToKmLox1x8Vu3F1c6FPM+d77RrMQ3UCIryC
	 QT0bSR500h90LljahRr85FkH6DbtMO9hcMCeacSfutEBFrFM4kNuuv57WA2TM5Vbc6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sg23jUiE;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC1A606A323
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 11:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC1A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sg23jUiE
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso1903660a91.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 03:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794829408; x=1795434208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTQjOLscv7pBRUr3IFndTok2cp32yKjgkssaNhdisLI=;
        b=Sg23jUiEtSUhNxETJE0Xvi1ElvGviFGzaUVdNxH50arx87z28doyXl7c88creDnFoI
         RehL4ICNvs2NxeSLF9mjDOJlC+anDPzczR4hWhFa70j/XfGpd4vyMaD4532rrj1IRZE6
         iyRwD+xFh17fD7ZDjuX5zrhB7Ptqmgbovqrcbup1K9FLRMSXkQ/oamJEQWc/jN0PAuar
         yAoyLI4b2zFDBDqhauhw1xmkQ/SV1BhGeVDFqOjQWllik1EvfAwlg+2wXc7nxUY5vpCw
         vDSvcfxPPp5nev4F800QhzTJqzgGZbISfGafkKZubaZ4zoIAaZ/TfjS92foHKkcCqt/4
         nvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829408; x=1795434208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTQjOLscv7pBRUr3IFndTok2cp32yKjgkssaNhdisLI=;
        b=ZeOuUo7c9yS+NBkyOZ7NlPs+rTVgqwGsRZiFOo0jt9D/hRyW/mqh5Vu5OyzaN5D0xm
         OQ2GYTAJyhD4PYsXiRwmuu1YNjGPRPYNE3EI06qfhOEIrCVd7FZK0JhOFo3kPAnpsu8W
         mPsIrcgALm1RzFqpFDo6TwRDD0fdVeRt7WIZu9epNZiRN8GRcgNVrGC3bEX1VWWWmWhD
         c8NhIfMNr2v0MmnFILKC1yM4/b7hoYc8wOpOV23N9OIrSZZ0eJEzba07GULgW+Fo9pPZ
         So7SrrOUoYxqz/eZTYzX2wEvrM9goq6jWuL1i4SFf0qV7qzGKN4KZt9qSRpP7fWKBcoe
         c2Mg==
X-Forwarded-Encrypted: i=1; AL+hErFmqFAQh+1SiSCUuhdX/J9IG7++W2clxDGMcdyZJTqjNgMhVSvePLXY8xzh1x9FdYHb9nggvTmsP0q4ag==@vger.kernel.org
X-Gm-Message-State: APuU4Z9GOcPtzGmqkFeORN1pF7W+I4PmgIItyi6eJO6nFt8EvXxBeO1w
	fcdrXzSsdiELiUXp8gZo2Sb9RyYArT1GYFIjf8WsVLW8ImL9ns7iQvGF
X-Gm-Gg: AZFdTZfDgZ8MYQ3L0jHQMYO7LBeXNOO+EIL+UhS9lvfscRER/XzsYkdGtvxRXwXm+1G
	ep5zU74pMjxM4/w8PTTfoyYdd/MaUYp2ex78HPeWD0TUtxr9PfYEYIL1UVLdMzPtkZg55LO4qE6
	QFfVZCM1TnqbFFsl48nx1erR307/cFduD6QGJFqp9JCSfpGHP12uvp7xnpiV1Hy3uTreeNpAJo+
	RVWP48utMqNImeo6ZOFZ76nZGpGjXr4zZRPdZM/9JL2QSy/L6TVhuPAznlPxW8tJt7YQD19RpOq
	W1RFLpM0mqjSRcuf3wbSIv0ah2VpVLLMcNU6q7/TOsdre/kFiVsdNe9m2gnYks7Hx9iWjDt2EPJ
	oV22MYv6sPEzMEvXai4nPPNdp4GwsghfAfYYWKoF6LCIxyXcw8e4BHu+fS7wbxrX/CPHeElbsTa
	WGvIePUvO2cnUcBjw22PvNapZwtfRDadKA9jAIs5AnuPE69suEEORjBrqPeUlUQOfs+8W9Lrpq3
	WxFiQCf1GqArF+lUqMaWDIHb2irwWIzIM2PvY8kfEvuzrZg20QEaspwBvTjCJ2KPjqiOa3Z2npB
	ez3tu4xRiPnOdlEwlLkN/S/wb0z/30IVZORU2WDVkXozZ1DYvNMuA8a+DF+Z4ZHKAH0Y8/2RAw=
	=
X-Received: by 2002:a17:90b:49:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3b1b081bbd8mr9740865a91.7.1794829407614;
        Mon, 16 Nov 2026 03:43:27 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1baaafdadsm14089519a91.13.2026.11.16.03.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:43:27 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH 0/3] media: atomisp: remove unused functions
Date: Mon, 16 Nov 2026 11:42:42 +0000
Message-ID: <20261116114250.6587-1-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
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

These three functions have no callers anywhere in the tree. Remove
them along with their declarations.

Found via a tree-wide search for functions whose name appears only in
their definition and prototype, and compile-tested under allmodconfig.

Avishek Chaulagain (3):
  media: atomisp: Remove unused any_virq_signal()
  media: atomisp: Remove unused get_sp_code_addr()
  media: atomisp: Remove unused hmm_flush()

 drivers/staging/media/atomisp/include/hmm/hmm.h           | 1 -
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c      | 8 --------
 .../atomisp/pci/hive_isp_css_include/host/irq_public.h    | 1 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c               | 5 -----
 .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h  | 1 -
 .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c | 5 -----
 6 files changed, 21 deletions(-)

-- 
2.43.0

