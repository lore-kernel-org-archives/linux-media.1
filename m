Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314282;
	b=K7QGiyoYUu4sT9aAh5ROxcoJjChVtngpP++r4o8hwYj9XdqG0ViOjzBsHL3tXUSFDH7b
	 rAOzblEKQ7ZjZNaPKefFOejswG2tgqqwzC5mLjrE60BCqFnYhK4X2xd+/ArX6DMv7ajxB
	 hA10OWYvDO8puTpSLZN1XpW03+RIiXrWnuPMk8HpFiKaJD9zaJeVxatHccurCc2Lx5Nu6
	 ERBlvS85oeSeBG6mRBHd14YWgnC8pk8meKYJX8CSM+D8KdFQN8KoGYRL1qOq6IIoKGEkw
	 pCwjTYXpGm+Yw7L7NRUg73Y9l+8dwlET3zN7vv8f7s0tMORX8gMWLO9YYxyFk5ywMDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LIqybWUTQzegIEfoVn3a6+qxGy8XVtvbVV2ymuSqRgc=;
	b=JaON2/8wDhvPs6HEWjiaXIbfGVh9d+iyrWmoISvZc5zXbnrKX/IoYOXyrmsY4Zy2xwGD
	 TAo+XrMYDQq1U3seBrd61xp6vmp+tLd3qiGRZBhumNZari2DTJY3atSV+X49I8S6AZzaq
	 z7ftaa5OffXStB0tE58j4TkoXwSzmLkl4HZahJ+DUx6KHM+LRMoV7dnZerF9XdWmmAT0x
	 u4xSAMK58yFlwJl4pvxqkm6MhrePvNQTdcPBeqQeDWnUkymn0lp+fcVnNma/MNZDbiTvP
	 jlWUxs0h2mUqE1mZrcC5wxISFlEy1xwAn4U+/7RoHr6gvfl7vEzI2HOuvhtUuHuzlng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=metarealtyinc.ca;
	spf=pass smtp.mailfrom=metarealtyinc.ca;
	dkim=pass header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=RhEL56TW;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC673606A31C
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 12:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC673606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=RhEL56TW
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-77bf892b496so742366137.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 04:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc.ca; s=google; t=1794314281; x=1794919081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIqybWUTQzegIEfoVn3a6+qxGy8XVtvbVV2ymuSqRgc=;
        b=RhEL56TWvZBXkEIEDYfBQgetrfcsntdz9+ZDPeqE/R5D/l7VBDa8SbFKKD2SNgQ5x2
         394OOvhKe/y5ClVwdIb1P4XsznMFbB/0VIcXtvPWj3i/xjUH7A5QtEYipC/c620fZvgk
         4JFfpKE9lEufOGNsrIlYIhFHM69Y7biG82vOKYUkDXXUjChSkhEOiMsOERFtWzMKL0hS
         0RQCfKzdyQEnlpDUHx3JgZ0MYIbzEEAt2LOE6yYkTIx8rY16niz2/wKaxfIpnlKS28Ph
         xsjRZpmFpfaEY9B1gLvG3yAEWKjNJT64BKCf6xZuj8lsdPg+4htkegzdxmLfg5px8Q//
         xCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314281; x=1794919081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIqybWUTQzegIEfoVn3a6+qxGy8XVtvbVV2ymuSqRgc=;
        b=z1XezETbjbxWoNhJ0Im9ob/RLUvh1/sRjUYTWj5Kk116JDBUExIo49CI9u2g+bRT1y
         xtrcF/VfxcixR+ZLUgIP8ZLR9+Kvl0rvOK2CUrUzuWg5aK1MGEXUq4TgK5lg0b3UUndH
         pagymwD3U9PpWHJ2LKqw2PDX300r8FdJyazCt8nD4bHbOJ8xFoBVA9bfIrDzrBuxaa5c
         /02tIByON1swpRSdEmViBaISCPBju+lN6UWYLN2jg5dWFqBIRoV3Bz6rYrNKAGusIydz
         3f2D14oU0PeAIumM4ULh8KVJ5HYL/qehP2GHJMJwVBS+JPTbPggnawwuNg/3ZAgAhPy5
         RtBA==
