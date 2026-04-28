Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92DF254AFF
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 18:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402761; cv=none; b=cq3XUF92SK0hRGJT4G/3qBr34Mr2Ubdd1Xd9uLd6iwT/sPYyhg6Ax0qutphdyQxgPq0CUWV5k5DQsW6qp7CmWpQz6Qm/iIK4nO9eEBo+28pS7YvuUUg4gYu+ZRTs2N1WnKSMWxPnVE9lpJmUxlmzN90mF6stTXPTGZI8uyAPDyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402761; c=relaxed/simple;
	bh=6a9Orqs4M+G9Ps0bWLS4aQAcCVzvmv1AumdBspToX0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDjxI/+9Coy4zzOEAO5rYciqjUrqZAsvIzlFj2lyZqoi5axziB/DOsKihHWsHORNSiZSn11yznfo6I4D8b8Nfp91vDmm7ppkQTCrSYvWju5m6h0HY5z1OpowdtEXwZJhiTR5YMeMRagyKSoYo/KzVKBPefx0p6cqvkjAKgiUdak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iy+Xi6L5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy+Xi6L5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso122320225e9.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 11:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777402758; x=1778007558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iXO2sWkYj08jDd50w1qkyZoYNw3zJTVw3EQTk5oc1B8=;
        b=iy+Xi6L5tNxo7dbhFAp7TjRoDU/fX7dJZZsBbr8WxwdCyCdxJeukYdoe6MsGEulxym
         LoezibCGUSm4SBY3THjTcPHzPOPOB2muiTRZpTzSwmsvaO4ie90G0Ku4R5DxBoGT6Ue9
         p5M4Akt8xBlGfUEkzUp4axo9jGMrtTUpJnO4DhvydPa3TuBa+EznCA3XBPgTuafkI9uT
         41oATH9bb19X7q3YYF9wnEq79BijYYt7D5pf6S+o/BCRu6cTok3p+bcyIi6gyBztBoLF
         3PqfyDshmbDJTFSeIQRghpcg+JoM07jezQu8GtQbOrNuYr5va64/TUI4Q0A7LuqXyvdv
         ms3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777402758; x=1778007558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXO2sWkYj08jDd50w1qkyZoYNw3zJTVw3EQTk5oc1B8=;
        b=bu9BjnIwJAMV4JU1UygDHfXs7axL75IhUPRyYrChlNTmQmQmvdC5tIY84/oEJH2+R4
         MZ+mtbj4jRG1+JjI3t2OQWLXb1kvuhsRCQyjkm9nEHEHyIjU6qx5e7AYfoOifW922w8B
         qgUZ5v7Z6mjrEVsgnVd0qT4A+4fMwm7SRBoX61XSPi5udrxwddej5Nw+wh08tz3zkIym
         QrP5gCd90u4FW1tn3cNCqf8NZrpF+C4SsrhiIwyyuVs3HRjuemZPS4fuiXWHqcxxXKo6
         2MKJAP1M++gc4kWSW8KpVTsOVUfddA33anHL5cw39o/ucstgdB4nM1MRncgBIt1P1GIB
         4x3g==
X-Gm-Message-State: AOJu0YxoL2wCGZDApnIARC+bl2Sf8rLKt3ZZseP/zYmwG+jjqaStZolB
	FOWWPP0DvNUVzO9G6+aRZL5WruqlB6T05sp+1ltixluRgQlI5KHcoX4W
X-Gm-Gg: AeBDiet5lE4jAQ3NtDwFBOldYwtR/AGex0eSq18FGpQYA2h9A5SSVxI2QOaMPDhIWOx
	cJgBzr+Xl10QMc9lfvi1lhJWSZxTfrDSpaov0XrFtjhdfnAixgppoS7GTq+p2SUnNoGEBbwVzGZ
	njNi8FmtDOAzrKp5CHsVHb3a+P9/QZdvUAQ+czPBktzTSf/oi3qpHOi/ifqbWD/dfgTvPXPq00n
	qolAvEuwW+IKKvSBqckv0SDLUAQYqhtfln0JCuHj9WKq6WM3qyK07CNeEXIcN/Dzr8FOkkGzBzG
	gnYDM9Py1ZQpsh92Man4lpc4ukY4AK+HqRavbAVzQ+9RAHJctTBz0+BAJnyu7QuzTbuCsM4hGr8
	1CKKZqtoupVHayIjsz6VN2wQxXqBBAKyjWCdXFmvBzagQB3qyk8uTdMm28RvDPsdGtRJupbupKr
	QxS0zDQnpYvg1SkgXmF5ZmIqU9t36YZWb0LMgGMhdw
X-Received: by 2002:a05:600c:6610:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48a7b54009cmr13442935e9.21.1777402757968;
        Tue, 28 Apr 2026 11:59:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463fa89038sm8391584f8f.26.2026.04.28.11.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 11:59:17 -0700 (PDT)
Date: Tue, 28 Apr 2026 21:59:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Marc Hanna <marchanna111@gmail.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	skomatineni@nvidia.com, luca.ceresoli@bootlin.com,
	mchehab@kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] staging: tegra-video: Align wrapped function arguments
Message-ID: <afEDgrzzxGf_VM5B@stanley.mountain>
References: <20260428185024.853-1-marchanna111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428185024.853-1-marchanna111@gmail.com>

The subject still says the patch is aligning function arguments when
the patch is about long lines.


On Tue, Apr 28, 2026 at 01:50:24PM -0500, Marc Hanna wrote:
> Align wrapped arguments in tegra20.c
> to follow kernel coding style.
> 
> v2:
> - Fix From header
> - Update commit message per review feedback
> 
This goes under the --- cut off line.

> Signed-off-by: Marc Hanna <marchanna111@gmail.com>
> ---
  ^^^
here.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

