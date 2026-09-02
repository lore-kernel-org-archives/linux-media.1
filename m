Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC542D876A
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 19:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376730; cv=pass; b=C9SLQGfQkKlDz4kQ2NbjpRP9I7Wzmnq5B77lmidD0EvznIoJlok/kA2oO1ocO3ymrqc2CgWqrYvyVxa+gDjS8sQAxJ4EiNPmfdfjzVSeOFDgi7zDxrI+tHCyI+7Y1B0WnzcMYq8V9n8zhgjCLus2zAFMKOdLZC1suae49CfVz30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376730; c=relaxed/simple;
	bh=kCaBwdcEGm835rfY4dPFCtTOHwYQBCTOaK1IqGDnpAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VREa9CkfxcfK9rLkq6UY/q5gXIrJOzMjvgkY/FeOdq2DqSGxMNh9T7tx168dlXBpwKgw988u0p/bhN0VSwcA5qtyaPKOc2g5jgfdG/zPV2I6hBsNDOauTpptZ3jwJnFeccrrlwm7qbfheCSsFHzaU3dc1plo2MSXGMjCZgqgp8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=HOZZ04lX; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="HOZZ04lX"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hZsvr4F6jz49PyP;
	Wed, 02 Sep 2026 22:18:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1788376713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YbgAFzeQfjcDItvF4JQrNV6iDljh0tT2uG7H1MJWbLE=;
	b=HOZZ04lXqi6hqikB/7Pn2c2/UZMi4kbuZEvi+vGvGA+PtLjHIors7+lkboZqSqcCzGblRh
	NuNcYRxjvZ/AZu6I3Bu9no3FcDpSjcp3LeEpjKos3guNju+wD19v32C1Ve5DQh4qlAd3vg
	yutpk9D3VRTGScVFLnlp/De7FDM6nQ/KwWXHzvoC7oPePRNZ910hHiAEk0R/ovDEuvhO+s
	KIA5C/cTfZ2ebySbqQ/eYTOpKCvSWpFHGq7p++2735idbgZzaSPMQpLOBjRWsNzL34lUwq
	5Uwy1XeUwkCszq7BGdSyT1EQ94t4jjtw87bMkbmOIv7c2mU2KzNxE/b53rXyBg==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1788376713;
	b=YXXpKIb0v9rS9nhNzWYoMrXO9wBy40i30Tvo7aUUipgWqpHmIeTpZ3sCLuW35W8NDo8XNs
	QtakdUfE6nf0HdC8gGMXSLcQgxrrxdeAZX9Kl5+TkL81YleSdPvpBodWZYfspvyexIvwf2
	DhKO3qXpbfLm8w7uP1C/KDECWFliXD+UWzmulTdBZS39d6cDchLMEtTuj/sEGDmTGrGDdl
	oKh4/W2RGBJJZg8USqzu6ogBewc+lyJy64+IatAw99WDTUau5PX+RngrPtVP8dCo6KJLlH
	HcSOywJjQqFPqSEVNqk6lbcyVyI0Wt0a2lwzycoFM7MGGxWUlLnEY4YI1wyuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1788376713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YbgAFzeQfjcDItvF4JQrNV6iDljh0tT2uG7H1MJWbLE=;
	b=r4EkDP2/KWxyqgpMcHoDqI1cQL2rYjOv6nEx5tuvHtrjYmW+nRIT2pktXF7ssl7uhcJ3S3
	2VtF4pKpWeWboDYDrfcRKQ58vc0IkPpv9vyYiDiZOQOJFsYAtASZjtB4GEqV2mlagrVU3w
	BHpNt9IrvJOIZZ1ZplcbFP5xiFodudpimWeNlVA0P+NrLg5a07U5QXR/euVcFgE/FBOvLC
	mi5wTogyD0oePXyy1rnWFmeLnQjDHt7AwxL0BQq/Gx8FouqwoUA6UpG/3RoQ3gWWYzVKLc
	kTJCu783S8xU2WB+Wph41+11HrPYHuue/PMB+ld+fhP2byr5bcSWzy0LaPNaMg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D8AEA634C58;
	Wed, 02 Sep 2026 22:18:30 +0300 (EEST)
Date: Wed, 2 Sep 2026 22:18:30 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [RFC PATCH] media: ti: cal: Deprecate non-MC API usage
Message-ID: <aph2hn5sg3eGR4CA@valkosipuli.retiisi.eu>
References: <20260723111903.742283-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723111903.742283-1-laurent.pinchart@ideasonboard.com>

On Thu, Jul 23, 2026 at 02:19:03PM +0300, Laurent Pinchart wrote:
> The MC API was introduced in the CAL driver more than five years ago in
> commit 38e89e790fe2 ("media: ti-vpe: cal: Implement media controller
> centric API") as a disabled by default option. Five years later, it's
> time to give users another nudge to move to the MC API. Deprecate non-MC
> API usage by printing a warning at probe time, and defaulting to the MC
> API. The legacy API can still be selected through the mc_api module
> parameter.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
