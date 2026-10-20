Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792466700;
	b=ppuxWVfweKjR5peHIR/yVqr/aGbLLvIu9eDLrY860xDLwjOSrk+9D3p6GWD/MCsOeNK0
	 DoGh+Bf6u6GiUlABkzVY9692jM0eUTYcfSG3a1uuMZuUtHSy07fza1ylPinCJuXtJQDWJ
	 2pfuH2ySClYiT0TlTwYRXDQxBL5HW30UGakWtnEG8zg0javE3N2PgzE4dDZFW0rH6tRRg
	 MLZhW1PRXLa1wwgFMUtb8HZ+iblj9x5hbpSm/PvOfWvbIwqaN1sFw5y3sO7OSjUp9yDEf
	 PzmayhTGQ76qO+k2aGU5UfGnWuc0o7qCbEAv2wNE4cMzu6Kuf/7QqfS8gvucr+78RnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792466700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bTIhfRXQ9A4fWivlb9V7+Dkt1Ju5gj489YBq7QLLDIc=;
	b=tguNeuLaDkwJC9D4mAjNzXWr38CHwRj15zuULul8ALp5mmowMkMSH9abmlsf/povbssr
	 SEzbnKmhoVY8EWCrU8hWPx01SWu68BVf8LJult9WIpWwsn9zGMWsAtrpFeIpNpuGvCIXl
	 SKRW2IAmD4o8xvRU3rIo83+wg0B3/crVhLe4TMMknoPSDtdRmvThPRLGhEEMDdrGBUlUJ
	 Ftue1UZw+d8E9icdaDuMOBSOqgz7R6KVaXBtUpGSkGSHMoDuSpEHvdD+LlrUFjrYbkwvu
	 /TgT6G4vVvJViTvtwBeTn+ASbuTPnySOG4rOhwFMcIz1ww6ugvcVgShQOz3E0C4VXSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F3egZBHG;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4DB606A319
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 03:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4DB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F3egZBHG
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2214899f8f.3
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 20:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792466698; x=1793071498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bTIhfRXQ9A4fWivlb9V7+Dkt1Ju5gj489YBq7QLLDIc=;
        b=F3egZBHGyKGcGtkxm3U6zaGanki/60Qc3WhiyxEdrpwmWrrwAcYRSpzt1pRF7vLuDw
         4vV6Xv2nvDCWFqc6KUc2Pb8Y64s5xImsWc1w+6gMW07HQ9InvKVCl3QtQOr1Mplr8jbq
         OPxlwL6sjWYyoc18sDOXhTlwiE33ICGAcnQXJs42QnaI/uJqCmq1WpIJJe8xUL9ltqF+
         d2oazE0zkTBYUrrgD9hWSwyU5bbCcesGZPsuiUeSJWswrvwJCclskoslYO/AT79yOTJl
         y675Cd2gqmZlHnQBJzjXrAAXNBCt8NcxOGD9bZSPbpdAefoNPfRRV9aJMGfFWS0jOHZk
         ivQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792466698; x=1793071498;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTIhfRXQ9A4fWivlb9V7+Dkt1Ju5gj489YBq7QLLDIc=;
        b=nizWPIMWqrg53Vj7sGYBoXHgvHBXogApwSE3gxUwRlZ3w9LgB/YsHuD4hfc0UOETJw
         oFDgXN+BAh2vPJJZRHyx9p6njjDiBFh4ageu+Urs6g1ELn0dsaGIM5kyEty+qaBXrpWE
         NOO2TyGPL2cMDP3fXUhzj2FNi1grxMSPVdCKkcYrc48d7xXtqAsNfl/aVv4GbY7BZzbJ
         2c6JxdTmmpZ/H1tEdjwmK4Yfa9z15RQnUE5JtBnAFaHmeerHELd5PIjG6cv7bPYAs+JD
         y9nKqNaIqtB1m5Zmn/jq217CRM93VmoXf9l48nGAlqKwQiYneaYzWTPeZz4LmlkKBrL9
         oD3w==
X-Forwarded-Encrypted: i=1; AKwUvBxfMBfBIzS7k5u+UzM2jdYchTzoeXosDLPZVbzehI+zA9Vr8XpPjUmPgfNr5p/gbs2r7jhjObtiZRKC2Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLmrI9jkW+D53MIrvfjt/CALPAl8IngvlvI+oupwp5QCrrbvGDy
	Dp4sMsQzHovYbZQWps2O7nQpQ+fIenG2R/BG6VBBelG9Hq8NEYFeYXYY
