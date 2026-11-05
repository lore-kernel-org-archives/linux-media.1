Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839397;
	b=H10Y1WR91mQYnxJGZ1ud3m+DDbsvfK3XMzNtO32tm9Qsgjao+fl2lWXE5RmOMOWOHEwD
	 nqqmHKKutWoNvWJ+OSP0yKMQOIqXIB+Z3gcw453cfrcPbxn7hgCsSnHNyO9RHnJ1P1nDB
	 r3fGVBAL8r48caAJf2WeNnVlB6Bsb60WDen+M/rw7wIyUxT6/2isAVnbqPpZXIV9l3ssy
	 dTo/7gpozwpl3VYQ/6op83zdJp51I4uDwEKm/AZWXcQtGtlxV7bdQKE4Y+TymSDUUVtUw
	 RQbwdpcuo01BGOL9KoFmAPYYi2nyS07J1P1kgXLLN5D5xTqT3q0Xy2kuZRRTiPrDq0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x2dqwrMB+tnBoA+6+42KIBNT73Z3cpCJD8k5B0qA0aY=;
	b=iXdeqc7jsdfSOXD7EeSa0Vbvwsz5W4URl4arVTTZQSNNLWIIovjBrjYVs4bowY4q3pWe
	 XgtiG83jbWy1hi9OhsgUtircD5giGq0PxxGnCWSLZNeJd5kudZVGgEab61PWBdaUZYSyn
	 q9y6T3kclZHTqg2SjOh/j8OjTn7Nb1UIIP96nb5XaIFzfR9c/Oax/0Xulmw/r7Srjujvh
	 XwCj85/XtAi7WEfByo7JhBCq2ITgt/Py/ZPQgo79n61a4wZkolVn5bUKS9Zrdg6lBld+g
	 /UIgNvgz1Q4MmMQtrKG8g9LBcb6kWBPLqTHvQIL8nsuLOyV4QnFAWtRMl8tAHYS17HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHBe0KMV;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F287E606A31B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 00:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F287E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHBe0KMV
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so15141485e9.3
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 16:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793839395; x=1794444195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2dqwrMB+tnBoA+6+42KIBNT73Z3cpCJD8k5B0qA0aY=;
        b=VHBe0KMV+u5jMRSkLnXNHnK0mTosWLIroj2ejLHi5ZRnZUiscTEHSsspxPZulOp8Gn
         twYUDF3uIMUTxDhmLF1w6238je3baH01ZhSyQDC6ZmRr4vyT+AB/GjGQg+akFB9mxQio
         RD6blvWxlg260yKErdKEoqZXyXooOcTCGpAV1Fv2hYh0A1WlqsItwIv5OwI1pjC5B6jn
         jfczZTroBf0+gHZxte1FnTzXjIiaDirC9Xx9ex0EFXvZVl2crZUSX1XJYZ2cWDaJWRaf
         oYokvnvRrbkIY0Srp+Kxnsx5LrxlPvUbftXS6lyO4VevEQqFLnFlERvZozojCI3rvulY
         fKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839395; x=1794444195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x2dqwrMB+tnBoA+6+42KIBNT73Z3cpCJD8k5B0qA0aY=;
        b=gbB9hO7D9OKVIFI3hpSL6xcf5l0scfii2CbTi62dUEu6iKPj+jSGfywq4+S2k7MmsX
         8ytygc74JMiogLdmWcZ328B2mSdh0d8NIQBIwMLKuAuXniSk3GuyBUNe0HTnLeQuRd20
         WTrDQXSB/YDlCBGqYePRVZJ7J2O02PG5UxtPNpcHmcES7big2Ktl6AWzA71pfdqaVqTu
         za1KQhsBIYspx/6RZeae5GCYeScak31WH9Nua/cEYJNnunc/VBx20gLsaeGMRlf5jho3
         ucsLnaKOLMi7NCkbEYPJp45IE6elnZ78Oyh3lT9Y+RrdeivapJ7IxHTO8EVBWvooMqAV
         NyuQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5kKvPu1HeiuUZYzbpHyHKyKO7UpicilQE2xa+2OuYOkbyrgdE4KQyJmIqSuCLrSPbh6/w/F6TT+ZW/w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+D9bipiLAFZgd5ye0QMeG5jOWiVZOsnNGca4uIhu1hw+3h+uyr
	wWBCXRXiwOx8R9dELRoP+xytzqNvTxZu4k6ccX30Z1g6T/urbQfteBmz
