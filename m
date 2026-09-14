Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F434A015F
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789418284; cv=none; b=GcEqIZ5jLluG2fFyzICci1ea3uWmTJcFanwNNuY63qU99AHRyZeEcWXRUlagx7/P3CFZj/SF+tZyBx8TumG3F2X7inw/LflA0LPXj+f3S6rKy5h3+aN9iXpTzqROFEnnU4nUA9E9IZIlFtFx2g6nDOz1ERRH3mNbID7xOvQr4hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789418284; c=relaxed/simple;
	bh=3K7GcquD3EOR1oBksyLuzW2MO6AbtSZ9+wDFpYynp+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOFFhHzWuLCHENRRLOYhbVZfWf9ktXO8CzfwG+EalUyBqo8NMBIcBQ8Sg2bWt59hscZ8mQJC4eBag/0oKnU2x39KtLyrfQ4Aj0l/7vc+xzD4ISVbQbuJQ498HzstijQgpvOrFaYuk47aTFUEufcpqESohsE8xjF9xfXPM2ATTDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hu7ZM8pU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hu7ZM8pU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso23461765e9.1
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 13:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789418281; x=1790023081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhEU0wHRURAHDPVBCdOLsIeyvo7dCcCPcPjIXRKdLFw=;
        b=Hu7ZM8pUs/Q2prh9xyvXD4FKuvge0uoTw96pGlc8RmTTRd4lWg0ppqMuER7NzJ54xa
         PRD8ZZu1355kZxZbWZzOkcUEIItO8r0QAwPK9nPqo5WOygAy9wK0HSfQHVfc3t/kFuuc
         IcttZBL6EIeOYNp8tCR/JQALCAjFjUqyY9AtZlZXcoZ57EWn5Sbym9Fh3/c3fRimGxIB
         ny/q6ZgnTDoSFXYtY/Vg6wGukuaIjTo9K7jeDXD7QEj5Ow/dgAcT9caJIGLSkQdq34js
         PnY56pPBZLqaVX9SPnfDGkYyp8tuO/6oUBUOACH8Phhs1xJHiVx0/2nYFxPoTcagjijo
         rXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789418281; x=1790023081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KhEU0wHRURAHDPVBCdOLsIeyvo7dCcCPcPjIXRKdLFw=;
        b=nJ1Ksxve5SyPFmKo6JiVypXEk1wERuxqgK07mwhyKFZbjZJwqqff3LU7sICjNmTuXu
         r0HPXTdOirkNaaaadbZFpmBqiMzY/ZNnUkxbl9Tu8BkgXXJOS+DKIgQldcBh0Kkqg3/q
         Bpdw6Eu4ID0JbFepEt5bSUN2b6cxCfyoIvTMqjemoeaYf7NAwykua4ihzAOK3VEVeWFi
         5XASVsK22tiOtXaNjBAQhdAjkhpXTTMPPDYTHLng1ZaaSUIr4WxXN/ufbb9HNZoji5/+
         8fFY2l0qUbxnfJ5OmNO8tpGVnA+X+YqQRkQ14VhrdGw9P77BqM+o+fWpNBiuDTHHBXKb
         QKRQ==
X-Forwarded-Encrypted: i=1; AKwUvByO2w7D2kUvXI0ZHpSVnkMZJ051iN9tQmWwv8ztVumcHFSAvTK+6WsffFZ3LxNlteLg5a4YPOU9ZOlZnQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n5bgg05wVCIRfSZx2RF94Vpjbt6Kodfr4m1nmFcxsccIa4Q4dQ
	CuZEC+wDPhps5nXobByY0C2+zYk7d00SeBIuQTtji13Vovc5C2+6Zzrs
X-Gm-Gg: AYBFou3FXdNGietK/3kdq81U48oIoz2YkZTlYsymdxoQ/EcEHXAR7JZV94jieW800YO
	tVGmGjo+OWv6vLbqk4aEEZrRXuWjsPoJ0vNqNQkLLTrf36GAwccQWHq0UJAX2ynoGjlsTfyPy5l
	PBKdbnenGgXWHhzDKnI2GDs5wWEejHlQvlUpetrSwH24d4aVeK0gG6KT5LNdAj0A+PXOMJDBraQ
	/+g6I+JO5jw8KB4m7ObNFgN43wH0E5zTWhgGa7KN+TYUiW1LLabjXOmxCGH1hJSD/ZpCRDPTP3T
	JvBEfUf1TfexC7oByKAAvhsxXo+MdWbYMwWFWwnDwlti76J2oEi1L9Uv14yl+4Fyn0aZY/ZXQ0t
	rgcXOzfdGaHZt5G1WbgcM/jlszxZgck3mdbq8Herqg51M4zPV7l/3R82sIk0EVqXcCX+hyOvR5v
	7AIvFDY8e73z+zOagDZscbWd0TA/gYlBG9K1wmLuuWuwC2oz7pUk/tzWIhAOGYk7XRM7Ys5yGmC
	+5MoFWQGWK1EDe84KJ3Q0yzRIFk16Qn
