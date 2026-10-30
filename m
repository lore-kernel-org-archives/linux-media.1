Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.238.20.250
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365750;
	b=NeO/s5TtuJjNwTnBFdQ82Gl2mQuAQOjnA+13mrOHWU7rtUSg4rsCN9QSLrlwpqlOtMyX
	 FflqYEZgXLWq1ufJ1xZJBacnGvFsjk2vrofsz8mZuu0IKxZRuBaWzxYuAPcMFjhQsAV/q
	 hon740UgUqMeniIjhlr1xFisbR0jh/dCPWnYjjy2DWkieAWSeiC7qwKqfySjB7XRHtuqr
	 Ni6ujRKqGxPYSVJClfo9sW4q9AUXUTomxy8xThf2V9+Q/mOmHXoIV6ayZEX2zrpbFZVZR
	 da9j71B73EnRVoUBbLzlZWRL4WSxV3UfGhva6f9G+vL5zfO9HLyz/h37A62Qf8Skjwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365750;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop:X-ThreatScanner-Verdict:X-IPAS-Result:IronPort-PHdr:
	 IronPort-Data:IronPort-HdrOrdr:X-Talos-CUID:X-Talos-MUID:
	 X-IronPort-Anti-Spam-Filtered:X-ProximusIPWarmup:Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding;
	bh=zjiGYoPCGLE3/aIcu0fTxJjUJnW8eL/4/YsB+JQSqMo=;
	b=uQbduUqf8lSMu8rnWuboa7NMASTcFcRTNdP7oEkwdpQLQLMJLHOTyb3Be9QoCTcBX7iZ
	 qE5u8VVO7WV00UK5LJthiJ2wrtxEDefEWk14YUI27XEUeGm+VK+95JghIhyyfziWUqASA
	 oLoSweL72WUKQPowRTPkc9KaHdMU/vtiP3ZDltgRnODYfVr/2ETOVZTuVtYidIWxDL0r+
	 fvOftgCUB9ZGTfwCJpKxMFBIHpoyioLvLCv+gxDwYWgKzt7hGjgnQNKdT72xzflVghMuD
	 +sAjvMKwgBndAHfHuJIdNbYz91lY3R2+98H0YtAWHLFJAZRxImuz5/HSGRyg4g9Vq2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=skynet.be;
	spf=pass smtp.mailfrom=skynet.be;
	dkim=pass header.d=skynet.be header.i=@skynet.be header.a=rsa-sha256 header.s=rmail2 header.b=fgkgMYoN;
	arc=none smtp.remote-ip=195.238.20.250