X-Gm-Gg: AYBFou1yvNZLqtnNA0yTVSrCqZr1cONyuTPbrp0py3BaezavV5AhNhP8kfJrPCvIwY2
	WpLsVkBofe2M8HpnXCUtLtUN7RlrM7uS4Q6me3WQBtZmrr53CxFmO2GdqzvNJooVKs+VFo7fWAA
	Bqtq4bvQoeb8e7oa/H3Zxwr6cWSdywym+K+qz+mDn83K46e/D3pBFOHBzJtWfdDdbN/731lfj87
	7UVTL/+kX2MTdtW7ZnNw7kmF0tKt2xyVH4XtHcgFJTuaBGisPjW1nehhCI9eQMO7Ix8zIwZZFFS
	jwJk223Dqv+Dj6+5ZF9ihp8vH1tb+9MzH1+hdRO7Ne4u0PUVkg+2Rf0HV4nyIHzlNSXTMBhu6DX
	aTNthAUFCuXnL9VxmNkVtrEM3DGXvmFbnoVDG+GDhTbqeCcKl7J8e0/jJ6xwnjA2PB0gLE6ilBS
	mMHDcXIDVuS9HYczgMUXMLJ+mp7KD1H6SHnhmtoSM+zP0CuxSJCD3mZCMCo1N3L8JNLBWIMiU1t
	cIePtojwfaWBL4UFTHBKHKgWnhP1Fv7Rw/UxAFQiv6rHUwLnYXWslvbO27VHjmzD/17OfHi1nmC
	IOtqU1GAqrFywB64xuVQ7nNB0ypijKsEEh91DzLmN/fU/YHZH8kKfAJHb/Fq2OVyvaFh4Kv9/xi
	xG11+rB1/
X-Received: by 2002:a05:600c:8b2c:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4ac151a8c26mr415678795e9.3.1793839395161;
        Wed, 04 Nov 2026 16:43:15 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b414b170d0sm62276595e9.1.2026.11.04.16.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:43:14 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	George Neacsu <geocausa@gmail.com>,
	Hao Yao <hao.yao@intel.com>,
	"D. Manresa" <dmanresa@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] media: Add the ST VD55G0 global shutter sensor
Date: Thu,  5 Nov 2026 00:43:10 +0000
Message-ID: <20261105004311.144035-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103103235.94397-1-lsa.uz@pm.me>
References: <20261103103235.94397-1-lsa.uz@pm.me>
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

Hi Sergey,

On the Surface Pro 9 (Alder Lake, IPU6 8086:465d), on a 6.19-based
kernel, with 3/4 and 4/4 in the bridge and 2/4 adapted only for 6.19 (no
v4l2_subdev_client_info argument, and the "dvdd" supply name this tree's
int3472 uses), plus an int3472 that passes 0 to the clock _DSM as on
Hao's thread:

 - 4/4 gives the sensor st,leds: led_mode appears without the GPIO 1
   fallback I used for v1, and at manual exposure 600 and analogue gain
   8 the frame mean goes from 15.9 with it off to 32.7 with flash;
 - with the clock now at a real 24 MHz and the link at 396 MHz, R8, R10
   and R10_CSI2P at all four sizes run at 59.14 fps, as the controls
   give, except R8 at 320x240, which now delivers no frames rather than
   the third it gave with v1: the IPU6 limit on narrow packed lines from
   my v1 report;
 - v4l2-compliance 1.26.1 on the subdev passes 44 of 44 in both exposure
   modes.

This covers 2/4 to 4/4. I did not test unloading ipu-bridge, since a
warm reload of the IPU6 needs a cold boot to recover on this machine. If
v3 changes 2/4 only as in your reply to Sashiko's review, feel free to
keep the tag.

Tested-by: Fernando Rimoli <fernandorimoli11@gmail.com> # Surface Pro 9, IPU6

Fernando
