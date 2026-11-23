Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441395;
	b=MimyJYnOS4wyIXVDmtSpu/om3sX0X6lOYdffnVDz+KwgkqNC1hIqupDk6fQU4ccg67Y+
	 IqgVo0VZIK/498ZWaYkh5LTbaRE6tDkZLl282g3Ydqgdpf53GiKU0f66ND1GymAV8Y8Kv
	 /dZEysz1w85cbDG2MocCV1ixyZ/niMOzG+IE8P/RP6lg+/zdMjnkNqb/+StyIQSkm6wbI
	 Fig5DFSPDjnls9mmF+2Dp4bSwxDJGEYQUCGg+s0v0TYfxcX08Y9NHqAm9ay+IidM5KFTm
	 Ou3vhspfYRgZy6vUF7utWhEWE9LUeoUhKKz1JM5ucK1Zbla+kj+B9UBNhHexGaiPj8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kqCL8yR438jqEfqX8sdAOmG8GdM6o1iX2qDOd73H3eE=;
	b=oqt7KVHnN66xzyVz9aY5I2A/MT50JhJ4T0Lq3oA4tCgqrk/TcRKwpCx7ocxwZyNJcNXH
	 7HzroePoCvmt06oGnQaf+gG0k8lGWRDeD8fgUQ5LwtRnQ82bwKPO30XyCyNh3cduexGCF
	 0kJMwLkAIel8DsfhVgmv0W3Od+Ua6GNSY1RLv22XEaXUlo7jG0zcq9+fwaxjmMsSc5knP
	 YUiDyTrV8ar9mdrSUQzbHTQH4GDNO5Sndv+dF5T5aFozj92IJxtaM1gu0KdxfojQ/Psxt
	 NRe5Z0cBs/FX4M5wnH95udaZfV55aCVVEfnm0scU9vxluHiSBjPGrEywFCa5t/hFzdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tSQq84S/";
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0936F606A32D
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 13:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0936F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tSQq84S/
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5154989984so370955166b.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 05:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441393; x=1796046193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqCL8yR438jqEfqX8sdAOmG8GdM6o1iX2qDOd73H3eE=;
        b=tSQq84S/1UMt0IuanHyasApDHPmNpDwhzVwotDPkeVq/SQyYZhFtggn3Cq/Gk/1tCk
         h2cA1OEReS/CYPQpS40RC7oB08MVqUd7hmoO2j5ugvGQeh1InNKeFitZ+YOOi7s7VDVk
         kyDC14iqfVs+yv1uzySejV0P+NH+PFQwPOU+3jS3mTPfmL6qomnI8+BCpKJhq3+wnmK0
         /3c4tviGXnzIz6iHoW1QhfVYLYZTEEUWmKBd+iYSEEDhv2iVJJ3HF5eOOzXLPrYX1BfL
         bAi0dp13I8lbGwD8qBUh4z2IGeZE250GZYAMy2MdxG0g/K6rOzOXfmCJZ62/M2fgsumP
         2CPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441393; x=1796046193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqCL8yR438jqEfqX8sdAOmG8GdM6o1iX2qDOd73H3eE=;
        b=jMoTiMxtMhjVXul0VVlwe6SnVpK3lfntcx+lhSZw812RGJb9hYTuWCB54Ybfpl3Zqj
         J0AZMKElUKw04F65ZqAEuWaIvBwGnCrPNjafCDwlE/0vzTE2HlBBWYPSsRDYAZGCS/7t
         MkP6kOqkiQu02TKxJPcSSje1KeepHlUmw3wxjS+rLeMaxwmJSZLxpisq+WI7krZh8vFL
         IkpgjIPYEYyo7A/v8wdmMar3DbAA0mWJPV9WOPvYzE33FXbMNyDoBBwJK9sFrh9FSdD4
         TQL28/scTjX9/RvAXQzHxdPOkd23sHnjDAoLF4KtgatJgjJd46uc0AZLvdL7qXQNiqHo
         IeCw==
X-Gm-Message-State: APuU4Z+K//d7PE5JaJcLR4RhOoDrp+ef6tMhhG7NJ2D0n46woM4pfUS5
	zfaPnRMDViR83PMFggsXhbwG7m6kHijQDQW3RXel/wwTLaSNceaHeTgO
