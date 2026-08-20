Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB03E2E7F17
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217245; cv=none; b=p6UsIUtWHVWDFGaFXaBOGX4u00ZhgIxuH+gVvL+Y+vxxkFLDF01uX9X++9KbUtAt7hbS5vKLONabQLNXbmd8uG86ODTci/MHQSmy8RGRe/jZ2MUb0u9It8l9g+/s7T2/MVGL9liDWp0cCng/x0P9nmo/1e+al8in8Ea0WYneGTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217245; c=relaxed/simple;
	bh=Ix5Kvrk08izmUTJAJJsED+itii2hjUN0KK6oicmh01U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L6/b+RBgRZYdrzlOW+Mn6gX5EITQ00iMnY0gTFXwtuf1vRLBCvRrEHsKFfPNaLXTbg7XnwPIe81m/1wB/+y1m8IrOaPyvDtVb5JH8zGe3wXtvQIaMDn2eAsIVhH3A9KtMu5k30g7rkei7iPe98z6+wxWi1CKm21eTKsUBcdakHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=B39QL+8z; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="B39QL+8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1787217233; x=1787476433;
	bh=8hb79duKljCsOF/OG7kIY4E4KbBi5Yk59OWwmouDX8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=B39QL+8zq4uJAKvsErY/o1k2I7mxT5ByY3kmszBwMjlEL4+LxF3GMYEn2Ou2BVzyg
	 MKd7z44MkuVIa5q1P4Vm8r0/rA8fY/zTYWtumOvzuKUuGp88/OIo7L0EDjLHrLV645
	 uiBDf2LQLw+h0pGjrlJbC7agtHVsLULXTNTJHv2lpW/vu8vuEkdS7KVfvAzDG+tGHe
	 V/paCvE1wZIUOpOeY6VtSpOj5pAZCC/Zd87V0/8myG7q5r2raS6ejFYLkg1F8HZPiW
	 +1TfM/xkoXAJ/vSj+OkySvzmx96WCFFEMHFeef54uJblXHN1SZjrX4DT+TogvFcbCy
	 P6WsgZLuaSyFA==
X-Pm-Submission-Id: 4hQd646Qxhz1DDWl
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: david.laight.linux@gmail.com,
	noambs2999@gmail.com
Cc: ribalda@chromium.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix integer overflow in frame buffer size calculation
Date: Thu, 20 Aug 2026 12:13:39 +0300
Message-Id: <20260820091339.42288-1-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260818092803.4f51e6dc@pumpkin>
References: <20260818092803.4f51e6dc@pumpkin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 18 Aug 2026, David Laight wrote:
> I'd bet there is a requirement that width*bpp is a multiple of 8 (or even 32)?
> You definitely don't want the divide rounding down!

There is no such check. bpp is a raw descriptor byte at uvc_driver.c:405, and
wWidth is unvalidated. The rounding is pre-existing, c0efd232929c has the same
/8, so it is not a regression, but it should be DIV_ROUND_UP. uvc_driver.c:431
already uses it thirty lines below.

> > +		if (bufsize > U32_MAX) {
> Should that be >= ?

No, U32_MAX itself fits.

> I'd include the bpp, width and height values in the trace.

Agreed, will do.

I am carrying this as part of a three-patch series at Ricardo's request. Will
fold in the rounding and the trace values.

Natasha
