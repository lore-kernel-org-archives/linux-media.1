Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617774;
	b=3AB3SNwAO06An3dGFHJVfPcePJcZC7exRfpZ/S1jx/uBkqYmcts3pirTxVkF+40Xn8HW
	 wJ2GjzPpomn0IeHh+rbWODk/qLHPeIyRY//KiNwzXCdqc20ZVZLtc7G0mSopU7rT7hA9t
	 Q33vuq5zM4q2bJ6CqjJH8lSeQJvd7PEbqwRyQLK2hzN/RsDmNyHV0GsOHmFxodTXf7V1z
	 iwruyetcZbK2AjTrlVvStqEGkVtJ+tEsij008X9UBbJHa72EvI9z17+BKRgfqQZQbe3NL
	 ctC4VoivA14C2UCkcftQV78y2+eSYw9Lg76w1i/G1vcQXrNvjTfOx2LLCm8irOgedbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pe1ZMe82aYurb6rarn1VrDghVHB1DbUnPtYdYIQXQBY=;
	b=nEMyLLbjCUIY9+Flph5WbtUFRIXgGuXEXfMcl0IVXxQAWSUTXqTdBpMQ3pauY+a+XOpd
	 G8LNLWkRjBtBJ0bCWYp90yMOcotD38vJSFmZgvRQsZgm/y6098RtcOWrNSp9o8cAiILDR
	 71Y2a8KdUoRBvgj+Z96qvBDFVE0+KxfdMT5eB1nVOYtbU/s6YHx7DOVqkcHP+q4hDTVqJ
	 uL1Bww98Hf70+26Kp2ZeAeynBtp06TT73PCluS1Tm671soJugfcRNaxZJ/FXBw82NcMXo
	 0LGafcAy828MqgAuDdaxvY3PrQygNGDfmkSGi/EuWtUB9NFJ9M1U0ZGJKscg99B547A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="EZW3/ZuY";
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A498C606A326
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 14:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A498C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=EZW3/ZuY
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55d3563e50eso38426951cf.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 06:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795617772; x=1796222572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pe1ZMe82aYurb6rarn1VrDghVHB1DbUnPtYdYIQXQBY=;
        b=EZW3/ZuY9WExbtSmj8DEkIib33heZdtGlhNDFx+tWdjASShaGJG9l1m82Kj/MaL+Fp
         dpSIbAnEHbFlVz+hIeuZe2jUZo7AJHmM9qcPUK5q4JUVqrygllkLlH5tKigPAwlBeJEB
         9LB10PLPNriJ9LdP2TBPATITfz7dOocLcdPXlVrWDP+RhnNxnuqb2E0hJfrMM+wCq9Jj
         0kjnypjQJIIlk11Kkm8Toq0P5eSeNb2pMa1k0pZ3FpVxzPKKXpMeyZeumx/o0vJkVbcZ
         vPXRC8FrppaPLwV8HvL9WH84Z2AFAp0gZ44kP+l6CyLkE5MwSC6VlDY2fKA7gEMmX/Xv
         DhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617772; x=1796222572;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pe1ZMe82aYurb6rarn1VrDghVHB1DbUnPtYdYIQXQBY=;
        b=q9v6z6WL+xpnWGnNPP9cBh17OmJ2G74eyN4flPnjIpLDRFENsRe2fjXfxWHaP+rqIX
         Z8h4uWxNp1/Y6wr8Vz2s2r/UxLlRxhlGeGBSQKV4tv3Xhj2R5JXipkKMOu5gum3m45mI
         Lq6LBs5tZ5bCg8NBGB4OZwEmKyjskPPxULnKhvjb4YFQpzgW3uITx5Fol7P7hOfyX38+
         f6t98wQqtpc/9yMcljJ2wCrRn8+pnEqePGg+C5gTeAcaLngsUjP7Z1N3pu+qLE6cKWwR
         44Lxys7HD38UpiiKO+HXYzY3hGMEhFJMQwEqi1NPp5wiNqjxLNox6r4zG3Q9MmYJ0iAr
         n6jA==
