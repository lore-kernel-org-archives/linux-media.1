Received: from mail-yx2-f3.google.com (mail-yx2-f3.google.com [74.125.224.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5FA4499B9
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 20:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973028; cv=none; b=s80UZrx7fA9zTShRn9fBs68TNvgtWStnYb0lpOHy7wsGFjVoI1Q4I3aoS8NAIsA17JAq3hp7X98b22gv8of3ol/isr5tmm94WzTvSQ5nUM/HJQmr+77FWsNohlOPQdccPSYgxTPqabg7rXRV6TojHH/GJAvqJRmZ+HASFpHqXRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973028; c=relaxed/simple;
	bh=lNq9HbHx84bO0jNzQuDP2EuhbElpWCYOSVhU+wGOVjw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyHgE7Irq0qcOwOy0cl6y+sTbSvE+32TMZ2uWbHHw5eVGypQ7wI4T0qZd0AuGpEbQAoLos+duTyZ4KD3V9BTu2kwnYxBaBNYpSxAXIVZrGtTprdVnbFcNG/jaqGQVAexlwgU863SwtqZNzMJcOQDjOk0bFmCqscrur866EPUqUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuwCMtee; arc=none smtp.client-ip=74.125.224.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuwCMtee"
Received: by mail-yx2-f3.google.com with SMTP id 00721157ae682-81e8f17ac11so816957b3.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 13:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783973025; x=1784577825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TQ/EY59cpu1jkc21PGftgoguMZtfT9udSMBKlCW2BmU=;
        b=KuwCMtee78wyGv6kJxK+OP+nxLdIXQfY3/EfQKhg43cPIZV5hC8Ipa05wp7MAfRX6o
         b/i4Zt/4TyLLYx4ml5UIu3Ttaxk3pQG5e56BDrTvsIHVKzh65VkGafpBC5x5Z/H1HXUz
         IOcRPBqwjarlsNzka4ODITVzfDEJ5yDp5VEN39EwXYcGnxmToC8s2Da5AsIdN7ERvqol
         wIdh/V8drKP+9JUHN41ERyJlHxcx4viZXwYUd1k8jkNKA5MJtc1Gw3mY/QkhVTqwY3bL
         2ORnXJjxzrpz1qgDmF1bCKPbBwTUw/QQRGn+OT2H46C+iXToj5Prm8HUYpCFCYV35vK3
         T7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783973025; x=1784577825;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQ/EY59cpu1jkc21PGftgoguMZtfT9udSMBKlCW2BmU=;
        b=osmJINUs2raRvv26u8FqFuXoRdM+gayoubyBO2irdIuX8PyVYiNXFZCfNW7YvpdkFr
         n7et78+5PGl2kqDbicwVGZYmOzF+AkR19DesEEnVIugnUf2PF4XJBXN/3S50pTCeVQSN
         n59B/nf7ETVvUz/Ul3617sUkorzElu6NMoCiHla2/unUNNtDoXfuh4hp+80xJTTtKywt
         Hqz4p1ZV1bsW6/bgwYN1V9KVKifXUTYMsCOEOgeydPHveTJvu/SRLXGZLAxPwku1ZcXd
         xjYIbyHOBL6njjTlLc1Mb3ekwoFhSivVIUAKXyLJTcGoPFxzFKocOtU2j5VWbmF7Hfog
         wBrw==
X-Forwarded-Encrypted: i=1; AHgh+RrqaQBKWNF7m7Af89GS6FZhj7qFg3OAWbwULXlXygIunHTVsMZ3YlVM3ivNxhBovxEhtHaUj3tFF1ClNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVvjxL10n809+oFLUdXP0EtVcZn+u6Z5ApBSprGGftCHUlLOhF
	pZY8tiMcFmuVpEcWEeqDYV1rs8H896z8YqKu4ji2EuJ9vWBKGqc1yBe4
X-Gm-Gg: AfdE7cl5O5MSuePzUWCUZSRb7KlA52HqNKKPv4IHcOIaqnQfz9cOtyJ4GAUqITTDz1X
	yFX4rtMVNOrOFHIJZ8SGnQo7OgCe4/PqB4MssXJBPFQvFzAiXpDcBB9WVsjkhaV3GRLfNMOFAyY
	I0TRA5nkUGxCIqXgTZNofd2GgNZ0QP2QAmsbwwT7YdjKW/e/xfNmR3ZIehLMal2TZoWXIV4zcXq
	8LOC3g3C1ZhsLjfIwQ+ivY6GdYl1QhmUF33xjdRwTudqXWYytpu5uL38X9s5yJY133OHOrbHNtl
	T7TLdQbeF7NoPYbgszgE/XWsTrPeZOmv6IIOjQbWtQjJHV+VOKA8NglNDjMLXSnrrolFQG+DzdK
	v2mcN5Ra2PTuX4T9sG6X/HLXzQUAEKeX23rnAEg2In/RbiB4qBlHqtPnn4AziWuA2KYwZJsGp2E
	0bjwDIavdph+uIgVTCHAXKb7k4dB7yiZUo6W57dL9YCH4g/fYK3y67jGC5s94ibkQg3LHgHMlic
	HaNWA==
X-Received: by 2002:a05:690c:3344:b0:814:5840:2f92 with SMTP id 00721157ae682-81e9014da15mr83359257b3.48.1783973020642;
        Mon, 13 Jul 2026 13:03:40 -0700 (PDT)
Received: from pendragon (76-234-45-214.lightspeed.cicril.sbcglobal.net. [76.234.45.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm123926137b3.46.2026.07.13.13.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 13:03:40 -0700 (PDT)
From: Colin Braun <colinbrauncl@gmail.com>
X-Google-Original-From: Colin Braun <electrolitic21@gmail.com>
Date: Mon, 13 Jul 2026 15:03:38 -0500
To: Danilo Krummrich <dakr@kernel.org>
Cc: Colin Braun <colinbrauncl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-media@vger.kernel.org, Colin Braun <colin.braun.cl@gmail.com>, oneukum@suse.com
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
Message-ID: <alVEUR0JrF1ga3S8@pendragon>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>

On Mon, Jul 13, 2026 at 03:22:33PM +0200, Danilo Krummrich wrote:
> (Cc: Oliver)
> 
> On Sun Jul 12, 2026 at 11:07 PM CEST, Colin Braun wrote:
> > @@ -382,8 +556,8 @@ fn as_ref(&self) -> &device::Device<Ctx> {
> >      }
> >  }
> >  
> > -impl<Ctx: device::DeviceContext> AsRef<Device> for Interface<Ctx> {
> > -    fn as_ref(&self) -> &Device {
> > +impl<Ctx: device::DeviceContext> AsRef<Device<Ctx>> for Interface<Ctx> {
> > +    fn as_ref(&self) -> &Device<Ctx> {
> >          // SAFETY: `self.as_raw()` is valid by the type invariants.
> >          let usb_dev = unsafe { bindings::interface_to_usbdev(self.as_raw()) };
> 
> Please see commit f12140f21acb ("rust: usb: don't retain device context for the
> interface parent").
> 
> We can't derive the device context of a USB device from a USB interface. Please
> also see the device context documentation in [1].
> 
> USB device drivers are separate from USB interface drivers, we can't assume that
> a USB device is bound to a USB device driver just because a USB interface (of
> that same device) is bound to an USB interface driver.
> 
> The same is true from the Core context, which means the device is in a bus
> device callback, where the device lock is held.
> 
> This is also the reason why I keep proposing to only expose simple forwarding
> helpers on usb::Interface to implement URBs (see also [2] and [3]).
> 
> An URB requires either usb::Interface<Bound> or, for a USB device driver,
> usb::Device<Bound>. But since we can't derive usb::Device<Bound> from
> usb::Interface<Bound> a simple forwarding helper does the trick.

That makes sense, thank you for pointing this out. I should have taken a
look at the git log for that line to try to understand its background.

I'll remove the usb::Device<device::Bound>::set_interface() and
usb::Device<device::Bound>::control_msg() implementations in my next
revision (since they will no longer be used) and just implement them on
usb::Interface<device::Bound>.
