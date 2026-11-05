Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871233;
	b=ydsrf+cAsI20fF97icEIhN97ITICl3wu2IMY6YaBnofSDD1Mi0YEJZbpryZ85s5sIJRJ
	 PEh6zu0FZZqrQlDiPMLioaauSdfdKJC84fEaDc1YvoNCG4jUBZTcVwV/OqoOhrbEGZO/B
	 d0A1kSGkKdSF0pm4+Gk/dxw6rLQFqef0lmcgA9NivHvREbYUycRSasTeYSUsahHtzA/Se
	 dFuPteu+GyZDVrUbgQZD8rvuMvUWCgq3zhi/M5gFpwCZaMW/bAaxdAmKY+fW8k3jkTNbB
	 0hD2KMFejqSP5tYD3F8fcWJKiONmiy4qyfRwKtrY/A5xZml8vw0qaxFqWLRULhbhcuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YyMbqjO+UegeRmy6DgvDbjX/Wf0GYEt6KMjPad/OgWY=;
	b=yVZG6XwZnXjZC4Uv0V2rZiM8SYIGvHMpPEhwpGhAbe6U7wnlgWhvTZvyfSNoDUT2laj7
	 Zp9hxaobonc8GGCSPx7/HtjaqpPAzmYCcAq5Rnb/zYbXxn0lgwGjgZZ73vcQ7o1r1dqKQ
	 Hctpbd2C1j5Og1qQ4+BcQAvF2jhz9I2RTt5lXvYIt5JonpjnDHDsuOM3b2VuXqaa6s66g
	 zK0mSfrTs+PIEcg96aBv/0deZc7OQt0PwC5tiBdL1ms7SjV/lNUXKpzT1W0bEl6ZhAmgw
	 1B3f+NFFs/yDXmRRHk2jGrLS22FcldnEXOdHzAARstHrMpeq9F8eZXpWkSeIQgKBtRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKlITHYj;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45E9606A335
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 09:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C45E9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VKlITHYj
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3edaso281349f8f.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 01:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871231; x=1794476031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YyMbqjO+UegeRmy6DgvDbjX/Wf0GYEt6KMjPad/OgWY=;
        b=VKlITHYjn4rMf67yDTvYadu+rZm8xzOxTpN/TKthk0zOHL/e42TxxIyfWJ+mrpRVje
         em3H8WxTWiSWlO4HBekqBRgX65X+rwMCQMmIxTclo9MWBMTf4kMog/FCNKUiesviV253
         CjpIQk2pjFgXRBqAG2C3RUiKwaI95B4CdJa0hcpTZflS7BDnNRxUyDkw8b+NY9r+/u4z
         8DFepbhDHZy1IvarML+OXYTqK+i4+Ebj5ZWraY9YUG44As4V9SgVZJsYZG4syTTwBCbO
         3L6rPolPJ8RBsfbZVyTf0AWeCL6BUF/FJv3sWfAYZwB2N5J8UoDRnOl/C+Rr7QPwIbMk
         izKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871231; x=1794476031;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YyMbqjO+UegeRmy6DgvDbjX/Wf0GYEt6KMjPad/OgWY=;
        b=SZ5sCqc21tc9V1ohckyD7Tn9GKe1CFZV42LB6Cs8h0EbO9PfgrDIGTQD/DOn3pWkOw
         vYjnbKJof5EvN+Am7gB4OKOZ5DdFnHTnW+KNW94uiQ6VtO8iV4ZCb8YvUck0b4H9z0Pq
         0f947lD8Pu+d1NXu36JUxgmLcZMBO/Q8e7Z5cjAvZQrNg0w33F7xD8/BXWhGSO88n1y+
         WQiB43Gz7ow0uZ/9Prt0Pq6CNk9EGvc9W7T7A6+n3F5/BcrU5QcsdCE58mnsu/wiuI7r
         DQYu29f3MQJTspEjcfM5e8GD4jLroOy4kgcI0LPo5qAwJ9hliHGrxgIMY9PgUrmQCF3O
         yV9w==