X-Received: by 2002:a05:600c:c168:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49e7a662e89mr49849915e9.7.1789418280538;
        Mon, 14 Sep 2026 13:38:00 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.65.89.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm29391321f8f.28.2026.09.14.13.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:37:59 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: ipu-bridge: add the OV13858 rear sensor
Date: Mon, 14 Sep 2026 21:37:43 +0100
Message-ID: <20260914203745.6049-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913142034.5632-1-lsa.uz@pm.me>
References: <20260913100932.92087-1-lsa.uz@pm.me> <20260913142034.5632-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On Sun, Sep 13, 2026 at 02:20:40PM +0000, Sergey Lebedev wrote:
> +	/* Omnivision OV13858 */
> +	IPU_SENSOR_CONFIG("OVTID858", 2, 540000000, 270000000),

I have the same sensor on the other side of the IPU generation gap, a
Surface Pro 9, IPU6 Alder Lake-P, with OVTID858 as the rear sensor and
OVTI5693 as the front one. Your entry works there too:

Tested-by: Fernando Rimoli <fernandorimoli11@gmail.com> # Surface Pro 9, IPU6 Alder Lake-P (8086:465d)

Method, since this machine does not boot media/next as it stands: I took
the tree it does boot and replaced my own OVTID858 entry with yours, so 
your line is the only difference from a known-good build. Your
patch also applies clean to media/next on its own. Only ipu-bridge needed
rebuilding, as the entry does not touch the header, so the exported CRCs
are unchanged and the installed intel-ipu6 and intel-ipu6-isys load against
it untouched.

Cold boot:

  intel-ipu6 0000:00:05.0: Found supported sensor OVTI5693:00
  intel-ipu6 0000:00:05.0: Found supported sensor OVTID858:00
  intel-ipu6 0000:00:05.0: Found supported sensor SMO55F0:00
  intel-ipu6 0000:00:05.0: Connected 3 cameras

Rear sensor at its native 4224x3136 SGRBG10 off the ISYS node, 29.95 fps
over 60 frames, and the operating point is identical to my ascending
ordering, which is the part worth checking:

  link_frequency  value=0 (540000000)
  pixel_rate      432000000

To show the path carries pixels and not just buffers I used the sensor's
own vertical colour bar: stddev 479.5 on a 0-1023 range, min/max 64/1023,
bar edge where it belongs, and no CSI-2 errors on that run with the log
cleared first. Front and IR cameras unaffected.

One thing that may save you a review round is that ov13858 never reads the
link-frequencies property at all. It calls v4l2_fwnode_device_parse() for
the device properties and never v4l2_fwnode_endpoint_alloc_parse(), so the
array the bridge publishes is not consumed by this driver. It exposes its
own menu instead, and the receiver takes V4L2_CID_LINK_FREQ from that:

  link_frequency  0x009f0901 (intmenu): min=0 max=1 value=0 (540000000)
  pixel_rate      0x009f0902 (int64)  : value=432000000

That reads 540 MHz here even though my local entry happens to list 270
first, which is how I know the order is inert. Useful if anyone asks why
you ordered them that way, the other multi-frequency entries in that table
happen to be ascending.

What I am mainly writing about is your remark that the sensor also needs
power sequencing the in-tree driver does not do, and that it is a separate
patch. I have an ov13858 patch parked that touches the same probe path, and
I would rather we did not send two overlapping fixes into the same
function.

Mine retries the chip-id read in ov13858_identify_module(), five attempts
5 ms apart. Without it the rear camera fails probe with -EIO on every boot
here. The cause I identified is not a missing power sequence: on this
machine OVTID858 and the IR sensor sit on the same I2C controller
(ov13858 2-0010 and vd55g 2-0060), and the first chip-id read gets
corrupted by bus and power activity from the neighbour, so it returns
garbage rather than timing out. Reverting the retry on its own reproduces
the failure.

So, what does your power-sequencing patch do, and against which symptom?
If it orders or delays the sensor's own power-up then the two are probably
independent and both wanted, in which case I should say so in my commit
message so that it does not read as a duplicate of yours. If it subsumes
what I am seeing, I would rather drop mine and test yours. Either answer
suits me, I would just like to know before either of us sends.

I had held mine back because the failure was not reproducible on mainline,
there being no bridge entry to enumerate the sensor in the first place.
Your patch removes that objection, which is great.

On your rotation patch, separately: the SP9 rear sensor is mounted inverted
as well and its SSDB reports 0, so that machine wants the same treatment. I
will send the SP9 entries myself. Your DMI_SYS_VENDOR match is right for
Surface, for what it is worth: this SP9 reports "Microsoft Corporation"
with no leading space, so the exact match holds across two Surface
generations.

Thanks for doing this.

Fernando
