Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A45E38D3F8
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470166; cv=none; b=CoQQavn7kfIyrH5vUq38GOtBMWoEpI4T2gEV4Qfyiacfu38Ph6SbNp6uIvU/sA/2Hy8uJK5GjIDvogjCKTWWUuG/++Ki//5ViIddbh3LZkHoDB0vnkP9nTHYRi7ZAGRkRRfMCDDTriLSWDg+Bq8y2rH2rWyv1Kyh/IxeMkLUmw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470166; c=relaxed/simple;
	bh=MEi4MePEOlhyLiWhDXjcK23C8xJankTZUdjD50pO1Yo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aKg7oq1FMt/I7f0yeBSFLwWWxqWrOisrdfoQBGTS8K8qHqodbzyLcMn8595lGls8FNv765GWkrTrk5Uub/btFtFL0HK+ncF3/NuOw/a6nrpgX0oE+tjf8xhTO6zf8oN4AXvm7hVgF18//dDuXuH+W64HNCcikoj7O8F1hRt5zGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4d5Cs62; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4d5Cs62"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so1975790a12.0
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 07:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470165; x=1785074965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=00346VtkKx3gyCJc91Tl5P1B1MYLfkTlj8IZlPeohbI=;
        b=B4d5Cs62TX0fBM33QxLRygKSrDQ0s+1zBta4jJiqkaHKZTrXmS0/DKSFu2AvXjlDDz
         x9/Ee6BQpjv9dphUjBpC2hAMbx7VYCahGdIVM6J3TFsri34vTZRoBmgzNmIhbRm+bp41
         lL3PcK1SndnilDXtpKrLvJky8NIDiBWj9bLjlC3SpVyPPSW61a+LWsSI2F3W6nOZ2kbH
         lmYdGO71lEII0Fvz6e2JsAxOxkd8GOxtLG3QpAAJsVxrJHfuharDV35Qf3TX80/Arbaz
         JvCa1o4uQKeaW6CvQo3j72XrKOcNhI66aoCXGXhtJBqLPpJNYoB2tiK0u3NsxOIvmiWy
         XMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470165; x=1785074965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00346VtkKx3gyCJc91Tl5P1B1MYLfkTlj8IZlPeohbI=;
        b=Bl5+bEEVxh6lm+4gmnVqSoU2FZi6g6xlovpAQjgbtnA0JYH1I1kL6dosc1NNWml8iL
         0dBpU9p3ujLOXh4xmd29SErjKTtzpvQDvkFO8kUeacPOJ04rFd4MMk68R+zhQaTRH5RG
         KKpwSuAJqZknGxF+7R2XBF5q4MGlQ2lEV57etVDljV9Y6xBGDZHt/9P9THUpx/F5N4W9
         hXZyoBemLBJhfyv7vGX/Zy07YwX/eOSu+nKKCaPhfxUkfFf4fhy9lE4nQZsLfWJ9FZpQ
         UXKNR1Wgdlc3smVjGINDqnuD1Lyziqq+whn18ahA4ktc5yDtEonbmZShQ/0zjTJfxeYF
         aS5g==
X-Forwarded-Encrypted: i=1; AHgh+Ro4C7oXpGm4C7CHId+pZkZYgDcy7yQnhDwoIqAag9jaQGzlM1vKClN9VY7M+uqPXMQOgZEaz1af5Z+buw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3CL+zdbjLHONCPh+mE1nmBXU8MsnL1lD+v5FlYzdx8FA0W7bO
	n1q3Mr+JEOoF6eRPA0gM9yPDgYWJ4U+fhhDP4JOIEqITMIckX40d9PBb
X-Gm-Gg: AfdE7cnoZCS7y4AKF1iUkpOnlPlfeXoApSay43OvQVAWgsZrwu0uynfNtqdIH08meiZ
	sFoIuxVDTUC5XW6cI3/fgGTihU4DavYlEkM4aWfj8CigmTpHTKX3zpSOgih92LmaFUUAmon0Q8D
	r1/8FSxaYsUpNHbi7GdhCkmfjTh/L0wmoZJDP8o+XbI8Z1KjSKVXKii3gwNJA+HhcnzbH2x5U4j
	AV1Xz2R60GEezpCd4fVxR/5uSTitD+k3TzKpWX/J1IdhZ076NUOGs3ZWWUgHQGUtP9bPH8rqMO/
	na9o+rpJrCjmZxNDLLFzRXXqB3QFi21N0Jly5XUEYAg54yghhLmOtMZ+P32R20v6e5aHWsaX7nJ
	cj1Vopji+dwsVxFxfx5UrKyNGyAuQQxmpa8LUQCzmLz0evY+9yC5bFGCKJVzIuERyb3NrZntWiS
	4rbAJf+KbhrP5UCyvQvIqVlC9K
X-Received: by 2002:a05:6a20:9192:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3c38d9615abmr16276182637.17.1784470164815;
        Sun, 19 Jul 2026 07:09:24 -0700 (PDT)
Received: from UbuntuOS.. ([49.34.211.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20bf96sm26738331eec.28.2026.07.19.07.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:09:23 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH 0/2] staging: media: atomisp: Clean up unnecessary module parameters
Date: Sun, 19 Jul 2026 19:33:48 +0530
Message-Id: <20260719140350.8266-1-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses the 'Remove unnecessary/unwanted module
parameters' task listed in the atomisp driver's TODO file.

The first patch removes the unused debug parameters along with the
user-facing pad_w and pad_h parameters to safeguard hardware padding
boundaries. The second patch converts the remaining internal usages
of pad_w and pad_h to const configurations to enable compiler
optimizations and enforce type safety.

Prajval Chaudhary (2):
  staging: media: atomisp: Remove unused and unwanted debug module
    parameters
  staging: media: atomisp: Mark pad_w and pad_h as const constants

 .../media/atomisp/pci/atomisp_common.h        |  6 ++----
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 19 ++-----------------
 2 files changed, 4 insertions(+), 21 deletions(-)

-- 
2.34.1

