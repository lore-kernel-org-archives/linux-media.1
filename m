Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039E22D060D
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 06:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936660; cv=none; b=XOPkbDR8tHgqKAG1iwffT+0sh0dp9ChtZPQXIEn7rVX0iHIKCqaFnsIx4e4lCAe5qU/aZO4uZG6wYIjYCys6SjnZcDvSt7kMaxbqqb9HHv57m9MYQBvlhO8VSFyJkdrBvBFL2fT5FDLIrepabf9QjU2otA66ux8uO5mxQ/UUW24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936660; c=relaxed/simple;
	bh=wLDEXefuJ6ysr65joIrk+CDBT5nG781r89dk8ZxIZWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8Xfia1uXaRtma55tzCfwlY0WT1eX/FccqhA6QNPiIU1+O7BvChBPvU4f/0Rx4kYDBl+NbRgIffJhYYbtoMvYSHtXwCwb9lbLjsqRFGCPYwNYn2GCYcgzcvW90MEG/1PWMKcXE62oc9sT9eHWQD6ZRhmZdAhs5r9WbD7lsu4pfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhG8vY9d; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhG8vY9d"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49557167508so64397375e9.1
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 23:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788936654; x=1789541454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLDEXefuJ6ysr65joIrk+CDBT5nG781r89dk8ZxIZWg=;
        b=DhG8vY9d+eTinmFNQm775o8Q7jFYyvD1+u3MTW/5lSvEBux2eigyr1PhU5mahAEzcP
         dM/Nt2OYBu262Q5l5hHK86R8Bez+xHclP6auZyDq+STfLywu1/OK0TseoQL1ElVYfvtK
         lSHQbb2s9eCEc/lxd6nzx+mWaQjtyayA3DDq7M80BCSvcebflez85PaMXHgMl9DyOsPg
         ZGv1qBv52krNvgf3OtBtjcn4t9ebevLKaQmNEHoo/hRvmET+0Q5seEqqd9MTev5qjDXv
         BWAorjpAKi5RUnst19QEjks8lkl6QpIHUkDxsN55Rg/dnmq+QP+eUVjf+p7WIYbEMxVk
         8abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936654; x=1789541454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wLDEXefuJ6ysr65joIrk+CDBT5nG781r89dk8ZxIZWg=;
        b=EqOilPPVRGTQnLvquEEnp8y3Q3EvpZLL1fFmNENBKqklikCLJSxaj8yn1YsKjfyChh
         0XdRGoFujkie2ZrT4tGXU2biikTuhDDOoEf/ZSkOLOAQ7AFlVqJYiobVPJ8yusy09UX8
         H3S4mBy0Xy8oVJ1cCfMTeHieBuX8rtdcPRvIIYI2/lhN/HCtc2dOWBedKxQhPPR3wfL7
         7M653q/ffMH5xTInGAPGZkWvltpDfVuikQCQtnyCfaDyqv8V7rCzM6gqK6HNR9DUYTbE
         Ry2TuOUReKj3q1ZMQtqdgWjmodAnnexYecbmRNIkDkKAjMw34A+goF2aI80bwRwxtjfo
         1PdA==
X-Forwarded-Encrypted: i=1; AKwUvBxgSYAYcHq5VI+PSUFWH1QqoxFR5ezT6zwsNB5QLxORS33vTAEAGYDxp/PuO1FQkzHX9yBj2HdrjD1/Zw==@vger.kernel.org
X-Gm-Message-State: AFuF++kU444Cxu5z2jzb8Ypn7QDCz69itACkfH0E7eFQp7Vtd4xZ4irK
	n5PemdCgLe93UbdNZZMaJwlgdZxdOLYCPCdB+q3NCJLdK28wr3pK9cAKk1ew6z/+Hg==
X-Gm-Gg: AYBFou3Rwgf/B7uzk58by0B98higVXVZ6SVJMSO9z/WgIjh6qJT5+bYR8VR+gKadbHx
	ELyZfx3bkaYekk4HQgbQS+Q98jticCE8me0CmbVqGOsPkbLvottK+xpQgjTxztVsS+NZobkU0Yx
	Ayuulvj4AiCfgv0D+ljLOPH7P0+qEAjh8npLxgXyqbojCP0OOArFt1jHdVXNRaGggRFSpveeZ/3
	z9N+PKaAd4Ffu1pH/jvTK94wxEI5aWxEEEiYfK5pAUfqyG8/Bh1ZL4XBu2WT3lBT509SRCmRAO1
	FpXNti4Hj7cdYxkhAWAtBmD9wQYPZLwmFMiQ7UoyeHmI2qy2oMurnK4UK0Qhyb0YbDWBKlx8Eir
	Yv6i4GCgkLlncZgKbEp8+3XWarXpVsSilqPkbAaKxaMH4C0g36CWV4zbvAQch8VQrws1zxBlREK
	zd5vDZKCJZEidnvY97x0c1T+v/wD+epigSOdjTjiflawX0EYOi7tvorbb3E/dF1bZIj7mPuFLvj
	5SyBw+1EGzWE5X6S5JZy4Yi2Q54Eu9xbVX43++CMVSm9jY/fukHMzhM6QM=
X-Received: by 2002:a05:600c:8715:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-49d17d4b01dmr219717855e9.1.1788936653490;
        Tue, 08 Sep 2026 23:50:53 -0700 (PDT)
Received: from latitude7275 (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm443215855e9.12.2026.09.08.23.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:50:52 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Thierry Chatard <tchatard@gmail.com>
Cc: Lee Jones <lee@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: add Dell Latitude 7275 to the resource conflict quirk
Date: Wed,  9 Sep 2026 08:51:04 +0200
Message-ID: <20260909065104.15817-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aqDkwTkAsvs8Escx@ashevche-desk.local>
References: <20260831160754.9857-2-tchatard@gmail.com> <20260908161629.335223-1-dmanresa@gmail.com> <aqDkwTkAsvs8Escx@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 9 Sep 2026, Andy Shevchenko wrote:
> Do not fold, just add into the series this one as patch 2, for example.

Fine by me. Thierry, please carry it as patch 2 of v11 with Hans'
Reviewed-by; no need to change anything else.

Thanks Hans and Andy for the quick review.

D.
