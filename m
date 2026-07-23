Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C100369D56
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 23:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784851101; cv=none; b=DtQMKNUbmdo4UlJeSuBaDUgZQ79uEWe/6uWVZKG1BNJk6jOhkQ4uKEFqLDAueq+tc7oWtwhldEHTtFGQgAjf3z0jvT8ebRGmnoqGrgFgXYT/ZDegYaSFQuEzWM5YcDCnccQFS0wx5aahVIKOFpBk9rvAz9GMa3qnwAG8OZFjwDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784851101; c=relaxed/simple;
	bh=K0m0Bw+juA87MvkMrxX6h4japgSDmVkJYZY6q2X099U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DObQpFotonuCAndQq1JZQDTYOAW14MqWwUrOET2rqDLaLvfRlrtjOclNKK9TaD1STsBWew7n/kitZxp/fu/M0NTQEdVT/yLnAItrq7UagzaaNssvYiZJrrj4V4Eo2dvzsK0WyPp5vQhGsUsrZ1DY1/wzcjv5r4V3l2yRbEs2syM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIxI5L7s; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIxI5L7s"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ceae1ed204so12632145ad.0
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 16:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784851098; x=1785455898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o9MA5hxyHF+TVODI4Fw4gloLACgAEZ6Zp8N9Sn3aTq8=;
        b=UIxI5L7sngoQnsTOl0k8ykJp+v4Q0IEGGCUJPD2hEH46hIp7oJU3w67FBqYvgs7Bit
         cLrV8+J21fMubKmBoaEJjgjZgUvoHewJSetvAYTk968OXtf/QpHOaUt+eFV5TSGxoUre
         /419Xfq6Kd2X+7OpLBqO/NDdsFRUd/SfXiwQe9+9P8ClFJ+KWsWX5g0sfdS/287/IDFs
         s40RUaKG6Bfz4jWnnJXuxfHyM0p2rHZYW8Ypgjl6TNYYKrbB+7ug6WaQjPWpFuEVcGeB
         4BdRbnldbR80AcNwiYIzouDoUmlyK7O7fNrQYMhzmuPQjy+6vkUbAIetIAJOjSWIh11f
         Z/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784851098; x=1785455898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9MA5hxyHF+TVODI4Fw4gloLACgAEZ6Zp8N9Sn3aTq8=;
        b=f9PLte/nfPy7eTJLKuGeQmgP9yJXXO9aRM2ovu34enq8Jq1R6pb6K1EVUeX269oijF
         HIKBgaRfqEm8gkwr07XuDJ3v5FH5JRoR8V2TLSKwpV3TAUjgO2kaktpv1cSV3u4QoCnG
         FMIlhNcBoFMhFVxYrqQVCrN+aL+jHx2UssF5/2X1ooPV5n3OfrvhlpEpkEMN2M/bQT9v
         nqAwQE3ODhqniuzdg9HnLuBrfzQvF2WGSjebWk1fPBI9IZ9dI2vsditvquKsNWrEhgmt
         Wh5f0iwNkz6/q6b2e5eM8sR88ONMK62zroCoS0QExypDG3VcvljgSp6B/VWZd3Tg8yBI
         EB+w==
X-Forwarded-Encrypted: i=1; AHgh+RqakmgKKA/FaN9K7U7zTRf+SXCrzShlenR4S6T7aawwMB7SQfSIYmYTROWannrHfFVjgDARhnMZ2OWKiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxHXzLdPKik9vDIf6K0Lingx+YriaEA7g4uyFzLgXT1+IPnuCK
	g+5JrjI99dN2bJxt1RiBxTQvT1felLnjMNdzBo9e6gmwx2JYuNhS6YIH
