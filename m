Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370402;
	b=XpKoW2b9OFSnqtQe4fEwvxxignXjYMg3FAl9pgYI8gXqdUyQCcnpH395VG8u4H2I4uWN
	 5D1H66hvAWaDQOytLKBUrDypD+6HasQkV1OxTwdrhQmpZhFfe535ArFTC5ELbcRjZ1nui
	 5At9Qj8AGgpC+4ZpF03eU4VOm3Rym+jl1Dj6w0p/473JZUBLoxryorv9Z/T8iltoEzpjT
	 HjnJ1aSb87PFleMpsnXdCm0usMZwSEVGmm44yPAuwkxx04MPV6lf7pZJu+/D3UVkaMj2d
	 I+u6ZmNhgro2QKxTGZSP/JiWEb2i/kLkDZBnACksS16Z8qCyPI/TKGnbMvkJyq07YBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SDmf0bD59MTl7PVD0AQu0SZMcBGjQbDBkS5Zjka31Fk=;
	b=xNKRmxBfwo5Ww4mUrOnrwGhTeQ6jCJxQsqDphpbmBrULU40fTKH1d1gh7A3Qw9C2Kn9U
	 al7INNz27u0lxWGlE3GiGpIIKb8RZ9DQO0soaWYlGyw3K8EjF0Kvq27ASKKhyuHFBAFiG
	 OlhXr22EqrIxuI41o+4dKuA1RCA2Vr78hURRhMYpNOGy7dbItg7yVFtg18QOeyorQXzlJ
	 KjFI4LW60rSyT92CKkjLqgfsTJc11j0msoT33DHrOTZ3GARakh7YHs2Lg431KpUzudcf8
	 j9APIg9E+dCYCC1WqH6+VuMJpBhp1hDvOEFOPwWgDYGxR7CsKOtg2NKBD0OyybLVchA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sgxr2fHl;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C85606A329
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 14:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6C85606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sgxr2fHl
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3550dd02c9cso75518eec.0
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 07:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793370401; x=1793975201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDmf0bD59MTl7PVD0AQu0SZMcBGjQbDBkS5Zjka31Fk=;
        b=sgxr2fHlj6L9jnqsYKE/4b+pQffw+apKKPsW40QRwSk+PodX0YKrdGymqq+y7GWim6
         /P3cLyvGol7JBdFoQicb3KP6oXmLNlpbPTdUiGUwiyrL9R9fljU+pIncY6YzgB6DwYSp
         yDPh3DpCO5POSX6na8v0M4ABbaao4/7jl626ozIlbX0rHVfqgHnX5nRGCQoHsybDLJyM
         bI2rAQSENIEllhuAqmycbvBtA7UZx6Pkzzt2AyPh2ZFe/zzVnaYI1l3ZEUupkW9T7S8D
         m8WVHdB8shJGdEMnoB7PpHOiZNTilYEhaJ3i5tm5s55SFMn1HOC+FlWyY/IxRqjE5bZ3
         5Sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370401; x=1793975201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDmf0bD59MTl7PVD0AQu0SZMcBGjQbDBkS5Zjka31Fk=;
        b=zb0PYLkEre6XTgqRR1F2D2EgU+AB6NMgR5TPyZtRhFXLe3t6HWP/hjAprxd+O8fsY0
         l/wckxbARKQWrz8dbYzAQwYPokC+8XhW9x1B2uycovcNLcTEmaZbLTQHGOJEkWiNA7l9
         fImKrRAgHXbo9BVo3gRp7TQkerM2txwdswZlhbxxsmMvjlU4nsnHsvhGHlEIyZUT5wW8
         kCqERySpCO9kENbVyrGzjQ+AZk3tDVmoFb3GpeTesdDwNZ369Z8zhr4MwyxHS9LyX+vx
         hb3FZb4C8ydWpvc7FomlVdMRO+FAu4ZKOxpeCiMt1mthZXI9g9gDOxbkXnkSvCLOLt3u
         U/Gw==
