Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639323;
	b=WHXlkkqwllEdJWtYb441GriqPcR5cA3zU2JJYkjbMrPSeOFH6afTH9P9OCZY6OuoNkX0
	 Kfgt6qUX3CfmPhHbu0Gmj0MU9Nq4M9nJ3lwiKhnqFYdELloIzsFt0UZB++rHkpeAVqOV7
	 PjJJ90pxitDFIIuLuJTArD5JUV85PO7NyYU2BTJdd47Ec9aNFrMvO+r+D7DXGiYpcTnd6
	 +V5/eS1gLPABBVtfkdH8fiWlXUjqSZhNzy6yb6lrn0Z8+Fabb6JEEouOoEVmS/j7NAfD0
	 Zu5/t601IbJxZVpNC9vn9+eXp1UwrvQ28pOW2Fb3jMEctKDdmjIq/08L9jXtxx9asIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=iY1/g9P0L4rhvgCO8gfRef6JrnvEPdwuVRox6+EysUI=;
	b=aBX7HqwAEtR4SNYkbHp2PwHXm0LSiDxrFwKptmlxKvZx4CO2xgdQhp6s5/1dQh5wKpEC
	 ioRB8XbJ5vuNBsXqk2HCTa5xV/vmArU1qeOhAl4M92PfIz4ic9kK+1pzHxG1ogYHaaufs
	 NTxbjdHqXTgs920bN4NFBmE6dnQWdgKY+tqYrLwttwj5sS/88t2B/6qcf0GFPFI8rX0Sy
	 iov3ma2S3P5r5R6RV6sDOlZOQvjhWJSqgFUASilAilgoJST7EoPcCnSelGw7iJMmwTV8N
	 4/lp3c1+wHWHgbnnr250l+Z2vZh2h2q8fKFwKyFQWAkOmueYTRQWscKWV4U6EiT/DIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JfP0LdLG;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAC8606A321
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 03:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCAC8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JfP0LdLG
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so11319615e9.3
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 20:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792639321; x=1793244121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iY1/g9P0L4rhvgCO8gfRef6JrnvEPdwuVRox6+EysUI=;
        b=JfP0LdLGXwtCILyMvoWWsANfLqwcpRJsp4BwEjALe1uQsqIMf6oFrj0+Wi6jo27351
         fIWnIrjzthUYJZioSG5OVNH81J17Ndkivmew/W/RJYIgF3v/B6+33LX/JPtt1nO/oT+x
         p8sgu7wFRiLmYU3wlFwrwyjhgh4ycoMhHiSFi8oHy6U5mxVA2u4/ybbVdzNViCa13in6
         ZdZWaShYoIMlZKL8+5OcSgrXJXSxQmDl2Eq6sbdXVCmSLsKEUyzQB/hFlYMIRXdm+XiX
         ITuu0Q8kkg5P7VSxbNFG/Hf+vK/i0ThGd8GFktJ00q7+aTljgYfn5OpyXde5EGajUp7T
         9kCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792639321; x=1793244121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iY1/g9P0L4rhvgCO8gfRef6JrnvEPdwuVRox6+EysUI=;
        b=bS/OzbX0bYL6i6WIVEkuPLbAMjIiv3yA8j6HlevidtSatbchow/LtQg2zMWQnD/+dC
         3+3C+cFSuyjJVg/pVAsS/yl1lnWZyZNoPGbt+Wb6Y0kTs7cw9BYkceOJ3zzVXePHoDJj
         Bv9sSXKH7NOcZflXHwUGVtw+fIrWMH3lYR4x1OX89kbemZsj46bFG3vr7Zz8+1nHXmta
         90vMnaxRsgrTJOe8LVlQ0USgOflEfTlTdG9o0CPyuTB0jIs7ifKLdcndG7hfEt8iZ29S
         PXPWyyLUKsDjqNT7tG8bPb4JBv9Dc9hLGPEJkV471OEdfMsJmx2UZug1waBJZXC7+L+N
         HeRA==