X-Forwarded-Encrypted: i=1; AL+hErEDBnQgaUvhi6S7iubmc8aL1/qanStp33uIxm3Vr654xQ1PeMH54+E8QLx9Q5CM0LBKFARj1YFnU+MX5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/so1OLh8cdCH8kxtLPG1IU2cqW4dSAerlqfItL9O9B9WaJTZz4
	pZZCA0L55xDcjCJnZ9fdFjaAvVK6Ix9h/I2f3uJmm/GRjB1G3leB9Ae0C2OZ1Ss15g==
X-Gm-Gg: AZFdTZfRiqsKCdXkOM1JvROSCK6+3uTVejDGR1Wc4RuXIR4UuiDltGl33IdVdM/4QEs
	Iy6XgZk3gyjV17J74wCMIjh5u0nx9x3pfdH9Gdtp/fBX6wbHY+s9LH66U9rOIcPlUwoY6qCAui3
	s3Sds0yCH9HPLcUawcL67QEjJs9owXVW2KgAwAnAx7TkWYTqE74a18DEw4codvOpTjDWNBv+Ujc
	J3ISPREyk5qFm2p1RrrwfpaAqEG0HcQyk/zMGpPtXOWEvb0vArmuh3YeW5Qpb2K8QczQpFY3G50
	nlW1ZFJDKb6tnE8k7hNtBg11Cj78VD+8hNopUros9K7q3O4BZvhZ+z+2txDhPBKtQiBYTrpgzQA
	QekoRF31RuZaYmmOvewK//XJd1rIIV8PXJQRkXNVkiIafx3qObqMrAl8kdA/HMi6B+U+1et1hCi
	q2bCy7QMjuQoPvmpIS5v7Kmvm2oDXvZ+MDwK/lCVZ02JRC7eCoccH5wqZKW4QoS5Rw0Mr+ASLla
	0OinpZF1wEgE47MUi3PIoFaGbSVqxosvmm3IvJoojpWkjwX5C1hBXb3Va9F37uswnezZVbwSDEC
	HpCtxsTss+gRHRHONH89dpasA8uXVg==
X-Received: by 2002:a05:622a:a19:b0:55d:33e0:abff with SMTP id d75a77b69052e-55d76933293mr358229581cf.6.1795617772385;
        Wed, 25 Nov 2026 06:42:52 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::9a34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78e4fc12sm154986831cf.0.2026.11.25.06.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:42:51 -0800 (PST)
Date: Wed, 25 Nov 2026 09:42:49 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Kettler Christian <christian.kettler@stiftung-kifa.ch>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Logitech BRIO (046d:085e) stops answering control requests when
 hot-plugged together with a USB-C hub; usbhid probe blocks hub_wq for 60 s
Message-ID: <6118ad01-65a0-4357-8118-3122479b554d@rowland.harvard.edu>
References: <3cd5f994a6260960cf7751d6383f2b9afc1baeb5.camel@stiftung-kifa.ch>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cd5f994a6260960cf7751d6383f2b9afc1baeb5.camel@stiftung-kifa.ch>

On Tue, Nov 24, 2026 at 07:56:35PM +0000, Kettler Christian wrote:
> Subject: Logitech BRIO (046d:085e) stops answering control requests
> when hot-plugged together with a USB-C hub; usbhid probe blocks hub_wq
> for 60 s

> 1. Is there a known issue with the BRIO stopping to answer control
>    transfers shortly after enumeration (with the usbhid probe being
> only
>    the first request that waits)? Would a quirk (e.g.
>    USB_QUIRK_DELAY_CTRL_MSG for 046d:085e, or an snd-usb-audio
>    control-message delay) be worth testing? Ignoring the HID interface
>    alone does not help.

No similar issues are known to me.

Go ahead and test any quirks you think might be relevant.  As for 
whether that will be worthwhile -- who knows?

> 2. Can the kernel recover from a device that stops answering control
>    requests during probe without blocking hub_wq for every interface in
>    turn?

No.  The reason is because the device might stop answering requests on 
one interface only, but go on answering them on other interfaces.  One 
non-working interface shouldn't prevent other interfaces from being 
probed, if they might be working.

Alan Stern