X-Forwarded-Encrypted: i=1; AKwUvBxBkZ9U69SddB+Nxi8ogyTGfLupLgzDQ+PbY2eFk0hHZuczzSbObI8nsSszHWGNAKCWNdSko/MrzILR1w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/sa3YluUzzbeRDJtKhn310kP+4DI0oPo0lT4I7T+duE1uVERK
	wAXXHbp7/lD6mLOlPAIyY1zOKBDwpjT/BeXLc7wHrLEtwO7YzUE7BeKe
X-Gm-Gg: AYBFou2cbjZRSKXt/FFSybreH86IvnIHbcOb0WjbgvCnEgoW8xu0Ce5wENWcFYdgfgl
	sVuRc3+mz/S6nYWXfBeQR3mQNlC7drENhtrUx/kSDvQTd1o0lc3cWZAoB2cq72ZKsoTnXNiPcL5
	QYapvOhL7aABX+hxz4m9DKDtnGvShAAqPcY1Z84z1JTjFMam0BKDYqMkaUiTIEcyWqPfvVRM//X
	yX1Px3v5q0dO12z3jKNLgpe5dDrcTBdePE0YG/zbU0fPbTA1rA/2BvR5ZoY8QDfIus3npRjMuka
	4J5ICUul49DOmNhRMnfIf/HkKbI94w6pEoIX7VdaBune7FcEi0ScjQqzKML4WwmdAoFevQBuXIH
	U7L+ArnPfhgk/z18NaRGFtbjArHOmNmXK1euUQbUaojty9youfBCOhUdHgoU+JlS50HbTz3TSiB
	+UU4YWTouwmh1Vzi307NEkNLVK3KlFJIsEVol+V/6C360hcda1ifcI4tTrtjoHbRfvhb0OVmOAD
	5Y8z+ojazt7o7BYbf7Cr97OSDaPJPeiMkXac/BKZi4OnTv00uo20xp+/62TSFSiAxt0L+XunjFo
	4y3G1PDTt2+FL9bI/KXB7bhPoZL653tjEuo5Axg=
X-Received: by 2002:a05:6000:41f0:b0:48e:6625:4190 with SMTP id ffacd0b85a97d-4911906d39fmr3386070f8f.7.1793871230914;
        Thu, 05 Nov 2026 01:33:50 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d88e1sm8999211f8f.15.2026.11.05.01.33.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 05 Nov 2026 01:33:50 -0800 (PST)
Date: Thu, 5 Nov 2026 10:33:47 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Kuangyi Chiang <ki.chiang65@gmail.com>,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Add UVC_QUIRK_CTL_MSG_DELAY_1M for HIK
 camera
Message-ID: <20261105103347.4983b901.michal.pecio@gmail.com>
In-Reply-To: <7c254ab7-579e-4c17-80fb-596e6fdd29a9@kernel.org>
References: <20261029033106.7374-1-ki.chiang65@gmail.com>
	<7c254ab7-579e-4c17-80fb-596e6fdd29a9@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Hans,

Kuangyi Chiang has also reported this to linux-usb and linked here.

On Thu, 29 Oct 2026 13:46:04 +0100, Hans de Goede wrote:
> Is this a USB-2.0 camera connected to a XHCI controller ?
> 
> And if yes, how old is this camera model ?
> 
> The reason why I'm asking this is because the EHCI USB-2.0 controller
> interface causes a natural delay between consecutive ctrl commands
> queued one by one till the start of the next USB frrame, so they get
> spaced 1 ms apart.
> 
> Where as the modern XHCI controller interface will put these
> back-to-back on the USB bus. We've seen some issues with (older) USB
> devices before where they needed some delay because they were
> originally only validated with EHCI controllers and the hw/ff assumes
> it will get some "breathing space" between control messages.

Are you sure that this wasn't possible with EHCI at all?

What sort of devices were affected? A bit surprising to see that there
is apparently no quirk for a known issue.

Regards,
Michal