X-Gm-Gg: AZFdTZcEtLARf9m2w2BwlvC7fiq9asEgfmNoYN5P1B6hawjqhgaqV9Zw/WsvsRy/MWb
	oxd2EMnIpLum5Rqq6N0xmCT7Hs1SCLKv/zf+SlOrmKYBTrsWGmmZwT8Wp6HaMx3Hap+Sz6iHY4S
	19QOWIbLsnRNf8tXxjccYhrqeioiUZPH9bbPnWvlQRLjOBbOxhMnPNpoWwWKRd+qwSVHSHwC1CN
	6JRF746uFVaXbqf1ywj/XeRhLx3MqC+rDCLWEI6HEM7vwoHIZvQSCaxFWfMUT728KR4CJp2QG9W
	BkJsDfw4yjNdeZ89DgoihNcUn5v5OxbJYEDPr1ZaDGbP+zvFhIWvmmAcdWPvxTqWhYV9UhhJ4ay
	zGSGKycv7sjAkS3ebI+HoojJkdCcmmMTbcG9FroSCFYlJ5QI3K/554KwJ2WANwIHJEathu5IUwm
	nk5pyNdX0TDVOmUBznWGagGzl4kXmZ7fpB6EvhlKaJ5zpEqs9eOOA/S1IszJq5a5CJ6rGryCFQy
	ax4awv1pIaP9xQUFYMA906UIC10gorvx1NrL4LujirNzqED3Y6tAKk3nbc8C9xAGAuLsZXb8swz
	QBIZEFubqeEMLEiy4uf2ngmVm+qMFku/Z27t7s1NsiyAbx3j+roEjACNc4cBN1cfvJMYLdXod+W
	fGwqqg74J7UuhvKsMVEmG701ZmDewXJSZgIXRb3saeGoVlrmQpxEyZyry41GqcdliL/Li7lIB7H
	HXpkI=
X-Received: by 2002:a17:907:2d13:b0:c50:ca93:19a0 with SMTP id a640c23a62f3a-c513aab9bcemr968102666b.40.1795441393323;
        Mon, 23 Nov 2026 05:43:13 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeca720sm409336466b.53.2026.11.23.05.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:43:12 -0800 (PST)
Message-ID: <664a18cc-24d8-4140-9c3a-d522945cd2cb@gmail.com>
Date: Mon, 23 Nov 2026 13:42:49 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix leak of ctx and dmabuf reference in
 dma_buf_io_ctx_create() WARN path
To: Falconet3 <Falconet3@proton.me>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <htm5h9oaY-vk0g9JVYJmz5XCaKe_nPoWkUJYJqDulyNvv_sAWfzSMp0T6GWt5okc8R4SyvXXpJQ3VGhetKnjEa2KGem5uCYdxpmdzUFf6XA=@proton.me>
 <tRqxbL7txMRAzNLKylzBLQURNLpU-D0Xx5CrngGwLoYrK7V7kREharagUfgQLGIfiYFyTALR0BwL93AL_PWmFXq_MoZPhvPfUojBsyCnilI=@proton.me>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <tRqxbL7txMRAzNLKylzBLQURNLpU-D0Xx5CrngGwLoYrK7V7kREharagUfgQLGIfiYFyTALR0BwL93AL_PWmFXq_MoZPhvPfUojBsyCnilI=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/22/26 10:49, Falconet3 wrote:
> Withdrawing this patch. Apologies for the noise.
> 
> The WARN_ON_ONCE() path in dma_buf_io_ctx_create() is not reachable with
> in-tree code: the only in-tree implementation, nvme_init_io_ctx_locked(),
> installs all of dev_ops (map/unmap/release) before it returns 0.

Right, it's a warning for the same exact reason, and cleanup considerations
for it are different as well.

> And on the only path where it could ever fire — an importer violating the
> contract — freeing ctx directly is not safe: init_dma_buf_io_ctx() has
> already attached ctx to the dmabuf and linked it into the importer's
> tracking, so kfree() + dma_buf_put() leaves dangling pointers and turns an
> unreachable leak into a potential use-after-free. Since dev_ops->release
> may itself be one of the missing callbacks, the core has no safe generic
> cleanup on that path.
-- 
Pavel Begunkov

