Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFA64BD34F
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 15:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004859; cv=none; b=KlaTH5PEfUrPAvmQKz+4DOOrRFw/cS9DTRDyQpAGlIbB5k4L+Az740SsRprFxg/XZybTWdu5k2q9w+bkQTvUmieWoMM1bx2GoYM1pH/FkD6YszHToclqxIStZznDbFzWUJQB6NSWKqEHFN5CkaTBxzhAqMQXLnLYUYPmL7BH+wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004859; c=relaxed/simple;
	bh=wGmrIqcdIcZU3r4B3ZiqI9AflO7CJwQ1F6YuHGdbybg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pt1hQledoHJanelXS4OnxML+Ovg0Bqr1VlFxmjWzKfP9rSSHPzScjLGsnKuq3bpvqcmQPHWXACablCeD621DDYZMxaF1f3z9njdZN5wXaf0fFitowNr0vOOGEuBRk5Oms6weyh4lMBwqHDWTcSgtLL9geG8isW0nufmeT9yDy40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgKPeAxT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgKPeAxT"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4843e397f74so3340f8f.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 08:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004855; x=1790609655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqhSWBti4659IVEid5ZOd4ooKHmp9n0NkC3/DOwtaEQ=;
        b=IgKPeAxT1AeqOypFM8ZZMbFKuriYWxHceGnvJdeQRpS3LPQmQcrtOrzVyfMtGblIvx
         la8x4BWEHvXu82Suj6WVsDqJ+O0Dgr887ohQ+8kWS1SQAX5TXikSxQMN5fvXj3r81xKr
         oHOTZ664M4QUoczuu+s2YU/jYfT3obzVllq0oncqH4A20Obc/fTCCuYrOpNxa5dHgcmJ
         CYoCOd+BEmsN9+bGUUGm7o3aUsuqq4p+SNJ3q+NZmYYLtQS7SVlpCC+wmVdsBgcnEzaW
         rCrntHh+a27qrRy3w06UMaL7QyQCRp6fdaPjk5onKL/h2YXfxYYBA5uFsfONacHwSOvV
         lxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004855; x=1790609655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqhSWBti4659IVEid5ZOd4ooKHmp9n0NkC3/DOwtaEQ=;
        b=1tfklPvIy1DKBXDIP44jf3yP0l3iMXthHe9XY15Ut94Wh9tPezrQP5po/HqW8zRIh4
         HFvKlTKNr968IXerVkYg/eoN08xOuOpjTwUJh3f+cAgKToKVP+vRrmOA+7kcxPjNoS7f
         33bxn1hSIjAoQoC80peL+7L1IPLRtFrCklzTvSJwc7cD7rC6uAHu77DRFydAHELuDg0I
         /of1dfP+RVASd/2PDTNjKm63ngZKMtrnJ1a4Yhvva++S50l5nTL+MYX22UkyTK/maePr
         TFWvfyAo2DAIB758mV45wJP1+yjdI2ffBmtL6ioQfCAHU8Qc+RzRScNku5cvMdN9juFW
         JXNA==
X-Forwarded-Encrypted: i=1; AKwUvBxfO2d0YC95mNEFfZwfBzUmvIBGFjtTpFOnz+FmgEivgxvXH+rZhAbeU7ThFjIKrrolrHPHrH+l7Cxjiw==@vger.kernel.org
X-Gm-Message-State: AFuF++kJfXb5d981kDm1poyrZA+Kd6nkeX7qvrgyBzr4JbPaDJTNgVt+
	T46mjtFTlYy8dH8KOoWQ3M/Al7NUpTayY76F1p/JeFXAjZXYv9/Llr0=
X-Gm-Gg: AYBFou3LhCkjX0JPWxlE9eCubqIzWpThNQgOo8rPJ6yI+NLyO34As382UvoU28pybae
	XiHJEnW0Sw5ULqRRRs4sRJ1is9ahoPC6jEyZlFkBQ4ltEN1QvvD5a1M5100I7ZBXhigOq4Reld0
	mNyuZNMaNfXMgoCm2EHZSQCnZQCCdYZ+FTzXOfaL0QlLCybYPnAjrt5Ey+LDU32k5EbuCErgnJy
	oYsE8TIHiL2jAJ7P0Lwe3hfGjUU2lpB9PXkC0adLZ/NX9KiJCZx50y1wPtrcssurZU+7xHJY4Lt
	of7W+YvA/uEqe2ue0Kc308WzsxER+1JaGAo/Y6dY9f6n0hmn8tqlHTF5bvy1qeNLAyOVMYcW/IL
	YsHYctJ8uE5fqAvvq1unXAs2o1t/ChkoktRHQrTFe0O6vwH2m+CECHe4nnqqjF/yZXsKBBXUf39
	3HRglSyn6DRkbOcyoo/ZKJEMLQ2QG3Y4KW3ZAGEREaA7gmFIxfSaIZuvNci8aCi/W96FLW1sgaO
	d1A5xkXyPIGIxfEHpawyL+4sOLC+H2RflRNBRGsb/GDJJCnf8T8M/g=
X-Received: by 2002:a05:6000:4008:b0:487:955:e6c3 with SMTP id ffacd0b85a97d-48860f27ad0mr103491f8f.0.1790004855209;
        Mon, 21 Sep 2026 08:34:15 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872456ee4esm22668564f8f.21.2026.09.21.08.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:34:14 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	Fil Dunsky <filipp.dunsky@gmail.com>,
	Kengo Oki <dev.kengo.fugu0141@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: [PATCH v5 0/7] media: Enable the OV5693 front camera on IPU6 Surface devices
Date: Tue, 22 Sep 2026 00:32:57 +0200
Message-ID: <20260921223257.534258-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914180807.150971-1-fernandorimoli11@gmail.com>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com> <20260902142322.73523-1-fernandorimoli11@gmail.com> <20260906073932.24090-1-dmanresa@gmail.com> <20260914180807.150971-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 14 Sep 2026, Fernando Rimoli wrote:
> The series was applied to media-committers next on 2026-09-11, and your tag
> did not make it into the commits. I have pointed Sakari at your message in
> the follow-up fix, in case that commit can still be amended.

Thanks, but please don't spend effort on that. The coverage was the point,
not the line in the commit.

Two practical things, because I am donating this Surface Pro 7+ shortly and
will not have the hardware any more:

- Don't hold anything waiting for a test from me. That includes a v3 of my
  ipu-bridge series: it stands as tested on 6.19 and on top of your v5, and
  anyone who wants to carry it is welcome to it (Sakari, on Cc).

- The two remaining literals, the link-frequencies values and the lens-focus
  name, are what my 1/2 fixes. Take it, rework it, or rewrite it under your
  own name, whichever is least friction.

Everything measured on this machine stays public, including the register
tables extracted from the vendor driver, the Bayer-phase matrices and the raw
captures: https://github.com/dmanresa-saes/surface-ipu6-cameras

Good luck with the rest of the series.

D. Manresa <dmanresa@gmail.com>
