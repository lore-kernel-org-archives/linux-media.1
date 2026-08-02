Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB562FE0F
	for <linux-media@vger.kernel.org>; Sun,  2 Aug 2026 04:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785646483; cv=none; b=F/TKywx/VHQzmj0XUBHSKrHcBOQLNjtde+qUQQ0D/ZPxY54SDt2Dv+M5ns3Ga29FJoiDu6+3pQIiUvpE7v4+8iKP+BjfYTpWLQWv1iABl/UiC/g21FzsfYNaDPXR3T9fIJsIGjQsi6Vs+2bMJEllUcAloDMGFQfUev3R243ZN4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785646483; c=relaxed/simple;
	bh=lLzEQSl9+ShMoZNGWYEr9B1dIP4jPDpshp2XHDCkA4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NMb90R2H38EObYEfHWtsp5NGvlygn79j1ZMYjHJ/gud1auPLlvAOd6BwWD+5pMun/0JSUQkWBNijbyuCCQyAJzTzsaNLq3XENsno1l2HWrLcIZ1qHaDuDB/eJeN7pEdOKnEFDIZDJhSyPm8LPVj90w/ICv0jMGR4jl1Ix+LWh60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJflNWQ9; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJflNWQ9"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c9107baa7so22523831fa.3
        for <linux-media@vger.kernel.org>; Sat, 01 Aug 2026 21:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785646480; x=1786251280; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXt+Qk58b9KPYqJkr6UYxY89Q8+l77fvxEmxNiNV0Aw=;
        b=XJflNWQ9KC3+ar0u2oPrmtejiWCzYorJj2SWoKe1+U0klMabinPvIje1oB2o9bxNsf
         AiQaDx7qpuzXaA5cS94g1tuSlbipsPL4JXP6TTvd44tKy2/6PtldwqO/YInuJBnvGqeE
         U3j4QhqJaalBD3+s7zDDMUzH4kkyd56nDt1rJ/SiWVLJoXCuUFvdkqXeNIziej9bGTbx
         UkpG24eJdiA3N1YILWuKICV7WFoRW1ncAmH9sYArwizzpOVqHq2DiT8dWpc8sSK9MaEL
         SD/jnm2c7WeDrKlDIAw2TJxJsDtfi1qFKXTilTu9wpHjgF/ydPWoNTZjgVy/Y5U/ef7C
         GOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785646480; x=1786251280;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXt+Qk58b9KPYqJkr6UYxY89Q8+l77fvxEmxNiNV0Aw=;
        b=qLonfh088LK3jEpi4nmRMgE9UFRR/Dz0pkA1pcBy7mHtfNzLsLlH3sZ7GvYcymmGK8
         mAdStvBn4iWyjoJyLUQq+K7mTl1njWEP0Ojn4QGw3gfNh1qKMyf+X+R+czvt6pL2FVwQ
         1fZcy5ZfJZVjE0qr3GMZSQpaWhLJajWZLp/VjpILOePtZEXIcVbRQeyx8jxiyyp+RMya
         s4uT0w/xPvPL4XxIOkJSwsmgFlgKpZicM0yuYoFx638f9bmvGAzT911/ajYmWYne1QVo
         m+YovcdSCd6Z6knyoQXRuKo/GKdNy0pvd50KrhzvPxIFi2ecCuQLkuzF3Og9+huqS3Ol
         qZEg==
X-Gm-Message-State: AOJu0YyC44NEWTI/XO+689RbxcEqettdL+vF3YCv3sBpEulTLmE58+gY
	hjFUjz9rb267WTjmqzYVZI8MDH/G4wRuhqoLw01Sg4RxepqC4LNsJKcsRwoXqoIFa1MDvg==
X-Gm-Gg: AR+sD13GSj/VnDlcD12zdpHfdHDYWBbEQ1Z3cZQyFGsuiM30dMYhAT42g8NeDbt1DlW
	vbFwJZ5ahVwYjlmXKixsxpM2SI3v8QI6H8UjcYayXHeT+EMGW62SNN+qNYzna0JHcSwXfdvoHi8
	3RRscYCvAZwRtFdsnzTkTOf5fECwfNnoBugxeRZJruTeD3SEB2NerT+6+KggyGHFOG8Ez3tlXS6
	MRvHnUoggaSxNcDyv5Ki7c0Il0XQIY9XN3jxZcHIf49f9cUXu/6l9rYk87BrJcSKy6/VE3WQjUq
	eqae+zUNPp3Y4xt8cC+mSDKOrAs0+SbO5Zz51fBveFPEXcMemRHfuwrSsdLH5cVDmS+fIkZucVe
	TXkEAjnL/CmPd+4Pm+2reTSvfwB0QfBqhkF712lbDaDTxnVbJMZ+YRQh0/njbNu9jM2se6cdmkG
	GpbLZVSTk/LnHw+YJgEa4D1uC2fNUPvf0Mnu0eLI5rZddBo9JaE0W0Q2T0wvnkKUPOx49JyRO37
	XHjRU7AP2OySEyNxTztTwY=
X-Received: by 2002:a05:6512:669c:20b0:5ae:c003:4b8b with SMTP id 2adb3069b0e04-5b2e4f96438mr604356e87.59.1785646479443;
        Sat, 01 Aug 2026 21:54:39 -0700 (PDT)
Received: from localhost ([77.237.185.162])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e244d709sm1273185e87.55.2026.08.01.21.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 21:54:37 -0700 (PDT)
Date: Sun, 2 Aug 2026 08:24:29 +0330
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org
Subject: [RFC] Discussion: VIDEO_NUM_DEVICES limit in v4l2-dev.c
Message-ID: <am7LpodognguIZN5@zephyr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

I'm working on a project involving high density video processing on a
single server using a large number of v4l2 loopback devices to route
virtual video streams to tenants.

While doing so, I ran into the hard limit imposed by `VIDEO_NUM_DEVICES`
(currently 256) in `drivers/media/v4l2-core/v4l2-dev.c`. Looking through
the code and git history, this limit has been there for quite a long time.
However, after searching the mailing list archives, I couldn't find any
previous discussion regarding this limitation.

May I ask:

1. Is there any internal design constraint that requires limiting the
   number of V4L2 devices to 256 on modern kernels?

2. Has this limit been discussed previously, or is there any relevant
   discussion that I may have missed?

If the current limit is no longer intentional and there's no historical
context that I might've missed, I'd be happy to work on a patch series to
address it, and I would appreciate any guidance on the preferred direction.

Cheers,
-Ali
