Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A32A35BDDB
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 22:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301016; cv=pass; b=S/C+GHkVw8nMubtju9s1Qbs/BuNaB5fYPZAh5ZRgRpqSDBDig1/rnw0pu7rL4UVmG50HWyfuvU7P9yoGzUOCcAID1OpYwERl9DPwlYfSnnVbRluxEZxBKXRxcW2kAsFlFVNqEm4aNMcQ95oX2uGmvC0CZu2a+NomjTm4qGbDKQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301016; c=relaxed/simple;
	bh=p22kh6WEGbuKfAaoqIlc3KXEj52IPkMy1G0NBe08JXg=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9P6uRd9bh2fZD6fZ3HcUJksyCQ1Zx8KnUJZ5lz5BYVYQ503FcG15wl190NoesYtQHiJO1MC7EnrEf1iYg+YgzjSd8fHrrQls4mIfNgwrLA8MpkM3QQNyXCEhDVIx51IvU36Z9SB6Kn0raJQ4MF6IJxuT6EGMTRJQPskHGzKjAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtIpgbNy; arc=pass smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtIpgbNy"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4b28d9537bcso294981b6e.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 15:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788301014; cv=none;
        d=google.com; s=arc-20260327;
        b=FT0g2eEaQLs4C7xG6mCsGcTE6iidBOLSgIkznmlO3e6JN5ab3CGqk6AdxAf9cDkX9z
         WJONwscBd+0xg/NW+e2bakHjKvdUVmB06GtwnnQbIGpGOtH7I1Lr3fWCL+zCDvzNG+bw
         LfEAYvlBSfdjNMaiDWi5CYecgICAhHQsTVthswT8J/Q2lGrwx1PP65mdNaC6yUWB1uD3
         VWsNC37nOCKw++5EQ73Oez13NUvTCI0qKqff6tpy93JvKiUSELfdsGGYaKn/TwYDE4IJ
         xxnpU3ve0m7HWweM5nhyBn3MnS9hj+zscxR+pOcRB5qbdSdUz/9jYq+wTd/SbI1X6zmo
         ptMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=p22kh6WEGbuKfAaoqIlc3KXEj52IPkMy1G0NBe08JXg=;
        fh=+Ohv0qPOdByKViFgTsPryzN+snScZY4pOmeApfosv7g=;
        b=InzpQ3sFEGeE9S4FNpY38UHddJ2QhE5sXx6EMS+eaedsIPAou77TUNhsdtBio0Bpt8
         8BRAQkkWehXuOG7uuVnP7tsJ4quiF2q7M5WeTVO5ddiwqrNAdJKUEk+5F1vDFYzqBE7y
         J9wbRyKbRbN5eppyDC1lyR1MVcmLgxaIOgI6+FXjuT47qzjkVabITTazq0DE3Dvda8p2
         W5rXG/LBu4X5Sas/1W1iklrelfuYSy45GomkSFmOeYeyv3C28THub1rXiYCXDKeEU0mu
         n8pG1RrFHMB9T6FfSeL1SATvl+qGCANBx8VAx/br9zPKQkP9dfOI45bYuSAX7Vc0Kg3J
         82CA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788301014; x=1788905814; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p22kh6WEGbuKfAaoqIlc3KXEj52IPkMy1G0NBe08JXg=;
        b=mtIpgbNyGtFtOkik3OhC1qgwcmEmBJcn1fhQmJQSy6f6vwJGG84wXYlkMLsz6ksUiY
         HLK/uN0mNoSpvb+W7qsD2eU7Pn88+W1I0srb+cCJap9KFB5ywPVa5EFfLejXgry2rk5q
         hy5RwVpI3mY53p8FWtgnGmZ7MaIsBW4ssio5MzFXr1VIMkO5Fi+7DP2mD/YLF8R1JqRQ
         FTrF4ZgtC6bwqTgQIbalqI8clPfQYOTmzHatG2LnRzXWdd2Zmut2jWLR0Vz+kzyhcE/m
         nJj3npGgGk4bKxLguJRbbDryC/8sFJxFMj44T1oPab9NlqSgCtH8lNDZ+xHQQalblqXz
         Dehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788301014; x=1788905814;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p22kh6WEGbuKfAaoqIlc3KXEj52IPkMy1G0NBe08JXg=;
        b=bM8/cuU7JqkrsU5P8E606hHdZyE9tTCfynwMefKeWP60408UkPMGcPjXxy2NTb6DF8
         mLhuB+R0gJioi5DPgn6vJEg0Kv72MVQ5oF7o63fHC7/RfSL8gua9+KUgkJmEHMGlk5hD
         cENyJB4gzXAo0XrkButj1SmomHH5tXSHuq4S1i87Mu36AWl8WMljdsYiCPliRNHjAvQ3
         XBDwVE78z45E87nM1oUi13uRLv2nOKBx5RHL2XvM+TOYKmE1UeZNPHsJyRYcwP/lToNr
         27F0kRcCatUHnUOSVjfCZ/kzJoNS4pf/4lmV8rqlt8BMnxh5NTcSTTjlnyiKHGTjbmcv
         uOlA==
