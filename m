Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635242;
	b=ZI1ftw5Xo2Nvatbg04YQFLkU+JO+QtKMvo+zDF08ggX8eyz1exDTWXPcyNkDeqhp8UEd
	 rbyPIZG2PHks7UNn0Gabc7xn0CNoYvC0KY+LAZGIt+kwBUxJSPyg/IcKcIm/np+WLAIzW
	 ehqwNIOu/zksgTGV32GQG25VcMEdnn/TWk8UCWdavD2xB/GY59DpCl1HQu2wQ0Pieicdy
	 0sq7SXk0Fe3ooCxcmfI89Rzn16QNOAGbUJu1HeYd6IR9QH3VrVq7dfIee+fuJWhO+lg7+
	 KnwKKdj/52a9cj7OqBOSyVldPoWl9fbc3fY0SAzaXZPZs+YSWbE4ul39TahYkSgjNWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NLxTkHVtfjBNbHINC3JQs2UX+5Tk80uWbQNIu6qGoTo=;
	b=0xJj7nbTPyAb5CesAfTo5yQAyG5DW7uJKp86l6wXnaLRK4Kad0/UfrJI4GoCXFWQ+zYj
	 Dq33oisA41Y4XjGK+vkpxJOptTD9Wk7yxAwQTdHD73VIG/XqrmVdvqtOJg6VvCLPZuGw4
	 nHepjg4V5kn0gtlLFpi1KLgjdBBKKSCUhdOkPlM/AbliH/d2CCbWA+20OYNBbiYGh1Ujh
	 so88cSOaSASpx4vppbFSJxary9mTM3bcdYIwcLfJuWoYXW2LgTs3oQMREFCrmhIU+K/2U
	 bkcCPwI/lc+0nsH8x48YBP4r3XPvjfSBabnHl0j9+LPP3jrmT93LCL3Yra+gi8hx++w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s29XqjRc;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AD9606A323
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89AD9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s29XqjRc
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8479f46ecd8so2464330a34.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635241; x=1796240041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NLxTkHVtfjBNbHINC3JQs2UX+5Tk80uWbQNIu6qGoTo=;
        b=s29XqjRc334YI5AgicyICZ/Y28HjbYuuCrk/L2v2saoZblJQuSIKXCh9TBMgxZNYFh
         8I0FX1nYXeMKyMhtOzSryqeoyvPsL76ThZI5wqyiodpNmXg/Gwa6FAxrUHIgRGnjrwoE
         PZfP+J/MrmnzE+JdvVrcUupvsWAx0hzv4q22+z39Lrh1SqhttyG2oOZYQXoKRYabQGaU
         gJo1RQXiuzgwaVnmT2nFUlSXVl6TGNo4iPTX584ZN8J+tWwNCkM0rHng3mOIHMjDEMJe
         acRF4O3uPF0+NR3I5GpuYR1XWBHh5FmF55NTjAsCwlAn32iH1/IXjUp+rd5Cfqj9s23k
         G7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635241; x=1796240041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLxTkHVtfjBNbHINC3JQs2UX+5Tk80uWbQNIu6qGoTo=;
        b=gzS3hkHrvQT5qq/jhvC8/3cjv8DASOy0BvzfMW2I/gNja6akKAXZC5JwfFsjkYk8Cl
         ogAYe5Zk0xJI1E0r1rHAmsC34NCF3DDDHjXp2LzdpVIRrGeAqTkW7LbXJ7hIyXevGHd9
         Muo/qvAv3H2qbV3FJuDgz33vx3bUR4Pd13kLpLyLljjmxbVHV3J0XC+xrLFR9mAPm6Ej
         G+Mzf94v/CmRTg4HnM5UBLmocP4tnVlhcMxr0UHcNHYA2Hu8BsWlgy0KpZqxCsicN+11
         OpqZDs47lJwJtkFfim05/mdzuJdOrRtALCnvV3mHnhq6x+WXvJqHk0ly42OXnP4sQUXF
         SE1Q==
