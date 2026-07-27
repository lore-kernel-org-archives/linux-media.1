Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1933736EAB0
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785166876; cv=none; b=NdxVS9NLN9q+rasCVCyX0OOUd0xv2oT2PbVawU6X+Z/1W4dBC1JXBGoRt/dyfFoWiacCuROV0C64K3W6EmexvHaK9H+6W1M7HdFuxK3a/9o3ujw+6YM4mVbwuihNuK31txFfZrcVA8iOVnOTAgs5rjaBFd9DSe5s8p4JxGXyyVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785166876; c=relaxed/simple;
	bh=0c0vwt7oBVUW4ZEJeqMi96BPC5MO6khiQDS/klqpJhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CweGPnly5O4q+AUx5T+6ByRvtoVSPH02WY6/XBfWoKL47nLbpTm+SejyhaDmQ+PojuUQwsgmjxmmgcEwagEfycT02ZHRF2xmhx+PRojZ1hRgoF0cs814NN5Ycps3LJX200e5CTr79nIbPfEKmOe6ZlFwoDI9hjv2bqQJut0ILRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=0nwdzFGY; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="0nwdzFGY"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9061a795d76so29682106d6.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1785166874; x=1785771674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ObFczNpW1oyaTyO0itofeppMoEYsiSFjLPiupcK+hfk=;
        b=0nwdzFGYVUdJFChKVVxcH17hic3gnA/lgRBRRwr7e2r7c4NZfwH1C7/IZWJvcNAhc7
         x8PxwNNsTryIiuVPdz+uZWTO7fFmWz2rh7Xk1p5LVhEIDSTv5FdGBV18G4tw2z1axHaR
         nXG4b7VI61ZhRx7hcdURVY5WNyGHflr+T3R/345MVdh5koFJRim91i15VOJN8uwwGLbx
         7Gd59+1F9iZ5hojqKtgpU5H1BQdgyVCFfUgujQOXJcXfvLtEItxYeP816mERLOaHlWE+
         rfqdncdxNTjOZpiZSGwam2fEbsQ/Bvkwpnt3rw8Nrh52oulDKhtNI5AnscfAjKFbXLxV
         M5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785166874; x=1785771674;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ObFczNpW1oyaTyO0itofeppMoEYsiSFjLPiupcK+hfk=;
        b=dqZCSVV8vgZ0BDXHKCOMLc9+hM2sSnTatXemstgd+N80vkisSrcNmWSYRl974Ad38q
         36YKseKjKhjggpqKDWQC3xMxr/11iNL3eKyJM0hsgOv3mcJoS+xZYs8PzeYMkI7FvQS2
         K8N9ZqrMYSkHGmQ9Lr2qRLbobvtxqGPEN0ITs/ajhs3PMRsHvYIDP7mXjG3x2bqLTtWn
         kFJhYHF9gH5ukfVfHlgLhNHUdOYsRnZLdI+Yrw+pSwWxHM596QFxN3Z80Ys6UWEumHp/
         ZJ8qNeXBBgqtvY7G4WLzV56MGJAo5WSAvXrQySTspChcx53b1lq3UUk3QAqgu/q1Z4IM
         td/A==
X-Forwarded-Encrypted: i=1; AHgh+Rrf930YufKTYKikp80ZIITUVhpP1FGGiSqm9ngecfgwecja/ON8S9a9/hskVtPkZj6ltENZl4xTMX4puw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtVj+Jn+fRJlNkHTViqvhmQ7BKA1XaHRF3PfeI0A4kdUBtDHog
	bFp4xfHz8v9j6dJrtFfb3oYofgMrbMn4YRL43iDGLvuPYX52f+GYPJmuogVqk8r8QXA=
X-Gm-Gg: AR+sD12XsA7sFnRDjCf8QQeIC8c3rGA9N2zFtRXChr4MNxO7NWX47SHhdnmceqc5Dsb
	Iy8kVDLGrn+Ki7XMkaca3/1MvROLvemQIUcOCe9UL75Cx5ualGDp5TOO2NS6XEpQsZjmC/xu742
	ooJa/oUj1/WktUgWES5ANX2z8YdbhpYSZbkE576MwQOytslOIrwYtMVHgJNQIeRbd7NZRgeL2d/
	q7ohgKQrB+c9g1s23KT0TxO69W/4YkZuPRxzGcVECHJYW2mgERcoSyh4dEzUZSVcE61b8mxzReh
	lEO5RXk+WKVt9gAYjL2/0a45otWs5jJkpOBa9Ag9GQpA7q16pJscWQ42OHz+KpYDaDBC+K3yxlf
	62Ao5eTmdj/aa+1MEgdrI2nrjuv0v/U+R47HmOzoDSvcNSV6qsibSEIF0RGP03eJekME/fhcwBh
	s4IdpHdW78sRcs79dBdh5KNccoK3tl3CC0lfXXFxIfN1irT0cw7RT08N9FOGLs8Xson5VjJ/aQd
	8kpvcbpHyXydg==
X-Received: by 2002:a05:6214:c21:b0:8ef:c64a:ffed with SMTP id 6a1803df08f44-907ec8046a0mr107570706d6.42.1785166873858;
        Mon, 27 Jul 2026 08:41:13 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::f163])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e86d7367sm67144266d6.33.2026.07.27.08.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:41:13 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: rshouriesh@gmail.com,
	linux-media@vger.kernel.org