X-Gm-Gg: AR+sD10LwnxrQfz6XnTu8QslEdFqJBxHQO31UZ0DeHWd35yoPWnrEE6Yp0AfcMuIIjj
	vLQrMzXo6FSKkkFUXhlN+JRbxeWQQbuo66EjVYYf+PHck5PdE5hlpD/LD+7hc5+eyoC5XQ0GZ/H
	IffwdYVc/Xkp4ui3g2HXNaLpcYLY5RNk5SH/MG4ADvZYP0yJ7dJrxio0OaBqCNf4qtJleoCmI1L
	sVbz03X65Sadtwu8bQIaCQIJHRQOU6fKJe3/6fO7pv14FGfQeO9GKAvwn/Up2nxPD/zOnWPhONR
	DkTSg7DDxzQGkS6UhO6dRZHN5GEfEyG8VgYrESx3hlU6ygMrrcbFXgtkSYEAQu6+q/0l/lgjqDq
	NhqLlSqNmBshwVl041nJBsj8NhegEBUAbgF2LE6PV1RHVWxCY3VzS59J9MhW2E3t51T0w2Q90wI
	Mb1KxzZAoagZ6hn/z7kKQz7g==
X-Received: by 2002:a17:903:1b07:b0:2ca:b8fd:f31 with SMTP id d9443c01a7336-2cfa6b77a8fmr64729945ad.15.1784851097746;
        Thu, 23 Jul 2026 16:58:17 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:9::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3131b0sm41548075ad.62.2026.07.23.16.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 16:58:17 -0700 (PDT)
Date: Thu, 23 Jul 2026 16:58:14 -0700
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
Message-ID: <amKqlqgfZipKjrii@devvm29614.prn0.facebook.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
 <20260708-tcpdm-large-niovs-v5-1-34bf6fac941b@meta.com>
 <20260721110713.325d36ba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721110713.325d36ba@kernel.org>

On Tue, Jul 21, 2026 at 11:07:13AM -0700, Jakub Kicinski wrote:
> On Wed, 08 Jul 2026 15:55:04 -0700 Bobby Eshleman wrote:
> > diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
> > index 5f143da7458c..70b902008bd3 100644
> > --- a/Documentation/netlink/specs/netdev.yaml
> > +++ b/Documentation/netlink/specs/netdev.yaml
> > @@ -598,6 +598,13 @@ attribute-sets:
> >          type: u32
> >          checks:
> >            min: 1
> > +      -
> > +        name: rx-buf-size
> 
> rx-page-size, we're modeling device pages.
> rx-buf-len exists in ethtool and is something else.
> 
> > +	if (info->attrs[NETDEV_A_DMABUF_RX_BUF_SIZE]) {
> > +		u32 rx_buf_size = nla_get_u32(info->attrs[NETDEV_A_DMABUF_RX_BUF_SIZE]);
> > +
> > +		if (!rx_buf_size || !is_power_of_2(rx_buf_size) ||
> > +		    rx_buf_size < PAGE_SIZE) {
> 
> we should add a check: min: page-size in the Netlink policy?

I played around with this adding:

Documentation/netlink/specs/netdev.yaml:
 definitions:
 +  -
 +    type: const
 +    name: page-size
 +    value: 4096  # dummy value, to pass ynl_gen_c.py checks
 +    header: asm/page.h
 +    scope: kernel

Generating:

+static const struct netlink_range_validation
netdev_a_dmabuf_rx_page_size_range = {
+       .min    = PAGE_SIZE,
+       .max    = U32_MAX,
+};
+

... but the dummy 4096 is kind of annoying. ynl_gen_c.py can't know the
value of PAGE_SIZE but needs some value for its arithmetic checks (e.g.,
confirm min < max is true).

Should we stick with using a dummy value, or should we add a patch
teaching ynl_gen_c.py to allow value-less consts (skip the arithmetic
checks)? 

Best,
Bobby

> 
> > +			NL_SET_ERR_MSG_FMT(info->extack,
> > +					   "rx_buf_size %u must be a power of 2 >= page size (%lu)",
> > +					   rx_buf_size, PAGE_SIZE);
> 
> This must point at _ATTR, the _FMT is unnecessary.
> -- 
> pw-bot: cr
