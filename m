Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECF63A9854
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 05:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784267506; cv=none; b=OWZMIcyK7weoJj0LGbR8FTCkORmjig3BL6OUngP0XcDSHvrNkDl5YUijXe1Fr9b7ansW86HOi/4WI30bgum7bWfGRk+Ql05Rn8qhX0J6WzYdYhYen886bry9Zpal/mTML0WwThb6hvjtzqYxi4o2lhlu9D1PNABB4SQm+Vf8980=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784267506; c=relaxed/simple;
	bh=1EFfARZqTYougMDxqJVwrAAU6s5k6TPIb1KJJancNeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULATLTJHNPiTxFmxWV6+BOVAPCcrlqSO6i3a5Zq6c7+rlBBdhOX4dnBgt/MuuD9eVtr+4QQxq5A108agwtxRof2YOA1o9AW1vYmULjTc+EQnhyW2uJ0EbeV5KkeFlIZgibGGla4jCZzT9hc3xdSGeuIH+54HbJacCMRXUV8t1Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMbT5/6M; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMbT5/6M"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7eb545db3afso2382536a34.0
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 22:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784267501; x=1784872301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7GNJ2VsT/H/OoPywtw6dAhOceHxaw517jB295gP2NHc=;
        b=JMbT5/6MSRxsbUAqcv/WmmJvt/PZky0MEYp7ofDy2bEU+miaLnSDA3pJoDAxHMNVNJ
         KcF4kcfVI2+AJhBEQW6vEOfzJnzL/WdLFi/rr0BkUokwEcmi7fOKeLF7wE4G/Xvt7yhF
         Lgi1CUHGnspTAAONdhTi5PCu2L9jtnpDmJiJwyETCpBJ6llFBGWibW7lIcXwLc4F/I+8
         HD22HCoclZ1hpHSnANabTnDeN9IGrpyISkYqI+wRwirkq6i+auKRwHis38pApPnuI2FK
         giu4iT1EP0jV8ltsADVnoOYxVWMRxCx2/H2p7vUiQLueuG2Mf+bUztqm+q5/Mt2WRlvY
         9EZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784267501; x=1784872301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7GNJ2VsT/H/OoPywtw6dAhOceHxaw517jB295gP2NHc=;
        b=e3887/xz9pNV3YsIbhtYlppLX0tBoH8g9IStNGzyGO3fdWW8eiGEECuaRQX9m5Zxnd
         nVU2PjTtFypR+5QuI7/F26wFFbnYb943TpJl/b89kLxaRe4hz5gVejaT7X6J3ZsvMndZ
         oRC0xY+GjjyMHZPvdGXK/1AbKJN/QJRjI0zrD2JR3qa9AEzPMKhIK01tTGNSeZjVcn55
         jR4AYEOTQLkCA9AkYgQTHq8boGjIaih+2rqRt/hviidsz9/DR58FEN36DqqYydHoBbKa
         /UERGsntLC+FCbxK5deboPih8L8uGEtVN1J3n44CcqFFwcdLY1wfHrceg0bXyp8MHjTt
         v7AA==
X-Forwarded-Encrypted: i=1; AHgh+RoPdINhqjBIBuAZrBLfD7sLIwnQVkp/r4v+jSMm3s0WkPpokWKn4HoK84F53wdi1Omxk3y1B58TwDmHXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLk3G86YxhBErfGnZcroMpWEdgQpUcZ3/8jNrawY2OJeqquIVv
	KgITY05JUFaoDCbmiXJCr/85Y36JoVC5Xwfqkt6TpXFXZP+lvEOPLfQT
X-Gm-Gg: AfdE7clwpR5E9a/ZiLoAwPbsQwVa1wv1ICnlUjWxA7nXQa6BnPzH3JnrJFL4nYCeL30
	erJPm3VAtj579uMPGUU/fkVgQeBpaH9MTTB+B0Meaz0BmccN7WLobpbIXIDbWUYALGYlm4wm8F8
	auHFoP2RJdv0p/UsLITxgrAIP6QyEtxI7qN/3mgxo+Phc4DJS3ZzC338ciPgOSf/oiIXqQaNwoa
	Ne7t7iNS7fxb3qMvwhNp7mdg7UiwtmdSbCqvpC3qqIg4mDLn6XMfgcpY7eGeUNnk6cqHrq9ult1
	6kpzTNeryCPrDxXQMI9TNJ2A5dasjM3JDzcukm0iy+MxGF06X/sF9L0KTKaALQWMBLnGN3k/9cN
	UqqEg40J1SEZIjerK2j5P4t2BN5LlgkzdQzncCyAeyZnHivaLKnKjK4x9H3pUZb3dpZm5Fw==
X-Received: by 2002:a05:6808:308c:b0:4a4:c12:46f6 with SMTP id 5614622812f47-4a4d01f55ebmr585102b6e.2.1784267501599;
        Thu, 16 Jul 2026 22:51:41 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3cb035csm167035b6e.11.2026.07.16.22.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 22:51:39 -0700 (PDT)
Date: Fri, 17 Jul 2026 08:51:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v3] staging: media: meson: vdec: propagate devm_clk_get()
 errors
Message-ID: <alnC5GH7m84F-tnk@stanley.mountain>
References: <20260717030559.167-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717030559.167-1-alfievarghese22@gmail.com>

On Fri, Jul 17, 2026 at 08:35:58AM +0530, Alfie Varghese wrote:
> vdec_probe() hardcodes -EPROBE_DEFER for all devm_clk_get() failures.
> This masks the actual error code returned by the clock framework, such
> as -ENOENT when a clock is not registered or -ENOMEM on allocation
> failure.
> 
> Return PTR_ERR() instead to propagate the real error to the caller.
> 
> Reviewed-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
> ---

There is supposed to be a note here under the --- cut off line which
says what changed.  Did you resend just to add my Reviewed-by line?

No need for that.

regards,
dan carpenter

