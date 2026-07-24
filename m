Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818743C3F4A
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 16:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911199; cv=none; b=LMkENqB6sPFpDCFFIGLM6OzUI1Gkr9A5aAqc5ZnPAegfajMLqDmd8MpCtKG7GcAZS5N/ctdvjiF4idoCMMxGI22duaYppHeARSDRQpP/IsiQWot4a0kkPmGaGf45zknmUITIYkaaqthOcTVrXGVrhe9SoGrS0HYtCJh7qmDe1Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911199; c=relaxed/simple;
	bh=rxpQc12lsUWEKrXL6hgR5Ul4ob5uHCzCMUR1TSqQtxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4R57yU+NoGIojtNnHS5Us7lrl8wxDelgWJE17Y038GimW+4M/gPXqwItFFQjVBsU8MpJU4EEFdASHJQnNsHaQiePJh0JnGW+2iIZAVTKHSVUasuXO7QN9ngwoluQjijYk8fckRKnY38sO0p1HF192SpLFwQ/f2jjDK9vgIwz7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erjUYXfu; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erjUYXfu"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so596987b3a.3
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 09:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784911198; x=1785515998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hhTRsMUDFAKZh60GY3lXmo5DTZVRrbo+NNX8ufmzfOc=;
        b=erjUYXfuLYe4+SuorcxzU+FMwuXss9uxmfHrCUQYWGk3zfybKZBSf/WlWldJk7FNBC
         tAshTeDxYSpMkZQ9oMCYrGYBYugRAZXXPjsq4MznEeiw6KuJl48JCUJza13yBdFV2Gcg
         eK/Fch37D9EfjOo27NBD2rOiMCPvK7PfjDZVOGMTj2Gqr3EN1/bqx4+iO1p3tK63FR9e
         xY2j42LNR8nmq2o/Ep769+R1StMlAES3JE0cEpIkmT4a/jCnRACQZes6nGcItlcZwowA
         lTmeRyt4PKxrIxUlIpBvdf+kXc2uQLlODIuLqhydzlYxWVG8RcDroarCPvAYuoq+sGhX
         hO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911198; x=1785515998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhTRsMUDFAKZh60GY3lXmo5DTZVRrbo+NNX8ufmzfOc=;
        b=mBf9vSGbKAXM6lVCeTua/Xl9Z7QJebafmug1MEETp8tZV1koCE0RH87S6RmVZS8xqs
         KdfavVCuvCj1gGv3lIQ/wCnMeo81PQ33xAZCjdC4smEpHFUH7uxwOyTN5YjGEVvmG1W6
         ZV2QYflqysgnK7SUWg/UB6lWaQtfXoo2Zy1kPFnHHtzto/gBVex65vptjWA9C1J9uZ7p
         ThDKRzf9y3RxmNdpVqQTauZoqZ7GXWa6nlYsrL0hU2b+c2UnL4AWq0JGt3s5mRBYIVqO
         MaCB58nV/pw6/QUT++aYkr2sbksiEH796xEKV89AiksjqSqlgZy8pX+hT6/yY+1Aweug
         0Ppw==
X-Forwarded-Encrypted: i=1; AHgh+RoHU0OaK9/4vVAsATQBuuyvQXzfxUTNn+kJfnapSG5Y1txMISS8SnLklOYzF/pm4f80WLxgpyMgUd3DAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsLqv5pGy3OvwWXd+XUt56QOvkYOhWFoW+u8tclBm+c5N/cFUT
	YuPYzUwxBxbt+ktQ3uRxGWE983nbX431CE02ESW1iw4804j2ui5akXoy
