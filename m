Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC84378D9B
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 08:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649993; cv=none; b=ZHZM2t37oIzZxsAMB565hoJ9MzLGNwt48UljYYEjoG2NRls++GW5AzfAmJRJVE4RujUmZg4KXadXqCZCn+/vRH3QEmLW6s5W3BISsRB6kQ/JHrDn64GsiAhXuDofhHRCpp7AQHnvHIPnDTUx4K2QXIAERsDSbxZE4mWzFEshP6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649993; c=relaxed/simple;
	bh=ZVQQwcjim/5RyqsBqMX5qZb6ORpdMy1y4jO6E1KFIoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grzDFaeWXgOoQDOCwexo4Fyj0G0wGbWxxFFiGhuFdJLOz5qWXOVBPoWKKXJcIziIFi5fb8Me+v+90xwR9j+d9TTc6CXR8RDLXlB3hhiMdq747aOpUWzhNjB/d7McieRldWe8d7qmgMzs+3Zpr2sTkypd1+3OeI3HOH2u8hJ3Tus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ddvn6B5A; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ddvn6B5A"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso37696495e9.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 01:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773649990; x=1774254790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MF8f4OpVOReg0WLpPAXIIDwAgflpzunWoXZkRVOIycA=;
        b=Ddvn6B5AlmHKwGK3DPgZkl4rMI0v4O+pZ26GtZAOB4Ifi5atJP3ceQ3yj34+dgOx8U
         aaf4kCo3etxHDAZSjDiRmbMUTbOAj9x4HLThBfImNtTU2ixBxcKShg+gHN2l/jJT5V95
         f4ErlVCaHwWum7/5aaaPfrbYIwINoFxCpHWX0cWGRzQyiFoRru4/UL3KQq6pUKpQxUMa
         0Q06PpQGcby/LtRR4/OUsJxde1SUTBufruXq+Afd3mVcy+l2Y7e02XkxNtwzqdFrthaN
         CcEpQdBF7lVNcLffo3eKDazHQvdVqW+LAK58ZB97gLH6qsYGAHTVx9cubm4NUQ0VyWdx
         bblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649990; x=1774254790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MF8f4OpVOReg0WLpPAXIIDwAgflpzunWoXZkRVOIycA=;
        b=YW3SmMu2YvLq2ttBRzXJmhbcKf7ldLQx/3yD4HvhsnUbX7ZnceCTUChParehVIa09Z
         mW2qFoNtsUmNIBW4BSChu0II5uGRx78HxgYtHUOqN3RqJR/g59IM5fySebBJIp3GjuB4
         uN9UrBbK/+YEEwqtLrurlRdxhjRVxFvCMwpxJ+5zJbiapbnsrgYQV0b2AIqs4/EEesxF
         3Lq2fEdll4lRk6hLw6e7Td+mYkOB67jnewhLAmkzrxRz2IJuY2pmEESzS2GpjUi3TJxb
         OgRh0X77mZWj6rlrnmxrErPXnQ4KczYqpj8V/rDHIea7x1WLMTI6LksW+GskC3d5V9CH
         MD7A==
X-Forwarded-Encrypted: i=1; AJvYcCXaB9LnO5MpnWHC8o78bHYahxz8tVoZ89Lcy3HzPDZ6fRIiXSeFipcAB+IBE2P2AmPKl/hO0BN2EBt8Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnGM6s8IxADV9aIfB7aQqMEcieNEyBs8lDAANdnz7WjBhMX/R0
	DBmb4TCFvCcVDRdYsZQojnK7LAdlzO8THSEVvq9o4Mj+uOk5DcLzfxI5C7kXoeEuIZY=
X-Gm-Gg: ATEYQzx7lPa4sPP9sZWojQaie/VIus4QxMyY7ovOZeo8HckcPvV3NA5Rhg5sYYuCcmn
	VwMBVoYy6K/fe8/w44oXESmPHairn0b0MzmWS4KwErzeT0/hbj9HWAkUsq3CgvjnRAnqSkDVLKo
	4Cz3NE64zPDg/DOV3WX9OMIYu5iND7dASO+QJO/+zG9f7ebCT1HtLjOfy1bZOENA+Moa7tWPi+B
	BPMTWtXc+dZkwZaTfqpvadv3UogrC/lj7ALUKnJr7QCZeUhbOMpFp3g/c2jA8B3jRQOoIn1eGOf
	K+had30I2bvgzKOEUVwpRu/d38l2FV8OQEVNye/eu1SSmbb6bua1kAUvkacwMoMGR/1ymlmk1aG
	guFUS9Snj00Cs9QgVwI27ZDoTVmWYRGvCbLea6Qit/HFFnsK/KTPU+lQONBK072aQTPhMQXUXW3
	J1pz3656coj7KWg/EFSkB3rC+3pUga
X-Received: by 2002:a05:600c:1e8c:b0:485:41c4:e2e5 with SMTP id 5b1f17b1804b1-485567090cdmr186773105e9.27.1773649990047;
        Mon, 16 Mar 2026 01:33:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e92d5sm403411795e9.1.2026.03.16.01.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:33:09 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:33:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: fix error code in frontend_init()
Message-ID: <abfAQrNdn58M8Dzq@stanley.mountain>
References: <20260313-av7110-fix-enodev-v1-1-1788db19a58a.ref@yahoo.pl>
 <20260313-av7110-fix-enodev-v1-1-1788db19a58a@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-av7110-fix-enodev-v1-1-1788db19a58a@yahoo.pl>

On Fri, Mar 13, 2026 at 06:36:52PM +0100, Tomasz Unger wrote:
> Return -ENODEV instead of -ENOMEM when no frontend driver is found
> for the device. -ENODEV is semantically correct here as the failure
> is due to no matching frontend driver being found, not a memory
> allocation failure.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

Returning -ENOMEM is just as reasonable as -ENODEV.  We're looking at
if ves1820_attach(), ves1x93_attach() or stv0299_attach() etc fail.
Memory allocation failures seem like the most common cause to me.

The FIXME also seems reasonable...  Just leave it as-is until someone
can address it properly.

regards,
dan carpenter