X-Gm-Message-State: AFq9FYJgUeRztt9Y920TtfM1PH6+meLYNkV6jn2hklfFc/cyjWPp3gsq
	WNJcajaTQbmwonHAtaAqxMRcpc7SFnmz7816mjCEVNe//DX4xzD2yUrr
X-Gm-Gg: AYBFou3zduqbIEZCubrIN3cbY4gzCUadUYHFTd4uQfgJRkOyTazmPobjPKloJ/b2x9R
	R4zkw4vtxjIGqQQWZWhwy4rfGlWL/MIBJ2D/RE6hYRMySxbxtxM6HDIAledhxhpE4BFX7e1LIaq
	R/EBT4iNFDg5QB2AqGBbXUK3C1X+gpNE/999t0+4dkao72T5wetwymWbFC6AjQK9faeJsCPbgGA
	HHYYyLHgwO0Z24aDBqS8XHVTkU9ZOcEKtbCVGZqkXNlZssSV6A2khYgLMsszGYFiGD08Srxtjtj
	mqalYwAa7Dj0quYueA3FnQaQ1kVELIEfOY/3mqeiZfD5+2kltG3tXeijBggpVmfDX+g460iddwv
	0BjeFs+A0EpwII36ZsUbpG+P0mzFBYTELDy1sCEOdtb8Amlj81zh/VVeLBHilblGX4vbpS6zaeo
	04AM4SC43wE5WYtbMFxPnByS52Q7BuZPQE2i95FXToXjFi3Yt3iq6+7B39AN25qeG1V2bAjxkfT
	bWBr6JSTl3cG2mc3cL8kaoTcwZkjll5vhC9Ks1DeGG2eXE6+Wly/jKFXPxwJXI/H9aCFMbCcf7/
	4L6GIy5DGBST2YElIb2DqwDzaD9mW+kYAIbGARrIiGsa5ugNQY1GVT/kW5nn+HAcNkz8ON6lI7o
	msCT1fbthkd/jkaKyPqFc9dyo1wwHe/10QcikQrxc3bTIUs2l+5Mx7xpFwxfKtvG8q5RPR8PEy0
	SSgdwMQN5Dr8ByJjfTQ18=
X-Received: by 2002:a05:693c:6304:b0:369:289a:d31a with SMTP id 5a478bee46e88-36a42059799mr5674818eec.0.1793370400963;
        Fri, 30 Oct 2026 07:26:40 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm9399910eec.23.2026.10.30.07.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:26:40 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/9] media: i2c: ov7251: Use sub-device active state
Date: Fri, 30 Oct 2026 23:26:37 +0900
Message-ID: <20261030142637.2235350-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <auNSB_yCjo8KVGJF@ashevche-desk.local>
References: <20261028112154.855185-1-antoine.pichot@gmail.com> <20261028112154.855185-6-antoine.pichot@gmail.com> <auNSB_yCjo8KVGJF@ashevche-desk.local>
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

Hi Andy,

On Thu, Oct 29, 2026 at 04:02:47PM +0200, Andy Shevchenko wrote:
> I'm wondering if v4l2 provides the set of conditional guards and hence
> some kind of ACQUIRE() macro.

Not today. Nothing under include/media or drivers/media defines a
guard class (no DEFINE_GUARD, DEFINE_CLASS, DEFINE_LOCK_GUARD or
DEFINE_FREE), and the state lock is unconditional:
v4l2_subdev_lock_state() is a plain mutex_lock(), so ACQUIRE_ERR()
would have nothing to report.

A guard class could be added: Tomi proposed one in September 2024
[1]; Laurent preferred a __free() annotation and the series stalled.
I would rather not add it in this series. The explicit pair is what
imx290, imx415, ov2740 and ov8858 do in s_stream, and what Sakari
asked to keep in the ov5647 conversion last December [2] until the
driver moves to .enable_streams() and .disable_streams(), after which
the core takes the state lock itself and the pairs go away.

[1] https://lore.kernel.org/linux-media/20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com/
[2] https://lore.kernel.org/linux-media/aVLOlkqSHn-N5Wi0@kekkonen.localdomain/

Thanks,
Antoine
