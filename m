Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039658;
	b=n8oLBkeIUFs+dv9z6WK3nN61/USJl859N6ls/+FIK43mDt8kfPtSjMwmjy6OtW86MpZL
	 ySbar6QUbrZJ+yREPVkrhJ2ebFsl5g3dHLxnmSQ8zHNst9sxW3o8OGGgsNQYeI5rU0zin
	 vvRsKBwd5BQoELhnk9Z6nKZ1+WmQ9SSFI1mKfB0nwLR2p5tgWc8rM9ViGLYTP5Hhs+XPx
	 Xu2LGxl2wZLlVmXnFV8w0Dp2jYDTKzrxqo+NG5Zyi8ws4tV0PpyFSa6bpOmg/HC9tQxf3
	 ZFm2ec11e95Psye3x7+fRiYogr4KgsCkpoP5U2Vh/DZUbooYt6Y8DKr0XyMleQyhKWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=o4fK+VM5phdV1u9FOggH5ztTAb+xziqUnUhmbDWQpUA=;
	b=krtuLmDkw/xkDkz20qTyLQ9BGvq61k4tFFsELlEMvqHBakSctdAoN2AxcMBnc6kVMo82
	 pFhZGFAeMS4LBysoXvDd3ju5yNDT21Xr4TqE6V3ClgjVpbZwfB5gEoHkMEmWIuoJxXhFj
	 q5WvIgV9i0xIdzkD9vJCrSQPJ9f56yc5HTgSXFEEpRBAFl/9On/KaB7egD85vXD1PikLC
	 Rfji9wQ7aGyd1IO405m/FVuQfAquq5Z8c5JYEyvPG7iEIfv5QGFeU3uZwtztintndXc+L
	 zfkMZArv46yWpjh2TZoqyhqlQ5G/v5TB9NeN/6GMVrKMyXYW6LYsugbREnxM7iw+tew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EN2z6pVs;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BFF606A31C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 22:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62BFF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EN2z6pVs
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso741421f8f.2
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 14:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795039657; x=1795644457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o4fK+VM5phdV1u9FOggH5ztTAb+xziqUnUhmbDWQpUA=;
        b=EN2z6pVssjLKuSvcSTfVUU2XsYZU8LdNBguLgEeRD9j2a/aINlZmtHfbXWvgT7lg+7
         MoE1yp0uo5BhaRDqcggD7DQ45VdGcyHYkPQXMCOuJ+w/wH2qElDnns9ZiS38mya3qofe
         b8tlJx4gzWkOoIqTRq7QiWClHh/wXl9Tztjo9X7lnJY2/S7FJ9CyhrspAEHT9JShB41u
         eWHc7bCsBVbIE2blmjonPlFHR879iOblH6DtCVnPugGoygrPGc0D2CzOWtDHtHRzG/cC
         is0nSXm+P82RkleF5GY3Lp5qCaUKcp/NEzwYN6d71/64ZsVzY25LCHe60XqZHC4GVXrI
         mLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795039657; x=1795644457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4fK+VM5phdV1u9FOggH5ztTAb+xziqUnUhmbDWQpUA=;
        b=MAIxKzJX4wLBtdhZDGepg3FM9pUpEhW1ooI5Bs1yquLEvoWQ3UBf4h+H32p8DaXe/0
         qAgFBStGxoAvd5EnJA7cpnE2bhgjJ/ZUVZQ5q9rH7n7t+XIFsyKNmMLk3g2Qfh3U9iSH
         R8IJ1yyhTsm9HE1VzZE2A0z1meuUDijt6oiqRv93/O/XYCUgoN0FqSv5Zml5Iml+rf52
         d5eLg6evpASoDY8MaUejjr4AY1lOKikY49b8oSZ7exYejcD2sVrrZGskbC/viAz8GE4e
         5WEXlTnI54X2I6KGv+0gZLrLLc5LGi1tQUuMB6RMUvIl/f9teUCrex6zYyghzFiVDQsz
         12vw==
X-Gm-Message-State: APuU4Z/Uv7M+1Q99NBjPhioaVCbSxV/Zqs+6bXRHAjZNLDGk6XVEti6n
	/vW3Ww6g7VoTmkEXMnKFU+oX2+vkK7FI97G1ehGoHu8mET73jUy/VJoV5N2pH1F0RjU=
