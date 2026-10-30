Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362360;
	b=J6N/G8/Z4wys7+eAAjTwBf8VnFxkd0mdnpRLtWuPdWxqj9J5qdj2w0IKds4kMpy8x9Mi
	 C44x1VFNTEDLasGcQk4Qg+ywmZT5jeKWtFdOjD9bAIS6NPC00yz3l4UL8vi6ARm0CqoB9
	 uKCRpj3Mfu2uvi0gV8V8p7h1PfaglQqS8CMViEHM4YOphVJGggX8siUXmBznYv3nJgc7O
	 yyr0qXmkgD12KVizMoHN39p59ts1LSPZPFKmvB5X4HnIz8lViWGUsjvlWRA7T+XIHC7yq
	 qy/NSlAMUdzPJgEJr3kPL6kLLCEMGDlcdiVR15d5EqAeOrij+0zofw2XjplWcTJZaOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=blStJ9NcJ/yNIOMWMmBskzYwxQkjL0hla7YFVzt7Pqw=;
	b=pBBoZN40PJ2oNR+//P3QyKWYwcsPkDhLeYGPINUtf9Tcp1h6Ttc4INS5CcVcaZVPRk3T
	 2dgsqS+1AqcjoV3Kw/Bg1/3RJgGQ0QVpdqPvfL9Ispy52dYU1hVr0ymZEimRIAMlVGaVd
	 JfsXuo9jDuTHHd1iGYYS4sSH85Nw1KhchI7mgqOXelugvlzHt2B1Yh7Drzuow61p7c0M+
	 jMc3O0TFI7VNSS3OlfmbY4M2Kc4kUgFpSLJf5jEw2E6BniUFlPwHM+0Nrlrz7dfoVcikS
	 HkEsntpWT7JW45IlCj/7hORJm+0Vb/cjMMwO9E0mse4yMCN1vauQz8ze5BQIO132grA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJ6uHEWh;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0F6606A31D
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 12:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E0F6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJ6uHEWh
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3646e6de3e8so48911eec.1
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 05:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793362359; x=1793967159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blStJ9NcJ/yNIOMWMmBskzYwxQkjL0hla7YFVzt7Pqw=;
        b=zJ6uHEWha1vPUwcHqbKqPCxHte/ObjdO995ZbPCDkwRchaK6DFWTPIPoSA7YdhzdkG
         Xf47necqRc2kBuvlOo6aZAbK2gQXtzmWhc+ecfdNDTg2tw7xrh2an+XtowIrDKx876iV
         AAQcBQWj1S6Se5J1eGWwCPQ9mhBGMFhLBJi5AvNM0XkynZiya5kQ+XSesy3GWMMkWeeO
         stN48kNxeAT+CFwGgtr2A+Ps1NYQaiTU9K//6S1PMcNl3nH7WZ1nm5rx9nP90fodVBsB
         GohM8c4sjHr01EwH8WVdn//32EiKQ4vBMIv3A3Tvwc+3a2nPdBulZmjZO8dUkcPKU3TH
         q+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362359; x=1793967159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=blStJ9NcJ/yNIOMWMmBskzYwxQkjL0hla7YFVzt7Pqw=;
        b=iaSi4qeHbp6VksgrMdT7Glioe/yPxsQQ4e/svrF2ss7pBoe9zy+kYGmvJjqtaipFbn
         51P9/5eYLpDbbFV7hpKaO5prCScIGffs/LwVI/2Dc3sLS4rtj2dMQ/K6VbQgwbypUtRN
         yQ5YQxTeMhOnV3ru+6MWRSHbn/e6uNNwCFqm+47P/OF9TuBRdCN9VeA4t0Pu7CdhUpcb
         ybT/pA1dlonmu3dx7dyAJnMXY7HaV/qyChX/tEC7JLfUCijDGf+HJO4teoGiKFQecReM
         ayKfkWjRNA/lHyuyR2owxSmDMHhUB5bQ1xPhbVe6BbV6l80cn3MCYjm72yy+kP+cLN3g
         01mg==