Cc: elgin.perumbilly@siliconsignals.io,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	bingbu.cao@intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] media: Add Himax HM1092 mono NIR sensor driver
Date: Mon, 27 Jul 2026 11:40:58 -0400
Message-ID: <20260727154058.2350497-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAJTcUFQxyVWJ7s3WnZHV+wob3nnkXH2_iFJL8ixh_Y8j33ah6A@mail.gmail.com>
References: <20260709-hm1092-driver-v5-0-a1f5baa6fe08@gmail.com> <20260727131252.1580332-1-j@metarealtyinc.ca> <CAJTcUFQxyVWJ7s3WnZHV+wob3nnkXH2_iFJL8ixh_Y8j33ah6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ramshouriesh,

Good — and measuring your own link rate rather than pasting mine is the right
call. 24 MHz EXTCLK is exactly the sort of thing that would have made a
copied constant wrong in a new way, and my derivation only holds for a 19.2 MHz
part. I would rather your v6 carry a number you can defend than one of mine.

Your provenance is genuinely useful, by the way. Mine came out of Dell's
hm1092.sys, yours out of Qualcomm's com.qti.sensormodule.hm1092.bin in the ASUS
stack — two different vendors' Windows artifacts, extracted independently, and
the register sequences agree. That is much better evidence for whoever reviews
this than either of us had separately, and I think it belongs in the cover
letter.

If it would help, I can make that concrete rather than assertive: send me your
table as (addr, value) pairs in order and I will diff it against my 238 entries
and post the result — how many entries match exactly, which differ, and whether
the differences are all board-level defaults like the 0xb4/0xbe exposure you
already spotted. "Two independent extractions from two vendors' Windows stacks
agree on N of 238 entries, differing only in <list>" is a much stronger sentence
for a cover letter than either of us saying we trust our own dump. It also has a
real chance of catching a transcription error in one of them, which is worth
knowing before this lands rather than after.

## Exposure and gain

Here is what I have. Rather than send a patch against v5 that your respin will
immediately invalidate, take this as the implementation plus the notes that
matter, and I will send a proper patch against v6 once your geometry and
link-frequency changes have landed. Say the word if you would rather have it the
other way round.

Registers:

  0x0202 / 0x0203   exposure, 16-bit, high byte first
  0x0205            analogue gain, 8-bit
  0x020e / 0x020f   digital gain, 16-bit, high byte first
  0x0104            group hold: write 1, program the group, write 0

Ranges I use, on a 648x368 mode with VTS 741:

  exposure          min 2, max 720, step 1
  analogue gain     min 0, max 0xff, step 1
  digital gain      min 0x0100, max 0x0fff, step 1   (0x0100 = 1.0x)

The writes themselves, in CCI terms since you are already there:

  case V4L2_CID_EXPOSURE:
          cci_write(regmap, CCI_REG8(0x0202), ctrl->val >> 8, &ret);
          cci_write(regmap, CCI_REG8(0x0203), ctrl->val & 0xff, &ret);
          break;
  case V4L2_CID_ANALOGUE_GAIN:
          cci_write(regmap, CCI_REG8(0x0205), ctrl->val, &ret);
          break;
  case V4L2_CID_DIGITAL_GAIN:
          cci_write(regmap, CCI_REG8(0x020e), ctrl->val >> 8, &ret);
          cci_write(regmap, CCI_REG8(0x020f), ctrl->val & 0xff, &ret);
          break;

Four things worth knowing before you wire it up, because three of them cost me
time:

**1. Your control defaults must match what your init table leaves behind, not
mine.** This is the one I would most like you to check. The control handler
setup that runs at stream-on writes the defaults to the sensor, so if a default
differs from the value the init sequence already programmed, you silently stream
a configuration the part has never been shown to work in. My table ends with
0x0203 = 0xb4, so my exposure default is 180. **Yours ends with 0xbe, so your
default should be 190, not 180.** Same for gain: my table leaves 0x0205 = 0x00
so my default is 0. Check what yours leaves.

I hit this exactly: a refactor made the stream-on control setup a real hardware
write for the first time, and it started programming exposure 256 and gain 0x10
over a sequence that had only ever been validated at 180 and 0.

**2. Do not fold the 8-bit halves into CCI_REG16.** It is tempting — 0x0202/0x0203
and 0x020e/0x020f are adjacent — but a CCI_REG16 write becomes one
auto-incrementing burst rather than two transactions, and that no longer matches
the sequence the sensor is known to accept. I kept them as pairs deliberately.
Same reasoning applies to the 0x0340/0x0341 and 0x0342/0x0343 pairs in the init
table.

**3. Derive exposure max from VTS rather than hardcoding it.** Mine is 720
against VTS 741. Yours is VTS 750, so the equivalent is not the same number, and
a max above the frame length will just clip or misbehave. Whatever you choose,
worth confirming the sensor actually accepts it at the top of the range rather
than assuming.

**4. Group hold.** Bracket each group of exposure/gain writes with 0x0104 = 1
then 0x0104 = 0. You already have 0x0104 in your init table, so it is the same
mechanism; the vendor sequence uses it around every AE group.

I have exercised all of this on 648x368. It has never run against your 560x360
mode, and since that is a different crop of the binned window I would not assume
the exposure range transfers unchanged.

## The ipu-bridge patch, and testing

I will rebase the ipu-bridge HIMX1092 entry onto your v6 and send it as part of
your series rather than separately, unless you would rather I kept it standalone.

Once v6 is out I will build it on both x86/IPU7 machines — mine is a Dell XPS 16
DA16260, one lane on CSI-2 port 2 behind a Synaptics SVP7500; the other user is
on a different Dell, CSI-2 port 1, I2C bus 15, different bridge ACPI id — and
report back either way. If your driver does not come up on ACPI x86 I would
rather find that now than after it lands, and honestly it is the more likely
outcome for a first attempt: the fwnode graph on these machines is built by
ipu-bridge from ACPI SSDB data rather than described in DT, so the endpoint your
driver parses arrives by a different route than on your board.

Thanks for taking this the way you did.

Jake