X-Forwarded-Encrypted: i=1; AL+hErG5bAtn9XcmM6RQyXjR2kYeqES0bcC962SMvSOF6me56qsw61nMnX1sp1Huvm2brLvFOjYnMm1ftMVm+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+4gjM/0+w9i5HEZuxptz749IT15yf4MDFf0Acd3zP2GWbQXWKv
	txZyc6F1F+CtT3ity7btDFwB21w/lVSybRQbdcDECP0+7PD4RDNWYbTboWAzUuhyvw==
X-Gm-Gg: AZFdTZentJQEy4YOwxAO2x3IAgje+9cP5B4cY9c6piKBhL/gTUFL14Rv2+bodHM8a/D
	OyHmCMtrP4EByDaMgbC/FZUk/HLe2rkPJgaNAtwdCbTlBiMGzLCEPZcICov3NI4W0lJBtcrxmRf
	eTkIpMKjlJ4hck5kgqs2o55tittO34by3NHJlou6MrF27IWaSQ19cuCrAtzPxXyUe5/prtCdetb
	uz+QeaY4V22IJ6DTCD6pd5hyo+5uv6awM6whjF0I7Qi7yTs0/7N2+CML39sXN/6IWkn7O6kgtR1
	/4d/VUTcYIovnoxjXZiOkASuOzN9oszG+EdT8S3/aUS3+qF0hiTNmRL40EiKfI/7VSbe9rFVP/y
	gWCDXWAGjUUggx2ZcqnXvqFES896Z0CNiIOJz2JyTUmOHr0sU7ab6jRp9agWGIpG0R1vUAQcTRj
	/EAAfjzSF+HP5aJo3/wyWiJUTYJnJgA4IUDlJbE3jaMmvlJsA0vlLfRmMzjj6FP4lMgZXeodcdD
	O4aZEUK3VZgkbqtLJordBBc8kqv0TZkVkB2YtOPq/WwMJ2D3KIr/J5I7ZMvsvwJzPpklwzLVIlz
	db5xnVuGQWZJxSTgHFtbEc2JuII1AhAu1epHGDZOmB/hB9giC0E=
X-Received: by 2002:a05:6830:920:b0:862:c9ab:687a with SMTP id 46e09a7af769-86314ec41bamr27057020a34.0.1795635241407;
        Wed, 25 Nov 2026 11:34:01 -0800 (PST)
Received: from miso ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f784fsm13769165a34.16.2026.11.25.11.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:34:00 -0800 (PST)
Date: Wed, 25 Nov 2026 13:33:59 -0600
From: Matthew Laux <matthew.laux@gmail.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v7 11/12] media: Add subdevice driver for the Mstar
 MST3367 HDMI receiver
Message-ID: <awc4J-M8SCfLx5O2@miso>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
 <20261121035523.26764-12-matthew.laux@gmail.com>
 <7969efe4-40e0-4c1e-b36d-dbb939bb4c64@kernel.org>
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
In-Reply-To: <7969efe4-40e0-4c1e-b36d-dbb939bb4c64@kernel.org>

On Wed, Nov 25, 2026 at 02:17:21PM +0100, Hans Verkuil wrote:
> <snip>
>
> InfoFrame data must also be exported to debugfs. See v4l2_debugfs_if_alloc etc.
> in v4l2-dv-timings.h.
> 
> It's implemented in most/all HDMI receivers, so you can take a look at how it is
> done.
> 
> The exported InfoFrame data can be parsed by edid-decode.

Implemented in v8 following the pattern from tc358743.c. I did have to
manually create the InfoFrame header and checksum because the chip
doesn't make them available through registers, but with that done, I was
able to use the existing hdmi_infoframe_unpack() instead of manually
filling the fields.

I added some output from edid-decode in the cover letter for v8.

> > +
> > +	return 0;
> > +}
> > +
> Regards,
> 
> 	Hans

Thank you for the review!

Matthew
