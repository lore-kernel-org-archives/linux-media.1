Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1872FD1CA
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 16:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108417; cv=none; b=j3sSGuHbb1zQh040N9aPkq/Mb6Vb8ZhMSriFrRpge9xd+XK2BvMKo9LWGRReh0VG4DXwq16Y+BqT8hdWZ3PsAHbxj4/UezBDU/y1CDrniNvdUCeb0hOkmLH7xU9FOdQZv0Fy2Ysf6DQRMuBt397ZDjQIN5uri8jWN2JUmc4U2bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108417; c=relaxed/simple;
	bh=s8wfvmKnT5EThbr+o6FwlV78PF2rGcjx4RuC4H0QgtQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sPA0JYiKdfgdPRgtGnvmE56EpRhKjrPeylJUC++Ts9BUOmmMfDjlPAmaM9Ltv7RltCvTxWmdLRgMkOHYQMl4icaKr3XHX+UQMTgQzdq5Sd6XNViUa55743vDPqajUqDRfoEK9BUytvJB+5d6J0ww3vDXgZtz43qXMEOGpQ25sg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cpnejtQ6; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cpnejtQ6"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa619653e4so21545e87.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 09:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781108415; x=1781713215; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ca/qQ2yJUURFkQI8KWw8AjEcxJ3dgga4R9Q3zcxa4Yk=;
        b=cpnejtQ6Ag/jFo8etOQXl33qG4QIeAWIEqRjqu2fsv7HbuoSEp4lQ2LIT62iG2fQx2
         jqAnwsPHG9y67lXZlz5mN6nt+NKn32wYEEhpExLveAMi+63yRXPPyat8r17ql1yKAFdS
         NJ0cUKfsDcY8SLWt64wVEKDNbeey+McSlD1Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781108415; x=1781713215;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca/qQ2yJUURFkQI8KWw8AjEcxJ3dgga4R9Q3zcxa4Yk=;
        b=fUiW+cfV4uFOcrE7EKM5H8pd3Zp8X/BF9Ge/zhqsqlZ3wSp/MmMozAjzCLzi5wyQyu
         C/J8spU6zKAkjYoUtucv73JQQYHf3bwbcb3HL8CpTuoukZpsGoUZFD2aLfOHFqbJeC3y
         u8SweIo0E7cBYvxUkjKvePHgoKEyIqcW3atA2wwZiMGORJGXEvjOzlyydU86zJgtc2pH
         y1o+dNgef7M4vGxP5JghW0IFC3TcVsoXRBeTJTQtFMRZNj+fymHJS6+5dFk3qPuQOYCs
         JM2oCJaDfas8GuQhoKEzWKewkg7AkRvMO22sVTtAEJDPxIhs7bvHO0gzRqGpJGK6w+MV
         wIYA==
X-Forwarded-Encrypted: i=1; AFNElJ+JduV/1u1+IpQaG/9ypsecSnqhKuwWJk54C9I66ozvWZM8oszrOYxnL9YJyKgY6eEq3v1SdgFi9Qj6/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXlljHwb97f40YTEN8alz/uwHEPWVJ8PTz8ShIKuse4RO8qGgc
	YuV+nqQTe+JpJVdjUDhB07FuT10xeyFaC/g1YqX6TMxD7QLRZaPGQNy6zfHje06iuA==
X-Gm-Gg: Acq92OFdPz3VsrWqo4uZbVbA4pQra8AjAARg1ELSKW7pKolNH3pnqG18E9y6S/XkOI9
	4vPYn6GOty4mcluR+rEYJprewaxQ0mGPZzqhUpreykEMZnalzMR2nk/1VCt7lHSNUiKxS/PR649
	FawJMuoM4nWmfgUgIyhZ3hi4hsTn4snnb2X3D9Uf48gci4TniNkNHwpm9axEgIEljYuJT8xnrMv
	afQoDVJh4csEuvo24J8FXzcU6UGGlsqAG+ueD1tSFNouFTL82xGMJGbZhdRjrGUE1iq+tj/Udmd
	KlW9QgM3TE+t+rySlW5nvmeKIjXjPkfcE8hlOzydGaHt7o9Y04dRGPcCGe6ppSj0UzqVTYZ9e4z
	5WaCWDU4litCMzCKSgVYH2+y/ROa9lAWE1uTvnvG8cYhcj+fxqDgC7mJ0CJx34bWb5pcsusT6YA
	aqy/BFElevWCFdpXueuvOEjp+UFjHsYvHcOqjU0uglDBBM0o25SN5/nlXfr4cuk1TlrRQ+Y5MKf
	yFcf+n9zYGzn3A/EA==
X-Received: by 2002:a05:6512:6718:b0:5aa:6f46:83d8 with SMTP id 2adb3069b0e04-5aa8867d1d9mr5258791e87.11.1781108414772;
        Wed, 10 Jun 2026 09:20:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ee219sm5608915e87.15.2026.06.10.09.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:20:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: Media-CI patches for kernel 7.2
Date: Wed, 10 Jun 2026 16:20:05 +0000
Message-Id: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALWOKWoC/x3MQQqAIBBA0avErBtQQ5OuEi1Mp5pFFgoRiHdPW
 r7F/wUyJaYMU1cg0cOZr9gg+w784eJOyKEZlFBGGCnwpMAOPeOICoO2g14tkbIBWnIn2vj9d/N
 S6wd9Vyp+XgAAAA==
X-Change-ID: 20260610-media-ci-7-2-d5835b8ee28d
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Xiaolei Wang <xiaolei.wang@windriver.com>, 
 Tarang Raval <tarang.raval@siliconsignals.io>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@kernel.org
X-Mailer: b4 0.14.3

This series fixes all the media-ci errors for the current linux-next.

They are pretty trivial, so it would be great if we could land them just
after we merge with -rc1, that way we do not need to add more things to
the allowlists.

I have added Fixes: tags for all of them, but feel free to remove them.

Hans, Mauro, please let me know if this is feasible.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: ov9282: Remove unused kerneldoc description
      media: rzg2l-cru: Remove unused kerneldoc description
      media: mc-entity: Add missing kerneldoc

 drivers/media/i2c/ov9282.c                           | 1 -
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h | 2 --
 include/media/media-entity.h                         | 1 +
 3 files changed, 1 insertion(+), 3 deletions(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260610-media-ci-7-2-d5835b8ee28d

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