X-Gm-Gg: AZFdTZcS/PtLf4AKjzKxpj+SMDpokkJi7vgf+WV+sjc8kZr29y7vxfKvcw4peEzjdj0
	VkC0kgcQFMmahK0JXeMuzHtluN1WNWm4SkfSJu2Ex3Yn5r7+WxtPZBp7N6wCNVk1WuIZQGF9gh5
	/jh6CkkbqJgnUT9rVVBIyvN0z5WUJIkNYVewVcbO59b2/aka0/pQRe6VW8aWStBsocV0BdqT964
	bZtMPKFy0FVsXEt9v8VGpOaE/7tpjw4i9fPQk6TJ8GZwVtFb1tO5z0Y5urN3DxwN5/tPaQtirZE
	ZYjiP/eXizwuxOBcrmRfIKCVfFII/KNG6BbvU3LT+QhDShiN6mcLzXX1hAc+Xm1p2KwhmNSUBok
	uYD9EBj5MZGvqk5UiUa2RoBeaCqzGqYBXgqOBOtk/NS5zfrJ/ewq9oGc0ciLNr9k8Q2BuEpMEmL
	D/jB6dnZagv02iponk3a+qZhjxYKv0irP/akVh2NTgXvrHEMYJXszojidmzhNT4yn0bLWiRKBct
	ljNnTyOiH+u6fzWArf+jGuRi6s/p3rutE+6ie1zywu+kcBIA39aTFB7kAXlfSXEPAx7c3KJbPKE
	lh2z0yWJ4t9Vk1jYZcEFKN1BLTQjUau9FH1OG4Dg5cwxcaw4sYUkBphjZOXoR1nIR5vscOpt
X-Received: by 2002:a05:6000:4703:b0:4a6:4f35:336b with SMTP id ffacd0b85a97d-4a64f353379mr7122654f8f.5.1795039656687;
        Wed, 18 Nov 2026 14:07:36 -0800 (PST)
Received: from Enricos-MacBook-Pro ([2a01:4b00:b82b:de00:c5e0:cc6:391:83e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3f7sm7541073f8f.24.2026.11.18.14.07.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 14:07:36 -0800 (PST)
From: Enrico Lorenzoni <enricolorenzoni59@gmail.com>
To: linux-media@vger.kernel.org,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org,
	Enrico Lorenzoni <enricolorenzoni59@gmail.com>
Subject: [PATCH 0/3] media: cxd2880: three small fixes
Date: Wed, 18 Nov 2026 22:07:29 +0000
Message-ID: <20261118220732.29246-1-enricolorenzoni59@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Three independent fixes for the CXD2880 driver, found while running
Raspberry Pi TV HATs (one and two tuners per Pi) with an out-of-tree
build of the driver. Each patch stands on its own and can be applied
separately.

1/3 removes a function-local static in cxd2880_attach() that is shared
    by all CXD2880 devices in the system.
2/3 keeps the TS reader thread alive until kthread_stop(), avoiding a
    use-after-free when an SPI command fails. Cc: stable.
3/3 lowers the per-tune and pre-lock DVB-T2 messages from info to debug.

They are independent of the carrier offset fix sent earlier:
https://lore.kernel.org/linux-media/20261118195135.92439-1-enricolorenzoni59@gmail.com/

The patches and changelogs were prepared with the help of an AI coding
assistant (Anthropic Claude); I have reviewed them. What was tested and
what could not be is described in each patch.

Enrico Lorenzoni (3):
  media: cxd2880: do not keep the attach state in a static variable
  media: cxd2880-spi: keep the TS thread alive until kthread_stop()
  media: cxd2880: lower routine tune and L1 messages to debug level

 .../media/dvb-frontends/cxd2880/cxd2880_top.c  | 18 +++++++++---------
 drivers/media/spi/cxd2880-spi.c                |  9 ++++-----
 2 files changed, 13 insertions(+), 14 deletions(-)


base-commit: aa0f4c41d4870a18e65772a1817af16427200371
-- 
2.47.3