Received: from mailbnc116.isp.belgacom.be (mailbnc116.isp.belgacom.be [195.238.20.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3338606A332
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 13:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3338606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=skynet.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skynet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=skynet.be header.i=@skynet.be header.a=rsa-sha256 header.s=rmail2 header.b=fgkgMYoN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=skynet.be; i=@skynet.be; q=dns/txt; s=rmail2;
  t=1793365747; x=1824901747;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zjiGYoPCGLE3/aIcu0fTxJjUJnW8eL/4/YsB+JQSqMo=;
  b=fgkgMYoNmaMnXX6H8uKzxt37qLLBZgV+1OBUXGHSqnwWv1mM1Ii/rR4/
   O0Zmtb0SctpiaxmuINMdBCOJ449/kU4y9b6+HlULcKUmVPOGFhtsECDan
   Zx6jTK3zH2eIRQMWUhOEwpr2Za5d+G53KE3ej5ByHmuUqS3e8y6rPtSQa
   j2CzCBZMg3IwVnDSOpidMThlBS7ML395xwCoMy3+NKO7Gz6jjgIdI6WwO
   DRcUYvjeStJwuusNDQ1acgpkZcf4NZwMuofeHv830fCEQ4b/oznmBTVAR
   G10OjmTXUXskt6i2I/t98orQ8AHgnMWfytHoIERLea+QIXJPvQpP6K2LG
   Q==;
X-CSE-ConnectionGUID: hfXsaHRTSLOswtd4Nmxm0w==
X-CSE-MsgGUID: DKnJtsMOS4+7D7D7qo6kRg==
X-ExtLoop: 1
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2HBBAAlluRq/8nPEblagRKBR4IYgTSBbAOVAgMGgSEdh?=
 =?us-ascii?q?DGHR5BTgWmBag8BAQEBAQEBAQEJPRQEAQEDBIR+jiAnNwYOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBAQUBAQEBAQEGBAEBAQKBHYYJRg2ME4EsgSYBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEdAg2BNgE1EXFNEhSCFlmCdBS3TIE0gQHeSYFuBoFNgRaHSQGFeTuFB?=
 =?us-ascii?q?H2BEIR+hA0BARIBboV4BIIigQyWd4FKHANZLAFVExcLBwWBNTMDIAojDBQZA?=
 =?us-ascii?q?hQdEg8EFjIdcAwnEiwXL1gbBgWBHXMrgRmBB12BKylgASGBCA5AgSgCBoJLg?=
 =?us-ascii?q?gACAUlBDgdFUwklQxJHJCIIEgkBExouC4EaNTwJJkEVDGQLGgViCAINDHY5E?=
 =?us-ascii?q?DEgJjIEAx4jbT03Bg8ZBJMlg0CBCCJvHzUuNyuTL512lReEKYwjlVQzhASNF?=
 =?us-ascii?q?IZKkw6ZCCOLBIF4a5s5gX6BEHBNIBgaglQBM1MZD1cBll/JKHgQLgEHAgcPA?=
 =?us-ascii?q?oFzkDSBTAEB?=
IronPort-PHdr: A9a23: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
IronPort-Data: A9a23:Ng3BBqh9hA6vZsYdtbqz51heX161MhAKZh0ujC45NGQN5FlHY01je
 htvWz3QPfnYZmPzL9siaovk9k1Uup/WxoVnTVE/qC49Q3kW8JqUDtmwEBz9bniYRiHhoOOLz
 O1HNIafc5ptEBcwgj/0auCJQaxUj/zQLlbEILeafH03HUk7GH9JZStLw4YRmpRvjcWyHzSDs
 Nbzp9y3EFK+0laYCEpNg064gE0p5quaVA8w5ARkO6kT5weGzhH5MbpGTU2PByqgKmVrNrPiL
 wrz5OnR1n/U+R4rFuSknt7TGmUWQqTfNBS5kXFfXa6vmHBq/kTeBY5iaZLwwW8O49m4t4gZJ
 Odl7PRcei9wVkH4o9nxZjEDe81IFfQYp+CYeyHh2SCk5xaun3PEm52CBaytVGES0r4f7Wpmr
 ZT0JN2RB/wqai3fLL+TE4FRasofwMbDPI0voXhA9w3iKdE9XozPH4PP9doAw2Jl7ixONa62i
 8sxYD5lYQ7cJRlGPD/7CrpnzLru3ya5KWUH7gjN/MLb4ECKpOB1+LzsOsT9Yd+bQ8hJ2EyVz
 o7D1z2mXE1GbI3Pk1Jp9FqApentgTjef7lOV+KUqdI1mVrNxVYcXUh+uVyT5KPRZlSFc8JYM
 UNR9icwoKwa8E2wUsK7T1u/unHslg4bQdUVGus87xyLwaf85weCGnNCQCRMZdArr8wqQiRs0
 UWG9/vsCCdm9bGYV1qZ96yItnW8IyUYIWIZZjMDVU0C+daLiI0pj1fDQ8huFIaxj8bpAnf+2
 T2HoCUlhKkUlYgMzarT1U/OkjaloJSMQgMr6wH/WmO+8hg/apSoaoCl8lvH6u4GK5yWJnGFv
 X4Zi42b4ewPBLmTmyGXBuYABrek47CCKjK0qVBoBJUs8hyp+mW/ZsZe5ypyKUIvNdwLERfme
 kbLuQJa/9pfMWWwaqhyJoe4Dc0lwLLIG9P+Wv3RKN1UbfBMmBSv9S9yfwvJjz2oyRdpy/lgf
 M3DKICgHHATDKVsij+wSvtY1rkvxyYzg2/eLXzm8ymaPXOlTCb9Yd843JGmNYjVMIvsTM7pH
 xqz+idEJ9izkAEzX8UPzbMuEA==
IronPort-HdrOrdr: A9a23:l6pvA6lzAwd1VPnkJXl/6t/rCKLpDfLy3DAbv31ZSRFFG/Fw9v
 re+cjzsCWftN9/Yh0dcK+7SdO9qB/nmqKdmLNhWotKBTOW3FdAT7sSj7cKoQeBJ8SkzJ8j6U
 4IScEXY7DN5D5B4/oSizPIcOrIruPnzEiS6N2us0uEd2xRGtldB4ISMHfjLqVdLzM2fqbQV/
 enl7d6TpGbCBIqUvg=
X-Talos-CUID: 9a23:OuocOmHRiygWbWHbqmJn+n4PE+AfTkb562zPP0PkL2N5TeWKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AVp2FrA0upaiWWlLr3oXiaRaDHzUjz4eoKlwWtLI?=
 =?us-ascii?q?954rbGXNcZC6a0jeNTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-ProximusIPWarmup: true
Received: from aftr-185-17-207-201.dynamic.mnet-online.de (HELO albert.lan) ([185.17.207.201])
  by relay.proximus.be with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Oct 2026 14:08:58 +0100
Received: from libv by albert.lan with local (Exim 4.96)
	(envelope-from <libv@skynet.be>)
	id 1xMmLk-001h0x-1F;
	Fri, 30 Oct 2026 14:08:52 +0100
Date: Fri, 30 Oct 2026 14:08:52 +0100
From: Luc Verhaegen <libv@skynet.be>
To: xorg-devel@lists.x.org, xorg-announce@lists.freedesktop.org,
	mesa-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	wayland-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	fosdem@lists.fosdem.org
Cc: graphics-devroom-manager@fosdem.org
Subject: FOSDEM27: Graphics DevRoom CfP.
Message-ID: <auSW5B2PoKq0ml7o@skynet.be>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

We are happy to announce that we will have our customary Graphics 
DevRoom at FOSDEM on Sunday the 31st of January 2027.

The talk topics of the graphics devroom encompass:
* graphics drivers: display, 2d engines, 3d engines, at bootloader, 
kernel and userspace levels.
* media/video drivers: camera/capture engines, hardware media encoders 
and decoders on all levels.
* input drivers for bootloaders, kernels and userspace on all levels.
* windowing systems (X, wayland, surfaceflinger, others) and window 
managers.
* graphics toolkits (QT, GTK, others).
* 3D and Compute APIs (OpenGL, Vulkan, DirectX, others), and 3d and game 
engines.
* Virtual reality hardware and toolkits.
* Artificial Intelligence HW acceleration.
* Media encode and decode applications.
And the tools needed to help configure and run the above.

Submission deadline is the 5th of december, but do not count on this 
date, once the schedule has filled with enough solid talks, we will 
accept no more.

You can submit your talk proposal here: https://fosdem.org/submit

Please put some time and effort in the title and the abstract of your 
talk, and in your personal bio. If you want an audience, then this 
information is what draws people in to watch your talk.

Since this an open source community event, please refrain from turning 
in a talk that is purely corporate or a product commercial. Also, this 
is a highly technical devroom on a conference aimed at developers and 
advanced users, so please only submit talks on a subject you actually 
worked on. These are the main reasons for talks not getting accepted; we 
want the actual developer who can go deep into the weeds with the 
audience.

If you are unsure on whether you can come or not, or perhaps you are 
unsure about corporate sponsorship of your travels (this is FOSDEM, why 
are you not there anyway?), wait with submitting your talk until you are 
certain that you can be present.

All talks will be recorded and made available as CC-By-Sa or CC-By. The 
FOSDEM CoC will have to be agreed as well 
(https://fosdem.org/2027/practical/conduct/)

If there are any issues, just email graphics-devroom-manager@fosdem.org, 
where you can reach the team of graphics devroom managers, Chema 
Casanova, Andrés Gómez, Ricardo Garcia, and myself, who will also 
schedule and review your talk submissions.

We will be keeping a keen eye on submissions and scheduling, and we hope 
to see you all at FOSDEM27!

Thanks!

Luc Verhaegen.