X-Forwarded-Encrypted: i=1; AHgh+RpIjO3jreXM2qeh29O4uQxChPMqWJ/gctdQxIr0f2dMWH9N5qO5riaffo9iu9IIYdRq0sSoAAcsQml8OA==@vger.kernel.org
X-Gm-Message-State: AFuF++mXh2l6wDfZrZQ/J3jWqpLmDXSG7UVQrJiLK2fFY7EgCqsezffq
	GWFiF+VL79kY4HZOkzpAYNJEQgVARJVuq43Zny9f77c9L7O+yLH+0TUnAZHiUu3PHHqsu71eWos
	BqgmmYs/sWCk/tPSqZW6ET0f3t9t2U2PRQ81qmJfnZQ==
X-Gm-Gg: AR+sD132JQDDy5yPIx2QkRgVxBoPZDjyvWjzm8Me5f++plTwvhbS3Ik4VytWVgBV6mS
	WH2LNj0TtzYe7SfjlDpnTaitEsnyYWuE5vejnFXLge7cZ9kIiYfu9I0aYOzMXbgiGFHVwU/nZ0X
	lAaNy6lI43vXJS/kUJ8tQkTdxPHzuYdlch1/m3xoX/ZwPQHypcYjZ5owqcAqPhSZwy5HCZdUHLA
	kk/D0LeEeJvfoiyTdPLWFaTNjpzAzAKxxyZyuwulUc+uEpwFbA/dTwcGbeB93+Py7r/Q7QZPLiC
	aXkWQpUyVffAz76JSFamSIZlcS6xREZNNPGKDkCmuNNuw+mkaxB/4QHspboXt4atMVZmstIkXwA
	gf/pCRbRD/a9k27uSGGk2haU=
X-Received: by 2002:a05:6808:2205:b0:4b2:8dbf:ffd with SMTP id
 5614622812f47-4b5bed07aa5mr6265199b6e.1.1788301014213; Tue, 01 Sep 2026
 15:16:54 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:16:53 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:16:53 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ec1729f6eb60f3d29707fc3d13e247d2b072dfc8.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com> <ec1729f6eb60f3d29707fc3d13e247d2b072dfc8.1788286339.git.mauriziocasciano7@gmail.com>
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Tue, 1 Sep 2026 15:16:53 -0700
X-Gm-Features: AcwNN1WUFQ7ilhOL96JVJxn4tbEarARgcqQdd-VycQ42yfsNYLKxJGesXAWGlpk
Message-ID: <CAO7O_xifSM=Ev8WtrEyufQCD2XjgtimwpzuwJDZC+d_ExbqmzA@mail.gmail.com>
Subject: Re: [PATCH v6 01/16] media: ov8858: Extract digital gain programming
To: mchehab@kernel.org, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, bingbu.cao@amd.com, 
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net, andy@kernel.org, 
	andriy.shevchenko@intel.com, hansg@kernel.org, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch is unchanged from v5 and I accidentally omitted the review
tag provided by Andy:

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

The review was posted at:
https://lore.kernel.org/linux-media/apa3EgKdnBfKXV1m@ashevche-desk.local/

Please retain the tag when applying this patch or carrying it into a
subsequent revision.

With Best Regards,
Maurizio Casciano
