Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851901;
	b=qtesJ/hmQun74MnS46f89KnW5IjGbloyt9vl6sheK3ymKqRCXuX6kmj2xbLZL+OGFe4z
	 Rd/CTPPw0YsDS9B8fVVj2dWEujLlwd2+t6ggjz/Xrp4RTZyZo74bWpUe6zd41EP4g4kUU
	 ux4cK+dyF0vULAETMfNgiT/XpW7KAzyXWzXfUNz4FiC1z1LNGlbAWn6HzrMS4uhWMyxJe
	 1suauf6O8jDxIp6fTOUrXx+UzN2C9Rx+z2Ly+7TMIaIdpUnpv5+k7bk0gRdAb7mdRJIu/
	 irgx2BRSPPxBy7oHOohfPqcqQ3tDRI4g2hhfJWBJil9Jey8z1qxKK6B66thNLVQdJMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h6XJvo2X2g2Z+K/pencoU7yNqa5NvpNeSb8E6WHAlWc=;
	b=ynlOVqlOrUIrfLRdtIT04iek3Hd4PWKY471w6O7eKNpHy0xCc2Rum+DP+yJVyIm/Z4Hz
	 dQ1ZtZuoJJJL/OczLsQJ8m6i482V2xV1inphNaNh6pbASJuEt1jyoJ2mGxGF3jo251kzp
	 vXTOUnAA0Z4+Z280OGi5gMUWa3SJzxtrMVb2bSWyDntxw+z/EEFo0Sx0P7Hh87m15o6Yf
	 vO0Uik/tOJcUqQzLDC9eg4RtYKYqsc+Vtywxi68jX2ROcsdHVB+dycmV3FxEUMmYiZP8s
	 /5lZDEOCYwW83eDsaHUPATd77S81DRLJmsyYTeNbmbAlgwxo0RSNECp63ew+ZmuAMoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvH8r4c6;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D14E606A884
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D14E606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvH8r4c6
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491971ac844so3284128f8f.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851897; x=1795456697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6XJvo2X2g2Z+K/pencoU7yNqa5NvpNeSb8E6WHAlWc=;
        b=hvH8r4c6NMHxVz1ieBiNUUrP4OYAIvuG2ggpimF4zv3FD10FOzaH8VZaV23E3K5UHP
         cQdj4jk8oaGOLzdWUgtPxoa2wZ+7+/7dOrLjZQ7lNHA/lhwolBgOAR9lK49EY2RhYJfL
         ek62qLdqb++2HCO/q/8HcX9scgUF0eJ8L9GSICb+UmTJOUCsX3kLoygqZ0vOKFUMT/Lp
         jp/PTtqm90eQIiwSeYoOXNmrrAK86CZlvHMNEuGnw4ZD18/ssQDXKq4axT9EJ0ebfBiA
         MpIEcDmRTZw42xQRbS/cSHLY4rVhwZGQa6sE9iro3SaxP7vKXoZ1ymQe58GazwRF15bZ
         bL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851897; x=1795456697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6XJvo2X2g2Z+K/pencoU7yNqa5NvpNeSb8E6WHAlWc=;
        b=p+llpNTDl1G9v9xT6rVFXuNDOIyy3x5ubU5roUnSFD1gp0/uzHjWiP/tS6GeR4TMG+
         J66R0iii5vgMycjVHgaGcfD9aFCC2U8u/xxA8r09qWLSI199kNRja6S1LOpFlF9DY3du
         v1PiDuqPmnCmbwwrrhdIaPzYqNv44I5JYYfA3xet18NeVV+/nC73ErdPX7D2C+doy86r
         6HqdoJsgPnbnzYMPfUhoJpzbQIir0yDSL1vZGei+VaDhyW2w30ZzMSychF4/58s0FIPs
         YIQVaD4A45gVoSqtpWI7hSnHlXN3bJO/ohePJcur/N2+9X07omMkCI26i5Wfk4P770Ol
         76Uw==
X-Forwarded-Encrypted: i=1; AL+hErFT88G1SQ17rLayc1aeXoxbJ+4Qvi123nUdy7QvHgRHpV1rzK5FUTsYinY1ZL2vJ4bUuS8lSkqVXr5CTg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/SX4KcmEQg3aSGEwa+mX0Y177U5nmStvtN7S36mXKkPooDyVI3
	QnDYE0XINWNPPTtPbCpbbahXfPghQR5Ia5mh2oqrR4pnZ/juU9i8nVnhKfxXtQLfUFl3fstN