X-Gm-Gg: AR+sD131rZIDNb4cOswhugL0Tt+cLcyDVPFzFh3e8RMHDmfHfmCAf6IghauwetNBTYF
	4l/79N1NSJBUTrnA6q8Ovus8WDPGAd6N0zoGy5etDsawrG7rFIRjhT3r4mW93oF6r50p2AUIMZd
	pJmdp0j4eZbngDp7h3Fwsn0cypNhWzU412xKku5FlfwWZHQ2Rd/LyVxKSUBFktTA7QZDahLxDc9
	Tt7CWT98P8pZerK/S9oVq8herLQ/6o4XdkuG4gdShVmbXFgsHHWBLH0bKWux/G2+nhtWddoXrIM
	4SicFcT0ErSX+Tzk5aKJDjX8FkXuVXytIy0JwoD7boBmIbUHUsrYcLLgz7m9BYnCloPKYDhXE+3
	CfwqXRswLyvFmWjTQp372WqUuA7n2j7fJTAMP/os0mov3VX7vnGlH6U+X0LmJf4fc3Ebt6utA3U
	/TwiIy1bSDSMRQdol6XMiX/KM=
X-Received: by 2002:a05:6a00:430c:b0:848:47db:a0ac with SMTP id d2e1a72fcca58-84e2b8aa987mr8703690b3a.27.1784911197498;
        Fri, 24 Jul 2026 09:39:57 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:70::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341d8f0sm163841b3a.44.2026.07.24.09.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:39:56 -0700 (PDT)
Date: Fri, 24 Jul 2026 09:39:54 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Joe Damato <joe@dama.to>, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v5 1/3] net: devmem: allow rx-buf-size >
 PAGE_SIZE per dmabuf binding
Message-ID: <amOVWgJ3BAJ8I/4+@devvm29614.prn0.facebook.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
 <20260708-tcpdm-large-niovs-v5-1-34bf6fac941b@meta.com>
 <20260721110713.325d36ba@kernel.org>
 <amKqlqgfZipKjrii@devvm29614.prn0.facebook.com>
 <20260724072419.62778bbe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724072419.62778bbe@kernel.org>

On Fri, Jul 24, 2026 at 07:24:19AM -0700, Jakub Kicinski wrote:
> On Thu, 23 Jul 2026 16:58:14 -0700 Bobby Eshleman wrote:
> > > > +	if (info->attrs[NETDEV_A_DMABUF_RX_BUF_SIZE]) {
> > > > +		u32 rx_buf_size = nla_get_u32(info->attrs[NETDEV_A_DMABUF_RX_BUF_SIZE]);
> > > > +
> > > > +		if (!rx_buf_size || !is_power_of_2(rx_buf_size) ||
> > > > +		    rx_buf_size < PAGE_SIZE) {  
> > > 
> > > we should add a check: min: page-size in the Netlink policy?  
> > 
> > I played around with this adding:
> > 
> > Documentation/netlink/specs/netdev.yaml:
> >  definitions:
> >  +  -
> >  +    type: const
> >  +    name: page-size
> >  +    value: 4096  # dummy value, to pass ynl_gen_c.py checks
> >  +    header: asm/page.h
> >  +    scope: kernel
> > 
> > Generating:
> > 
> > +static const struct netlink_range_validation
> > netdev_a_dmabuf_rx_page_size_range = {
> > +       .min    = PAGE_SIZE,
> > +       .max    = U32_MAX,
> > +};
> > +
> > 
> > ... but the dummy 4096 is kind of annoying. ynl_gen_c.py can't know the
> > value of PAGE_SIZE but needs some value for its arithmetic checks (e.g.,
> > confirm min < max is true).
> > 
> > Should we stick with using a dummy value, or should we add a patch
> > teaching ynl_gen_c.py to allow value-less consts (skip the arithmetic
> > checks)? 
> 
> Let's stick to a dummy one for now, but maybe something obviously dummy
> like 0 ?

0 sounds good to me.

> 
> BTW did you add both min and max checks? Cause the only risk with using
> a dummy value would be that the policy will be rendered inline, and
> inline policy is u16 so 64k wouldn't fit. But your sample above has a
> max of u32_max which forces the out-of-line policy, which is what we
> want.

Yep, u32_max:

+	 name: rx-page-size
...
+        checks:
+          min: page-size
+          max: u32-max

Sorry, probably should have just sent the whole patch instead of
replying hunk-by-hunk.

BTW, how expressive do we want these policies? For example, would
absorbing the power_of_2 check into a policy be valid in the future? or
is that too bespoke?

Best,
Bobby