X-Forwarded-Encrypted: i=1; AL+hErEHtdVgZQkk9WbzxD91VJnva4TL09p7Rv7NERJ7ICfTKm8OvVc7xl49qukceeymJrbTFbkDAxqpyawleA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9KnyrV4oSCOGgmBY2TNmI3DYxRJ7f0QzXcwWxHacDuYqZpvGzL
	HF0anNc1bwkIxBaX+UeciE4BArW/X09p1ZKPQUwk7IUoLzDP0cK9JQLlIk1WKzbBoVA=
X-Gm-Gg: AYBFou0CLPUD2Rf2A7QkFtcNJHh3UozSeqn3lkMlW5pXQMhmZqCUywnWNTgE8dxSFXQ
	janoGamllqXL6qEqWMy7FewZ+6LvdmvTysqfu4dPgvu3S5JmPgvr7oSXjTJPJtrnQTe0zga8bul
	Kr7pAvtoYDInnwrYe5u+krDGIUWzX9hDBOZDKca3XGoCZd0GEYlJ8VBTZ/eeKbVUpdw3GUwVbJU
	amrrQusCvU2KtmSrWmj5HeXvoYA0jas9pYIGgyxEd2nkNzLw9/J4bPmry14PjRuVFf8lFBCJvbp
	OMXdx9/ELcsjUMWDyFvR3nshvuxPK7tqP0r69LI5NOfgnEKXFBLW9JsnxUZ0+4fQ9hmhlqyyXFI
	j1RNKQfktKPvTV/RuFKXCrmFA1YLV1h4Jx3rsRYwNFBTd2UbzNP7Jd1Ekx70UhmUlhrEP+SLZK5
	vnSdhpwLloZf7rUgBXhiPQSBXvSGL2/hFHGveYjL90uRkU1K8fHbrcyyjyV/lTSogyGObT00coM
	c0DXIWkz9tdEtrToq//sjVmSC6N/adgBsMwwtc2Xe/6rbGgBheQ78QvNP92ahfxwnGjGTjpu2F7
	5VzwliDFXB+3T9fWWCJsFYwkV8oVLkL0Xbs3q4Ez7faXxNlHbyhKFQStLTgKs8dIqR/2A8jPuNZ
	F92HJGYhFVFuFTYvszThM1RF+8I8lZYtsDDS9XNJKvQ81m+SwbBHnukbBPsR52GU/b41ibPu966
	EzXUZsGa+DYzrfJpr/PbZ1F8w+c1jjmIWri8V/765C1bAII890Bm8oxINtVZjSs1cm
X-Received: by 2002:a05:6102:94c:b0:7c3:9b8d:5124 with SMTP id ada2fe7eead31-7d301ba5407mr716189137.18.1794314280680;
        Tue, 10 Nov 2026 04:38:00 -0800 (PST)
Received: from jake-laptop ([2607:fea8:c6:a700::879a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d30209ff97sm1658194137.0.2026.11.10.04.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:37:59 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: arpith99@gmail.com
Cc: sakari.ailus@linux.intel.com,
	gvozdoder@gmail.com,
	lixu.zhang@intel.com,
	mchehab@kernel.org,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] media: ivsc: csi: Add sensor node in bound callback
Date: Tue, 10 Nov 2026 07:37:57 -0500
Message-ID: <20261110123757.730188-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103200226.100989-1-arpith99@gmail.com>
References: <20261103200226.100989-1-arpith99@gmail.com>
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

(Resending, my first copy had a broken Cc list.)

Sorry about this, the HM1092 ipu-bridge entry went in ahead of the
driver. The change matches the CVS fix and looks right to me.

Reviewed-by: Jake Steinman <j@metarealtyinc.ca>

Sergey's VCM point probably still holds: a VCM instantiated by
ipu-bridge only gets its node from .complete(). Sakari, if you'd rather
not rely on per-bridge fixes until the hm1092 driver lands, I'm fine
with reverting 4fdb0342f05e.

Jake
