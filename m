Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793079633;
	b=mfY6aXG0HFJnSPf8XCwqBu2yiNjeahi+ZC2087ZqVoEO6VjMQaTlptOch5gicZZT3NTa
	 GfPyHb+SQT3SUKXEg8dO/5qNuZ8pk8+rUxvmRnlGr7d/nblmxrdR1OJAV1/6atb+IYQqm
	 Fgcf/Y3f4rvyQT/rvpcsJ8kBcxvyHjifuxL6775n5hfJYlhvCex2+dW2DqekkYPd7zbmq
	 557dnnIF08euIReV/9dT8IMJkMclmQxBIzIAUVuHr4cJSUcJ3Qto2v7J1MPqLXy+GjZHr
	 Zw+qSQN1qMzYId96D6OFlGQi6fOo8G8HUDRFvEMI3NIMTmXJJDxAehBM+Lpr4u8do9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793079633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7MtvTda9c8jDrNpv0a5ikKu9DGEM1JaWO2UAKaYBnKY=;
	b=jjkeQVLzi9jJ0RG0nAll9QLtQWUgCqFEtpAPGP5oRf3JlHVslbwYvNUktgPtPrsoWWX+
	 lLfTuIqsRKQZ0jVzXdzuzXWCu6+rH7zOtQ5OwNiWYPk6pgpvueik2lfqbdyQ74Z2TQsTW
	 1RtohRNG0RI1nwUbhKaVPPZRUfk7CLoF7YG1z7GeHJc0ktcOytGZLM7eghoEyr4hc8yjP
	 UiwAvOMX3AuBw3xaTN+tWfZW1UWXIxawBoOv24LlrBKL0ZFAD8Gds+f3FAxr4NgkwR3Ho
	 VIFDf4ZsRVdkeNqhYQ0T003Mu+saQYvpOoOoSRye5f3SSWVx50b6syP0DnW6wl9tPHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qNDKeJ6E;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B65606A31B
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 05:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B65606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qNDKeJ6E
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2357896f8f.1
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 22:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793079631; x=1793684431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7MtvTda9c8jDrNpv0a5ikKu9DGEM1JaWO2UAKaYBnKY=;
        b=qNDKeJ6EAHh1ox1z+OeiukJIQXKpgzItCUrRu4sxv9erfy0SgZlzslWGBIUDXf9txi
         2A6fw/VzaSlr4uAmdy17VvZH82y3jqNgfm38dgey8gpCYMiULlzMMkGY/cCwUC+SmILP
         7ufYTJvFCsk/uBT3vLT0sOH3jaU2+UBOpIlVc1h0HTjEwtnVRrCC+rLIGz/MVF8NzcHn
         SnH3ysjGxCs4JFIVNRnNDSeQK1iM9Kp0jlTVmOhdHkCPU2B8KnCj8aHdlNlfHo09bbjz
         +ElV3ll6O5sN8BzNzeidv1VixsUC2Nyu0pHzqlUX1UNIaFwgB1BeNA+ecqNAMusj06y4
         ijTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793079631; x=1793684431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MtvTda9c8jDrNpv0a5ikKu9DGEM1JaWO2UAKaYBnKY=;
        b=z8zrSi23fb+UGSeA8h8cBNISM+LQvY0g5NtgC6G7D0ok8TRIZafP02riWsQ1SRHzn6
         LSQaitvG9fgKARxJZ1MZIdu32Lq9PprOQ21XdZCuKtnHD7zd5fPd4j4dVAkbswLUTyJc
         ddx1NunIzrVCsqR7GfmbVz86b/mW0Pwzy3RqlPds5YxfWMReC/gfiJd7/vdmaqQlcqkC
         zeFVa8LuhNLVZ415CDiuxg+w492fAI4VO9gaRjCK+Gag0rcSEZucr2CTZUaVYB0Y9y7V
         WB+T633SySczno0hdKJTQNV6Sdkr0b2LaikOgkWSviL24+i96OBOWYEeSN9GFD+zhrwy
         mVrQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+AbVsa8wXb2JeLydPPwCURSjmLEX8O6ojqL7jqejp7qhQ/2X8bVzsdS83EgmZ+34AlG4paORTbyN/CA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ0yH/08LJ4zqfeMeAkFJxMmpudghcj1tguWRCDawDsndC6h3b
	JPM5k0+9lB9rvTwMwBgZR6OI/udWCYlvEZKKNaMYq4NEKg2kMyauXRLC
X-Gm-Gg: AYBFou2CV1H1r/Hpbe3ACZL4jdMjYTDpJiB4G1n3cZOebhijlOQdFUEzG/GX8zFJkDh
	wvBv7sAKo47FhYF8AhFhU5Ds4nkhnusNEguRU4jlzVFuY7ArfqiQFAUX+4fGloYQQ2GS/DkHRkC
	H79NzIXXLOSn2s2GXj4kifQO1NA1SivimVYmQdNBz8UsgnCwDCmCO3Nx+KOYO4ptiSiL9OOtMby
	DEb+eApbqManRCZTt2dnxREh9FA/oQzitOVYm01VuCIJn0jb/qtrNE4JKVkDCn6vggQmqdXZ/qG
	bK3ExxOj/xUawWs0/OPzhjsksH6JHdoMK1ngfcG0m/Ib6lp/loIf8GQ1WCVUBAlN/MFhGLU1M1E
	g1VoJfZCAGPTjPh/qZbBUq63YebjpiSmNGpK5X4/euojXD9YFFpHouKIBxowvLIs/a7mZ4gQ3+A
	Kw/2wX8l+gpx1EE/x6hpwFfwn+4p6cWpeCwCw/YSZtF6Rf2LjKurnPNXbZE5xJKMDLpsEb/A54l
	GuQGQGKQBgQ+e9FqlNq6/LuXyYr62nIRTGIy4eSXh9HrAZQeiHp
X-Received: by 2002:a05:6000:2c05:b0:48a:f8fb:cd49 with SMTP id ffacd0b85a97d-48e3eb88590mr17346250f8f.22.1793079631109;
        Mon, 26 Oct 2026 22:40:31 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3418sm18500026f8f.41.2026.10.26.22.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:40:30 -0700 (PDT)
Date: Tue, 27 Oct 2026 08:40:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Cc: dan.carpenter@linaro.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Fix memory leak in
 atomisp_alloc_dis_coef_buf
Message-ID: <auA5SoRV1MDwHrw8@stanley.mountain>
References: <20261026175840.13979-1-sifat.yt.2.0c@gmail.com>
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
In-Reply-To: <20261026175840.13979-1-sifat.yt.2.0c@gmail.com>

On Mon, Oct 26, 2026 at 05:58:39PM +0000, Abdullah Mohammd Sifat wrote:
> Free the allocated dvs2_coeff memory if ia_css_dvs2_statistics_allocate
> 
> fails to prevent a memory leak in the error path.

Extra blank line is strange.

> 
> Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
> ---

See my comments to the other thread.  This is a false positive.

regards,
dan carpenter

