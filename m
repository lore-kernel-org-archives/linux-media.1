Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794453383;
	b=26LNvT9/xkazh72KK93iwK1UJV58gl7LC7wuw9LiJ2M8WycfD9jTMuuPOsLMkApHPRGt
	 ucJXGMBLeHrn4Qm80NYQjwiApkoeq0Dtz//631aEokgZnmC06qnEX+QR1czUubMx9IkX8
	 OOBl9OWROPi6oJHgNQfBxgut+IyKzCuK7mI5JhhjncxruW+UGpxuQJ2NmylBWkpu776o9
	 zrhMV3vkoB/EQrHgLu9nIysUb/xylCn5Zc/LkCgFVbH/P4lwb9KgNFB3clUL+bPkcvYBR
	 e765OoTz7jjFt6XD+c6cQw95WlVjc2uC0uuM0uN1ls8zotbMlt5SZXiruk8nMJAlsFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=B1+ma03bcpp5acNonkpy2s1c2LTj/v5z83tVJvaJ6z4=;
	b=qaDVKUFd0G5n03jFyuOcmSz3ew0VqKXiDIXjs8WG+C8aM5ViZU37EvHz1DPLBN0SHmdw
	 YQ8mj0nibopG0vDazCrGx9jpjEVdDqq3q6mW2cDxVemkyK1fVI64oRfQCDfWBERyFOuSF
	 I7jS2w/+0cLfdZrO0nI9i180bhbiFmFvHTQ7usqLcKIM40vopeq44UF81/WNcJ3+WbBB+
	 CQEPIj8rd8E0L5nFcJt62kiZOsjjcitSFdkaqd8QhL+KlYeW1J21OqokGv+Zx/a3kTeK1
	 HMqdZnRuvUleioabIbj3YurKv75/rUq/3JrRW1xciiw5W66ViUc+uqy6i+cjcEBgJkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzQ8Uuex;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB07606A32D
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 03:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FB07606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzQ8Uuex
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1668863f8f.2
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 19:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794453382; x=1795058182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1+ma03bcpp5acNonkpy2s1c2LTj/v5z83tVJvaJ6z4=;
        b=pzQ8Uuexjt1M5LTPHmPjA/0AkTNNox0xoewfbs0mmNXc2ebwhaseX7U2bMdJ/b/nwr
         PZaUwldH/h8WVsErNvfL1vx4tSc69uuqLHbiJRM6ZljGwd4Er1H9s25geQRt/b+P9lCq
         AecblAHgho2WS8Vk6Hu/PI5d7yp7SnNwpaK15iCSveNyPC3dR4eSDSnSsUvSjoklOkLp
         VyALg+f4s9J8ViIF/3TmxYnR8H0xT9la+53qwdS1xsdG1uCnOkuXR0//RyvrV4zOwsFO
         VB1Od+Ej8HO54DGOv3T1LkhZjRRVvz0NZxav85z59DLvd2vZhnFE91VtaBaeyjJI2ajT
         Gh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794453382; x=1795058182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1+ma03bcpp5acNonkpy2s1c2LTj/v5z83tVJvaJ6z4=;
        b=SGVzLN0mxwIKfzuteKPbKiebGG+JdoivnKVMJWb2facFj3K92c9AuRMCiiXaKzc50e
         slcFjaP2Fbztwe3eAMVLAIYAHxqMrRWtPMBsNfxyrCZQ/rmGjS8PPcIKdLplMxAAk9rZ
         mIYXHdUzJLiL7TESEVQQ3R6qd+PkXSI5u415D2sGq4/0JU5ipJ3uYa5Pp3rxo56RLtmZ
         5ddErws+alzDxMEltmhCrNE5/LnRsb4VbLaa9SsFeeet3XRa/kv2bpxRYP8thCDyFXt2
         dl+Y1KPkIR7+13hyNZQO30ed5Smf1ZLCmW8/RwwUIfNY0BtphIUKh4QIjA340tinAONH
         04iA==
X-Forwarded-Encrypted: i=1; AL+hErHsiQaayfNgTsGx2DAhzvAoXCNGmXph12BWNt4ZcijiWN0b9gJNX9QkV4A5Sj0sgYQMGix0wtgD90A6Qg==@vger.kernel.org
X-Gm-Message-State: APuU4Z99OqoC/BfySzdXD4hx7Bbn3WPhawS8lH3p4XRf8OkI9aJeFEaH
	Blxk/NRrij5gsi74tjaDN3urI9FmAqfcMe+K6rNYetBcMlWkjXY4RAWd