X-Gm-Message-State: AFq9FYK3OOzSHNnQvlDtrcJnIUQkEMnZjrnMmrcUtoO5OUuPUoWenP7J
	k2tfgA8+WFrBiKlC03me5TPvT+OF+VnNiw/jxHOrAwnDUNOTHSBg2q+qtwxXPg==
X-Gm-Gg: AYBFou0K8nUOW/xxATOurv2N92onOQAF6hLkiWnOHDKhsB1Dxtfb0PW+lL7orKD4STr
	nexgUodzibtG/x4fN9mWUqnqaEch+kAZQId8ZiD1j02UMZ2TokA8DvaJbvDCAAn8xe3fs8FwH3E
	Lzi4cvLn9zdi1S4fbq2Gi+lqgAq+BT63fnfp4O8miKaGJL3LLmovnRsI5ESgT7/W+A+txiB5toE
	7CwZ72z0rWdKGePc4acfQmcbNpiIDeJl4/UkPjRNFVj/ZesiaCoejO6j2vyYLoTUYHOGNjxkBnC
	d54XrdJ+IFx/SMIkrkB6S2NeUmr3LO3V8RjO7eVwjgnJmgQ8mWv70+a2RluwIbzps7d52Sl8kRp
	RSQP5QHS55GBFMlAMfLomqO+tgtb+U0CD4c5X3DJrRDs97xf2U1Ipc4DB8O33HVbisALh4iak5P
	cLX4G8nrxJhjv0NX4+7Piig7JuHPuf0/g88fL9+3R0tklDftWtD3K6CbQ77/p9+2blIl7GNtlsu
	GJLYUIUhx/F10/P58l3/CxXUSAiyZRuuKecqdiuwip0rufWAnSPyfTbONMINwr4vh/Xm9f5jddY
	L4UN9zU49FYwt8zR+swY5COEJHEF+2IXtdFwz4XYEKgKRUkPj25BSS5JzHZJ7rxT7RGdPD7J98q
	OCgZxr+rDddZjGxVbPsA6lqVUyyfCFu95sCQ72eb3UJJpBXsKmkFLgSJF
X-Received: by 2002:a05:600c:628d:b0:4a1:f377:5c6e with SMTP id 5b1f17b1804b1-4a1fdd20a24mr80516715e9.7.1792639320880;
        Wed, 21 Oct 2026 20:22:00 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcdd3856sm23089115e9.1.2026.10.21.20.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:21:59 -0700 (PDT)
Date: Thu, 22 Oct 2026 05:21:54 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Tomasz Stanislawski <t.stanislaws@samsung.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: videobuf2: finish prepared buffers in
 VIDIOC_REMOVE_BUFS
Message-ID: <atl_rOMxqyHbD64q@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
 <f2258d73562e0ebf2efd793b646706ba0dacb2c7.1792392288.git.kmehltretter@gmail.com>
 <CAAFQd5CDPG4RxUwPDbPUJSCxVZE1cEeYEZvQ25Sy4CuJR861Yg@mail.gmail.com>
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
In-Reply-To: <CAAFQd5CDPG4RxUwPDbPUJSCxVZE1cEeYEZvQ25Sy4CuJR861Yg@mail.gmail.com>

Hello Tomasz,

On Thu, Oct 22, 2026 at 01:00:19AM +0100, Tomasz Figa wrote:
> > +               __vb2_buf_mem_finish(vb);
> > +               call_void_vb_qop(vb, buf_finish, vb);
> > +               vb->prepared = 0;
> > +       }
> > +
> 
> __vb2_queue_cancel() does much more than that, especially all the
> media request handling. In addition, this open coded handling just
> causes code duplication.
> 
> Would it make more sense to refactor the relevant part of the buffer
> cancelation loop from __vb2_queue_cancel() into a helper function and
> call it here instead?
> 

Yes that makes sense. The complete per-buffer cancellation tail can be
moved into a shared helper, while keeping the REMOVE_BUFS range check
before any buffer is changed.

I can then send patch 1 separately from the DMA-BUF access work.

Thanks,
Karl

