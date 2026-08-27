Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E74B04B1
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 18:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854786; cv=none; b=lg0FznNYVPdBE8XNChi4nP9l4JNeXaB7pgRt/p3pwK2EZDkYTTQRRKJGjGuyLmAJd7sDrmhcmk2GWWb5DiICBneu+qs5UIQUTbuDguQI8lJfufW7Pxy1v/mKlAS5O+Sv28fHGvGgIIJBO7IW86L+FKU1TZ/nU1UtldRYIm04Kl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854786; c=relaxed/simple;
	bh=fixTMnw1wCe4SQW1Mpx/hz/yAjnGwm9mXVrqZi+gr5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2rW0hpacg+Vdxrz/qX0Q9V7twHznU5W4QIGqmQeFERG1KtCiD4gi3eeGt+99W3jTWqI1tx/1GsDlh+PcY18klyxLAalB8vADxJpqhFaSR1UFA6kjS+d69kEza2/ejCu5WDcttj79ULDGVUPj74rVMU1fgAJMwYpxqEc6+fOKBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jI07dLGj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jI07dLGj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso364505e9.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 11:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854781; x=1788459581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fixTMnw1wCe4SQW1Mpx/hz/yAjnGwm9mXVrqZi+gr5Q=;
        b=jI07dLGj7PcNU9MqOinhnBUDl5e32enE/dM0LmtoxeCWtzy5MCUQ59CYkdSyU1DH+L
         Z9vOLdLEyiiQ1gcMNLqFYg/8Dsaf2HxlwqtmgjdFBWLpTJUNMJsaTjMizBDWvYwAmpGw
         g5szAp9xDjVarw2xtH7NA3YOd+SfADq3vsTUfdZzGxDX80cpQ9oebSyepMXxchEjjbbw
         DRAk8coB07+0zQ1HN6vOROze44YO24Yg+fbnVlgHzzbT/rRLDT7iJe+aZGij/HoBBuhk
         66ttjP3LEOTkOCjRoH7O5K6vsfeu/nEUdUk1eWbl/r8BKm6yVhqNS5hYYVlUBxlH/4yX
         xeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854781; x=1788459581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fixTMnw1wCe4SQW1Mpx/hz/yAjnGwm9mXVrqZi+gr5Q=;
        b=UAgtRsChtb+VXzk6yIycM845HJC7wteMWjHPSc6O0xjRAFQ1QeWMEsHsDRnKJLJOW1
         RbhlTZr6an4sfeMg+TS3LcEvLLfKcmmp8fT868yCSS6ibioE4yShdtofUkRz780B3kod
         +Vt/15RgTAwq/M8LtaW3fLZP7M8l8ShgRocRcmyj0C34ElgqquChcibzAUc8yAipvsbQ
         GgNSqwTEqRHF2Z0KRBxtSjVX1DdSiWgWka6kQnn9cT1/thiZDiaZinQF1yRePmhwJCBf
         lfYq3Hh9C85ewy7q/Nar0nU49+VzzYxNOFgpB0SO+KkFZthB05zgj5U6VC0qbKyZ73UT
         I2PA==
X-Gm-Message-State: AFuF++kVYr8WNvu4HcQY2EKJEVtEKszhgRlTudCn3q7USU1K04gBbil7
	64W+2H+oQBvYk3+JmZcVeYeQ/YYMmCkhm/RyvMn+Fi65EoTkZ45WETQj
X-Gm-Gg: AR+sD11J467R8AFY2hPnny6kXIiA1BAgnQ8VOxbDwh/yaRcDIpagaG0owulMedDk7kd
	O3U7XbfuSJM/4+X0WASCVT7bbWN+WYAdDLPhoLBg1fM6XaJqPnyN8P0aHCKDt/x6qLiIle8Rj/X
	G486QN/Z34SHKjaNGK6u2UvqPWBsiwCyhVG8kr0a/5sLv9WDUfIbGsxRvAWDqQCiORvsp2+WRdr
	Z9rcyUWjC2uaEWWb/wQYCPdMOmJSIPW8SbzzgPaweHNqg4EkJxBvE1gvDIsYHqvFeNik+X9N1U9
	y81Fo8gYkEcDnvwJ5wcNLrIzSEuQINiqCbXBjypdgw8ZhhwiFBwQSoEvU7kkv/rYv9voRf2FOMf
	SRgF3bmPoX3YbQVUmGD9fUV3LpUrHW4i0+oqtZQBdRPoAj6d5oby2Gjv3qwEoQJQ8UH+jqI2C2x
	VusAQVESCgV48WQAae5YLQ8OIZntIAOSjL/q2n1L5YH8pgV/KJ5d4BCtQL8MbxYjTAHE7ARlqn7
	vqQXKHAauEJA1tJAAjaL65pqBaCO2ieQ0pUpot+zrN91w==
X-Received: by 2002:a05:600c:530f:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-49b91bd1552mr13828835e9.0.1787854780571;
        Thu, 27 Aug 2026 11:19:40 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91ca314fsm4381035e9.3.2026.08.27.11.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:19:39 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH 1/8] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Thu, 27 Aug 2026 20:19:31 +0200
Message-ID: <20260827181931.2432507-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apAGGD27ZUFHQ6Aa@ashevche-desk.local>
References: <apAGGD27ZUFHQ6Aa@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you. v2 splits the existing 24 MHz digital-gain packing into a
preparatory patch before adding the clock-specific path.

I retained the two masks and shift for that existing path because the 14-bit
control value is not laid out contiguously in the 16-bit register write:
0x350a receives gain[13:6], while 0x350b[5:0] receives gain[5:0]. A single
combined mask would not perform that repacking.

The remaining review points are addressed in v2, including HZ_PER_MHZ,
single-line writes, a table-selected gain range, and declaration/layout
cleanup. Pahole on the final built object reports struct ov8858 at 792 bytes,
with xvclk_rate naturally aligned at offset 8 and no hole introduced by it.

Maurizio