X-Gm-Gg: AYBFou2sNgpmBLElmLDLptZJpFFaRAIrgVrqIm7lnzx17OFHDXZ2sRdO+XTC97+LR7l
	ozWM5RzDE+orMH8iXlL+f0W91L3suu5ihudd4hgbQclgOs/M23fyhBPRWrsx8nsoFYO+VKXeoTI
	GDLALlCDuYZSgayGjDlEA+T3DPjdy7fdhu0jmEgdreszE0+xXM7w8BlGrHYNG0NLOVXy1GApzNC
	8uW3Dteqz3Q/YkfBAIfK986KYyeEzuKxRWQBx4ZiLLzP6NrvrYNm2mxHHFAbWlvtAPk9DEv5WhG
	q8zHaJrSzi9Kx7tjcE5E48+ln7P53AaRdsQ0O68ARuwa1N+O3wi+CT7/t0e2Uo5Q8BNBWMdJWxB
	zqiut7jCiPGBYWDOVjN4rFcSi+K0TpQOVMKxV8XPGkDIcQJWMI42I43KFvJsu0qt/2dZRsO+smX
	lQTvBgIN1rfnOERP8I3niSpJKvfVihnruU0GyMEbhJtTL339hv9tOVfNgAgOyJh79+guEE/+oNN
	TVpsEckcsK7CdrLepLAYu/iyVtWmOwlrjcHodqXgolAciITLWqNN+WMuau7gNCBuWvWX+3MavAp
	aSNFebQzLzpuFqMOqkN2bfAmHV22lEULYeUlXGsh/wKBXmRObmxx9divW30dS1+VCA9sAZVduXv
	SGguVkjd/nVb8O+eBJF08l20In52lclPPu1KfSJB7zhmLfEvLFwwxzo2HtBiOvqvmpHj+EPrjCX
	3RffS0i78KjjU9TTXfSuCxfPsuvlwUNg==
X-Received: by 2002:a05:6000:401e:b0:495:5c83:51bc with SMTP id ffacd0b85a97d-499c3b9ff3emr7370230f8f.5.1794453381449;
        Wed, 11 Nov 2026 19:16:21 -0800 (PST)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a181-4b01-25fa-1a8a-4f45-ba49.310.pool.telefonica.de. [2a02:3100:a181:4b01:25fa:1a8a:4f45:ba49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363dffa1sm13523836f8f.39.2026.11.11.19.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 19:16:20 -0800 (PST)
Date: Thu, 12 Nov 2026 04:16:19 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomasz Figa <tfiga@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hans de Goede <hansg@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: synchronize CPU access to imported DMA-BUFs
Message-ID: <avUvHGb4talXW7qS@gmail.com>
References: <20261107104703.44111-1-kmehltretter@gmail.com>
 <20261107105946.GA96745@killaraus.ideasonboard.com>
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
In-Reply-To: <20261107105946.GA96745@killaraus.ideasonboard.com>

On Sat, Nov 07, 2026 at 12:59:46PM +0100, Laurent Pinchart wrote:
> Hi Karl,
> 
> We discussed in v1 how this is not the right approach. Why are you
> posting a v2 without addressing that ? You need to go back to the design
> table.
> 

v1 ended with two conflicting positions on non-coherent DMA-BUFs:

- Laurent [1] and Nicolas [2]: end_cpu_access(WRITE) only marks the CPU
  cache dirty, and non-coherent DMA importers clean before starting DMA.
  Persistent DRM/KMS imports then need a sync call on each submission.
- Christian [3]: devices must access DMA-BUFs coherently with the CPU,
  using begin/end_cpu_access() around CPU accesses. Importing a buffer
  with dirty CPU caches onto a non-coherent device is intentionally
  unsupported. Today cma_heap and system_heap sync all mapped
  attachments inside begin/end_cpu_access().

On my Pi 500+ with a USB UVC camera (640x480 YUYV) and V3D on CMA
DMA-BUFs:

- Without vb2 CPU sync, V3D reads stale data on 8/8 zero-copy frames.
- With vb2 begin/end_cpu_access() on cma_heap, zero-copy V3D is clean
  (0/8 stale). CPU capture takes 91 us/frame without a V3D import, and
  144 us/frame when an idle V3D PRIME import is attached.
- With a test heap that tracks CPU cache state and syncs imported BOs
  at V3D job submission, zero-copy V3D stays clean (0/8 stale) and the
  idle-V3D CPU read drops back to 89 us/frame.

Question to all: should I look at opt-in cache-state tracking in
dma-buf (with a sync call before DMA submission), or keep
begin/end_cpu_access() as is and handle CPU consumers via V4L2 cache
hints?

[1] https://lore.kernel.org/r/20261021175900.GG15441@killaraus.ideasonboard.com/
[2] https://lore.kernel.org/r/7e4c7707880e9092180d28484ecf674be29b40a0.camel@ndufresne.ca/
[3] https://lore.kernel.org/r/1e798600-5a76-412a-959c-94313629baf4@amd.com/

Thanks,
Karl
