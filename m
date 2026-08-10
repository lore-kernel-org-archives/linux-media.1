Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33BC3FE352;
	Mon, 10 Aug 2026 16:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380000; cv=none; b=BpdpTNt/N3raUMl0jCXCkBf/77sjawXwbeYLZauWnKp+Eg1TNHvZa03xgWrqi/nTUVb0Kvi5tdrfpr+wpV9W6sCJ0j0fIYflO2f/4kgn3+jbkfAw+RelG3P9gW5nAZXA5r8gOFuSgaXpOocCZGmLQrrJzp6/gAcN085hU5VWjyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380000; c=relaxed/simple;
	bh=+OKTK65DeDrU6wPJhTTeNvkxxc3ZKtH//mDT5gxhnKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aN51LxRtpuLjZJvn9IEi6aVp1a6ctLDfOP/elC65alkFmdOv/pVG83CpYxLJMBFyZG5nLSEEbYE7wsDeOV6mcPIrM+SP/2oROzRl7ZWL6BHiFzPMx+B7hJGnCxF5Oz4LGopJGlXr/2Dt4dvOeM7xeELcxHKk1eH7XGlJ+skbiYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9HTYXYZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9HTYXYZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DE11F000E9;
	Mon, 10 Aug 2026 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786379998;
	bh=MvC3eEx0MPSnsIqD1BOBAB4Dh5hJyA+w3MMVvoUxEMQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=E9HTYXYZyAef6izwUCjvpHkrkGPrM+EO/P5NeSElHTAXAyxzhbpi1UsDUBonzNU6T
	 1f0Z3CGpe8xg/pujshvicNHmV1yfch5Ky20mWbwk7Qrth8sRxjUqKEJ2SqHn6IekwU
	 /ALO4xd9MfLwt0HEs9g/ne2qh0SrfHft5QIv9z0YFF67UJOoN3HjZJRoiUGrnxYHIB
	 HeGo2KnUNZPlAMx2riuCCiwXj+/OIgdzQo0rhxGUB0yFivEMcdmV42Aem+PZGObvwd
	 4XxMouy8+HMvIZsZ8DAHp0HW+S5Beb7w9IPzaGBoAaJhi+mZlItVlUt2Pwl4TCh9nG
	 ZsBVTI7UZnA0A==
Message-ID: <4aaff8d6-573f-475f-aee4-f70decd5b521@kernel.org>
Date: Mon, 10 Aug 2026 19:39:54 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: microchip-csi2dc: fix async notifier leak on probe
 error path
To: Cong Nguyen <congnt264@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260808090729.2680734-1-congnt264@gmail.com>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <20260808090729.2680734-1-congnt264@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/8/26 12:07, Cong Nguyen wrote:
> csi2dc_of_parse() ends up calling csi2dc_prepare_notifier(), which
> registers the V4L2 async notifier with v4l2_async_nf_register(). The
> probe error label csi2dc_probe_cleanup_notifier is reached after
> csi2dc_of_parse() has already succeeded (e.g. when media entity init,
> csi2dc_power() or v4l2_async_register_subdev() fail), but it calls only
> v4l2_async_nf_cleanup() and never v4l2_async_nf_unregister().
> 
> The notifier therefore stays chained in the global notifier_list while
> the enclosing struct csi2dc_device is freed, leading to list corruption
> and a use-after-free when the list is next walked.
> 
> Unregister the notifier before cleaning it up on the error path,
> matching the teardown already done in csi2dc_remove().
> 
> Fixes: 2de0b3c0f678 ("media: atmel: introduce microchip csi2dc driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---

Reviewed-by: Eugen Hristev <ehristev@kernel.org>
