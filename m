Received: from mail-qk2-f5.google.com (mail-qk2-f5.google.com [74.125.230.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E903B14AF
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 22:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769255; cv=none; b=VHZBdOSH8ZsoZUlh8tlvgMZWrvf+oZo3Mh0FD2evwnuNG/+0X5oRBgQcuncQGdM16FtWaYah0IuVznqeBlCd1bwYEcSPq1rKxza4DjiHITeTIRx4xILYA4b9IUPWCdigTARUJiBw9TqQTtGI5imycjiinxMEmXCYX1huLLDP7YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769255; c=relaxed/simple;
	bh=XdgB+fp7khA5JFBvlIJ2/4tdWhfod8lqnqnOwNnt6ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PlC0waSoBZmJ25N8NQWkrxdQKlnbbh7/uj4lmsuA3uhEmOBL/TxdFI7l3tzQUpgDx4Wd96QbAB56/4e+lW1FzL1MD+yFIdRLU3qM6nhhEpFnYs2MRQhL6jz7cDcwMnusVrAMYFZvLTHPv22QaZl14SizQzfVjlkHMw7Yb8h/YtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzPifF+K; arc=none smtp.client-ip=74.125.230.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzPifF+K"
Received: by mail-qk2-f5.google.com with SMTP id af79cd13be357-939042cc742so74392985a.1
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 15:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789769252; x=1790374052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdgB+fp7khA5JFBvlIJ2/4tdWhfod8lqnqnOwNnt6ro=;
        b=FzPifF+KBSW/uwpqpxtRiHyALmTxUZ9KFM6vE/Cqjkw4Dbpui/X6iXXRIDL4XfMk5y
         laNJXCUrvF7Ifr6LK2RxwcuhskyT17wy/UZyJIiv2ivtl4UvF8hSPhQottgIIqlLG3hm
         qCEYOzQIc+U8qF5ENwVhSpxmbGoquwUCD+zxYhcySjnyZcOHheXxpngby/jVzNjM3hr7
         JJwDJCIzc84XT3a3NzVTob8RflygKBSuq53WXZPa1FfBdu6CKpozpWAj+1U4GE2DsTOL
         oUxlE9jM8FW+CR+q5WO7HRYXie8oqwDne0wTnMWR3Hrx/ZheYe7cy12RbZTPA1EcPVs2
         /H+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789769252; x=1790374052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdgB+fp7khA5JFBvlIJ2/4tdWhfod8lqnqnOwNnt6ro=;
        b=qhFvHNncZAiMXc1g0TsoZq0eUp5Rjs4ehVf0SCbKbTxdiXs5DcD5WG6gHfnEjG6zCP
         8lRtIeWM7QyaroeAVMfJjwZ7xV76huTzRFk5QU9H1mwqoJk3An7ggLNe8MdBQM6OPsyn
         1HckLuNyaOLswcpDlLBxjzpZFFVscLmR+o2DwImxhH6YrG8y0a9uY3Ze/Hdn6rTKSWUl
         B6rjwQW4rmDr6y5t1aTRLiad3azM7rg/30Vdbjg7tymUGqb3GanLU1murv0wyHNuFdUI
         8vEbDXGOMuv01KBe6sOWb1za7DvAShjsU1tx38lMMyo4ONXOxAA7tF14j6rUaLmgJgiq
         BRpA==
X-Gm-Message-State: AFuF++nKqVj19m5fKWHA3bSObFPs/b+MJ7HYXMiFPe2ohOLr7zyXU69o
	n2/B3PIsuYmfpsvkXmhDnAdy66dVC8ba1IJUtWz06ngflBm2TB/7Y3qzGi5JvtQKYBgO4A==
X-Gm-Gg: AYBFou19rmO134Ucz+WLR1I+6Zbh6UXYE8T1Hq9xzEWkGDnA2OPZ+mPkXA5Afz8cZ3D
	rqK8yVwO6l3+m9rK8jeiUwleQYWk3zQuxnjq50ipCchziEBTNXO1eBDitewS0/+Byqtg5Di7QFc
	AFmEs9T4EKV873apeD94x6BkK1YmmLWlCilRM0NWaNH6M++UyAhz5fKVHSnYrh5SQOX5JQmDHKk
	Tz11YH2Pj8HU/BDj6x9IYY1edRnMLQTQ3roYu2cHIHmYvbZX9cJ+PgPP5sY/5MOAgmhqYEJ+jQ4
	tQ3XFzNsYT8F0pAgx9oSshAjMwsJrZcj/fLv2tOtLEDZHd6kS67p+cXyqZVcYdt2bz4qModQuCk
	p99csVyp/PCjJJU4+hh1LjQz363fETDOo4RhZipsaWpthqQnv0YAG8uN2V7P1oQDRvCkpIfMLGs
	3vWIoY/c0oQB5Jmpwq/ND7Uid/ZEC8iRzkHq/fCtZNtfiZekZG3NyVuv2RVA1l2QUi4h72ln56X
	vAFspcsaPDkWtsWSLL0/8VEe/h4tB728BfmGZcfIE0H
X-Received: by 2002:a05:620a:294a:b0:93b:da60:a557 with SMTP id af79cd13be357-93bdc6d5b3amr623463585a.19.1789769252604;
        Fri, 18 Sep 2026 15:07:32 -0700 (PDT)
Received: from Interstice (pool-96-239-109-94.nycmny.fios.verizon.net. [96.239.109.94])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedac2955sm47668285a.24.2026.09.18.15.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:07:32 -0700 (PDT)
From: David Wood <d01.devel@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH] media: em28xx: fix silent audio capture on EM2860/TVP5150 reference design
Date: Fri, 18 Sep 2026 18:07:25 -0400
Message-ID: <20260918220725.2040896-1-d01.devel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913231013.30b18fcc@foz.lan>
References: <20260913231013.30b18fcc@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 13 Sep 2026 23:10:13 +0200, Mauro Carvalho Chehab wrote:

> Instead of touching the reference design, and except if you have the
> real em2861 reference card (unlikely unless you're a manufacturer or
> if some manufacturer donated one to you), you need to create a
> board-specific entry with the brand name used on it, and use
> card=<number>.

Agreed. It is a retail StarTech.com SVID2USB23. v2 adds a board entry
for it and leaves the reference design entry alone.

Since the USB ID is the generic eb1a:5051, v2 identifies the board by
EEPROM hash (0x11b79572), the way em28xx_eeprom_hash[] already does for
other boards with shared IDs, with a lookup in em28xx_card_setup() for
devices that arrive as the reference design. Boards that do not match a
hash keep the reference design entry exactly as before, with no extra
log output. card=114 also works.

> It may also mean that the AC97 chip - either emp202 or a different
> model - is wired on a non-standard way. Those chips have multiple
> inputs that are wired on different ways depending on the board.

It is an EMP202 (vendor ID reads back as such, features 0x6a90) and
Line In is wired as on the reference design: with the record source set
to Line In the capture is clean line level. The only thing missing is
that nothing ever programs the ADC record source, because audio on this
board leaves over a USB Audio Class endpoint fed by the EMP202 ADC
rather than the em28xx vendor path, and .amux only reaches the mixer
volume registers.

> Please use your name instead of "d01".

Done.

> Most boards don't require adjusting aout. On most cases, just amux is
> needed. The above setup also sounds weird: why does it need 3 audio
> lines there?

Two are needed. em28xx_audio_analog_set() only writes AC97_REC_SEL when
EM28XX_AOUT_PCM_IN is set, and EM28XX_AOUT_PCM_LINE is what selects
Line In as the record source, so v2 uses exactly those two, matching the
other entries that set PCM_IN. EM28XX_AOUT_MASTER was only carried over
from the old fallback so the master volume register would keep tracking
the V4L2 volume control; it has no effect on capture on this board, so
it is gone in v2.

Thanks for the review,
David