X-Gm-Gg: AYBFou1xlhjg6/rNY4at5WnG3D8fA2fvgzUBCX4iMSNERNeGkjcpegry7RnmwnkOU7p
	BixHRSrASpcjpUyy7ONyc5OdD4x69JaYB5e7OUhvQ9tDjVxxB7goFtIm5XVJPDKhkya7LMsczpx
	cZYPgf6g+dhSjlPXSaLg1IXUsx6aDzMQOirQPCRiCffSJvzHEcY6dOZi5bY2MVaZb+fAPRLUu2V
	Rw3+nbygIUFr1CNORZL/txbmC/lEyAg5PJCbNZtQcMC65Jjb1mhDRLoKolEVJcGJMKFMOhnGkZU
	n7sgo8G4CuNPHQKqdT5X7OY6l6v/qNVsrRUx2wY9MdXjX3mhY58gb196BQZAA3UtpeDFH+RaWkO
	Q33f8mMsl1NzdsTOkNgEiF1gdaQyStQSLsgpFNjxkzOQqTxm3kK4+haTI/0CyWEiEX8LM38+5/a
	tRQ+tFW7LTUHorDMaPlR4FOBzvFHifsORYoajxWuSxt/L+sTfUNVQVpNjmuBdGsfgSMDwXtlM7z
	KQnX2YJJIHFQaFtWr4+GEiBVkrh4ZjQY46tqe73Gpr4BZpPpW8YCYE3vquAvI9FoEPTmpMixN6R
	Myoc22AkXnCDzWae5GuNKXUNXYGxqBSHjItZ0rRDzi6O3UthjtfjzXTFPWZkmsEuw5gbdK0Hwck
	=
X-Received: by 2002:a05:6000:2583:b0:487:490:8391 with SMTP id ffacd0b85a97d-48e07bb58aamr21758837f8f.16.1792466697879;
        Mon, 19 Oct 2026 20:24:57 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9c92-6501-cda9-90cd-4e49-75d9.310.pool.telefonica.de. [2a02:3100:9c92:6501:cda9:90cd:4e49:75d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818d61sm2909579f8f.31.2026.10.19.20.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 20:24:57 -0700 (PDT)
Date: Tue, 20 Oct 2026 05:24:54 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: synchronize CPU access to imported DMA-BUFs
Message-ID: <atbbdKshkbmbMZMk@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
 <20261019124433.GU595565@killaraus.ideasonboard.com>
 <b9f5ee4d-987f-44c2-a1fc-2570f4500803@amd.com>
 <20261019150116.GA3705@killaraus.ideasonboard.com>
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
In-Reply-To: <20261019150116.GA3705@killaraus.ideasonboard.com>

Hi Laurent,

On Mon, Oct 19, 2026 at 06:01:16PM +0100, Laurent Pinchart wrote:
> 
> This patch series introduces a big penalty in the common case where a
> userspace application consumes the frame with the CPU. There should be
> no cache invalidation in that case.
> 

I measured this on my Pi 500+. The cost appears when the DMA-BUF has a
V3D attachment that stays mapped but idle. I compared patch 1 alone with
patches 1-4 on the same v7.3-rc4 base at 640x480 YUYV. For the DMA-BUF
runs, userspace read every frame between DMA_BUF_IOCTL_SYNC READ calls.

Median process CPU time (us/frame), five 1800-frame runs:

                                      patch 1      patches 1-4
  DMA-BUF, no DRM import              129.2        130.6
  DMA-BUF, idle V3D map               130.0        153.1
  MMAP                                126.5        125.4

The no-import and MMAP ranges overlapped. The V3D-mapped ranges did not.
Pi 400 reproduced the mapped cost with vivid (+8.7%) and UVC (+7.5%).

The task-clock profile covered only the patched mapped path:

  Operation                              Sample share
  DQBUF producer END|WRITE clean         26%
  userspace START|READ invalidation      13%
  userspace END|READ clean               8%

I tried a CMA experiment that kept the DMA-BUF callbacks but skipped the
read-only END|READ attachment sync. The skip variant saved a median 12.3
us/frame (8.0%) across three alternating same-boot pairs. With private
DMA-BUFs, the full-sync and skip variants both passed 64 byte-checked
V3D read and overwrite cycles after END|READ.

That experiment still performs END|WRITE and START|READ. In a negative
control without END|WRITE, all eight V3D reads returned stale data.

Patch 1 is independent, so I can send it separately. 

For patches 2-4: How should vb2 avoid the END|WRITE/START|READ
round trip when userspace consumes the frame with the CPU, while still
publishing the frame if the next consumer is a device?

Thanks,
Karl