X-Gm-Gg: AZFdTZegCInaswF8W+TkoWdpeJcVR+tuJES+ojbW7/5/R+XJmCe45ApZa3J+Eu3kH3k
	4x1kIhGTat0c1oQXLanLUKYOMz31vizj3sLNQ6JSIuSSraP6y1dqwjIAh/FQeqDyyXa3mu0JpqN
	YsNjjBbLNNEmkhtvwscbpLMIdOsw6MP8syYdtDJkOALBdY1srNz5dIAoWCoqSA9OvdImvON5KtJ
	vyncntjYRyWeBJzxDc7DkgZqj4MH7YwSR/P/2N1x33HgLWSZpExfxrnvxyAAlzRPIn/qsv+uSyG
	03d2E+O6zqg7GVNIjEra8rDTXt5UtbFWdg7sV+9+nevvbiaQQ4ssDz7xjO/acaAnrRt7r8dIigH
	YJQLtzgoXrLCsKT/yTsa4wMVs8Ggk0Hwv7VEWsfZrAW6RG3dc4ujaOOg7B0Bj9urAjkWF8A91dS
	ZKxWan1KGEfppDcsbflfGZrYGmiMy3EKZb87TEZ5iNtC63nru5KZ1eAskWpj8BZ3utcXl6411Bj
	im3oXli/PydL6Y90rbFuJtsn2u/qxazB64kekeFPrEH8HFI8p5nDpYEaAbKVNye5d6xyr6cCg5w
	l3wsjbIeDdmauwCxFcwy3mPRHuZYGJmpNOC3iVR+DyiU2g==
X-Received: by 2002:a05:6000:4541:b0:48f:bb86:cc03 with SMTP id ffacd0b85a97d-49c70ed7ff4mr17130136f8f.11.1794851896560;
        Mon, 16 Nov 2026 09:58:16 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm24171374f8f.3.2026.11.16.09.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:58:16 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 0/2] media: atomisp: Fix PipeWire/Firefox streaming for sensors without crop or frame interval support
Date: Mon, 16 Nov 2026 17:57:48 +0000
Message-ID: <20261116175750.21905-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
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

With PipeWire as the camera path, Firefox could not stream from the two
cameras of a Lenovo ThinkPad 10 (20C3) on atomisp:

- Patch 1: for sensors without crop support, VIDIOC_ENUM_FRAMESIZES lists
  sizes which the preview pipeline cannot output, so format negotiation
  fails when userspace picks the largest one (IMX175 3264x2448).
- Patch 2: VIDIOC_ENUM_FRAMEINTERVALS fails for sensors without
  enum_frame_interval, so PipeWire advertises a 1-120 fps range, which
  Firefox turns into 1 fps. atomisp now reports the sensor's current
  frame interval from get_frame_interval or the pixel rate and blanking
  controls.

Patch 2 has no Fixes tag: ENUM_FRAMEINTERVALS never worked for these
sensors, so this is more an improvement than a regression fix.

Tested on the ThinkPad 10 with the OV2722 front sensor and the IMX175 rear
sensor (the IMX175 driver is pending in a separate series [1]), with both
patches built out of tree against a 7.2.15 kernel: Firefox 160 streams from
both sensors at about 30 fps through PipeWire. Build-tested on media.git
next.

[1] https://lore.kernel.org/linux-media/20261116175151.20150-1-volodymyrchapman@gmail.com/

The problems were investigated and the patches drafted with the help of an
AI coding assistant (Claude); the testing was done on the hardware by the
submitter.

Volodymyr Chapman (2):
  media: atomisp: Don't enumerate frame sizes the preview pipe can't
    output
  media: atomisp: Report frame interval for sensors without
    enum_frame_interval

 .../staging/media/atomisp/pci/atomisp_ioctl.c | 86 ++++++++++++++++++-
 1 file changed, 83 insertions(+), 3 deletions(-)


base-commit: 3fc9303dba01676c2090768126e5327e341b7761
-- 
2.43.0