X-Gm-Message-State: AFq9FYIE4jtdfR20DR6mU/hlXdY+e4AxfXKPsj80XyJoK6sJttQDCpWP
	8wdP7/vMTHOGdAP8CU3wrYMOyDxn95tGjEhx3iz3U+2OalJkC7E5woZHrZCexqFJJwQ=
X-Gm-Gg: AYBFou1hFSgxgIHAEWtfg4qhjo2q+5uqfPoOHRo9BjjXfbGyyFpfSW6ww488vbCUOqT
	fYO9XdTAnR8TjlpNhQ3sVe3tfIN4ue30uTCGQbUIA/xJ5ehgv7wto4s6tLsuKTb48vndXxThkfs
	1YBlNOxh4I73lYKj2RgkmTaWWahUMvJi+oTXRlzDT5xaY1COq36MwWLOXoYuDkHgXM2B/hbB5LO
	QOXF8FYQQgOExZhpQ7eu7ZsTqnxQxMyo1da1d99+Z2qtImV1QXZV0wFOsop3HjmFBPPojnisM42
	eF2M+RxIf4XPm8GbNxHlU7+tJ8KIelCJU4z98SnJFvivCqreV9Z7uaNEiPGCs6JmBD9kIIw1kQY
	tuvDhIw7O9rrmsuGjBFxFdnkd3BAiAVsJADZ/t5bplZmA+esh7Iasoa92qFaPCIuZOHRuBZ4CQ5
	45FZlS3bXwn6XyGW0q9yxOqWMak7aRxsi4ncV0LTIktiGb2cUEXYawoVkbchgRnYJdyAE9XQnBB
	mktq0VgjN9yjG0t1aYQRsrSebZABtCC7BiyrD10ECR6cnFBkMT2dSWPPiLPGQQKFe2nK6ykOrqx
	ePV4ZWgygu1sS16tWxP3sIw7Y8BckChPdvUPLTLgAo5ymVygoLP8fp053nmV9JzDGY5vQ9ehHtN
	YSKVXSUfL5UOlsE/DtNAp0PRcKzlL7RQjtm9ssBY9CnBhDL/euCYDY8MFwEbQOFCT7siUPJSa9X
	i+Bqhx/oYCMPRKG9vZjuUOplMGYxlAkjUQZ7xi33TB
X-Received: by 2002:a05:693c:8099:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-36a42236aa1mr4832510eec.2.1793362359267;
        Fri, 30 Oct 2026 05:12:39 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm8144599eec.29.2026.10.30.05.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:12:38 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/9] media: i2c: ov7251: Add strobe output enable control
Date: Fri, 30 Oct 2026 21:12:35 +0900
Message-ID: <20261030121235.2163478-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-9-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com> <20261028112154.855185-9-antoine.pichot@gmail.com>
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

Hi,

On Tue, Oct 28, 2026, Antoine Pichot wrote:
> Alternate frames is what the Windows driver uses for face recognition
> on this hardware: its 30 and 60 fps modes write 0xaa, and a register
> dump taken during a Windows Hello sign-in on a Surface Book 2 shows the
> same. Lighting every frame (0xff, which two of its other modes use)
> would double the average emitter power. User space tells lit frames
> from dark ones by their brightness; V4L2 has no per-frame illumination
> flag yet.

Before I send v3, could you please say which of these two you prefer?

V4L2_CID_FLASH_STROBE_OE is a boolean: it turns the strobe pin on or
off. Two sensor settings then shape the signal: how long the pulse
lasts within a frame (the span, which this driver ties to the
exposure), and which frames get a pulse at all (the pattern, one bit
per frame over eight frames). V4L2 has no control for the pattern.
ov9282 writes 0xff in its common register table, a pulse on every
frame; this patch writes 0xaa, a pulse on alternate frames. Both chips
default to 0xa5, four frames in eight, so a driver has to pick one.

- when the control is on, pulse alternate frames, as in this patch;
- when the control is on, pulse every frame, like ov9282, and add a
  menu control "Strobe Frame Pattern" with "Every frame" and
  "Alternate frames", after the infrared torch mode of the Windows
  camera API (off, always on, alternating frame illumination).

Either way the pattern is one register write.

Thanks,
Antoine
