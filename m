Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A053AFB01
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 15:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791647791; cv=none; b=H5x6oXXJb4CQcPSd/NOedmyn/kc2YUxjfYE2I+OZZTcpjb/CdZBI/R3TKz2DD3Gta8ogKHyR9Wn62Gl2fHTrjaz1gH2TQjhQ8qU66ZZvN/VvbAa+SDY1UqF2cwXAvdemgkinyj91eDw20rCjCaeje7Kt7pOOAPQn1qCyv0xEgyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791647791; c=relaxed/simple;
	bh=hH79H3vo8l9b0pOUFINLiin80vIty5FUusR4bujw4Es=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bC4ZtjgFCZvAg93/uIB9kCJwpaHFHXjtPi7jYHdEO0QQHKDalfGZ1bYolH8TOxm3dxSzJI8G/yHP+MEJ1Xh8Ds0nfIOufN4bBkcnhWsmV4q76uCvK1KbnkfKIhtY6LlPtrrR1zTYMnpodg+ScyMdO6Rzniq1+Sko5AFHFCcw9Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHQTX7+M; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHQTX7+M"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so4482325e9.0
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 08:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791647788; x=1792252588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1fqqjrYoN5qO5PGqrAIgeLIk3sJV+IoDKwLgWXDiqk=;
        b=rHQTX7+MNXljd16TfFm55gRn/2oG1NDkza2VMyvxK78D41qO36XbjaetBMGIc0sSh0
         CaCVc+C4kBdytwBMzIaY3XIicgpnvREG9yiHZq8sYq37H/wwCIvrnEqDaJxR2Wfwo/cn
         YBrcroblKiMC6yWkcNfw7fpfMbybfEKqPWwPEqmDCZYraNOQbbL2dw2i2KR9G+++7+LF
         yJut5aVyziI2S/Y85UzmSBeWzr5WJyldNK2Ozx4pZlgdOpJdHQm9EEgV1W+ClxSQk2Bd
         +cFuhr20/NmGohuUhuvf0X/Rc0x/1UUsdcBYVAtjmcH3JXe6fyt7QeWW6ptUfxbN0nkS
         dFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791647788; x=1792252588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1fqqjrYoN5qO5PGqrAIgeLIk3sJV+IoDKwLgWXDiqk=;
        b=Daimcb2AO+n/8ONyFXC3+LWkze8FiGTlkOfyo4IanqXwS0uea5Sovm4zFVNAhGknrV
         qsQd4Zo4KVqNYMw2slVz7UrwA8szqhnQLO/Gu4so1G0y3yhk7kzEyK5omuhxOw2bTOYB
         Vv0brmOhvXLETtg/Rxw+MQSn7eRAbGUh183CUD2VPR0PRcdme/8Gu5+9m0kXM0JrKFhK
         xWDtHbN9f6BZ7lVhyDW0jdQ8sHfJkTYA6hbsR62dpRURooWN6NRuhaUN8jp9VYAUnWJ/
         FInmVwIKpBdKV7cQ9LsxEzDKiAhsc6zYxZlSE4+gAjqvfhpHQi/YRoAPtphEonYAMWh4
         /F3A==
X-Forwarded-Encrypted: i=1; AKwUvByrNToM+694eCu5TMsRkSmPPfKlY901fa6eNcQ4b8jz9h+SsCM7+QUtnqD47uyFqmtuQHtDHOu/ZbA1gg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKzZCH8Z2+XlIkG1sODCnJCzirBlT5jIWPVniKXUMvdhWk1yi1B
	mNKyJojERbtKuWY78KCYHmZ1LW5oYBj9Ow0vNEhWsHYIisPqQVigfy8=
X-Gm-Gg: AYBFou3yz5H22tYw25k2zoNwBXeHvhGuoNX2opErcJDdsGCEjRuPD57jD0KrFwkMwcE
	5MSVhM3Wn+MqOuKAJf+JCXDmU/8JWHsnk+rY0uH+idC9WlcxuA17vqnVg9ttxQ4FcNcbGhtrnZU
	q2kzeeuSbSw0w68G3b5ZlCq0/bAWg7NCMjiw1LyL9Gu261iBUkgpwYENEblhUX0WsnbN1AU0p+r
	JEzUkw97tti483t5bNlRFCZuDIRabr3McJJIPDWAcK0gr0hE5SKcC7GEh+S1pUDJIJcr+XaQsnN
	uXCdSre1YzwXVPxSeQKXg6hH3hqIf9icIrgMY02eBgHzQXebK+TilvyL6pCsZ+aTV6nPFwbdZDk
	f6Z5vwcfSykr+0lv3P4iBkatIEN0V7lsAy0K58zA6obhomZRfyH6WEKTIYisE0VVFB+zsSdyN76
	UFm0OEPyHB+kUVPAauiP7IG78G/MeCOLLlGed7mCcl2BtxJxjGl2qTfCqP3gUwMguyAAvMCbI5a
	I3eMYqWgR9+VmZta6Kv1+EsRa7WMm/GXcGuTF8C2RELbCzuXEAY5mY=
X-Received: by 2002:a05:600c:e557:20b0:49f:dd9f:6038 with SMTP id 5b1f17b1804b1-4a18e4bff94mr61576615e9.25.1791647787553;
        Sat, 10 Oct 2026 08:56:27 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm138023065e9.14.2026.10.10.08.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 08:56:26 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] media: ipu-bridge: survive module unload and reuse the software nodes on rebind
Date: Sat, 10 Oct 2026 17:56:24 +0200
Message-ID: <20261010155626.2766298-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

v4 addresses Sakari's review of v3. Both commit messages are much
shorter, the in-code comments are trimmed, and the data moved in 1/2
now lives in struct ipu_sensor as asked:

- the "lens-focus" name goes into struct ipu_property_names, next to
  clock_noncontinuous, so it is copied per sensor like every other
  property name and ipu_bridge_init() needs no strscpy() for it;
- link_freqs becomes a per-sensor array, which also drops the
  sensor - bridge->sensors indexing v3 needed.

No functional change against v3.

Testing: unchanged from v1/v2, on a Surface Pro 7+ (IPU6, OV5693 +
OV8865 + OV7251) running the equivalent change on 6.19 - the PCI remove
-> module unload -> rescan -> modprobe sequence, fatal today (-EEXIST),
completes cleanly with the series, with all three cameras streaming
after each rebind. The patches as posted are compile-tested only; that
machine is not on a media/next kernel and is leaving my hands, so I
cannot promise a fresh run on it.

Changes since v3:
- 1/2 and 2/2: commit messages cut down;
- 1/2: lens_focus moved into struct ipu_property_names and link_freqs
  into struct ipu_sensor;
- 2/2: reuse-path comment shortened, and the fwnode_handle_put()
  comment now says why the reference is dropped rather than what the
  call does.

Changes since v2:
- rebased onto media/next (1/2 rewritten for the new property
  indexing).

Changes since v1:
- shortened the 2/2 commit message;
- dev_info() -> dev_dbg() on the reuse path;
- Assisted-by: tag per Documentation/process/coding-assistants.rst.

v3: https://lore.kernel.org/linux-media/20261008132614.2456716-1-dmanresa@gmail.com/

Thanks,
D. Manresa

D. Manresa (2):
  media: ipu-bridge: don't reference the module image from software
    nodes
  media: ipu-bridge: reuse the software nodes on rebind

 drivers/media/pci/intel/ipu-bridge.c | 29 +++++++++++++++++++++++++---
 include/media/ipu-bridge.h           |  6 ++++++
 2 files changed, 32 insertions(+), 3 deletions(-)

-- 
2.43.0

